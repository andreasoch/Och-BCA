# Fernweh – Meine Lieblingsorte

Installierbare Web-App (PWA), die dich über deine Lieblingsurlaubsorte auf dem Laufenden hält.
Start-Ziele: **Misano Adriatico** und **Lemmer**, weitere Orte frei wählbar.

## Funktionen

- **Übersicht** aller Orte mit Illustration (passend zum aktuellen Wetter und zur Tageszeit), Temperatur,
  Wassertemperatur, Tages-Briefing („Morgen Strandwetter …“, „Top-Tag: Freitag“) und Reise-Countdown.
- **Wetter je Ort** (Ortszeit): nächste 24 Stunden, 7-Tage-Vorhersage mit „Bester Tag der Woche“,
  Wind in Beaufort mit Hinweis für Bootsfahrer, Wassertemperatur und Wellenhöhe (Meer/See), UV-Index,
  Sonnenauf- und -untergang, Niederschlag. Aktualisierung automatisch nach 30 Minuten oder per Knopf.
- **„Heute/Morgen empfohlen“**: drei Ausflugstipps, passend zum Wetter (Regen → Museum, Sonne und
  warm → Strand/Wasser, starker Wind → kein Boot). Die Auswahl wechselt täglich.
- **Ausflugstipps**: 17 kuratierte Tipps für Misano, 16 für Lemmer, Filter nach Kategorie, Merkliste (★),
  Tipps ausblenden und wieder einblenden, **eigene Tipps** anlegen, ändern und löschen.
- **Entdecken**: Orte mit Wikipedia-Artikel im Umkreis von 10 km, nach Entfernung sortiert.
- **Google Maps**: Jeder Ort und jeder Tipp hat „Karte“ und „Route“. Dazu kommen Schnellsuchen
  (Restaurants, Strände, Eisdiele, Supermarkt, Apotheke, Tankstelle, Parkplatz, Fahrradverleih).
- **Orte verwalten**: Suchen und hinzufügen, Name, Region und Motiv ändern, Reisezeitraum eintragen,
  Reihenfolge ändern, löschen (mit Rückfrage). Gelöschte Start-Ziele lassen sich als Vorschlag wieder hinzufügen.
- Hell- und Dunkelmodus, Smartphone und Desktop, offline nutzbar mit den zuletzt geladenen Daten.

## Bedienung

1. Die Seite `urlaub/` im Browser öffnen. Auf dem Smartphone über „Zum Home-Bildschirm“ installieren.
2. Ort antippen → Detailseite. Mit dem Stift oben rechts trägst du den Reisezeitraum ein.
3. Mit „+ Ort hinzufügen“ suchst du einen neuen Ort und wählst ein Motiv (Meer, See, Berge, Stadt).

## Datenquellen und Datenschutz

| Zweck | Dienst | Übertragen werden |
|---|---|---|
| Wetter, Wassertemperatur, Ortssuche | Open-Meteo (CC BY 4.0), kein API-Schlüssel nötig | Koordinaten bzw. Suchbegriff, technisch bedingt die IP-Adresse |
| Orte in der Umgebung, Vorschaubilder | Wikipedia / Wikimedia (CC BY-SA 4.0) | Koordinaten, IP-Adresse |
| Karte und Route | Google Maps | erst beim Antippen eines Karten- oder Routen-Knopfs |

Alle eigenen Daten (Orte, Reisedaten, Tipps, Merkliste) liegen nur im `localStorage` des jeweiligen Browsers.
Es gibt kein Konto, keinen eigenen Server, keine Schriftarten oder Tracker von Drittanbietern.
Eine Content-Security-Policy erlaubt nur Verbindungen zu den genannten Diensten.
Unter „Info“ lässt sich alles zurücksetzen.

## Hinweise

- Die Ausflugstipps sind redaktionell zusammengestellt. Entfernungen sind Circa-Angaben.
  Öffnungszeiten und Saison (z. B. Aquafan, Fähre Stavoren–Enkhuizen) bitte vor dem Besuch prüfen.
- Für das IJsselmeer liefert Open-Meteo eventuell keine Wassertemperatur. Dann entfällt die Kachel.
- Dateien: `index.html` (App), `sw.js` (Offline-Cache, nur App-Dateien), `manifest.webmanifest`, Icons.

Version 1.0
