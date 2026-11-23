# Och · CRM

Ein privates, verschlüsseltes und multimediales **Contact Relationship Management** für Andreas Och, also Beziehungspflege statt Kundenverwaltung: Geschäftspartner, Dienstleister, Netzwerk, Familie und Freunde. Es ergänzt DIVA der BCA (Finanzberatungskunden) und Outlook (reine Kontaktdaten). Kein Server, kein Konto, keine Datenübertragung an Dritte. Laptop und Handy lassen sich über einen eigenen Cloud-Ordner synchronisieren, und das CRM lässt sich als App installieren.

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

## Beziehungen pflegen

- **Kategorien:** Kunde, Familie, Freunde, Geschäftspartner, Dienstleister, Netzwerk und Bekannte. Die Liste ist unter *Einstellungen → Darstellung & Felder* änderbar.
- **Beziehungen:** Im Kontakt über **„Beziehung“** Kontakte verknüpfen, z. B. Ehepartner/in, Kind, Elternteil, Geschwister, Freund/in, Kollege/Kollegin, Empfohlen von.
  - Die Gegenrichtung erscheint automatisch: Ist Lisa „Kind“ von Anna, steht bei Lisa „Elternteil: Anna“.
  - Entfernen geht mit × von beiden Seiten.
- **Wichtige Daten:** Im Kontakt je Zeile „Bezeichnung: TT.MM.JJJJ“ (oder ohne Jahr „TT.MM.“), z. B. Hochzeitstag oder Namenstag. Sie erscheinen mit Geburtstagen unter „Geburtstage und Jahrestage“ in der Übersicht, mit Angabe des Jahrestags.
- **Geschenkideen:** freies Feld im Kontakt, durchsuchbar.
- **Kontaktrhythmus:** Wöchentlich bis jährlich. Das CRM erinnert unter „Melde dich mal bei …“.
- **Verstorbene Kontakte:** Im Kontakt „Verstorben ✝“ anhaken, optional mit Datum. Mehrere Kontakte auf einmal geht über die Mehrfachbearbeitung.
  - Sichtbar: ✝ neben dem Namen, abgeblendetes Profilbild. Verlauf und Beziehungen bleiben erhalten.
  - Ausgeschlossen aus allen Rundmails (auch persönlichen), aus „Melde dich mal bei …“ und aus den Geburtstagserinnerungen.
  - Optional „Todestag als Gedenktag“: erscheint unter „Geburts- und Jahrestage“.
  - Kontaktliste: Filter „inkl. / ohne / nur Verstorbene“.
- **Pipeline:** Pipeline und Chancen (Vertrieb) sind ausgeblendet. Einschalten über *Einstellungen → Darstellung & Felder → „Pipeline und Chancen anzeigen“*, vorhandene Daten bleiben erhalten.

Beim ersten Start von Version 1.4 wurden die alten Vertriebsstatus umgestellt: „Partner“ wurde zu „Geschäftspartner“, „Privat“ zu „Freunde“. Andere bereits verwendete Werte (z. B. „Kunde“) bleiben in der Liste, bis du sie umstellst.

## Mehrere Kontakte auf einmal bearbeiten

In **Kontakte** auf **„Auswählen“** klicken. Dann Kontakte anklicken oder mit Filter und **„Alle angezeigten auswählen“** markieren, z. B. alle mit dem Tag „Asuro“. Anschließend:

- **Bearbeiten …:**
  - Kategorie setzen (oder direkt eine **neue Kategorie anlegen**),
  - Tags hinzufügen oder entfernen,
  - E-Mail-Werbung mit Nachweis, Kontaktrhythmus, Wichtigkeit.
  - Felder auf „unverändert“ bleiben unangetastet.
- **Löschen …:** mit Bestätigung durch Eingabe von LÖSCHEN.

„Auswahl beenden“ schaltet zurück, dann öffnet ein Klick wieder den Kontakt.

Kategorien verwaltest du außerdem unter *Einstellungen → Darstellung & Felder → Kategorien* (eine pro Zeile).

## Kontakte importieren (Import-Assistent)

*Einstellungen → Import & Export → „vCard / CSV importieren“.* Für Outlook am besten das **klassische Outlook** nehmen (Datei → Öffnen und exportieren → Importieren/Exportieren → In Datei exportieren → CSV → Ordner „Kontakte“). Das neue Outlook lässt die Kategorien *vermutlich* weg.

