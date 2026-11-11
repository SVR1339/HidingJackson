; Inno Setup Script for Hiding Jackson v1.0.0
; Packages the verified distribution from HidingJackson-Dist\HidingJackson-v1.0.0-Windows-x64

#define MyAppName "Hiding Jackson"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Hiding Jackson"
#define MyAppURL "https://github.com/SVR1339/HidingJackson"
#define MyAppExeName "HidingJackson.exe"
#define DistDir "C:\Users\asus\.gemini\antigravity\scratch\HidingJackson-Dist\HidingJackson-v1.0.0-Windows-x64"

[Setup]
AppId={{D1A2B3C4-E5F6-7890-ABCD-EF1234567890}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}/issues
AppUpdatesURL={#MyAppURL}/releases
DefaultDirName={localappdata}\Programs\HidingJackson
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile={#DistDir}\LICENSE
OutputDir=C:\Users\asus\.gemini\antigravity\scratch
OutputBaseFilename=HidingJackson-v1.0.0-Setup
SetupIconFile=C:\Users\asus\.gemini\antigravity\scratch\HidingJackson\src-tauri\icons\icon.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
Compression=lzma2/normal
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
CloseApplications=yes
CloseApplicationsFilter=HidingJackson.exe,verge-mihomo.exe

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#DistDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{userprograms}\HidingJackson"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\{#MyAppExeName}"
Name: "{userdesktop}\HidingJackson"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
