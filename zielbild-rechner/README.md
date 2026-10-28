# Zielbild: Rechner-, Programm- und Ordnerstruktur

**Geräte:** BCA-Laptop · OCH-Gewerbe-Laptop · PC (privat + KI-Workstation)
**Leitlinie:** KI konsequent nutzen, ohne dass personenbezogene Daten dort landen, wo sie nicht hingehören.
**Annahme:** Alle drei Geräte laufen unter Windows 11 (Gewerbe-Laptop und PC mit **Pro**, wegen BitLocker). Unter macOS gilt dieselbe Struktur, nur mit FileVault statt BitLocker und Homebrew statt winget.

> Hinweis: Dieses Repository ist öffentlich. Das Dokument enthält deshalb bewusst keine Zugangsdaten, Gerätenamen, Seriennummern oder Kundennamen, und das soll auch so bleiben.

---

## 1. Das Grundprinzip: drei Datenzonen, die sich nie mischen

| Zone | Gerät | Wem gehören die Daten? | Rechtlicher Rahmen | KI-Regel |
|---|---|---|---|---|
| **A · BCA** | BCA-Laptop | BCA AG (Arbeitgeber) | Arbeitsvertrag, BCA-IT-Richtlinien, DSGVO (BCA ist Verantwortlicher) | **Nur KI-Tools, die BCA freigegeben hat.** Keine privaten Konten, keine eigenen Tools. |
| **B · OCH Gewerbe** | Gewerbe-Laptop (Primär), PC (nur Zugriff über Tresor) | Du als Gewerbetreibender (Och Finanzberatung §34f, Och Skippertraining) | DSGVO (du bist Verantwortlicher), FinVermV, GoBD/AO-Aufbewahrung | **KI-Ampel** (Abschnitt 2): Kundendaten nur lokal oder pseudonymisiert. |
| **C · Privat & KI-Labor** | PC | Du privat | — | Frei, aber ohne Zone-A- oder Zone-B-Daten im Klartext. |

**Die drei goldenen Regeln:**

1. **Kein Datentransfer A ↔ B/C.** Keine BCA-Dateien auf private oder Gewerbe-Geräte, keine privaten USB-Sticks oder Clouds am BCA-Laptop, keine Weiterleitung von BCA-Mails an private Adressen.
2. **Zone B ist verschlüsselt, wo immer sie liegt:** BitLocker auf dem Datenträger, Cryptomator-Tresor in der Cloud, verschlüsseltes Backup.
3. **KI sieht nur, was in `KI-Freigabe` liegt.** Jedes KI-Tool mit Dateizugriff (Claude Desktop, Cowork, MCP-Server, LM Studio, Ollama-Frontends) bekommt **ausschließlich** den Ordner `…\40_KI\KI-Freigabe` freigegeben, nie das ganze Benutzerprofil.

```
                 ┌──────────────────────┐
                 │   A · BCA-Laptop     │   von BCA-IT verwaltet
                 │   BCA-Daten only     │   ✗ kein Austausch mit B/C
                 └──────────────────────┘

┌──────────────────────┐   Cryptomator-Tresor   ┌──────────────────────┐
│ B · Gewerbe-Laptop   │ ◄────(EU-Cloud)──────► │ C · PC               │
│ Kunden, Buchhaltung, │   nur Zone-B-Daten,    │ Privat + KI-Labor    │
│ Skippertraining      │   Ende-zu-Ende-        │ lokale LLMs (GPU)    │
│ lokale KI (klein)    │   verschlüsselt        │ Zone B nur im Tresor │
└──────────────────────┘                        └──────────────────────┘
           │                                               │
           └────────► verschlüsseltes Backup (3-2-1) ◄─────┘
```

---

## 2. KI-Ampel: welche Daten in welche KI dürfen