1. **Kategorien aus der Datei** erscheinen mit Anzahl. Je Kategorie wählst du eine Aktion:
   - **Ausschließen:** Kontakte mit dieser Kategorie werden nicht importiert.
   - **Weglassen:** Die Kategorie wird nicht übernommen.
   - **Als Tag behalten.**
   - **→ CRM-Kategorie**, z. B. Familie oder Kunde.
2. **Vorbelegung:**
   - „BCA …“ wird ausgeschlossen (BCA-Daten gehören nicht ins CRM).
   - „Auto: …“ und „Radar: …“ (Sortierung des Posteingangs) werden weggelassen.
   - Gleichnamige Kategorien werden zugeordnet, alles andere wird Tag.
3. **Kontakte auswählen:** Suche, Filter nach Kategorie, nur mit E-Mail, nur mit Telefon. Standardmäßig ist **nichts** ausgewählt, „Alle angezeigten auswählen“ übernimmt die gefilterten.
4. **Schon vorhandene Kontakte** (gleicher Name und gleiche E-Mail) werden ausgeblendet und nie doppelt angelegt.
5. Die **Zuordnung der Kategorien wird gespeichert**. Dieselbe Datei später erneut laden und die nächste Gruppe übernehmen.

Die Zeichenkodierung (auch Windows-1252 aus Outlook), mehrere E-Mail-Adressen und Telefonnummern sowie Anschrift mit PLZ und Ort werden automatisch erkannt.

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

## Kampagnen (Rundmail)

Unter **Kampagnen** (am Handy: „Mails“) verschickst du Rundmails an eine Auswahl deiner Kontakte. Absender ist **Andreas@och-Finanzberatung.de**. Es gibt zwei Arten:

- **Geschäftlich (Werbung):** nur an Kontakte mit Einwilligung oder als Bestandskunde, mit Pflichtangaben-Fuß und Abmeldehinweis.
- **Persönlich (Einladung, Gruß, keine Werbung):** an Familie und Freunde auch ohne Werbe-Einwilligung, ohne Geschäftsfuß. Ein Widerspruch sperrt trotzdem. Nur für echte private Anlässe: Grüße mit geschäftlichem Bezug an Geschäftskontakte gelten oft als Werbung.

### So geht's

1. **Neue Rundmail** anlegen und einen Namen vergeben.
2. **Inhalt:** Betreff und Text schreiben. Platzhalter: `{{Briefanrede}}`, `{{Vorname}}`, `{{Nachname}}`, `{{Name}}`, `{{Firma}}`. Formatierung: Leerzeile = neuer Absatz, `**fett**`, `[Linktext](https://…)`.
3. **Empfänger auswählen:**
   - nach Status, Tags (mit bzw. ohne), Art, Ort und Wichtigkeit,
   - einzelne Kontakte hinzufügen oder entfernen,
   - die Zahl der Empfänger aktualisiert sich sofort.
4. **Vorschau** für jeden Empfänger ansehen.
5. **Versand:** zuerst eine Testmail an dich, dann „An N Empfänger senden“ und die Prüfung bestätigen.
   - Jede Mail geht einzeln raus, ohne sichtbare Verteilerliste.
   - Es gehen höchstens 20 Mails pro Minute raus (einstellbar bis 30).
   - Jeder Versand steht anschließend im Verlauf des Kontakts.
   - Versand anhalten und später fortsetzen ist möglich. Bereits Angeschriebene werden nicht doppelt beschrieben.

Ohne eingerichteten Microsoft-Zugang gibt es zwei andere Wege:
- **Empfänger als CSV** (für eine Serien-E-Mail mit Word und Outlook),
- **Einzeln per Mail-Programm** (jede Mail personalisiert öffnen, nach dem Senden abhaken).

### Wer angeschrieben werden darf

Im Kontakt gibt es das Feld **E-Mail-Werbung**:

| Status | Rundmail |
|---|---|
| Einwilligung liegt vor | ja |
| Bestandskunde (§ 7 Abs. 3 UWG) | ja, aber nur für eigene, ähnliche Produkte |
| ungeklärt | nein (ausgeschlossen) |
| Widerspruch / abgemeldet | nie |

