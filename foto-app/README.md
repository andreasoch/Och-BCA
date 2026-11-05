# Lichtwerk Fotostudio

Fotos mit einem Tipp optimieren – auf Handy und Rechner, direkt im Browser.

- **Analyse & Empfehlungen:** Lichtwerk misst Helligkeit, Kontrast, Farben, Farbstich und
  ausgefressene Lichter, erkennt die Szene (Landschaft, Porträt, Gegenlicht, Nacht, Essen, …)
  und schlägt die drei passendsten Looks mit Begründung vor.
- **Auto-Zauber:** korrigiert Belichtung, Dunst, Kontrast, Schatten/Lichter und Farbstich automatisch.
- **11 Looks + Feinschliff:** Brillant, Goldene Stunde, Kühl & klar, Porträt sanft, Landschaft Pop,
  Nacht aufhellen, S/W Drama, Analog-Film, Food lecker, Details retten, Matt modern.
- **Selbstlernend:** Jedes gespeicherte Foto bringt Lichtwerk bei, welche Looks du bei welcher Szene wählst
  und wie du sie nachjustierst. Empfehlungen und Looks passen sich an; nach 3 Fotos entsteht „Mein Stil“.
  Gelerntes bleibt lokal im Browser (localStorage) und lässt sich zurücksetzen.
- **Datenschutz:** Fotos werden nie hochgeladen; alles wird auf dem Gerät gerechnet. Export in voller Auflösung (JPEG).

## Kurzbefehle (Rechner)
`A` Auto · `1`–`9`, `0` Looks · `E` beste Empfehlung · `M` Mein Stil · `+`/`−` Stärke ·
Leertaste halten = Vorher · `Strg/⌘ Z` Rückgängig · `R` Original · `O` Öffnen · `Strg/⌘ S` Speichern

## Starten / installieren
Ordner `foto-app/` über einen beliebigen Webserver (z. B. GitHub Pages) ausliefern und im Browser öffnen.
Am Handy über „Zum Startbildschirm hinzufügen“ als App installieren – funktioniert danach auch offline.
Lokal testen: `python3 -m http.server` im Ordner `foto-app/`.
