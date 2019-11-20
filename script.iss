#define MyAppName "TeraToolbox"
#define MyAppVersion "2"
#define MyAppPublisher "SaltyMonkey"
#define MyAppURL "https://discord.gg/dUNDDtw"
#define MyAppExeName "TeraToolbox.exe"

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
VersionInfoVersion=1.0
VersionInfoDescription=TERA Toolbox
MinVersion=0,6.1
AppCopyright=SaltyMonkey
UsePreviousAppDir=False
InfoBeforeFile=D:\CaaliToolboxInstaller\topack\readme.txt
UsePreviousLanguage=False
ShowTasksTreeLines=False
VersionInfoProductName=TERA Toolbox
InternalCompressLevel=ultra64
Compression=lzma2/ultra
Uninstallable=no
UsePreviousSetupType=False
UsePreviousTasks=False
ShowLanguageDialog=no
SetupIconFile=D:\CaaliToolboxInstaller\topack\icon.ico
WizardSmallImageFile=D:\CaaliToolboxInstaller\topack\logo.bmp
DisableWelcomePage=True
DisableFinishedPage=True

ShowComponentSizes =False
FlatComponentsList=False
DisableProgramGroupPage=yes
DisableReadyPage=True
DisableReadyMemo=True

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
Name: "desktopicon"; Description: "Create shortcut at desktop"; GroupDescription: "Common:"; Flags: checkedonce
Name: "openfolder"; Description: "Open install folder in explorer"; GroupDescription: "Common:"; Flags: checkedonce
Name: "startAfterInstall"; Description: "Run Toolbox after installation"; GroupDescription: "Common:"; Flags: checkedonce

[Files]
Source: "topack\toolbox\config.json"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\package.json"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\README.md"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\TeraToolboxCLI.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\TeraToolbox.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\doc\*"; DestDir: "{app}"; Flags: ignoreversion; Components: Toolbox
Source: "topack\toolbox\bin\*"; DestDir: "{app}\bin\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Toolbox
Source: "topack\toolbox\node_modules\*"; DestDir: "{app}\node_modules\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Toolbox
Source: "topack\toolbox\mods\*"; DestDir: "{app}\mods\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Toolbox

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\TeraToolbox.exe"; Components: Toolbox
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Components: Toolbox; Tasks: desktopicon

