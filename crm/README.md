# Och · CRM

Ein privates, verschlüsseltes und multimediales CRM für OCH, genutzt von genau einer Person. Kein Server, kein Konto, keine Datenübertragung an Dritte. Laptop und Handy lassen sich über einen eigenen Cloud-Ordner synchronisieren, und das CRM lässt sich als App installieren.

## Dateien

| Datei | Zweck |
|---|---|
| `index.html` | die komplette App |
| `manifest.webmanifest`, `sw.js`, `icon-*.png`, `apple-touch-icon.png` | Installation als App und Offline-Betrieb |
| `README.md` | diese Anleitung |

## Starten und als App installieren

Für die App-Installation und das Handy muss das CRM über **HTTPS** erreichbar sein. Am einfachsten geht das mit GitHub Pages:

1. Branch in `main` übernehmen.
2. In GitHub: *Settings → Pages → Source: Deploy from a branch → `main` / root*.
3. Die Adresse lautet dann `https://andreasoch.github.io/Och-BCA/crm/`. Vermutung: Pages ist für dieses Repo noch nicht eingerichtet, von hier aus konnte ich das nicht prüfen. Das Repo muss dafür öffentlich sein (oder ein kostenpflichtiger GitHub-Plan). Den Code sieht dann jeder, deine Daten nicht.

Installieren:
- **Windows/Mac (Chrome, Edge):** Einstellungen → App → *Als App installieren* (oder das Symbol in der Adressleiste).
- **iPhone/iPad (Safari):** *Teilen → Zum Home-Bildschirm*. Achtung: Die installierte App hat einen **eigenen Speicher**, getrennt von Safari. Richte das CRM deshalb erst in der App ein (z. B. per Sync-Datei).
- **Android (Chrome):** Menü → *App installieren*.

Lokal geht es auch ohne Hosting: `index.html` im Browser öffnen. Dann allerdings ohne App-Installation und ohne Offline-Betrieb.

Wichtig: Die Daten gehören zu *Browser bzw. App + Adresse*. Für einen Wechsel nutzt du das Backup oder die Sync-Datei.

## Synchronisation Laptop ↔ Handy

Grundidee: Ein Ordner in deiner Cloud, empfohlen **OneDrive des OCH-Kontos, Ordner `OCH-CRM`**. Jedes Gerät legt dort eine eigene Datei `och-crm-<gerät>-<kennung>.ochsync` ab und liest die Dateien der anderen.

- Die Dateien sind Ende-zu-Ende verschlüsselt. Die Cloud sieht nur unlesbare Daten.
- Weil jedes Gerät nur seine eigene Datei schreibt, gibt es keine Schreibkonflikte in der Cloud.
- Zusammengeführt wird **feldgenau**: Pro Feld gewinnt die jüngere Änderung. Änderst du am Handy das Tag und am Laptop die Position desselben Kontakts, bleiben beide Änderungen erhalten.
- Löschungen werden mit übertragen.
- Medien werden mit übertragen, aber nur die, die dem anderen Gerät noch fehlen.

### Einrichten

1. **Laptop (Chrome/Edge):**
   - Einstellungen → Synchronisation → *Sync-Ordner wählen* → den OneDrive-Ordner `OCH-CRM` wählen.
   - Ab dann synchronisiert der Laptop automatisch: beim Start, alle 1–2 Minuten und nach Änderungen.
   - Nach einem Browser-Neustart fragt Chrome evtl. einmal nach der Ordner-Freigabe. Dann einfach auf das Sync-Symbol oben tippen.
2. **Handy:**
   - Das CRM öffnen bzw. die App installieren.
   - Auf dem Startbildschirm *„Backup oder Sync-Datei einspielen“* tippen.
   - In der Dateien-App unter OneDrive › OCH-CRM die Laptop-Datei wählen und die Passphrase eingeben.
3. **Danach am Handy:** Sync-Symbol oben antippen.
   - **1 · Stand der anderen Geräte laden:** Datei(en) des Laptops wählen.
   - **2 · Meinen Stand sichern:** über *Teilen → In Dateien sichern* nach OneDrive › OCH-CRM speichern und die alte Datei ersetzen.

Warum am Handy zwei Tipper? Mobile Browser erlauben Web-Apps keinen dauerhaften Zugriff auf Cloud-Ordner. Eine voll automatische Synchronisation auch am Handy wäre über die OneDrive-Schnittstelle (Microsoft Graph) möglich. Dafür bräuchte es eine App-Registrierung in deinem OCH-Tenant. Das wäre ein möglicher nächster Ausbauschritt.

Hinweise:
- Die Sync-Datei enthält alle Medien. Mit vielen Videos wird sie entsprechend groß.
- Die Uhrzeit der Geräte sollte stimmen (automatische Zeit an). Sie entscheidet, welche Änderung „jünger“ ist.
- Eine Passphrase-Änderung gilt nur auf dem Gerät, auf dem du sie vornimmst. Der Sync funktioniert trotzdem weiter.

