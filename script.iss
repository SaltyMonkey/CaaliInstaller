#define MyAppName "CaaliTeraProxy"
#define MyAppVersion "1"
#define MyAppPublisher "SaltyMonkey"
#define MyAppURL "https://discord.gg/dUNDDtw"
#define MyAppExeName "TeraProxy.bat"
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
OutputDir=D:\CaaliProxyInstaller\output
OutputBaseFilename=setup
SolidCompression=yes
RestartIfNeededByRun=False
UninstallLogMode=overwrite
UninstallDisplayName=TeraProxy
VersionInfoVersion=1.0
VersionInfoCompany=Caali's team
VersionInfoDescription=TeraProxy (Caali edition)
MinVersion=0,6.1
AppCopyright=SaltyMonkey
ShowLanguageDialog=no
DisableStartupPrompt=False
UsePreviousAppDir=False
AlwaysShowGroupOnReadyPage=True
AlwaysShowDirOnReadyPage=True
InfoBeforeFile=D:\CaaliProxyInstaller\topack\readme.txt
UsePreviousLanguage=False
ShowTasksTreeLines=True
UninstallDisplayIcon={uninstallexe}
VersionInfoCopyright=SaltyMonkey
VersionInfoProductName=TeraProxy
InternalCompressLevel=ultra

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
Name: "EUtera"; Description: "EU (GameForge)"; GroupDescription: "Choose your region:"; Flags: exclusive unchecked
Name: "NAtera"; Description: "NA (Enmasse)"; GroupDescription: "Choose your region:"; Flags: exclusive unchecked
Name: "KRTera"; Description: "KR (Nexon)"; GroupDescription: "Choose your region:"; Flags: exclusive unchecked
Name: "RUtera"; Description: "RU (Destiny)"; GroupDescription: "Choose your region:"; Flags: exclusive unchecked
Name: "THTera"; Description: "SE (Playwith)"; GroupDescription: "Choose your region:"; Flags: exclusive unchecked
Name: "TWtera"; Description: "TW (Mangot5)"; GroupDescription: "Choose your region:"; Flags: exclusive unchecked
Name: "JPtera"; Description: "JP (Pmang) IGNORE CERTIFICATE ERROR IN LAUNCHER!"; GroupDescription: "Choose your region:"; Flags: exclusive unchecked
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "Common:"; Flags: checkedonce

