; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Bug Finder"
!define PRODUCT_VERSION "1.2.0"
!define PRODUCT_PUBLISHER "Antonio Petricca"
!define PRODUCT_WEB_SITE "http://exccatch.sourceforge.net"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_RADIOBUTTONS
!insertmacro MUI_PAGE_LICENSE "..\..\docs\ReadMe.txt"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Bug Finder"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "..\..\bin\bugfinder_setup.${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\BugFinder"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "!Bug Finder (Core)" SEC01
  SetOutPath "$INSTDIR\bin"
  SetOverwrite ifnewer

  File "..\..\bin\BfCfgWiz.dll"
  File "..\..\bin\BfConfig.exe"
  File "..\..\bin\BugFinder.exe"
  File "..\..\bin\ClrEP.dll"
  File "..\..\bin\CoffSP.dll"
  File "..\..\bin\DbgHelp.Dll"
  File "..\..\bin\DelphiEP.dll"
  File "..\..\bin\MapSP.dll"
  File "..\..\bin\psapi.dll"
  File "..\..\bin\TD32SP.dll"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Bug Finder.lnk" "$INSTDIR\bin\BugFinder.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Configuration Wizard.lnk" "$INSTDIR\bin\BfConfig.exe" "" "$INSTDIR\bin\BfConfig.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section "Documentation" SEC02
  SetOutPath "$INSTDIR\docs"
  File "..\..\docs\ChangeLog.txt"
  File "..\..\docs\ReadMe.txt"
  File "..\..\docs\HowToWriteSymbolsProvider.txt"
  File "..\..\docs\HowToWriteExceptionProvider.txt"
  File "..\..\docs\HowToUse.txt"
  File "..\..\docs\ConfigurationSwitches.txt"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP\Documentation"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\Change log.lnk" "$INSTDIR\docs\ChangeLog.txt"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\Read me.lnk" "$INSTDIR\docs\ReadMe.txt"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\How to write symbols provider.lnk" "$INSTDIR\docs\HowToWriteSymbolsProvider.txt"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\How to write exception provider.lnk" "$INSTDIR\docs\HowToWriteExceptionProvider.txt"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\How to use.lnk" "$INSTDIR\docs\HowToUse.txt"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\Configuration switches.lnk" "$INSTDIR\docs\ConfigurationSwitches.txt"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section "Demo Application" SEC03
  SetOutPath "$INSTDIR\demo"
  
  File "..\..\bin\BugFinder.ini"
  File "..\..\bin\FaultingApp.exe"
  File "..\..\bin\FaultingApp.map"
  File "..\..\bin\FaultingAppCoff.dll"
  File "..\..\bin\FaultingAppCoff.pdb"
  File "..\..\bin\FaultingAppTD32.dll"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Demo application.lnk" "$INSTDIR\bin\BugFinder.exe" "BugFinder.ini" "$INSTDIR\demo\FaultingApp.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section "Demo Application (.NET/CLR)" SEC04
  SetOutPath "$INSTDIR\demo.net"
  File "..\..\bin\FaultingAppNET.exe"
  File "..\..\bin\FaultingAppNET.pdb"
  File "..\..\bin\BugFinderNET.ini"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Demo application (.NET/CLR).lnk" "$INSTDIR\bin\BugFinder.exe" "BugFinderNET.ini" "$INSTDIR\demo.net\FaultingAppNET.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Bug Finder on the web.lnk" "$INSTDIR\${PRODUCT_NAME}.url" "" "$SYSDIR\Shell32.dll" 13
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"

  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\bin\BugFinder.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "Bug Finder core engine"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "Bug Finder documentation"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "Bug Finder crashing demo application"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "Bug Finder crashing demo application (.NET/CLR)"
!insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) has been completely removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Do you want to completely remove $(^Name) and all its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  
  Delete "$INSTDIR\bin\BfCfgWiz.dll"
  Delete "$INSTDIR\bin\BfConfig.exe"
  Delete "$INSTDIR\bin\BugFinder.exe"
  Delete "$INSTDIR\bin\ClrEP.dll"
  Delete "$INSTDIR\bin\CoffSP.dll"
  Delete "$INSTDIR\bin\DbgHelp.Dll"
  Delete "$INSTDIR\bin\DelphiEP.dll"
  Delete "$INSTDIR\bin\MapSP.dll"
  Delete "$INSTDIR\bin\psapi.dll"
  Delete "$INSTDIR\bin\TD32SP.dll"
  Delete "$INSTDIR\demo.net\BugFinderNET.ini"
  Delete "$INSTDIR\demo.net\FaultingAppNET.exe"
  Delete "$INSTDIR\demo.net\FaultingAppNET.pdb"
  Delete "$INSTDIR\demo\BugFinder.ini"
  Delete "$INSTDIR\demo\FaultingApp.exe"
  Delete "$INSTDIR\demo\FaultingApp.map"
  Delete "$INSTDIR\demo\FaultingAppCoff.dll"
  Delete "$INSTDIR\demo\FaultingAppCoff.pdb"
  Delete "$INSTDIR\demo\FaultingAppTD32.dll"
  Delete "$INSTDIR\docs\ChangeLog.txt"
  Delete "$INSTDIR\docs\ConfigurationSwitches.txt"
  Delete "$INSTDIR\docs\HowToUse.txt"
  Delete "$INSTDIR\docs\HowToWriteExceptionProvider.txt"
  Delete "$INSTDIR\docs\HowToWriteSymbolsProvider.txt"
  Delete "$INSTDIR\docs\ReadMe.txt"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Bug Finder on the web.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Demo application.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\Configuration switches.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\How to use.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\How to write exception provider.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\How to write symbols provider.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\Read me.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\Change log.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Bug Finder.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Configuration Wizard.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP\Documentation"
  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\docs"
  RMDir "$INSTDIR\demo"
  RMDir "$INSTDIR\bin"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
SectionEnd