Trag im Feld **Nachweis** Datum und Quelle der Einwilligung ein, z. B. „12.03.2026, Formular Erstgespräch“. Jede Mail enthält automatisch deinen Fußtext mit Pflichtangaben und einen Abmeldehinweis („Antworten Sie mit ‚Abmelden‘“). Wer sich abmeldet, bekommt im Kontakt den Status **Widerspruch / abgemeldet** und ist ab dann gesperrt.

Für die persönliche Ansprache gibt es im Kontakt außerdem **Anrede** (Frau/Herr) und **Wir duzen uns**. Daraus entsteht `{{Briefanrede}}`, z. B. „Sehr geehrte Frau Schmidt“ oder „Lieber Peter“.

### Microsoft-365-Zugang einrichten (einmalig)

Voraussetzung: Das Postfach Andreas@och-Finanzberatung.de liegt in deinem Microsoft-365-Tenant (*Vermutung*, bitte prüfen), und du hast Administratorrechte. Die Menünamen können sich bei Microsoft leicht ändern.

1. **entra.microsoft.com** öffnen → *Identität* → *Anwendungen* → *App-Registrierungen* → **Neue Registrierung**.
2. Name: `Och CRM`. Unterstützte Kontotypen: **Nur Konten in diesem Organisationsverzeichnis** (Einzelmandant).
3. Umleitungs-URI: Plattform **Single-Page-Anwendung (SPA)**, Adresse `https://andreasoch.github.io/Och-BCA/crm/` → **Registrieren**.
4. In der Übersicht zwei Werte kopieren: **Anwendungs-ID (Client)** und **Verzeichnis-ID (Mandant)**.
5. *API-Berechtigungen* → *Berechtigung hinzufügen* → *Microsoft Graph* → *Delegierte Berechtigungen* → **Mail.Send** (User.Read ist meist schon da) → **Administratorzustimmung erteilen**.
6. Im CRM: *Einstellungen → E-Mail-Versand* → Mandant (Verzeichnis-ID oder `och-finanzberatung.de`) und Anwendungs-ID eintragen.
7. Den **Fußtext mit Pflichtangaben** ausfüllen. Solange dort noch `[Platzhalter]` stehen, ist der Versand gesperrt.
8. **Anmelden und prüfen**: Es öffnet sich das Microsoft-Anmeldefenster (Pop-ups erlauben). Melde dich mit Andreas@och-Finanzberatung.de an.

Hinweise:
- **Kein Speichern von Zugangsdaten:** Die Anmeldung gilt nur für die laufende Sitzung. Kennwörter oder Schlüssel speichert das CRM nicht.
- **Am besten vom Laptop senden** (Chrome oder Edge). *Vermutung:* In der installierten iPhone-App kehrt das Anmeldefenster nicht zuverlässig zur App zurück.
- **Versandgrenzen:** Microsoft begrenzt den Versand. *Vermutung nach Stand meines Wissens:* etwa 10.000 Empfänger pro Tag und 30 Mails pro Minute je Postfach.

## Was das CRM kann

| Bereich | Funktionen |
|---|---|
| Kontakte | Personen und Firmen, Adresse mit „In Karten öffnen“ und Kartenausschnitt (OpenStreetMap), Kategorien, Beziehungen, wichtige Daten, Geschenkideen, Tags, Wichtigkeit (★), Geburtstag, eigene Felder, Kontaktrhythmus, Karten- oder Tabellenansicht, Filter und Sortierung |
| Verlauf | Notiz, Anruf, Treffen, E-Mail, Nachricht, Termin, Sprachnotiz, Medien, Recherche; mit Quelle (Link), Anhängen und optionaler Folgeaufgabe |
| Recherche | Such-Links zu Google, LinkedIn, XING, Northdata und Website; Ergebnis als Eintrag „Recherche“ mit Quelle festhalten |
| Multimedia | Fotos, Videos, Audio, PDFs und beliebige Dateien per Auswahl, Drag & Drop, Einfügen (⌘V) oder Kamera; Sprachnotizen aufnehmen; Vorschau, Profilbild, Mediathek |
| Aufgaben | fällig, überfällig, heute, nächste 7 Tage, erledigt |
| Pipeline (optional) | Kanban mit Wert, Wahrscheinlichkeit und gewichteter Summe; Drag & Drop oder Phasenauswahl auf der Karte |
| Übersicht | Kennzahlen nach Kategorien, „Melde dich mal bei …“, Geburtstage und Jahrestage, Aktivität der letzten 12 Wochen, Pipeline nach Phase (wenn eingeschaltet) |
| Suche | ⌘K / Strg+K durchsucht alles inkl. Befehle; `N` legt etwas Neues an |
| Daten | verschlüsseltes Backup, Sync-Dateien, Import aus vCard/CSV, Export als CSV/vCard/JSON |
| Kampagnen | Rundmails an Auswahl nach Status, Tags, Ort, Wichtigkeit; Platzhalter, Vorschau, Testmail, Einzelversand über Microsoft 365, Einwilligungsprüfung, Verlaufseintrag |

