# Bildmuse

Fotografiere eine Landschaft, ein Objekt, ein Fahrzeug oder einen Raum. Die App setzt per KI eine **zufällig ausgewählte, fiktive Frau** passend ins Bild, damit es wie ein professionelles Lifestyle-Foto wirkt. Die App ist mit einer Passphrase geschützt und lässt sich aufs Handy installieren.

## So funktioniert es

1. **Foto aufnehmen** (Kamera) oder aus der Mediathek wählen.
2. **Motiv wählen:** Automatisch, Landschaft, Objekt, Fahrzeug oder Raum. Danach richten sich Kleidung und Pose.
3. **Zufällige Muse:** Alter (Mitte 20 bis Mitte 40), Typ, Haare, Stil und Ausdruck werden zufällig gewürfelt. Mit 🎲 neu würfeln, bis es passt. Optional ein Zusatzwunsch (z. B. „lehnt am Geländer“).
4. **„Muse ins Bild setzen“:** Das Foto geht an den KI-Dienst. Nach 10–40 Sekunden erscheint das Ergebnis mit Vorher/Nachher-Regler.
5. **Teilen / Sichern:** Über das Teilen-Menü in die Fotos-App oder an andere Apps. Jedes Ergebnis landet zusätzlich verschlüsselt in der **Galerie**.

Die KI hat feste Vorgaben: fiktive Person, keine Ähnlichkeit mit realen oder bekannten Personen, vollständig bekleidet, nicht anzüglich, Licht, Schatten und Perspektive wie im Original.

## Einrichten

1. Branch in `main` übernehmen. Die App liegt dann unter `https://andreasoch.github.io/Och-BCA/muse/` (Vermutung: wie beim CRM, sofern GitHub Pages aktiv ist).
2. Auf dem Handy öffnen und installieren:
   - **iPhone (Safari):** Teilen → *Zum Home-Bildschirm*. Danach die App vom Home-Bildschirm aus einrichten (eigener Speicher).
   - **Android (Chrome):** Menü → *App installieren*.
3. **Passphrase festlegen** (mindestens 12 Zeichen). Es gibt kein „Passwort vergessen“. Bewahre sie im Passwortmanager auf.
4. **API-Schlüssel eintragen** unter *Einstellungen*:
   - **Google Gemini (Voreinstellung):** Schlüssel unter aistudio.google.com → „Get API key“. Modell `gemini-2.5-flash-image`.
   - **OpenAI:** Schlüssel unter platform.openai.com → API keys. Modell `gpt-image-1`.
   - Bietet der Anbieter ein neueres Bildmodell an, den Modellnamen in den Einstellungen ändern.

Kosten (Vermutung, Stand meines Wissens, bitte beim Anbieter prüfen): etwa 4 Cent pro Bild bei Gemini, bei OpenAI je nach Qualität etwa 4–25 Cent.

## Sicherheit

- Passphrase → PBKDF2-SHA256 (600.000 Runden) → verpackt einen zufälligen AES-256-GCM-Schlüssel.
- API-Schlüssel, Einstellungen und Galerie liegen nur **verschlüsselt** auf dem Gerät (IndexedDB).
- Nach drei Fehlversuchen wachsende Wartezeit (bis 5 Minuten).
- Automatische Sperre nach 1, 5 oder 15 Minuten Inaktivität bzw. im Hintergrund.
- Passphrase ändern ohne Datenverlust unter *Einstellungen → Sicherheit*.
- Content-Security-Policy: Verbindungen nur zu Google Gemini und OpenAI.

## Datenschutz und rechtliche Hinweise

- Das Foto wird zur Bearbeitung an Google bzw. OpenAI gesendet (Server u. a. in den USA). Keine fremden Personen, Kfz-Kennzeichen oder vertraulichen Unterlagen fotografieren.
- Die eingefügte Person ist KI-generiert und fiktiv. Optional setzt die App ein kleines „KI“-Zeichen ins Bild (Voreinstellung: an). Bei Veröffentlichung das Bild als KI-generiert kennzeichnen.
- Keine echten Personen einfügen (die App bietet dafür bewusst keine Funktion).

## Dateien

| Datei | Zweck |
|---|---|
| `index.html` | die komplette App |
| `manifest.webmanifest`, `sw.js`, Icons | Installation und Offline-Start (nur App-Dateien, nie Bilder) |

Version 1.0