| Stufe | Datenart (Beispiele) | Erlaubte KI |
|---|---|---|
| 🔴 **Rot** | Kundennamen, Adressen, Geburtsdaten, Vermögens- und Depotdaten, Beratungsprotokolle, Ausweiskopien, Gesundheitsangaben (Versicherung), Steuer-ID | **Nur lokal**: Ollama / LM Studio auf PC oder Gewerbe-Laptop. Alternativ vorher pseudonymisieren (dann gilt Gelb). |
| 🟡 **Gelb** | Geschäftliches ohne Personenbezug: Konzepte, Webinar-Folien, Angebotstexte, anonymisierte Fallbeispiele, Marketing, Website-Code | Cloud-KI **mit Geschäftsvertrag und AV-Vertrag (DPA)**: z. B. Claude Team / API, ChatGPT Team / Enterprise. Training mit deinen Daten in den Einstellungen deaktiviert. |
| 🟢 **Grün** | Öffentliches und Privates: Segeltörn-Planung, Recherche, Lernen, eigene öffentliche Website | Jede seriöse Cloud-KI, auch Consumer-Tarife. |
| ⚫ **BCA** | Alles aus dem BCA-Kontext | **Ausschließlich** die von BCA bereitgestellten Tools (z. B. Microsoft 365 Copilot im BCA-Tenant, falls lizenziert), auf dem BCA-Laptop. |

**Pseudonymisieren, bevor etwas in die Cloud geht:** Ersetze Namen durch Kürzel (`Kunde-K042`). Die Zuordnungsliste `K042 = echter Name` liegt **nur** in `20_Kunden\_Zuordnung` im Tresor und wird nie einer KI gegeben. Ein lokales Modell kann die Pseudonymisierung erledigen (Prompt-Vorlage liegt in `40_KI\Prompts`).

**Für dein Gewerbe dokumentieren:** In `10_Verwaltung\Datenschutz` gehören ein kurzes Verzeichnis der Verarbeitungstätigkeiten, die AV-Verträge der genutzten Cloud-/KI-Anbieter und dieses Ampel-Schema. Dann bist du bei einer Prüfung auskunftsfähig.

---

## 3. Gerät A: BCA-Laptop

**Rolle:** reines Arbeitsgerät der BCA AG. BCA-IT verwaltet es (Intune, Defender o. Ä.). Du gestaltest nur das, was innerhalb der BCA-Vorgaben in deinem Benutzerbereich liegt.

### Programme

| Zweck | Programm | Hinweis |
|---|---|---|
| Office, Mail, Kalender | Microsoft 365 (BCA-Tenant) | |
| Ablage | OneDrive for Business / SharePoint / Teams (BCA) | einziger Speicherort für BCA-Dateien |
| Fachanwendungen | DIVA, Investmentshop, IFC-Admin, BfV-Tools | |
| Webinare | Teams / von BCA vorgegebenes Webinar-Tool | |
| KI | **nur von BCA freigegeben** (z. B. M365 Copilot) | private Claude-/ChatGPT-Konten hier nicht anmelden |
| Notizen | OneNote (BCA-Konto) | keine privaten Notiz-Apps mit Cloud-Sync |
| Passwörter | Passwortmanager nach BCA-Vorgabe | **nicht** derselbe Tresor wie Gewerbe/privat |

**Nicht auf den BCA-Laptop:** private Cloud-Clients (Google Drive, Dropbox, privates OneDrive), private Messenger, eigene KI-Tools, Browser-Sync mit privatem Konto, private USB-Sticks.

### Ordnerstruktur (in OneDrive for Business)

```
OneDrive - BCA AG\
├── 00_Eingang                ← Downloads/Scans landen hier, wöchentlich leeren
├── 10_Vertrieb
│   ├── Partner_A-Z           ← je Vermittler ein Ordner (gemäß BCA-Ablagerichtlinie)
│   ├── Anbindungen
│   └── Reporting
├── 20_Veranstaltungen
│   ├── Messen
│   └── Webinare              ← Folien, Aufzeichnungen, Teilnehmerlisten
├── 30_Plattformen
│   ├── DIVA
│   ├── Investmentshop
│   └── IFC_Finanzcockpit
├── 40_KI                     ← nur mit BCA-freigegebenen Tools nutzen
│   ├── Prompts               ← bewährte Prompts (ohne Partnerdaten)
│   └── Vorlagen
├── 50_Wissen                 ← Produktinfos, Regulatorik, Schulungen
└── 90_Archiv
```

---

## 4. Gerät B: OCH-Gewerbe-Laptop

**Rolle:** Hauptgerät für **Och Finanzberatung (§34f)** und **Och Skippertraining**. Hier liegen die sensibelsten Daten, die du selbst verantwortest.

### Grundschutz