## Sicherheit

- Jeder Datensatz und jede Datei wird einzeln mit **AES-256-GCM** verschlüsselt.
- Der Datenschlüssel ist mit **PBKDF2-SHA-256 (600.000 Runden)** an deine Passphrase gebunden.
- Die Passphrase muss mindestens 12 Zeichen haben. Nach Inaktivität sperrt sich das CRM automatisch (Standard 10 Minuten).
- Nach Fehlversuchen beim Entsperren wächst die Wartezeit.
- Eine strenge Content-Security-Policy verbietet externe Skripte und Schriften. Netzwerkverbindungen sind nur zu wenigen Adressen erlaubt, und nur auf deinen Klick:
  - Microsoft-Anmeldung (`login.microsoftonline.com`) und Mail-Schnittstelle (`graph.microsoft.com`) für den Rundmail-Versand,
  - OpenStreetMap (`nominatim.openstreetmap.org` für die Adresssuche, `www.openstreetmap.org` für den Kartenausschnitt), wenn du bei einem Kontakt „Karte anzeigen“ wählst,
  - die eigene Seite für die Update-Prüfung.
- Der Service Worker speichert nur die App-Dateien, nie deine Daten.
- Backup- und Sync-Dateien enthalten den mit der Passphrase verpackten Schlüssel. Wer eine solche Datei erbeutet, kann nur durch Raten der Passphrase an die Daten kommen. Deshalb: **lange Passphrase** (ein Satz aus 4–5 Wörtern) und Cloud-Konto mit MFA.
- **Es gibt kein „Passwort vergessen“.** Bewahre die Passphrase im Passwortmanager auf.

## Backup

Unter *Einstellungen → Backup erstellen* entsteht eine `.ochcrm`-Datei. Sie bleibt verschlüsselt und lässt sich nur mit der Passphrase öffnen, die beim Erstellen galt. Das Wiederherstellen **ersetzt** den Inhalt. Der Sync ersetzt kein Backup: Eine versehentliche Löschung wird auf alle Geräte übertragen.

CSV-, vCard- und JSON-Exporte sind **unverschlüsselt**.

## Datenschutz für OCH (Ersteinschätzung, keine Rechtsberatung)

Das CRM ist gemischt genutzt:
- **Privatkontakte** (Familie, Freunde) fallen weitgehend unter die Haushaltsausnahme der DSGVO (Art. 2 Abs. 2 lit. c).
- Für **Geschäftskontakte** von OCH gilt die DSGVO, verantwortlich ist OCH.

**Abgrenzung BCA ↔ OCH, bitte sauber trennen:**

| Daten | Herkunft | Wohin |
|---|---|---|
| **BCA-Daten** | Angestelltentätigkeit als Senior-Vertriebsmanager der BCA: Vermittlerdaten und deren Kundendaten | **nur auf den BCA-Laptop**, nie ins Och-CRM, nie auf Gewerbe- oder Privatgeräte |
| **OCH-Kunden** | eigene Kunden der Finanzanlagenvermittlung (Gewerbe OCH), auch wenn sie in DIVA geführt werden | **Och-CRM erlaubt**, Kategorie „Kunde“ |

