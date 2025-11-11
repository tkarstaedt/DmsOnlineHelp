param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$GlossaryPath,
    [Parameter(Mandatory=$true, Position=1)]
    [string[]]$Files
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-GlossaryMap([string]$path) {
    if (-not (Test-Path -LiteralPath $path)) {
        throw "Glossary not found: $path"
    }
    $map = @{}
    $sepChar = [char]0x001A
    $sepLiteral = '\u001a'
    $sepArrow = "" # placeholder; will set properly below
    # Proper rightwards arrow U+2192
    $sepArrow = [string][char]0x2192
    Get-Content -LiteralPath $path | ForEach-Object {
        $line = $_.Trim()
        if (-not $line.StartsWith('-')) { return }
        $line = $line.TrimStart('-').Trim()
        $parts = $null
        if ($line.Contains($sepArrow)) {
            $parts = $line.Split($sepArrow)
        } elseif ($line.Contains($sepLiteral)) {
            $parts = $line.Split($sepLiteral)
        } elseif ($line.Contains($sepChar)) {
            $parts = $line.Split($sepChar)
        } else {
            return
        }
        if ($parts.Count -lt 2) { return }
        $src = $parts[0].Trim()
        $dst = $parts[1].Trim()
        if ([string]::IsNullOrWhiteSpace($src) -or [string]::IsNullOrWhiteSpace($dst)) { return }
        # Avoid duplicates; last one wins
        $map[$src] = $dst
    }
    return $map
}

function New-OrderedKeys([hashtable]$map) {
    # Order keys by length descending to prevent partial overshadowing
    return $map.Keys | Sort-Object { $_.Length } -Descending
}

function Replace-Text([string]$text, [hashtable]$map, [string[]]$orderedKeys) {
    if ([string]::IsNullOrEmpty($text)) { return $text }
    $result = $text
    # Minimal normalization for frequent corrupted tokens (limit to short windows)
    $result = [regex]::Replace($result, '(?i)DMS.{0,20}?Kalender', 'DMS-Kalender')
    $result = [regex]::Replace($result, '(?i)VDV.{0,20}?Kalender', 'VDV-Kalender')
    $result = [regex]::Replace($result, '(?i)VDV.{0,5}?452', 'VDV-452')
    $result = [regex]::Replace($result, '(?i)DMS.{0,20}?Tagesarten', 'DMS-Tagesarten')
    foreach ($key in $orderedKeys) {
        $value = $map[$key]
        # Use regex with word boundaries for letters/digits; escape special chars in key
        $escaped = [regex]::Escape($key)
        $pattern = "(?<![\p{L}\p{Nd}])$escaped(?![\p{L}\p{Nd}])"
        $result = [regex]::Replace($result, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $value })
    }
    return $result
}

function Translate-XmlTopic([string]$filePath, [hashtable]$map, [string[]]$orderedKeys) {
    # Load as XML
    [xml]$doc = Get-Content -LiteralPath $filePath -Raw

    # Translate text nodes
    $textNodes = $doc.SelectNodes('//text()')
    foreach ($tn in $textNodes) {
        # Skip pure whitespace
        if ($tn.Value -match '^\s+$') { continue }
        $tn.Value = Replace-Text -text $tn.Value -map $map -orderedKeys $orderedKeys
    }

    # Translate select attributes that carry user-visible text
    $attrsToTranslate = @('title','alt','content','aria-label')
    $elemNodes = $doc.SelectNodes('//*')
    foreach ($el in $elemNodes) {
        foreach ($attrName in $attrsToTranslate) {
            if ($el.Attributes[$attrName]) {
                $el.Attributes[$attrName].Value = Replace-Text -text $el.Attributes[$attrName].Value -map $map -orderedKeys $orderedKeys
            }
        }
    }

    # Save back preserving UTF-8
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    $writerSettings = New-Object System.Xml.XmlWriterSettings
    $writerSettings.Encoding = $utf8NoBom
    $writerSettings.Indent = $false
    $writer = [System.Xml.XmlWriter]::Create($filePath, $writerSettings)
    try {
        $doc.Save($writer)
    } finally {
        $writer.Dispose()
    }
}

$gloss = Get-GlossaryMap -path $GlossaryPath
if ($gloss.Count -eq 0) { throw "No glossary entries parsed from $GlossaryPath" }
$ordered = New-OrderedKeys -map $gloss

foreach ($f in $Files) {
    if (-not (Test-Path -LiteralPath $f)) {
        Write-Warning "Skipping missing file: $f"
        continue
    }
    Translate-XmlTopic -filePath $f -map $gloss -orderedKeys $ordered
    Write-Host "Translated (glossary-based): $f"
}
