# 2 Installation und erste Schritte

Dieses Kapitel beschreibt, wie Sie die App auf Ihrem iOS-Gerät einrichten und die Verbindung zum PEAK.DMS-Server herstellen.

## 2.1 App installieren
Die Verteilung der App erfolgt in der Regel zentral über das Mobile Device Management (MDM) Ihres Unternehmens. In diesem Fall finden Sie die App **PEAK.DMS.Mobile** (rotes Icon mit weißem Bus-Symbol) automatisch auf Ihrem Startbildschirm.

Sollten Sie die App manuell installieren müssen, folgen Sie den Anweisungen Ihrer IT-Abteilung (z. B. Download über den Apple App Store oder TestFlight).

## 2.2 Serververbindung konfigurieren
Bevor Sie sich zum ersten Mal anmelden, müssen Sie der App mitteilen, mit welchem DMS-Server sie kommunizieren soll.

1.  Starten Sie die App. Der Anmeldebildschirm erscheint.
2.  Tippen Sie unterhalb der Anmelde-Schaltfläche auf den Button **„Server-Einstellungen“** (Zahnrad-Symbol).
3.  Es öffnet sich ein Dialogfenster „Server-Einstellungen“.
4.  Geben Sie im Textfeld die vollständige **API-URL** Ihres Servers ein.
    *   *Beispiel:* `https://dms-server-01.ihre-firma.de:5201`
    *   *Hinweis:* Diese Adresse erhalten Sie von Ihrer IT-Administration.
5.  Bestätigen Sie die Eingabe mit **„Ok“**.

Die App prüft nun die Erreichbarkeit des Servers. Bei Erfolg kehren Sie automatisch zum Anmeldebildschirm zurück.

## 2.3 An der App anmelden
Nachdem der Server konfiguriert ist, können Sie sich mit Ihrem persönlichen Benutzerkonto anmelden.

1.  Tippen Sie in das Feld **„Benutzername“** und geben Sie Ihre Kennung ein (z. B. `AppTestUser1`).
2.  Tippen Sie in das Feld **„Kennwort“** und geben Sie Ihr Passwort ein.
    *   *Tipp:* Tippen Sie auf das **Augen-Symbol** rechts im Feld, um das Passwort im Klartext anzuzeigen und Tippfehler zu vermeiden.
3.  Tippen Sie auf die dunkle Schaltfläche **„Anmelden“** (Pfeil-Symbol).

Während die App Ihre Daten prüft, erscheint kurz ein Ladeindikator („Einloggen...“). Nach erfolgreicher Prüfung gelangen Sie direkt auf das **Dashboard** (Startseite).

> **Hinweis zur Sicherheit:**
> Aus Sicherheitsgründen sollten Sie Ihr Passwort niemals an Dritte weitergeben. Wenn Sie das Gerät mit anderen Kollegen teilen, denken Sie daran, sich nach Schichtende auszuloggen (siehe Kapitel [Vom System abmelden](#)).