[Run]
Filename: "explorer.exe"; Parameters: "{app}"; Tasks: openfolder
Filename: "reg"; Parameters: "add ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths"" /v ""{app}"" /t REG_DWORD /d 0 /f"; Components: DefenderExclude
Filename: "powershell.exe"; Parameters: "-windowstyle hidden -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath ""{app}"""; Components: DefenderExclude
Filename: "reg"; Parameters: "add ""HKLM\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths"" /v ""{app}"" /t REG_DWORD /d 0 /f"; Components: DefenderExclude
Filename: {app}\{#MyAppExeName}; Flags: shellexec skipifsilent nowait; Tasks: startAfterInstall

[INI]
Filename: "{app}\{#MyAppName}.url"; Section: "InternetShortcut"; Key: "URL"; String: "https://discord.gg/dUNDDtw"

[UninstallDelete]
Type: files; Name: "{app}\{#MyAppName}.url"
Type: filesandordirs; Name: "{app}\node_modules\*"
Type: filesandordirs; Name: "{app}\bin\*"
Type: filesandordirs; Name: "{app}\doc\*"
Type: filesandordirs; Name: "{app}\*"

[Components]
Name: "Toolbox"; Description: "TERA Toolbox"; Types: full compact custom; Flags: fixed; MinVersion: 0,6.1
Name: "DefenderExclude"; Description: "Add Windows Defender exclusion"; Types: full custom compact; MinVersion: 0,6.1

[ThirdParty]
UseRelativePaths=True

[Code]
{ from https://stackoverflow.com/questions/11778292/how-to-change-wizard-size-width-and-height-in-an-inno-setup-installer }
procedure MoveDown(Control: TControl; DeltaY: Integer);
begin
  Control.Top := Control.Top + DeltaY;
end;

procedure MoveRight(Control: TControl; DeltaX: Integer);
begin
  Control.Left := Control.Left + DeltaX;
end;

procedure MoveDownAndRight(Control: TControl; DeltaX, DeltaY: Integer);
begin
  MoveDown(Control, DeltaY);
  MoveRight(Control, DeltaX);
end;

procedure GrowDown(Control: TControl; DeltaY: Integer);
begin
  Control.Height := Control.Height + DeltaY;
end;

procedure GrowRight(Control: TControl; DeltaX: Integer);
begin
  Control.Width := Control.Width + DeltaX;
end;

procedure GrowRightAndDown(Control: TControl; DeltaX, DeltaY: Integer);
begin
  GrowRight(Control, DeltaX);
  GrowDown(Control, DeltaY);
end;

procedure GrowRightAndMoveDown(Control: TControl; DeltaX, DeltaY: Integer);
begin
  GrowRight(Control, DeltaX);
  MoveDown(Control, DeltaY);
end;

{ from https://stackoverflow.com/questions/11778292/how-to-change-wizard-size-width-and-height-in-an-inno-setup-installer }
procedure InitializeWizard;
var
  DeltaY: Integer;
  DeltaX: Integer;
begin
  with WizardForm do
  begin
    DeltaX := ScaleX(WizardSmallBitmapImage.Bitmap.Width)-MainPanel.Width;
    DeltaY := ScaleY(WizardSmallBitmapImage.Bitmap.Height)-MainPanel.Height;
    
    { Banner }
    MainPanel.Width := ScaleX(WizardSmallBitmapImage.Bitmap.Width);
    MainPanel.Height := ScaleY(WizardSmallBitmapImage.Bitmap.Height);
    WizardSmallBitmapImage.Top := 0;
    WizardSmallBitmapImage.Left := 0;
    WizardSmallBitmapImage.Width := MainPanel.Width;
    WizardSmallBitmapImage.Height := MainPanel.Height;
    WizardSmallBitmapImage.Stretch := True;
    WizardSmallBitmapImage.AutoSize := False;
    PageDescriptionLabel.Visible := False;
    PageNameLabel.Visible := False;
    Bevel1.Visible := False;
       
    { Frame }
    GrowRightAndDown(WizardForm, DeltaX, DeltaY);

    { General Controls }
    GrowRightAndMoveDown(Bevel, DeltaX, DeltaY);
    MoveDownAndRight(CancelButton, DeltaX, DeltaY);
    MoveDownAndRight(NextButton, DeltaX, DeltaY);
    MoveDownAndRight(BackButton, DeltaX, DeltaY);
    GrowRightAndDown(OuterNotebook, DeltaX, DeltaY);
    GrowRight(BeveledLabel, DeltaX);
    
    { InnerPage }
    GrowRightAndDown(InnerNotebook, DeltaX, DeltaY);

    { WelcomePage }
    WelcomeLabel2.Top := WelcomeLabel2.Top+MainPanel.Height;
    WelcomeLabel2.Left := ScaleX(20);
    WelcomeLabel2.Width :=  MainPanel.Width-ScaleX(20);
    WelcomeLabel1.Top := WelcomeLabel1.Top+MainPanel.Height;
    WelcomeLabel1.Left := ScaleX(10);
    WelcomeLabel1.Width :=  MainPanel.Width-ScaleX(10);
    WizardBitmapImage.Bitmap := WizardSmallBitmapImage.Bitmap;
    WizardBitmapImage.Width := MainPanel.Width;
    WizardBitmapImage.Height := MainPanel.Height;

    { Information Page }
    MoveDown(InfoBeforeMemo, deltaY);
    GrowRightAndMoveDown(InfoBeforeClickLabel, DeltaX, DeltaY);

    { LicensePage }
    MoveDown(LicenseNotAcceptedRadio, DeltaY);
    MoveDown(LicenseAcceptedRadio, DeltaY);
    GrowRightAndMoveDown(LicenseMemo, DeltaX, DeltaY);
    GrowRightAndMoveDown(LicenseLabel1, DeltaX, DeltaY);

    { SelectDirPage }
    GrowRightAndMoveDown(DiskSpaceLabel, DeltaX, DeltaY);
    MoveDownAndRight(DirBrowseButton, DeltaX, DeltaY);
    GrowRightAndMoveDown(DirEdit, DeltaX, DeltaY);
    GrowRightAndMoveDown(SelectDirBrowseLabel, DeltaX, DeltaY);
    GrowRightAndMoveDown(SelectDirLabel, DeltaX, DeltaY);

    { SelectComponentsPage }
    GrowRightAndMoveDown(ComponentsDiskSpaceLabel, DeltaX, DeltaY);
    GrowRightAndMoveDown(ComponentsList, DeltaX, DeltaY);
    GrowRightAndMoveDown(TypesCombo, DeltaX, DeltaY);
    GrowRightAndMoveDown(SelectComponentsLabel, DeltaX, DeltaY);

    { SelectTasksPage }
    GrowRightAndMoveDown(TasksList, DeltaX, DeltaY);
    GrowRightAndMoveDown(SelectTasksLabel, DeltaX, DeltaY);

    { ReadyPage }
    GrowRightAndMoveDown(ReadyMemo, DeltaX, DeltaY);
    GrowRightAndMoveDown(ReadyLabel, DeltaX, DeltaY);

    { PreparingPage }
    MoveDown(PreparingYesRadio, DeltaY);
    MoveDown(PreparingNoRadio, DeltaY);
    GrowRightAndMoveDown(PreparingLabel, DeltaX, DeltaY);
    GrowRightAndMoveDown(PreparingMemo, DeltaX, DeltaY);

    { InstallingPage }
    GrowRightAndMoveDown(FilenameLabel, DeltaX, DeltaY);
    GrowRightAndMoveDown(StatusLabel, DeltaX, DeltaY);
    GrowRightAndMoveDown(ProgressGauge, DeltaX, DeltaY);

    { FinishedPage }
    FinishedLabel.Top := FinishedLabel.Top+MainPanel.Height;
    FinishedLabel.Left := ScaleX(20);
    FinishedLabel.Width :=  MainPanel.Width-ScaleX(20);
    FinishedHeadingLabel.Top := FinishedHeadingLabel.Top+MainPanel.Height;
    FinishedHeadingLabel.Left := ScaleX(10);
    FinishedHeadingLabel.Width :=  MainPanel.Width-ScaleX(10);
    WizardBitmapImage2.Bitmap := WizardSmallBitmapImage.Bitmap;
    WizardBitmapImage2.Width := MainPanel.Width;
    WizardBitmapImage2.Height := MainPanel.Height;
    
  
   end;
end;