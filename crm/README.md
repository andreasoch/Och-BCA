# Och · CRM

Ein privates, verschlüsseltes und multimediales CRM für genau eine Person. Es besteht aus einer einzigen Datei (`index.html`), braucht keinen Server und kein Konto und sendet keine Daten ins Internet.

## Starten

- **Lokal:** `index.html` im Browser öffnen (Chrome, Edge, Firefox oder Safari, jeweils aktuell). Am besten als Lesezeichen speichern.
- **Über die Website:** Liegt das Repo auf GitHub Pages, ist die App unter `…/crm/` erreichbar. Den Code kann dort jeder sehen, die Daten nicht: Sie liegen ausschließlich verschlüsselt im Browser des jeweiligen Geräts.
- **Wichtig:** Die Daten gehören zu *Browser + Adresse*. Eine lokal geöffnete Datei und die Pages-Adresse sind deshalb zwei getrennte CRMs. Bleib bei einer Variante. Für den Umzug gibt es das Backup.

## Was es kann

| Bereich | Funktionen |
|---|---|
| Kontakte | Personen und Firmen, Status, Tags, Wichtigkeit (★), Geburtstag, eigene Felder, Kontaktrhythmus, Karten- oder Tabellenansicht, Filter und Sortierung |
| Verlauf | Notiz, Anruf, Treffen, E-Mail, Nachricht, Termin, Sprachnotiz, Medien; mit Anhängen und optionaler Folgeaufgabe |
| Multimedia | Fotos, Videos, Audio, PDFs und beliebige Dateien per Auswahl, Drag & Drop, Einfügen (⌘V) oder Kamera; Sprachnotizen direkt aufnehmen; Vorschau, Profilbild, Mediathek |
| Aufgaben | fällig, überfällig, heute, nächste 7 Tage, erledigt |
| Pipeline | Kanban mit Phasen, Wert, Wahrscheinlichkeit und gewichteter Summe; Drag & Drop oder Phasenauswahl auf der Karte |
| Übersicht | Kennzahlen, „Melde dich mal bei …“, Geburtstage, Aktivität der letzten 12 Wochen, Pipeline nach Phase |
| Suche | ⌘K / Strg+K durchsucht Kontakte, Einträge, Aufgaben, Chancen, Dateien und Befehle; `N` legt etwas Neues an |
| Daten | verschlüsseltes Voll-Backup inkl. Medien; Import aus vCard (.vcf) und CSV; Export als CSV, vCard oder JSON |

## Sicherheit

- Jeder Datensatz und jede Datei wird einzeln mit **AES-256-GCM** verschlüsselt (Web Crypto API).
- Ein zufälliger Datenschlüssel wird mit einem Schlüssel verpackt, der per **PBKDF2-SHA-256 mit 600.000 Runden** aus der Passphrase entsteht (OWASP-Empfehlung). Argon2id bietet der Browser nicht von sich aus an.
- Die Passphrase muss mindestens 12 Zeichen haben; sehr schwache werden abgelehnt.
- Der Schlüssel liegt nur im Arbeitsspeicher. Nach einstellbarer Inaktivität (Standard 10 Minuten) sperrt sich das CRM automatisch.
- Eine strenge Content-Security-Policy erlaubt keine externen Skripte, Schriften oder Netzwerkverbindungen (`connect-src 'none'`).
- Nach Fehlversuchen beim Entsperren wächst die Wartezeit. Der eigentliche Schutz gegen Durchprobieren ist aber die aufwendige Schlüsselableitung.
- **Es gibt kein „Passwort vergessen“.** Ohne Passphrase sind die Daten verloren. Bewahre sie in deinem Passwortmanager auf.

## Backup (bitte regelmäßig)

Unter *Einstellungen → Backup erstellen* entsteht eine `.ochcrm`-Datei. Sie bleibt verschlüsselt und lässt sich nur mit der Passphrase öffnen, die beim Erstellen galt. Das Wiederherstellen **ersetzt** den aktuellen Inhalt. Browser können lokalen Speicher in Ausnahmefällen löschen (z. B. beim Zurücksetzen der Browserdaten). Deshalb ist das Backup der eigentliche Datenschutz.

CSV-, vCard- und JSON-Exporte sind **unverschlüsselt**.

## Datenschutz (Hinweis, keine Rechtsberatung)

- Verarbeitung ausschließlich lokal, keine Übermittlung an Dritte, keine Cloud, keine externen Schriften.
- Nutzt du das CRM für Kunden- oder Geschäftskontakte, gilt die DSGVO. Die rein private Nutzung fällt unter die Haushaltsausnahme (Art. 2 Abs. 2 lit. c DSGVO). Sinnvoll ist dann:
  - Löschen auf Anfrage: Kontakt löschen entfernt alle zugehörigen Einträge, Medien, Aufgaben und Chancen (Art. 17).
  - Auskunft und Datenübertragbarkeit: vCard- oder JSON-Export je Kontakt bzw. gesamt (Art. 15/20).
  - Datenminimierung: nur festhalten, was du wirklich brauchst; regelmäßig aufräumen.
- Für die dienstliche Nutzung im BCA-Kontext bitte vorab mit Compliance bzw. dem Datenschutzbeauftragten klären, ob ein privates CRM zulässig ist.

## Technik

- Eine HTML-Datei ohne Abhängigkeiten; Speicher: IndexedDB `och-crm` (Stores `meta`, `rec`, `blob`).
- Vorschaubilder für Fotos und Videos werden beim Hochladen erzeugt und ebenfalls verschlüsselt gespeichert.
