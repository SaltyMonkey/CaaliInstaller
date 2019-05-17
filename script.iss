#define MyAppName "CaaliTeraToolbox"
#define MyAppVersion "2"
#define MyAppPublisher "SaltyMonkey"
#define MyAppURL "https://discord.gg/dUNDDtw"
#define MyAppExeName "TeraToolbox.bat"
#include <idp.iss>

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{4B00F866-7298-4EAD-930D-2713A55394C0}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultGroupName={#MyAppName}
DefaultDirName={userpf}\{#MyAppName}
OutputDir=D:\CaaliToolboxInstaller\output
OutputBaseFilename=setup
SolidCompression=True
RestartIfNeededByRun=False
UninstallLogMode=overwrite
UninstallDisplayName=TeraToolbox
VersionInfoVersion=1.0
VersionInfoCompany=TeraToolbox
VersionInfoDescription=TeraToolbox
MinVersion=0,6.1
AppCopyright=SaltyMonkey
UsePreviousAppDir=False
AlwaysShowGroupOnReadyPage=True
AlwaysShowDirOnReadyPage=True
InfoBeforeFile=D:\CaaliToolboxInstaller\topack\readme.txt
UsePreviousLanguage=False
ShowTasksTreeLines=True
UninstallDisplayIcon={uninstallexe}
VersionInfoProductName=TeraToolbox
InternalCompressLevel=ultra64
Compression=lzma2/ultra
Uninstallable=yes
CreateUninstallRegKey=no
UsePreviousSetupType=False
UsePreviousTasks=False
ShowLanguageDialog=no
SetupIconFile=D:\CaaliToolboxInstaller\topack\icon.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "greek"; MessagesFile: "compiler:Languages\Greek.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "nepali"; MessagesFile: "compiler:Languages\Nepali.islu"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "scottishgaelic"; MessagesFile: "compiler:Languages\ScottishGaelic.isl"
Name: "serbiancyrillic"; MessagesFile: "compiler:Languages\SerbianCyrillic.isl"
Name: "serbianlatin"; MessagesFile: "compiler:Languages\SerbianLatin.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "Common:"; Flags: checkedonce
Name: "openfolder"; Description: "Open toolbox folder"; GroupDescription: "Common:"; Flags: checkedonce

[Files]
Source: "topack\toolbox\config.json"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\package.json"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\package-lock.json"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\README.md"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\TeraToolboxCLI.bat"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\TeraToolbox.bat"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\doc\*"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\bin\*"; DestDir: "{app}\bin\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Toolbox
Source: "topack\toolbox\node_modules\*"; DestDir: "{app}\node_modules\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Toolbox
Source: "topack\toolbox\mods\*"; DestDir: "{app}\mods\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Toolbox

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\TeraToolbox.bat"; Components: Toolbox
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Components: Toolbox; Tasks: desktopicon

[Run]
Filename: "{sys}\msiexec.exe"; Parameters: "/package  ""{tmp}\node.msi"" /qn /norestart /passive"; Flags: skipifdoesntexist; StatusMsg: "Install NodeJs binary"; Components: NodeJS
Filename: "{tmp}\vc17x86.msi"; Parameters: "/install /passive /norestart"; Flags: skipifdoesntexist; StatusMsg: "Install VC++ 2017 Redistributable package x86"; Components: VCRedistributable
Filename: "{tmp}\vc17x64.msi"; Parameters: "/install /passive /norestart"; Flags: skipifdoesntexist; StatusMsg: "Install VC++ 2017 Redistributable package x64"; Components: VCRedistributable
Filename: "{tmp}\vc15x86.msi"; Parameters: "/q /norestart"; Flags: skipifdoesntexist; StatusMsg: "Install VC++ 2017 Redistributable package x86"; Components: VCRedistributable
Filename: "{tmp}\vc15x64.msi"; Parameters: "/q /norestart"; Flags: skipifdoesntexist; StatusMsg: "Install VC++ 2017 Redistributable package x64"; Components: VCRedistributable
Filename: "explorer.exe"; Parameters: "{app}"; Tasks: openfolder
Filename: "reg"; Parameters: "add ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths"" /v ""{app}"" /t REG_DWORD /d 0 /f"; Components: DefenderExclude
Filename: "cmd.exe"; Parameters: "powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath ""{app}"""; Components: DefenderExclude
Filename: "reg"; Parameters: "add ""HKLM\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths"" /v ""{app}"" /t REG_DWORD /d 0 /f"; Components: DefenderExclude

[INI]
Filename: "{app}\{#MyAppName}.url"; Section: "InternetShortcut"; Key: "URL"; String: "https://discord.gg/dUNDDtw"

[UninstallDelete]
Type: files; Name: "{app}\{#MyAppName}.url"
Type: filesandordirs; Name: "{app}\node_modules\*"
Type: filesandordirs; Name: "{app}\bin\*"
Type: filesandordirs; Name: "{app}\doc\*"
Type: filesandordirs; Name: "{app}\*"

[Components]
Name: "Toolbox"; Description: "Main toolbox files"; Types: full compact custom; Flags: fixed; MinVersion: 0,6.1
Name: "NodeJS"; Description: "Download and install NodeJS"; Types: full custom; MinVersion: 0,6.1
Name: "VCRedistributable"; Description: "Download and install VC++ packages"; Types: full custom; MinVersion: 0,6.1
Name: "DefenderExclude"; Description: "Try to exclude toolbox from WinDefender"; Types: full custom compact; MinVersion: 0,6.1

[Code]
procedure InitializeWizard;
begin
    idpDownloadAfter(wpReady);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
    if CurPageID = wpReady then
    begin
        idpClearFiles;
        if IsComponentSelected('NodeJS') then
        begin
            if IsWin64 then
              idpAddFile('https://nodejs.org/dist/v12.2.0/node-v12.2.0-x64.msi', ExpandConstant('{tmp}\node.msi'));
            if not IsWin64 then
              idpAddFile('https://nodejs.org/dist/v12.2.0/node-v12.2.0-x86.msi', ExpandConstant('{tmp}\node.msi'));
        end;
        if IsComponentSelected('VCRedistributable') then
        begin
            if IsWin64 then
            begin
              idpAddFile('https://aka.ms/vs/15/release/VC_redist.x86.exe', ExpandConstant('{tmp}\vc17x86.msi'));
              idpAddFile('https://aka.ms/vs/15/release/VC_redist.x64.exe', ExpandConstant('{tmp}\vc17x64.msi'));
              idpAddFile('https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x86.exe', ExpandConstant('{tmp}\vc15x86.msi'));
              idpAddFile('https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x64.exe', ExpandConstant('{tmp}\vc15x64.msi'));
            end;
            if not IsWin64 then
            begin
              idpAddFile('https://aka.ms/vs/15/release/VC_redist.x86.exe', ExpandConstant('{tmp}\vc17x86.msi'));
              idpAddFile('https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x86.exe', ExpandConstant('{tmp}\vc15x86.msi'));
            end;
        end;
  end;
end;
