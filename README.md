# DmsOnlineHelp

Dieses Repository enthält die Dokumentations- und Projektdateien für das DmsOnlineHelp-Projekt.

Projekt: DmsOnlineHelp

Dieses Repository enthält die lokale Ausgabe der Online‑Hilfe (HTML, Skripte, Ressourcen) für das DmsOnlineHelp‑Projekt.

Wichtige Ordner (Top-Level)

- `de/` — Deutsche Ausgabe der Onlinehilfe (viele HTML-, JS- und Ressourcen-Dateien)
- `en/` — Englische Ausgabe der Onlinehilfe
- `Content/`, `Data/`, `Resources/`, `Skins/` — Projekt- und Hilfsdaten (Strukturen, Indizes, Suchdaten)
- `.gitignore` — Ausschlussregeln für generierte/temporäre Dateien
- `README.md` — diese Datei
Startseite [https://tkarstaedt.github.io/DmsOnlineHelp/index.html]
Aktueller Repo‑Status

- Ein lokales Git‑Repository wurde initialisiert (Branch `main`).
- Remote `origin` wurde mit der URL `https://github.com/tkarstaedt/DmsOnlineHelp.git` gesetzt (Push benötigt ggf. Authentifizierung).
- Initialer Commit wurde erstellt (enthält die Projektdateien und Ressourcen).

GitHub Pages — mögliche Veröffentlichungsoptionen

Dieser Repository‑Typ eignet sich gut, um eine statische Online‑Hilfe als GitHub Pages zu hosten. Es gibt drei gebräuchliche Varianten:

1) Veröffentlichung aus `main:/docs` (einfach und schnell)
    - Kopieren Sie den fertigen Site‑Output (z. B. den Inhalt von `de/`) in ein Verzeichnis `docs/` im Root.
    - Commit & push auf `main`.
    - GitHub → Settings → Pages → Source: wählen Sie `main` und `/(docs)`.

    Beispiel (PowerShell):

```powershell
cd 'c:\github\DmsOnlineHelp'
robocopy .\de .\docs /E
git add docs
git commit -m "docs: add de site for GitHub Pages"
git push origin main
```

2) Veröffentlichung auf `gh-pages` Branch (saubere Trennung)
    - Legen Sie einen `gh-pages` Branch an und legen Sie die fertige Site in dessen Root.
    - Pushen Sie `gh-pages` und wählen Sie in GitHub Pages als Quelle `gh-pages` / root.

    Beispiel (schnell, mit subtree):

```powershell
cd 'c:\github\DmsOnlineHelp'
git subtree push --prefix de origin gh-pages
```

3) Automatisiertes Deployment per GitHub Actions
    - Erstellen Sie einen Workflow unter `.github/workflows/` der bei Push die Site baut/kopiert und nach `gh-pages` (oder `main:/docs`) deployed.
    - Vorteil: Automatische Aktualisierung bei jedem Commit.

Hinweise und Empfehlungen

- Repo enthält viele Binärdateien (Fonts, Bilder). Falls einzelne Dateien >100 MB sind, entfernt sie vor dem Push oder verwenden Sie Git LFS (`git lfs install`, `git lfs track "*.ttf"` usw.).
- Beim Push per HTTPS benötigen Sie ein Personal Access Token (PAT) oder die Browser‑Authentifizierung des Git Credential Managers. Alternativ: SSH‑Zugang und SSH‑URL.
- Wenn Sie nur die deutsche Hilfe veröffentlichen wollen, ist die `main:/docs` Variante am einfachsten.

Remote / Push Status

- Remote `origin` ist gesetzt auf: `https://github.com/tkarstaedt/DmsOnlineHelp.git`.
- Ein vorher gestarteter Push wartete auf Browser‑Authentifizierung; bitte schließen Sie die Anmeldung/Autorisierung ab, damit Pushes abgeschlossen werden können.

Nächste Schritte — Vorschlag

1. Entscheiden, welche Sprache veröffentlicht werden soll (`de` oder `en`).
2. Ich kann die `docs/`-Variante lokal vorbereiten (kopieren & commit). Danach müssen Sie die Auth in Ihrem Browser abschließen, damit ich / Sie die Änderungen pushen können.
3. Optional: Git LFS aktivieren, wenn viele große Binärdateien versioniert werden sollen.

Wenn Sie möchten, erledige ich Schritt 2 jetzt: sagen Sie kurz welche Sprache live gehen soll (z. B. `de`).

---
Automatisch aktualisiert: 2025-11-10
