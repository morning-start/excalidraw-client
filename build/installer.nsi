; 定义常量
!define APP_NAME "Your App Name"
!define APP_VERSION "1.0.0"
!define APP_EXECUTABLE "your-app.exe"
!define APP_INSTALL_DIR "$PROGRAMFILES64\${APP_NAME}"

; 初始化安装程序
Name "${APP_NAME} ${APP_VERSION}"
OutFile "build/installer.exe"
InstallDir "${APP_INSTALL_DIR}"

; 设置安装程序页面
Page directory
Page instfiles

; 安装部分
Section "Install"
    SetOutPath "$INSTDIR"
    File "build/bin/windows/amd64/${APP_EXECUTABLE}"
    ; 如果有其他依赖文件，可以在这里添加更多的 File 指令
    ; File "path/to/your/file.txt"

    ; 创建快捷方式
    CreateShortCut "$SMPROGRAMS\${APP_NAME}\${APP_NAME}.lnk" "$INSTDIR\${APP_EXECUTABLE}"
    CreateShortCut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${APP_EXECUTABLE}"
SectionEnd

; 卸载部分
Section "Uninstall"
    Delete "$INSTDIR\${APP_EXECUTABLE}"
    ; 如果有其他依赖文件，需要在这里添加相应的 Delete 指令
    ; Delete "$INSTDIR\path/to/your/file.txt"

    Delete "$SMPROGRAMS\${APP_NAME}\${APP_NAME}.lnk"
    Delete "$DESKTOP\${APP_NAME}.lnk"
    RMDir "$SMPROGRAMS\${APP_NAME}"
    RMDir "$INSTDIR"
SectionEnd