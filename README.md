# DmsOnlineHelp

Dieses Repository enthält die Dokumentations- und Projektdateien für das DmsOnlineHelp-Projekt.

Inhalt:
- `Content/` - die HTML- und Source-Dateien der Dokumentation
- `Project/` - Projektkonfigurationen (TOCs, Skins, Exports…)
- `Output/` - generierte Outputs (standardmäßig ausgeblendet via `.gitignore`)
- `Analyzer/` - Datenbank-Dateien (ebenfalls ausgeblendet)

Aktueller Status:

- Dieses Repository wurde soeben neu initialisiert (Neustart auf Wunsch des Benutzers).
- Die Datei `.gitignore` ist vorhanden und schließt generierte Outputs / DB-Dateien aus.

Wie weiter (lokal):
1. Lokales Repository ist initialisiert und enthält diesen README sowie `.gitignore`.
2. Um ein Remote-Repository auf GitHub zu erstellen und zu pushen, haben Sie zwei Optionen:

Option A — mit GitHub CLI (empfohlen, wenn `gh` installiert und angemeldet):

    gh repo create <OWNER>/<REPO> --public --source=. --remote=origin --push

Option B — manuell über GitHub-Webseite:
- Erstellen Sie ein neues Repo auf https://github.com
- Dann lokal ausführen:

    git remote add origin https://github.com/<OWNER>/<REPO>.git
    git branch -M main
    git push -u origin main

Wichtig:
- Beim ersten Push werden ggf. Anmeldeinformationen benötigt (GitHub Token oder gh CLI).
- Passen Sie `.gitignore` an, falls Sie weitere Dateien ausschließen möchten.

Wenn Sie möchten, kann ich das Remote-Repository für Sie erstellen und den Push durchführen — dafür benötige ich, dass Sie auf dieser Maschine bereits mit `gh auth login` angemeldet sind, oder mir die Erlaubnis geben, die `gh`-Befehle auszuführen.

---
Automatisch aktualisiert: 2025-11-10