## Was das CRM kann

| Bereich | Funktionen |
|---|---|
| Kontakte | Personen und Firmen, Status, Tags, Wichtigkeit (★), Geburtstag, eigene Felder, Kontaktrhythmus, Karten- oder Tabellenansicht, Filter und Sortierung |
| Verlauf | Notiz, Anruf, Treffen, E-Mail, Nachricht, Termin, Sprachnotiz, Medien; mit Anhängen und optionaler Folgeaufgabe |
| Multimedia | Fotos, Videos, Audio, PDFs und beliebige Dateien per Auswahl, Drag & Drop, Einfügen (⌘V) oder Kamera; Sprachnotizen aufnehmen; Vorschau, Profilbild, Mediathek |
| Aufgaben | fällig, überfällig, heute, nächste 7 Tage, erledigt |
| Pipeline | Kanban mit Wert, Wahrscheinlichkeit und gewichteter Summe; Drag & Drop oder Phasenauswahl auf der Karte |
| Übersicht | Kennzahlen, „Melde dich mal bei …“, Geburtstage, Aktivität der letzten 12 Wochen, Pipeline nach Phase |
| Suche | ⌘K / Strg+K durchsucht alles inkl. Befehle; `N` legt etwas Neues an |
| Daten | verschlüsseltes Backup, Sync-Dateien, Import aus vCard/CSV, Export als CSV/vCard/JSON |

## Sicherheit

- Jeder Datensatz und jede Datei wird einzeln mit **AES-256-GCM** verschlüsselt.
- Der Datenschlüssel ist mit **PBKDF2-SHA-256 (600.000 Runden)** an deine Passphrase gebunden.
- Die Passphrase muss mindestens 12 Zeichen haben. Nach Inaktivität sperrt sich das CRM automatisch (Standard 10 Minuten).
- Nach Fehlversuchen beim Entsperren wächst die Wartezeit.
- Eine strenge Content-Security-Policy verbietet externe Skripte, Schriften und jegliche Netzwerkverbindung aus der App.
- Der Service Worker speichert nur die App-Dateien, nie deine Daten.
- Backup- und Sync-Dateien enthalten den mit der Passphrase verpackten Schlüssel. Wer eine solche Datei erbeutet, kann nur durch Raten der Passphrase an die Daten kommen. Deshalb: **lange Passphrase** (ein Satz aus 4–5 Wörtern) und Cloud-Konto mit MFA.
- **Es gibt kein „Passwort vergessen“.** Bewahre die Passphrase im Passwortmanager auf.

## Backup

Unter *Einstellungen → Backup erstellen* entsteht eine `.ochcrm`-Datei. Sie bleibt verschlüsselt und lässt sich nur mit der Passphrase öffnen, die beim Erstellen galt. Das Wiederherstellen **ersetzt** den Inhalt. Der Sync ersetzt kein Backup: Eine versehentliche Löschung wird auf alle Geräte übertragen.

CSV-, vCard- und JSON-Exporte sind **unverschlüsselt**.

## Datenschutz für OCH (Ersteinschätzung, keine Rechtsberatung)

Da das CRM geschäftlich für OCH genutzt wird, gilt die DSGVO. Die Haushaltsausnahme greift nicht. Verantwortlich ist OCH.

- **Technik (Art. 25, 32):** lokale Verarbeitung, Verschlüsselung, Auto-Sperre, keine Übermittlung an Dritte. Die Cloud speichert nur verschlüsselte Dateien. Empfohlen ist der OneDrive-Ordner des OCH-Tenants, der durch den Microsoft-Vertrag zur Auftragsverarbeitung (Data Protection Addendum) abgedeckt ist.
- **Verzeichnis von Verarbeitungstätigkeiten (Art. 30):** das CRM als Verarbeitung „Kontakt- und Kundenpflege“ eintragen (Zweck, Datenkategorien, Löschfristen, Technik).
- **Informationspflicht (Art. 13/14):** Kontakte in der Datenschutzerklärung von OCH bzw. beim Erstkontakt über die Speicherung informieren.
- **Löschen (Art. 17):** Ein gelöschter Kontakt verschwindet mit allen Einträgen, Medien, Aufgaben und Chancen, auch auf den anderen Geräten. Ältere Backups enthalten ihn weiter, also Backups nur begrenzt aufbewahren.
- **Auskunft und Übertragbarkeit (Art. 15/20):** vCard-Export je Kontakt, JSON-Export gesamt.
- **Aufbewahrung (HGB/AO):** Geschäftsbriefe und Belege gehören in die Buchhaltung bzw. das Archiv, nicht nur ins CRM.
- **Sensible Daten:** Gesundheits- oder vergleichbare Daten (Art. 9) nur festhalten, wenn es wirklich nötig ist.
