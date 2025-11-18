@echo off
setlocal

REM --- PFADE ANPASSEN ---
set "SOURCE=c:\git\PSItrafficProductManual\DMS\User\de\Output\HTML5"
set "TARGET=c:\github\DmsOnlineHelp\docs\de"
set "TARGET_REPO_ROOT=c:\github\DmsOnlineHelp"

echo -------------------------------------------------------
echo 1. Synchronisiere Doku (Mirroring)...
echo -------------------------------------------------------

REM /MIR = Spiegelt den Ordner (Kopiert neue, UEBERSCHREIBT ge„nderte, LOESCHT alte Dateien im Ziel)
REM /XD .git = Schlieát den .git Ordner aus (Sicherheitsmaánahme)
robocopy "%SOURCE%" "%TARGET%" /MIR /R:3 /W:1 /XD .git

if %ERRORLEVEL% GEQ 8 (
    echo FEHLER beim Kopieren!
    pause
    exit /b
)

echo.
echo -------------------------------------------------------
echo 2. Bereite Git-Commit vor...
echo -------------------------------------------------------
cd /d "%TARGET_REPO_ROOT%"

REM Status anzeigen
git status

echo.
echo Sollen die Aenderungen jetzt committet und gepusht werden?
set /p ASW="Ja (j) oder Nein (n)? "

if /i "%ASW%"=="j" (
    git add .
    git commit -m "Update Documentation HTML5 Output"
    git push
    echo.
    echo Upload erfolgreich!
) else (
    echo Kein Git-Upload durchgefuehrt.
)

echo.
echo Fertig.