- Windows 11 **Pro**, **BitLocker** mit PIN beim Start, Wiederherstellungsschlüssel ausgedruckt und im Passwortmanager (nicht im Microsoft-Konto allein)
- Zwei Windows-Konten: `Admin` (nur für Installationen) und dein **Standard-Benutzerkonto** für die tägliche Arbeit
- Windows-Sicherheit/Defender aktiv, automatische Updates, Firewall an
- Bildschirmsperre nach 5 Minuten, Windows Hello (PIN/Gesicht)
- Telemetrie auf Minimum, Werbe-ID aus, „Recall“ (falls vorhanden) deaktiviert

### Programme

| Zweck | Programm | Begründung |
|---|---|---|
| Browser | **Firefox** (Gewerbe-Profil) | ein Profil nur fürs Gewerbe, uBlock Origin |
| Passwörter + 2FA | **Bitwarden** (eigene Organisation „OCH Gewerbe“) oder KeePassXC | getrennt von BCA, Passkeys/TOTP |
| Verschlüsselte Cloud | **Cryptomator** über **EU-Cloud** (z. B. Nextcloud bei einem deutschen Hoster, Proton Drive, Hetzner Storage Share) | Ende-zu-Ende verschlüsselt, Anbieter sieht nichts |
| Mail & Kalender | **Thunderbird** oder Outlook mit eigener Geschäftsdomain (z. B. bei einem deutschen Hoster mit AV-Vertrag) | |
| Office | LibreOffice oder Microsoft 365 Business Standard | bei M365: Datenstandort EU, AV-Vertrag |
| Buchhaltung | **lexoffice / sevDesk** (Cloud, AV-Vertrag) oder DATEV-Anbindung an den Steuerberater | GoBD-konform |
| Beratungssoftware | die vom Haftungsdach/Pool vorgegebene Software (Web) | |
| PDF | **PDF24** (offline) oder SumatraPDF | keine Online-PDF-Konverter für Kundendokumente! |
| Scannen | Scanner-Software direkt in `00_Eingang` | |
| **KI (Cloud, Gelb/Grün)** | **Claude Desktop** mit Geschäftskonto (Team/Pro, Training aus) | Dateizugriff nur auf `40_KI\KI-Freigabe` |
| **KI (lokal, Rot)** | **Ollama** + **LM Studio** mit kleinem Modell (z. B. 7–8B, quantisiert) | Pseudonymisieren, Zusammenfassen von Kundendokumenten, alles offline |
| Diktat / Transkription | lokales Whisper (z. B. über LM Studio oder „Buzz“) | Beratungsgespräche nie in Cloud-Transkription |
| Notizen / Wissensbasis | **Obsidian** (Markdown, lokal) | Vault liegt im Tresor; KI-freundliches Format |
| Website Skippertraining | **VS Code** + **Git** | Website-Code ist Grün/Gelb, darf in Claude Code |
| Fernwartung | keine Dauer-Tools (kein TeamViewer im Autostart) | |
| Backup | **Veeam Agent Free** oder **restic** auf verschlüsselte USB-SSD + Cloud-Tresor | 3-2-1-Regel |
| Komprimieren | 7-Zip (AES-256 beim Versand) | |

### Ordnerstruktur

Alles Geschäftliche liegt **in einem Cryptomator-Tresor**, der als Laufwerk `O:` eingebunden wird (O wie OCH). Lokal ist nur der verschlüsselte Container gespeichert, in der Cloud ebenfalls.

