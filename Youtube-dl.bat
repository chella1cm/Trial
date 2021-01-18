@ECHO OFF
ECHO ----------------------------------------------------------------------------------------------------------------------
SET /P URL="[Enter video URL] "
ECHO ----------------------------------------------------------------------------------------------------------------------
goto formatList

:formatList
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------
youtube-dl -F %URL%
ECHO ----------------------------------------------------------------------------------------------------------------------
goto selection


:selection
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO 1) Video + Audio
ECHO 2) Single format (Audio only / Video only)
ECHO.
SET /P option="Select option: "
if %option% == 1 (goto download)
if %option% == 2 (goto downloadSingle)
ECHO.
ECHO Unknown value
ECHO ----------------------------------------------------------------------------------------------------------------------
goto selection

:download
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------
SET /P video="Select video format: "
SET /P audio="Select audio format: "
ECHO.
youtube-dl -o Downloads/%%(title)s.%%(ext)s -f %video%+%audio% -i --ignore-config --hls-prefer-native %URL%
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO.
PAUSE
EXIT

:downloadSingle
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------
SET /P format="Select format: "
ECHO.
youtube-dl -o Downloads/%%(title)s.%%(ext)s -f %format% -i --add-metadata --all-subs --embed-subs --embed-thumbnail %URL%
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO.
PAUSE
EXIT

