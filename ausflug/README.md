# Ausflug – Ausflugsziele in der Nähe

Installierbare Web-App (PWA) fürs iPhone. Sie zeigt herausragende Ausflugsziele im Umkreis des aktuellen
Standorts oder eines frei gewählten Orts.

## Funktionen

- **Standort**: per GPS („⌖ GPS“) oder von Hand („Ort ändern“). Eingabe als Ortsname
  (z. B. „Lemmer“) oder als Koordinaten („50.11, 8.68“ bzw. „50,11 8,68“). Ist GPS gewählt,
  wird der Standort beim Öffnen der App aufgefrischt.
- **Umkreis**: Schieberegler 5, 10, 15, 20, 30, 50, 75 oder 100 km. Beim Verkleinern rechnet die App ohne neue Abfrage.
- **Erwachsene / Kinder**: Der Schalter wählt die passenden Kategorien und gewichtet sie anders.
  - Erwachsene: Burgen & Schlösser, Museen, Klöster & Dome, Ruinen & Ausgrabungen, Sehenswürdigkeiten,
    Aussicht & Türme, Natur & Gärten, Denkmäler, Zoos, Aquarien, Freizeitparks, Planetarien
  - Kinder: Freizeitparks, Zoos & Tierparks, Aquarien, Erlebnisbäder, Rodeln & Klettern,
    Mitmach- & Technikmuseen, Burgen, Natur, Aussichtstürme, Sehenswürdigkeiten, Planetarien, Minigolf
- **Sortierung**: „★ Top“ (Bekanntheit, Art und Entfernung) oder „Nächste zuerst“. Kategorien lassen sich über die Chips ein- und ausblenden.
- **Je Ziel**: Entfernung, Kurzbeschreibung, Bild, Öffnungszeiten (soweit hinterlegt) und die Knöpfe
  🧭 Route (Apple Karten), Google Maps, 🌐 Website, 📞 Anrufen, Ⓦ Wikipedia, ↗ Teilen.
  Ein Tipp auf den Namen öffnet den Ort in Apple Karten.
- Kein Konto, kein Passwort. Hell- und Dunkelmodus. Die zuletzt geladenen Ergebnisse bleiben 7 Tage gespeichert und sind auch offline verfügbar.

## Wie „herausragend“ bestimmt wird

Die App wertet OpenStreetMap aus. Allgemeine Kategorien (Museen, Burgen, Sehenswürdigkeiten usw.) werden nur
berücksichtigt, wenn es einen Wikidata-Eintrag gibt. Das filtert Unbekanntes heraus. Die Punktzahl setzt sich
zusammen aus dem Gewicht der Kategorie (je nach Erwachsene/Kinder), der Zahl der Wikipedia-Sprachversionen
(Bekanntheit), dem Vorhandensein von Website und Öffnungszeiten sowie einem Abschlag für die Entfernung
(am Rand des Umkreises bis zu 35 %). Das ist eine automatische Schätzung, keine redaktionelle Bewertung.

## Installation auf dem iPhone

1. In Safari `https://andreasoch.github.io/Och-BCA/ausflug/` öffnen
   (Voraussetzung: GitHub Pages ist für das Repo eingerichtet, siehe `crm/README.md`).
2. Teilen-Symbol → „Zum Home-Bildschirm“.
3. Beim ersten Tipp auf „Aktuellen Standort verwenden“ die Ortung erlauben.
   Falls versehentlich abgelehnt: Einstellungen › Datenschutz & Sicherheit › Ortungsdienste ›
   Safari-Websites bzw. „Ausflug“ › „Beim Verwenden der App“.

## Datenquellen und Datenschutz

| Zweck | Dienst | Übertragen werden |
|---|---|---|
| Ausflugsziele | OpenStreetMap über Overpass-API (overpass-api.de, Ausweich: overpass.private.coffee, maps.mail.ru) – ODbL | Koordinaten, Umkreis, IP-Adresse |
| Bekanntheit, Kurzbeschreibung | Wikidata – CC0 | Kennungen der gefundenen Ziele, IP-Adresse |
| Bilder | Wikipedia / Wikimedia Commons | Artikeltitel, IP-Adresse |
| Ortssuche, Ortsname zu GPS | Nominatim (OpenStreetMap) | Suchbegriff bzw. Koordinaten, IP-Adresse |
| Route | Apple Karten, Google Maps | erst beim Antippen |

Einstellungen, Standort und Ergebnisse liegen nur im `localStorage` des Browsers. Es gibt keinen eigenen Server,
keine Tracker und keine fremden Schriftarten. Eine Content-Security-Policy erlaubt nur Verbindungen zu den
genannten Diensten. Unter „Info“ lässt sich alles löschen.

Nutzungsregeln der freien Dienste: Overpass und Nominatim sind für geringe, private Nutzung gedacht.
Die App fragt nur auf Knopfdruck bzw. bei Ortswechsel ab, nicht laufend, und die Ortssuche startet erst bei „Suchen“.

## Hinweise

- Die Daten pflegen Freiwillige. Öffnungszeiten und Preise vor dem Besuch auf der Website prüfen.
- Bei 75–100 km Umkreis kann die erste Suche bis zu einer Minute dauern. Ist der Server ausgelastet,
  versucht die App automatisch zwei Ausweichserver.
- Dateien: `index.html` (App), `sw.js` (Offline-Cache, nur App-Dateien), `manifest.webmanifest`, Icons.

Version 1.0