```
O:\  (Cryptomator-Tresor „OCH-Gewerbe“)
├── 00_Eingang                    ← Scans, Downloads; täglich/wöchentlich einsortieren
├── 10_Verwaltung
│   ├── Gewerbe_Zulassung         ← §34f-Erlaubnis, IHK-Register, Vermögensschadenhaftpflicht
│   ├── Datenschutz               ← VVT, AV-Verträge, TOM, KI-Ampel, Datenpannen-Log
│   ├── Steuern
│   ├── Versicherungen
│   └── Verträge                  ← Haftungsdach, Pools, Dienstleister
├── 20_Kunden                     🔴 ROT, niemals in Cloud-KI
│   ├── _Zuordnung                ← Pseudonym-Liste (K042 = …), nur hier!
│   ├── K001_Nachname-Vorname
│   │   ├── 01_Stammdaten
│   │   ├── 02_Beratung           ← Geeignetheitserklärung, Protokolle
│   │   ├── 03_Antraege_Vertraege
│   │   ├── 04_Korrespondenz
│   │   └── 05_Depot_Reporting
│   └── _Ehemalige                ← nach Mandatsende hierher; Löschfristen beachten
├── 30_Buchhaltung
│   ├── 2026
│   │   ├── Eingangsrechnungen
│   │   ├── Ausgangsrechnungen
│   │   ├── Provisionsabrechnungen
│   │   └── Bank
│   └── Steuerberater_Austausch
├── 35_Skippertraining
│   ├── Kurse_Toerns              ← je Termin ein Ordner
│   ├── Teilnehmer                🔴 ROT (Namen, Gesundheitsangaben, Notfallkontakte)
│   ├── Unterlagen_Schulung       🟢
│   ├── Boot_Ausruestung
│   └── Website                   ← nur Exporte; Code liegt in Git (C:\Dev)
├── 40_KI
│   ├── KI-Freigabe               ★ EINZIGER Ordner, den KI-Tools sehen dürfen
│   │   ├── Kontext               ← Profil, Leistungsbeschreibung, Stil-Leitfaden (Markdown)
│   │   ├── Anonymisiert          ← pseudonymisierte Fälle zur Bearbeitung
│   │   └── Ausgaben              ← KI-Ergebnisse, vor Übernahme prüfen
│   ├── Prompts                   ← Prompt-Bibliothek (Markdown, versioniert)
│   └── Lokal_Modelle_Notizen     ← welche Modelle, wofür, Erfahrungen
├── 50_Marketing_Wissen
│   ├── Webinare
│   ├── Vorlagen
│   ├── Fachwissen_Regulatorik
│   └── Obsidian-Vault            ← Wissensbasis, Markdown
└── 90_Archiv
    └── JJJJ                      ← abgeschlossene Jahre, mit Löschdatum im Ordnernamen
```

Außerhalb des Tresors (unverschlüsselt ist hier akzeptabel, weil BitLocker greift und keine Rot-Daten enthalten sind):

```
C:\Dev\                ← Git-Repositories (Website Skippertraining, Profil-Website)
C:\KI\Modelle\         ← Ollama-/LM-Studio-Modelldateien (groß, gehören nicht ins Backup)
```

### Aufbewahrungsfristen (Orientierung, mit Steuerberater abstimmen)

| Unterlagen | Frist |
|---|---|
| Buchungsbelege (Rechnungen, Kontoauszüge) | 8 Jahre (seit 2025) |
| Handels- und Geschäftsbriefe | 6 Jahre |
| Bücher, Jahresabschlüsse | 10 Jahre |
| Aufzeichnungen nach FinVermV (Beratung, Geeignetheit) | mindestens 5 Jahre |
| Interessenten ohne Vertragsabschluss | löschen, sobald der Zweck entfällt |

Ordner in `90_Archiv` bekommen das Löschdatum im Namen, z. B. `2026_loeschen-ab-2034`.

---

## 5. Gerät C: PC (privat + KI-Labor)

**Rolle:** dein leistungsstärkstes Gerät. Privates Leben, Segeln, Experimente mit KI und **lokale große Sprachmodelle** auf der Grafikkarte. Gewerbedaten nur bei Bedarf, und dann ausschließlich im eingebundenen Tresor.

### Grundschutz

- BitLocker für alle Laufwerke
- Getrennte Windows-Konten: `Admin`, **`Andreas-Privat`** (Standard), optional **`Andreas-Gewerbe`** (Standard), in dem allein der OCH-Tresor eingebunden wird. So kann privat installierte Software den Tresor nicht sehen.
- Browser: Firefox/Brave mit getrennten Profilen „Privat“ und „Gewerbe“

### Programme

