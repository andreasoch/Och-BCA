<#
.SYNOPSIS
    Installiert die Zielprogramme fuer den OCH-Gewerbe-Laptop oder den PC per winget.

.DESCRIPTION
    Nicht fuer den BCA-Laptop: dort installiert ausschliesslich die BCA-IT.
    Bereits installierte Programme werden uebersprungen. Ein Fehler bei einem Paket
    bricht den Lauf nicht ab, am Ende folgt eine Zusammenfassung.
    Vor dem ersten Lauf die Paket-IDs bei Bedarf mit "winget search <Name>" pruefen.

.EXAMPLE
    .\setup-programme.ps1 -Geraet Gewerbe -WhatIf
    .\setup-programme.ps1 -Geraet PC
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateSet('BCA', 'Gewerbe', 'PC')]
    [string]$Geraet
)

if ($Geraet -eq 'BCA') {
    Write-Warning 'Der BCA-Laptop wird von der BCA-IT verwaltet. Bitte dort keine eigene Software installieren.'
    return
}
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw 'winget nicht gefunden. Bitte "App Installer" aus dem Microsoft Store installieren.'
}

# Gemeinsame Basis fuer Gewerbe-Laptop und PC
$basis = [ordered]@{
    'Mozilla.Firefox'                 = 'Browser (getrennte Profile)'
    'Bitwarden.Bitwarden'             = 'Passwortmanager'
    'Cryptomator.Cryptomator'         = 'Verschluesselter Tresor fuer Zone B'
    '7zip.7zip'                       = 'Archive, AES-Verschluesselung'
    'Anthropic.Claude'                = 'Claude Desktop (Freigabe nur 40_KI\KI-Freigabe)'
    'Ollama.Ollama'                   = 'Lokale KI (Rot-Daten)'
    'ElementLabs.LMStudio'            = 'Oberflaeche fuer lokale Modelle'
    'Obsidian.Obsidian'               = 'Markdown-Wissensbasis'
    'Microsoft.VisualStudioCode'      = 'Editor / Website'
    'Git.Git'                         = 'Versionsverwaltung'
    'Tailscale.Tailscale'             = 'Privates Netz PC <-> Laptop'
    'restic.restic'                   = 'Verschluesseltes Backup'
}

$geraetSpezifisch = @{
    Gewerbe = [ordered]@{
        'Mozilla.Thunderbird'             = 'Geschaeftsmail'
        'TheDocumentFoundation.LibreOffice' = 'Office (alternativ M365 Business)'
        'geeksoftwareGmbH.PDF24Creator'   = 'PDF offline bearbeiten'
        'Nextcloud.NextcloudDesktop'      = 'EU-Cloud-Sync fuer den Tresor (alternativ Proton Drive)'
    }
    PC = [ordered]@{
        'Brave.Brave'                     = 'Zweitbrowser privat'
        'Python.Python.3.12'              = 'Skripte, KI-Experimente'
        'Docker.DockerDesktop'            = 'Open WebUI, n8n (benoetigt WSL2)'
        'Nextcloud.NextcloudDesktop'      = 'Cloud-Sync (Tresor im Gewerbe-Konto)'
    }
}

$pakete = [ordered]@{}
foreach ($p in $basis.GetEnumerator()) { $pakete[$p.Key] = $p.Value }
foreach ($p in $geraetSpezifisch[$Geraet].GetEnumerator()) { $pakete[$p.Key] = $p.Value }

$ergebnis = @()
foreach ($p in $pakete.GetEnumerator()) {
    $id = $p.Key
    winget list --id $id -e --accept-source-agreements *> $null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  vorhanden   $id" -ForegroundColor DarkGray
        $ergebnis += [pscustomobject]@{ Paket = $id; Status = 'vorhanden'; Zweck = $p.Value }
        continue
    }
    if (-not $PSCmdlet.ShouldProcess("$id ($($p.Value))", 'installieren')) {
        $ergebnis += [pscustomobject]@{ Paket = $id; Status = 'WhatIf'; Zweck = $p.Value }
        continue
    }
    Write-Host "  installiere $id" -ForegroundColor Cyan
    winget install --id $id -e --silent --accept-package-agreements --accept-source-agreements
    $status = if ($LASTEXITCODE -eq 0) { 'installiert' } else { "Fehler ($LASTEXITCODE)" }
    $ergebnis += [pscustomobject]@{ Paket = $id; Status = $status; Zweck = $p.Value }
}

$ergebnis | Format-Table -AutoSize

Write-Host 'Manuell nachziehen:' -ForegroundColor Yellow
Write-Host '  - Veeam Agent for Windows Free (Image-Backup) von der Herstellerseite'
Write-Host '  - Firefox: uBlock Origin; Profile "Gewerbe" / "Privat" anlegen (about:profiles)'
Write-Host '  - Claude Desktop: Training deaktivieren, Dateizugriff nur auf den KI-Freigabe-Ordner'
Write-Host '  - Ollama: passendes Modell laden, z. B. "ollama pull llama3.1:8b" (Laptop) bzw. groesser auf dem PC'
if ($Geraet -eq 'Gewerbe') {
    Write-Host '  - Buchhaltung (lexoffice/sevDesk/DATEV) und Beratungssoftware des Haftungsdachs: Web-Zugang'
}