[Files]
Source: "topack\proxy\package.json"; DestDir: "{app}"; Flags: ignoreversion; Components: Proxy
Source: "topack\proxy\package-lock.json"; DestDir: "{app}"; Flags: ignoreversion; Components: Proxy
Source: "topack\proxy\README.md"; DestDir: "{app}"; Flags: ignoreversion; Components: Proxy
Source: "topack\proxy\TeraProxy.bat"; DestDir: "{app}"; Flags: ignoreversion; Components: Proxy
Source: "topack\proxy\bin\*"; DestDir: "{app}\bin\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Proxy
Source: "topack\proxy\node_modules\*"; DestDir: "{app}\node_modules\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Proxy
Source: "topack\proxy\mods\*"; DestDir: "{app}\mods\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Proxy
Source: "topack\Tasks\config-NA.json"; DestDir: "{app}\"; DestName: "config.json"; Flags: ignoreversion confirmoverwrite; Components: Proxy; Tasks: NAtera
Source: "topack\Tasks\config-EU.json"; DestDir: "{app}\"; DestName: "config.json"; Flags: ignoreversion confirmoverwrite; Components: Proxy; Tasks: EUtera
Source: "topack\Tasks\config-RU.json"; DestDir: "{app}\"; DestName: "config.json"; Flags: ignoreversion confirmoverwrite; Components: Proxy; Tasks: RUtera
Source: "topack\Tasks\config-KR.json"; DestDir: "{app}\"; DestName: "config.json"; Flags: ignoreversion confirmoverwrite; Components: Proxy; Tasks: KRtera
Source: "topack\Tasks\config-TW.json"; DestDir: "{app}\"; DestName: "config.json"; Flags: ignoreversion confirmoverwrite; Components: Proxy; Tasks: TWtera
Source: "topack\Tasks\config-SE.json"; DestDir: "{app}\"; DestName: "config.json"; Flags: ignoreversion confirmoverwrite; Components: Proxy; Tasks: THtera
Source: "topack\Tasks\config-JP.json"; DestDir: "{app}\"; DestName: "config.json"; Flags: ignoreversion confirmoverwrite; Components: Proxy; Tasks: JPtera

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{sys}\msiexec.exe"; Parameters: "/package  ""{tmp}\node.msi"" /qn /norestart /passive"; Flags: skipifdoesntexist; Components: NodeJS; StatusMsg: "Install NodeJs binary"; 
Filename: "{tmp}\vc17x86.msi"; Parameters: "/install /passive /norestart"; Flags: skipifdoesntexist; Components: VCRedistributable; StatusMsg: "Install VC++ 2017 Redistributable package x86"; 
Filename: "{tmp}\vc17x64.msi"; Parameters: "/install /passive /norestart"; Flags: skipifdoesntexist; Components: VCRedistributable; StatusMsg: "Install VC++ 2017 Redistributable package x64"; 
Filename: "{tmp}\vc15x86.msi"; Parameters: "/q /norestart"; Flags: skipifdoesntexist; Components: VCRedistributable; StatusMsg: "Install VC++ 2017 Redistributable package x86"; 
Filename: "{tmp}\vc15x64.msi"; Parameters: "/q /norestart"; Flags: skipifdoesntexist; Components: VCRedistributable; StatusMsg: "Install VC++ 2017 Redistributable package x64"; 
Filename:  "explorer.exe"; Parameters: "{app}"

[INI]
Filename: "{app}\{#MyAppName}.url"; Section: "InternetShortcut"; Key: "URL"; String: " https://discord.gg/maqBmJV"

[UninstallDelete]
Type: files; Name: "{app}\{#MyAppName}.url"
Type: filesandordirs; Name: "{app}\node_modules\*"
Type: filesandordirs; Name: "{app}\bin\*"
Type: filesandordirs; Name: "{app}\*"

[Components]
Name: "Proxy"; Description: "Main proxy files"; Types: full compact custom; Flags: fixed; MinVersion: 0,6.1
Name: "NodeJS"; Description: "Download and install NodeJS"; Types: full custom; MinVersion: 0,6.1
Name: "VCRedistributable"; Description: "Download and install VC++ packages"; Types: full custom; MinVersion: 0,6.1

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
              idpAddFile('https://nodejs.org/dist/latest-v11.x/node-v10.11.4-x64.msi', ExpandConstant('{tmp}\node.msi'));
            if not IsWin64 then
              idpAddFile('https://nodejs.org/dist/latest-v11.x/node-v10.11.4-x86.msi', ExpandConstant('{tmp}\node.msi'));
        end;
        if IsComponentSelected('VCRedistributable') then
        begin
            if IsWin64 then
              idpAddFile('https://aka.ms/vs/15/release/VC_redist.x86.exe', ExpandConstant('{tmp}\vc17x86.msi'));
              idpAddFile('https://aka.ms/vs/15/release/VC_redist.x64.exe', ExpandConstant('{tmp}\vc17x64.msi'));
              idpAddFile('https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x86.exe', ExpandConstant('{tmp}\vc15x86.msi'));
              idpAddFile('https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x64.exe', ExpandConstant('{tmp}\vc15x64.msi'));
            if not IsWin64 then
              idpAddFile('https://aka.ms/vs/15/release/VC_redist.x86.exe', ExpandConstant('{tmp}\vc17x86.msi'));
              idpAddFile('https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x86.exe', ExpandConstant('{tmp}\vc15x86.msi'));
        end;
  end;
end;
