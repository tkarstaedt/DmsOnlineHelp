# 5 Fahrzeugmanagement und Disposition

Das Modul **„Fahrzeuge“** ist Ihr digitales Bestandsverzeichnis. Hier erhalten Sie Zugriff auf die elektronische Fahrzeugakte und verwalten die Positionen der Fahrzeuge auf dem Betriebshof (Disposition).

## 5.1 Fahrzeuge suchen und aufrufen
Um Informationen zu einem bestimmten Fahrzeug zu erhalten, tippen Sie auf dem Dashboard auf die Kachel **„Fahrzeuge“**.

### Die Fahrzeugliste
Die Liste zeigt alle Fahrzeuge des ausgewählten Depots an. Farbige Symbole am rechten Rand informieren Sie auf einen Blick über den Status:
*   **Schraubenschlüssel:** Es liegen offene Werkstattaufträge vor.
*   **Ausrufezeichen:** Es gibt gemeldete Störungen.
*   **Tank-Symbol:** Es stehen Versorgungsaufträge an.

### Fahrzeug finden
Sie haben zwei Möglichkeiten, ein Fahrzeug zu öffnen:
1.  **Liste durchsuchen:** Wischen Sie durch die Liste oder nutzen Sie den Filter, um das gewünschte Fahrzeug zu finden. Tippen Sie auf den Eintrag.
2.  **QR-Code Scan:** Tippen Sie auf das QR-Code-Symbol (falls verfügbar), um den Barcode am Fahrzeug zu scannen und direkt in die Detailansicht zu springen.

## 5.2 Fahrzeugdetails einsehen
In der Detailansicht eines Fahrzeugs finden Sie alle relevanten Informationen in vier Reitern (Tabs) organisiert:

*   **Details:** Zeigt Stammdaten (Typ, Baujahr) und die aktuelle Position (z. B. „Gleis 3.1“).
*   **Werkstatt:** Listet alle geplanten und laufenden Reparaturen auf.
*   **Versorgung:** Zeigt offene Aufgaben wie Tanken oder Reinigen.
*   **Störungen:** Listet technische Defekte und deren Priorität (A–D).

## 5.3 Fahrzeugstandort setzen (Disposition)
Wenn Sie ein Fahrzeug auf dem Betriebshof abstellen oder umparken, müssen Sie die neue Position im System erfassen.

1.  Öffnen Sie die Detailansicht des Fahrzeugs.
2.  Scrollen Sie zum Bereich **„Disposition“** und tippen Sie auf den Eintrag **„Standort setzen“**.
3.  Es öffnet sich ein Dialogfenster. Füllen Sie die Felder aus:
    *   **Betriebshof:** Wählen Sie das Depot (z. B. `FBM`).
    *   **Ort:** Wählen Sie das Gleis oder den Abstellplatz (z. B. `2.2`).
    *   **Versatz [cm]:** Geben Sie optional an, wie weit das Fahrzeug vom Gleisanfang entfernt steht (wichtig bei Hintereinander-Parken).
4.  Tippen Sie auf **„Auswählen“** oder **„Ok“**.

### Systemprüfung (Validierung)
Die App prüft sofort, ob der gewählte Platz gültig ist.
*   **Erfolg:** Die Position wird gespeichert und in den Details aktualisiert.
*   **Fehler:** Ist das Gleis zu kurz oder bereits belegt, erscheint eine Meldung (z. B. „Nicht erfolgreich! Not enough place for vehicle“). Wählen Sie in diesem Fall einen anderen Standort.

## 5.4 Standort entfernen
Verlässt ein Fahrzeug den Betriebshof (z. B. für eine Fahrt), können Sie die Position löschen.
1.  Tippen Sie im Bereich „Disposition“ auf **„Standort entfernen“**.
2.  Bestätigen Sie die Sicherheitsabfrage. Die Positionsangabe in den Details wechselt auf „-“ (leer).