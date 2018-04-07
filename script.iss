#define MyAppName "CaaliTeraProxy"
#define MyAppVersion "1"
#define MyAppPublisher "SaltyMonkey"
#define MyAppURL "https://discord.gg/maqBmJV"
#define MyAppExeName "TeraProxy.bat"
#define Nodex64Name  "node-v9.11.1-x64.msi"
#define Nodex86Name  "node-v9.11.1-x86.msi"

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
Compression=lzma2/ultra
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
UsePreviousSetupType=False
UsePreviousAppDir=False

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
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "D:\CaaliProxyInstaller\topack\proxy\package.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\CaaliProxyInstaller\topack\proxy\package-lock.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\CaaliProxyInstaller\topack\proxy\README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\CaaliProxyInstaller\topack\proxy\TeraProxy.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\CaaliProxyInstaller\topack\proxy\bin\*"; DestDir: "{app}\bin\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\CaaliProxyInstaller\topack\proxy\node_modules\*"; DestDir: "{app}\node_modules\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\CaaliProxyInstaller\topack\proxy\bin\node_modules\*"; DestDir: "{app}\bin\node_modules\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\CaaliProxyInstaller\topack\{#Nodex64Name}"; DestDir: "{tmp}"; Flags: deleteafterinstall; Check: Is64BitInstallMode
Source: "D:\CaaliProxyInstaller\topack\{#Nodex86Name}"; DestDir: "{tmp}"; Flags: deleteafterinstall; Check: not Is64BitInstallMode

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{sys}\msiexec.exe"; Parameters: "/package  ""{tmp}\{#Nodex64Name}"" /qn /norestart /passive"; Flags: 64bit skipifdoesntexist waituntilterminated; Check:IsWin64; StatusMsg: "Install NodeJs"; 
Filename: "{sys}\msiexec.exe"; Parameters: "/package  ""{tmp}\{#Nodex86Name}"" /qn /norestart /passive"; Flags: 32bit skipifdoesntexist waituntilterminated; StatusMsg: "Install NodeJs"; 
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall add rule name=""Node In"" program=""{pf64}\nodejs\node.exe"" dir=in action=allow enable=yes"; Flags: runhidden;
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall add rule name=""Node Out"" program=""{pf64}\nodejs\node.exe"" dir=out action=allow enable=yes"; Flags: runhidden;

[INI]
Filename: "{app}\{#MyAppName}.url"; Section: "InternetShortcut"; Key: "URL"; String: " https://discord.gg/maqBmJV"

[UninstallDelete]
Type: files; Name: "{app}\{#MyAppName}.url"
