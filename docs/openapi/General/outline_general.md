Semantische Gliederung: PEAK.X General OpenAPI (Admin-Fokus)

1. Einführung & Kontext

1.1 Plattform-Architektur [Score: 4/10]

Komponenten: PEAK.X Database, Client (PifNetCx), Server (PifDmsOpenApiServer).

Wichtig für Admin: Verständnis, welcher Dienst neu gestartet werden muss.

2. System-Konfiguration (Backend Control)

Verschoben von Prio 6 auf Prio 1. Dies ist das Alleinstellungsmerkmal der Doku.

2.1 Lizenzierung & Aktivierung [Score: 10/10]

Prozess: Task-Liste in PEAK.X -> Filter "Open API" -> Property Activated.

Abhängigkeit: Ohne Lizenz keine Aktivierung möglich.

2.2 Netzwerkkonfiguration (Ports & Protokolle) [Score: 9/10]

Parameter: HttpPortNumber (5600), HttpsPortNumber (5601).

Umschaltung: HttpsEnabled Flag.

2.3 Sicherheits-Setup (Zertifikate) [Score: 9/10]

Speicherort: Windows Certificate Store (LocalMachine/My).

Umgang mit Self-Signed Zertifikaten (HttpsCertificateAllowInvalid).

2.4 Zugriffsschutz (Rate Limiting) [Score: 8/10]

Konfiguration der Drosselung: PermitLimit, QueueLimit, Window.

Auswirkung auf den Client: HTTP 429 (implizit).

3. Datenverarbeitung & Verhalten (Backend Logic)

Hier wird erklärt, wie PEAK.X die Daten intern behandelt.

3.1 Abruf-Logik & State Management [Score: 9/10]

Long Polling: Server-seitiges Verhalten bei clientId Verlust (Service Restart = Full Sync). Das ist kritisches Wissen für die Client-Implementierung.

Callbacks: Subscription-Lifecycle im Backend.

3.2 Schreib-Operationen (Data Ingress) [Score: 8/10]

Validierung: Was passiert im Backend bei ungültigen Daten?

Verarbeitung: Synchrone vs. Asynchrone Verarbeitung (Datenfluss in die DB).

4. API-Spezifikation (Referenz)

Standard-Wissen, stark kondensiert.

4.1 Authentifizierung [Score: 7/10]

Einrichtung des API-Users in PEAK.X (Rechte-Management).

4.2 Status Codes & Formate [Score: 4/10]

Nur PEAK-spezifische Besonderheiten.

5. Tools

5.1 Swagger UI & Interaktive Tests [Score: 6/10]

URL und Nutzung zur Diagnose.