@ECHO OFF
ECHO ----------------------------------------------------------------------------------------------------------------------
SET /P URL="[Enter video URL] "
ECHO ----------------------------------------------------------------------------------------------------------------------
goto formatList

:formatList
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------
D:\Soft\Mpv\youtube-dl.exe -F %URL% -i --youtube-skip-dash-manifest
ECHO ----------------------------------------------------------------------------------------------------------------------
goto selection


:selection
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO 1) Download
ECHO 2) Download Partial
ECHO.
SET /P option="Select option: "
if %option% == 1 (goto downloadSingle)
if %option% == 2 (goto Partial)
ECHO.
ECHO Unknown value
ECHO ----------------------------------------------------------------------------------------------------------------------
goto selection

:Partial
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------
SET /P format="Select format: "
SET /P Start="Start Time (HH:MM:SS): "
SET /P End="End Time (HH:MM:SS): "
SET /P Name="Name (with Extension): "
ECHO.
for /f %%N in ('D:\Soft\Mpv\youtube-dl.exe --youtube-skip-dash-manifest -f %%format%% -g %%URL%%') do @ffmpeg -i "%%N" -ss %Start% -to %End% -c copy -copyts C:\Users\Chella\Downloads\%Name%
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
D:\Soft\Mpv\youtube-dl.exe -o C:\Users\Chella\Downloads/%%(title)s.%%(ext)s -f %format% -i --youtube-skip-dash-manifest --add-metadata --no-mtime --hls-prefer-native --write-auto-sub --write-sub --sub-lang en --embed-subs --embed-thumbnail --merge-output-format mp4 %URL%
ECHO ----------------------------------------------------------------------------------------------------------------------
ECHO.
PAUSE
EXIT