| Zweck | Programm |
|---|---|
| Browser | Firefox oder Brave (Profile getrennt), uBlock Origin |
| Passwörter | Bitwarden: privater Tresor + Zugriff auf Gewerbe-Organisation |
| Cloud privat | Proton Drive oder Nextcloud (privat), Fotos gern auch lokal + Backup |
| Tresor Gewerbe | Cryptomator (nur im Gewerbe-Konto eingebunden) |
| **KI lokal (Hauptmaschine)** | **Ollama** (Hintergrunddienst), **LM Studio** oder **Open WebUI** als Oberfläche; größere Modelle (z. B. 14–32B je nach GPU-Speicher) |
| **KI Cloud** | Claude Desktop (privates oder Geschäftskonto), Claude Code für Programmierprojekte |
| Entwicklung | VS Code, Git, Python, optional Docker Desktop / WSL2 (für Open WebUI, n8n-Automatisierungen) |
| Wissensbasis privat | Obsidian (eigener privater Vault) |
| Medien / Segeln | Navigations-/Törnplanungs-Apps, Foto-Software |
| Backup | Veeam Agent Free / restic, NAS oder USB-SSD + verschlüsselte Cloud |
| Netzwerk | optional Tailscale, um vom Gewerbe-Laptop sicher auf die lokalen Modelle des PCs zuzugreifen (kein Port nach außen öffnen) |

### KI-Labor: so arbeiten PC und Gewerbe-Laptop zusammen

- Ollama läuft auf dem PC mit großen Modellen. Der Gewerbe-Laptop erreicht ihn **nur über Tailscale** (privates, verschlüsseltes Netz). So bekommst du die Qualität eines großen Modells für Rot-Daten, ohne dass etwas das eigene Netz verlässt.
- Unterwegs ohne PC: kleines lokales Modell direkt auf dem Gewerbe-Laptop.

### Ordnerstruktur

```
D:\Privat\                         (Konto „Andreas-Privat“)
├── 00_Eingang
├── 10_Persoenlich                 ← Ausweise, Verträge, Versicherungen, Gesundheit
├── 20_Finanzen_Privat             ← Konten, Depot, Steuer privat
├── 30_Segeln                      ← Törns, Logbücher, Revierinfos, Fotos
├── 40_KI-Labor
│   ├── KI-Freigabe                ★ einziger Ordner für KI-Dateizugriff (privat)
│   ├── Prompts
│   ├── Experimente                ← Tests mit Modellen, Automatisierungen (n8n etc.)
│   └── Obsidian-Vault-Privat
├── 50_Medien                      ← Fotos, Videos
├── 60_Projekte                    ← private Projekte, Lernen
└── 90_Archiv

D:\Dev\                            ← Git-Repositories
D:\KI\Modelle\                     ← Ollama-/LM-Studio-Modelle (OLLAMA_MODELS hierhin umleiten)

O:\                                (nur im Konto „Andreas-Gewerbe“, Cryptomator-Tresor)
└── identisch mit dem Gewerbe-Laptop (synchronisiert über die EU-Cloud)
```

---

## 6. Gemeinsame Regeln für alle Geräte

**Gleiche Logik überall.** Die Nummern (00 Eingang, 10 Verwaltung/Persönlich, 40 KI, 90 Archiv) sind auf allen Geräten gleich. Dadurch findest du dich überall sofort zurecht, und KI-Prompts können Pfade allgemein benennen.

**Dateinamen:** `JJJJ-MM-TT_Thema_Version.ext`, z. B. `2026-10-28_Geeignetheitserklaerung_K042_v1.pdf`. Keine Umlaute oder Sonderzeichen; das ist robuster für Sync, Skripte und KI-Tools.

**KI-Freigabe-Ordner konfigurieren:**
- *Claude Desktop / Cowork:* unter Einstellungen → Ordner-/Dateizugriff nur `…\40_KI\KI-Freigabe` hinzufügen.
- *MCP-Filesystem-Server:* als erlaubtes Verzeichnis ausschließlich diesen Pfad eintragen.
- *Claude Code:* nur in `C:\Dev\…` bzw. `D:\Dev\…` starten, nie im Tresor.
- *Ollama / LM Studio:* laufen lokal und dürfen daher auch Rot-Daten verarbeiten. Trotzdem nur gezielt einzelne Dateien übergeben, kein Indexieren ganzer Kundenordner in Cloud-gestützte RAG-Tools.

**Passwortmanager-Struktur (Bitwarden):**
```
Privat (persönlicher Tresor)
OCH Gewerbe (Organisation)
 ├── Banking & Steuer
 ├── Haftungsdach & Pools
 ├── Cloud & KI-Dienste
 └── Website & Domain
BCA → NICHT hier, sondern im BCA-vorgegebenen System
```
Überall 2FA, bevorzugt Passkeys oder TOTP. Wiederherstellungscodes ausgedruckt im Ordner zu Hause.