**Kunden aus DIVA:** Der Kundenbestand gehört Andreas Och als Vermittler. Kundendaten aus DIVA **dürfen ins CRM übernommen werden**, z. B. per CSV-Export und Import.
- **Keine KI-Verarbeitung:** Das CRM hat keine KI-Funktion und läuft verschlüsselt nur auf den eigenen Geräten.
- **KI-Ampel:** Kundendaten sind Stufe **Gelb**. In Claude und andere Cloud-KIs nur pseudonymisiert. Also keine CSV-, JSON- oder Backup-Dateien und keine Screenshots mit Kundendaten in KI-Chats geben.
- **Verantwortung:** Für die Kundendaten ist Andreas Och als Vermittler verantwortlich (DSGVO). Für Rundmails an Kunden gilt die Einwilligungs- bzw. Bestandskundenregel (siehe Kampagnen).
- **Künftige DIVA-Anbindung:** Schritt 1: die Standardschnittstelle von BCA/DIVA anbinden (ohne KI). Schritt 2, nach eingehender Prüfung: MCP. Hinweis: MCP ist eine Schnittstelle für KI-Assistenten. Eine Verbindung über MCP bringt die Daten daher *vermutlich* in KI-Berührung, zulässig nur mit Copilot im OCH-Tenant oder pseudonymisiert. Ohne KI geht es per CSV oder über eine direkte DIVA-Schnittstelle (API), falls angeboten.

- **Technik (Art. 25, 32):** lokale Verarbeitung, Verschlüsselung, Auto-Sperre, keine Übermittlung an Dritte. Die Cloud speichert nur verschlüsselte Dateien. Empfohlen ist der OneDrive-Ordner des OCH-Tenants, der durch den Microsoft-Vertrag zur Auftragsverarbeitung (Data Protection Addendum) abgedeckt ist.
- **Verzeichnis von Verarbeitungstätigkeiten (Art. 30):** das CRM als Verarbeitung „Kontakt- und Kundenpflege“ eintragen (Zweck, Datenkategorien, Löschfristen, Technik).
- **Informationspflicht (Art. 13/14):** Kontakte in der Datenschutzerklärung von OCH bzw. beim Erstkontakt über die Speicherung informieren.
- **Löschen (Art. 17):** Ein gelöschter Kontakt verschwindet mit allen Einträgen, Medien, Aufgaben und Chancen, auch auf den anderen Geräten. Ältere Backups enthalten ihn weiter, also Backups nur begrenzt aufbewahren.
- **Auskunft und Übertragbarkeit (Art. 15/20):** vCard-Export je Kontakt, JSON-Export gesamt.
- **Aufbewahrung (HGB/AO):** Geschäftsbriefe und Belege gehören in die Buchhaltung bzw. das Archiv, nicht nur ins CRM.
- **E-Mail-Werbung (§ 7 UWG, Art. 6, 7, 21 DSGVO):**
  - Rundmails nur an Kontakte mit dokumentierter Einwilligung oder als Bestandskunde, wobei die Bestandskundenausnahme nur für eigene, ähnliche Produkte gilt.
  - Jede Mail enthält Pflichtangaben und einen Abmeldehinweis.
  - Ein Widerspruch sperrt den Kontakt dauerhaft.
  - Der Versand wird je Kontakt im Verlauf dokumentiert.
  - Die Mails laufen über das OCH-Postfach bei Microsoft 365, Grundlage ist der Microsoft-Vertrag zur Auftragsverarbeitung.
- **Recherche:** Der Knopf „Recherche“ am Kontakt öffnet Suchen bei Google, LinkedIn, XING und Northdata erst auf Klick, ohne KI. Gespeichert wird nur, was du als Eintrag „Recherche“ festhältst, mit Quelle. Nur öffentliche Quellen, nur Nötiges. Bei Geschäftskontakten die Informationspflicht (Art. 14 DSGVO) über die Datenschutzerklärung abdecken.
- **Karten:** „In Karten öffnen“ übergibt die Adresse erst beim Klick an Apple Karten bzw. Google Maps. „Karte anzeigen“ sendet die Adresse einmalig auf Klick an OpenStreetMap (Großbritannien, Angemessenheitsbeschluss der EU), um die Koordinaten zu finden. Die Koordinaten werden verschlüsselt im Kontakt gespeichert. Vor der ersten Nutzung erscheint ein Hinweis.
- **Sensible Daten:** Gesundheits- oder vergleichbare Daten (Art. 9) nur festhalten, wenn es wirklich nötig ist.
