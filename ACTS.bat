@ECHO OFF
TITLE Anderson University Classroom Troubleshooter
COLOR 0f
ECHO Welcome to the AU Classroom Troubleshooter.
ECHO This program will help automate the process of fixing your classroom computer.
ECHO.
ECHO.
ECHO What issues are you having today?
ECHO. 
ECHO (S)ound
ECHO (D)isplay
ECHO (N)etwork Connectivity
ECHO (O)ther
ECHO.
:initialchoice
ECHO Choose [S,D,N,O] and hit ENTER
SET /p answer=
if %answer%==s goto :s
if %answer%==S goto :s
if %answer%==d goto :d
if %answer%==D goto :d
if %answer%==n goto :n
if %answer%==N goto :n
if %answer%==o goto :o
if %answer%==O goto :o (
) else (
 goto :initialchoice
)

:s
cls
ECHO Sound / Playback Errors - Step 1
ECHO.
ECHO A new window will open when you press enter. Set the volume to your desired level,
ECHO then close the window and return back to the troubleshooter.
ECHO.
PAUSE
sndvol
ECHO.
ECHO Did this fix your issue?
CHOICE 
if %errorlevel%==1 goto :end
if %errorlevel%==2 goto :s2

:s2
cls
ECHO Sound / Playback Errors - Step 2
ECHO.
ECHO A second possibility is that the volume on the projector (if applicable) has been muted.
ECHO You can use the projector remote to mute/unmute, as well as set the desired volume level.
ECHO.
ECHO Did this fix your issue?
CHOICE 
if %errorlevel%==1 goto :end
if %errorlevel%==2 goto :s3

:s3
cls
ECHO Sound / Playback Errors - Step 3
ECHO.
ECHO The last thing we want to check is that the we are using the proper sound device.
ECHO A new window will open when you press enter. If you aren't sure which sound device 
ECHO is correct, simply right click on each one and click "Test" until you hear sound
ECHO coming out of your preferred device.
ECHO.
ECHO Once you have found your preferred sound device, right-click on it and 
ECHO choose "Set as Default Device".
PAUSE
control mmsys.cpl sound
ECHO.
ECHO Did this fix your issue? (Hint: make sure your new device has the volume turned up!)
CHOICE 
if %errorlevel%==1 goto :end
if %errorlevel%==2 goto :escalate

:d
cls
ECHO Display / Video Errors - Step 1
ECHO.
ECHO The first step to success is to ensure the display is on and receiving power. Ensure it is turned on.
ECHO.
ECHO Did this fix your issue? 
CHOICE 
if %errorlevel%==1 goto :end
if %errorlevel%==2 goto :d2

:d2
cls
ECHO Display / Video Errors - Step 2
ECHO.
ECHO A new window will open when you press enter. Ensure that either "Duplicate" or "Extended"
ECHO Display options are enabled, if you are working with multiple screens (such as a monitor 
ECHO and projector).
PAUSE
control desk.cpl
ECHO.
ECHO Did this fix your issue? 
CHOICE 
if %errorlevel%==1 goto :end
if %errorlevel%==2 goto :escalate


:n
cls
ECHO Network Connectivity Issues - Step 1
ECHO.
ECHO If you are physically able to, check to see that the network cable is plugged into the 
ECHO back of the computer. If it looks like a rat's nest of wires and you are unable to determine
ECHO whether it is plugged in or not, proceed to step two.
ECHO.
ECHO Did this fix your issue? 
CHOICE 
if %errorlevel%==1 goto :end
if %errorlevel%==2 goto :n2

:n2
cls
ECHO Network Connectivity Issues - Step 2
ECHO.
ECHO When you press enter, a script will run to attempt to reconnect you to the network.
ECHO Do not attempt to close any windows that open, they will close automatically when complete.
PAUSE
ECHO.
ECHO Running Network Connection Script... Please Wait...
ipconfig /release >nul
ipconfig /renew >nul
ECHO.
ECHO Did this fix your issue? 
CHOICE 
if %errorlevel%==1 goto :end
if %errorlevel%==2 goto :escalate

:o
cls
ECHO Please submit a ticket via Raven Solutions for other issues that you are having.
ECHO We will work to help you as quickly as possible. Have a great day!
ECHO.
ECHO Press any key to exit...
pause >nul
exit

:end
cls
ECHO Thanks for using the troubleshooter! If your issue is still not resolved, please submit a
ECHO ticket via Raven Solutions. Have a nice day!
ECHO.
ECHO Press any key to exit...
pause >nul
exit

:escalate
cls
ECHO The automated troubleshooter was unable to fix your issue. Please submit a ticket via 
ECHO Raven Solutions, or call our ITS Help Desk at x4300. Thank you!
ECHO.
ECHO Press any key to exit...
pause >nul
exit