**Backup nach 3-2-1:**
| | Gewerbe-Laptop | PC |
|---|---|---|
| Kopie 1 | Original (Tresor) | Original |
| Kopie 2 | EU-Cloud (Cryptomator, verschlüsselt) | NAS / USB-SSD (verschlüsselt) |
| Kopie 3 | wöchentliches Image auf USB-SSD (BitLocker To Go), **getrennt vom Laptop aufbewahrt** | verschlüsselte Cloud |

Einmal im Quartal eine Wiederherstellung testen (eine Datei, einen Ordner).

**Mobil:** Smartphone mit Arbeitsprofil bzw. getrennten Apps; Kundendaten nicht in WhatsApp, sondern per verschlüsselter Mail oder Kundenportal.

---

## 7. Umsetzungsplan

| Phase | Was | Wo |
|---|---|---|
| **1. Sichern** (Tag 1) | Vollbackup des Ist-Zustands beider privater Geräte | B, C |
| **2. Absichern** (Woche 1) | BitLocker, Standard-Benutzerkonten, Updates, Bitwarden-Organisation, 2FA überall | B, C |
| **3. Struktur** (Woche 1) | `setup-ordner.ps1` ausführen, Cryptomator-Tresor anlegen, EU-Cloud verbinden | B, C |
| **4. Programme** (Woche 2) | `setup-programme.ps1` ausführen, Überflüssiges deinstallieren (alte Cloud-Clients, Toolbars, Testversionen) | B, C |
| **5. Umziehen** (Woche 2–3) | Altbestand über `00_Eingang` einsortieren; Kunden pseudonymisieren (Kürzel K001 ff.) | B |
| **6. KI einrichten** (Woche 3) | Ollama + Modelle, Claude Desktop nur mit Freigabe-Ordner, Prompt-Bibliothek anlegen, Tailscale PC ↔ Laptop | B, C |
| **7. Dokumentieren** (Woche 4) | VVT, AV-Verträge, KI-Ampel in `10_Verwaltung\Datenschutz` | B |
| **8. BCA** (laufend) | Ablage nach Struktur in OneDrive; KI-Nutzung mit BCA-IT/Datenschutz klären | A |
| **Routine** | wöchentlich `00_Eingang` leeren; monatlich Updates & Backup-Check; jährlich Archiv + Löschfristen | alle |

### Checkliste „Zielbild erreicht“

- [ ] Kein BCA-Dokument auf B oder C, keine private Software oder KI auf A
- [ ] BitLocker aktiv auf B und C, Wiederherstellungsschlüssel sicher abgelegt
- [ ] Tägliche Arbeit unter Standard-Benutzer, nicht als Admin
- [ ] Alle Gewerbedaten im Cryptomator-Tresor `O:\`
- [ ] Jedes KI-Tool mit Dateizugriff sieht nur `40_KI\KI-Freigabe`
- [ ] Kundendaten (Rot) nur in lokaler KI oder pseudonymisiert
- [ ] Cloud-KI fürs Gewerbe mit AV-Vertrag, Training deaktiviert
- [ ] Bitwarden: Privat und Gewerbe getrennt, 2FA überall
- [ ] 3-2-1-Backup läuft, Wiederherstellung einmal getestet
- [ ] Datenschutz-Dokumentation in `10_Verwaltung\Datenschutz` vollständig

---

## Dateien in diesem Ordner

| Datei | Zweck |
|---|---|
| `README.md` | dieses Zielbild |
| `setup-ordner.ps1` | legt die Ordnerstruktur je Gerät an: `.\setup-ordner.ps1 -Geraet Gewerbe` (oder `PC`, `BCA`) |
| `setup-programme.ps1` | installiert die Programme je Gerät per winget: `.\setup-programme.ps1 -Geraet Gewerbe` (nicht für den BCA-Laptop) |

Beide Skripte zeigen mit `-WhatIf` zuerst nur an, was sie tun würden. Den Tresor `O:\` legst du nur einmal an (auf dem Gewerbe-Laptop mit `-Geraet Gewerbe`). Auf dem PC erscheint er über den Cloud-Sync automatisch. Dort führst du nur `-Geraet PC` aus.

Ausführen in PowerShell (einmalig `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` setzen, falls Skripte blockiert sind).
