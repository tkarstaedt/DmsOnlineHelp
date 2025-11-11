param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$GlossaryPath,
    [Parameter(Mandatory=$true, Position=1)]
    [string]$OutDir,
    [Parameter(Mandatory=$true, Position=2)]
    [string[]]$Files
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-GlossaryMap([string]$path) {
    if (-not (Test-Path -LiteralPath $path)) { throw "Glossary not found: $path" }
    $map = @{}
    $sepChar = [char]0x001A
    $sepLiteral = '\u001a'
    $sepArrow = [string][char]0x2192
    Get-Content -LiteralPath $path | ForEach-Object {
        $line = $_.Trim()
        if (-not $line.StartsWith('-')) { return }
        $line = $line.TrimStart('-').Trim()
        $parts = $null
        if ($line.Contains($sepArrow)) { $parts = $line.Split($sepArrow) }
        elseif ($line.Contains($sepLiteral)) { $parts = $line.Split($sepLiteral) }
        elseif ($line.Contains($sepChar)) { $parts = $line.Split($sepChar) }
        else { return }
        if ($parts.Count -lt 2) { return }
        $src = $parts[0].Trim()
        $dst = $parts[1].Trim()
        if ([string]::IsNullOrWhiteSpace($src) -or [string]::IsNullOrWhiteSpace($dst)) { return }
        $map[$src] = $dst
    }
    return $map
}

function New-OrderedKeys([hashtable]$map) {
    return $map.Keys | Sort-Object { $_.Length } -Descending
}

function Replace-Plain([string]$text, [hashtable]$map, [string[]]$orderedKeys) {
    $result = $text
    foreach ($key in $orderedKeys) {
        $value = $map[$key]
        $escaped = [regex]::Escape($key)
        $pattern = "(?<![\p{L}\p{Nd}])$escaped(?![\p{L}\p{Nd}])"
        $result = [regex]::Replace($result, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $value })
    }
    return $result
}

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$gloss = Get-GlossaryMap -path $GlossaryPath
if ($gloss.Count -eq 0) { throw "No glossary entries parsed from $GlossaryPath" }
$ordered = New-OrderedKeys -map $gloss

foreach ($inFile in $Files) {
    if (-not (Test-Path -LiteralPath $inFile)) { Write-Warning "Missing file: $inFile"; continue }
    $content = Get-Content -LiteralPath $inFile -Raw
    $out = Replace-Plain -text $content -map $gloss -orderedKeys $ordered
    $outPath = Join-Path $OutDir ([IO.Path]::GetFileName($inFile))
    Set-Content -LiteralPath $outPath -Value $out -Encoding utf8
    Write-Host "Wrote: $outPath"
}

