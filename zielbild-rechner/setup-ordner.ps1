<#
.SYNOPSIS
    Legt die Zielordnerstruktur fuer BCA-Laptop, OCH-Gewerbe-Laptop oder PC an.

.DESCRIPTION
    Bereits vorhandene Ordner bleiben unveraendert, es wird nichts geloescht oder verschoben.
    Mit -WhatIf wird nur angezeigt, was angelegt wuerde.

.EXAMPLE
    .\setup-ordner.ps1 -Geraet Gewerbe -WhatIf
    .\setup-ordner.ps1 -Geraet Gewerbe                 # Basis O:\ (Cryptomator-Tresor muss entsperrt sein)
    .\setup-ordner.ps1 -Geraet PC
    .\setup-ordner.ps1 -Geraet BCA -Basis "$env:OneDriveCommercial"
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateSet('BCA', 'Gewerbe', 'PC')]
    [string]$Geraet,

    # Zielwurzel; Standard je Geraet siehe unten
    [string]$Basis
)

$ErrorActionPreference = 'Stop'
$jahr = (Get-Date).Year

$struktur = @{
    BCA = @(
        '00_Eingang'
        '10_Vertrieb\Partner_A-Z'
        '10_Vertrieb\Anbindungen'
        '10_Vertrieb\Reporting'
        '20_Veranstaltungen\Messen'
        '20_Veranstaltungen\Webinare'
        '30_Plattformen\DIVA'
        '30_Plattformen\Investmentshop'
        '30_Plattformen\IFC_Finanzcockpit'
        '40_KI\Prompts'
        '40_KI\Vorlagen'
        '50_Wissen'
        '90_Archiv'
    )
    Gewerbe = @(
        '00_Eingang'
        '10_Verwaltung\Gewerbe_Zulassung'
        '10_Verwaltung\Datenschutz'
        '10_Verwaltung\Steuern'
        '10_Verwaltung\Versicherungen'
        '10_Verwaltung\Vertraege'
        '20_Kunden\_Zuordnung'
        '20_Kunden\_Ehemalige'
        "30_Buchhaltung\$jahr\Eingangsrechnungen"
        "30_Buchhaltung\$jahr\Ausgangsrechnungen"
        "30_Buchhaltung\$jahr\Provisionsabrechnungen"
        "30_Buchhaltung\$jahr\Bank"
        '30_Buchhaltung\Steuerberater_Austausch'
        '35_Skippertraining\Kurse_Toerns'
        '35_Skippertraining\Teilnehmer'
        '35_Skippertraining\Unterlagen_Schulung'
        '35_Skippertraining\Boot_Ausruestung'
        '35_Skippertraining\Website'
        '40_KI\KI-Freigabe\Kontext'
        '40_KI\KI-Freigabe\Anonymisiert'
        '40_KI\KI-Freigabe\Ausgaben'
        '40_KI\Prompts'
        '40_KI\Lokal_Modelle_Notizen'
        '50_Marketing_Wissen\Webinare'
        '50_Marketing_Wissen\Vorlagen'
        '50_Marketing_Wissen\Fachwissen_Regulatorik'
        '50_Marketing_Wissen\Obsidian-Vault'
        '90_Archiv'
    )
    PC = @(
        '00_Eingang'
        '10_Persoenlich'
        '20_Finanzen_Privat'
        '30_Segeln'
        '40_KI-Labor\KI-Freigabe'
        '40_KI-Labor\Prompts'
        '40_KI-Labor\Experimente'
        '40_KI-Labor\Obsidian-Vault-Privat'
        '50_Medien'
        '60_Projekte'
        '90_Archiv'
    )
}

# Zusaetzliche Ordner ausserhalb der Hauptstruktur (Code und Modelldateien)
$extra = @{
    BCA     = @()
    Gewerbe = @('C:\Dev', 'C:\KI\Modelle')
    PC      = @('D:\Dev', 'D:\KI\Modelle')
}

# Ordner mit Rot-Daten bekommen einen sichtbaren Warnhinweis
$rot = @('20_Kunden', '35_Skippertraining\Teilnehmer', '10_Persoenlich', '20_Finanzen_Privat')

if (-not $Basis) {
    $Basis = switch ($Geraet) {
        'BCA'     { $env:OneDriveCommercial }
        'Gewerbe' { 'O:\' }
        'PC'      { 'D:\Privat' }
    }
}
if (-not $Basis) {
    throw 'Basisordner nicht ermittelbar. Bitte -Basis angeben.'
}
if ($Geraet -eq 'Gewerbe' -and -not (Test-Path $Basis)) {
    throw "$Basis nicht gefunden. Cryptomator-Tresor zuerst entsperren (Laufwerk O:) oder -Basis angeben."
}

Write-Host "Geraet: $Geraet  |  Basis: $Basis" -ForegroundColor Cyan

foreach ($rel in $struktur[$Geraet]) {
    $pfad = Join-Path $Basis $rel
    if (Test-Path $pfad) {
        Write-Host "  vorhanden  $pfad" -ForegroundColor DarkGray
    }
    elseif ($PSCmdlet.ShouldProcess($pfad, 'Ordner anlegen')) {
        New-Item -ItemType Directory -Path $pfad -Force | Out-Null
        Write-Host "  angelegt   $pfad" -ForegroundColor Green
    }
}

foreach ($pfad in $extra[$Geraet]) {
    if (-not (Test-Path $pfad) -and $PSCmdlet.ShouldProcess($pfad, 'Ordner anlegen')) {
        New-Item -ItemType Directory -Path $pfad -Force | Out-Null
        Write-Host "  angelegt   $pfad" -ForegroundColor Green
    }
}

foreach ($rel in $rot) {
    $pfad = Join-Path $Basis $rel
    $hinweis = Join-Path $pfad '_ROT_keine-Cloud-KI.txt'
    if ((Test-Path $pfad) -and -not (Test-Path $hinweis) -and $PSCmdlet.ShouldProcess($hinweis, 'Hinweis anlegen')) {
        Set-Content -Path $hinweis -Encoding UTF8 -Value @(
            'ROT: personenbezogene Daten.'
            'Inhalte nur mit lokaler KI (Ollama / LM Studio) verarbeiten oder vorher pseudonymisieren.'
            'Diesen Ordner niemals fuer Cloud-KI-Tools oder MCP-Server freigeben.'
        )
    }
}

$freigabe = switch ($Geraet) {
    'Gewerbe' { Join-Path $Basis '40_KI\KI-Freigabe' }
    'PC'      { Join-Path $Basis '40_KI-Labor\KI-Freigabe' }
    default   { $null }
}
if ($freigabe) {
    Write-Host ''
    Write-Host 'Diesen Ordner (und nur diesen) in Claude Desktop / MCP-Tools freigeben:' -ForegroundColor Yellow
    Write-Host "  $freigabe" -ForegroundColor Yellow
}
if ($Geraet -eq 'PC') {
    Write-Host ''
    Write-Host 'Tipp: Ollama-Modelle nach D:\KI\Modelle umleiten:' -ForegroundColor Yellow
    Write-Host '  [Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "D:\KI\Modelle", "User")' -ForegroundColor Yellow
}
