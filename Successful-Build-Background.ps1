$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment
$RootPath = split-path $SCRIPT:MyInvocation.MyCommand.Path -parent 
$BackGroundFile = "McKesson_2560x1440.jpg"
$BackGroundFileName = $($RootPath + "\" + $BackGroundFile )
$tsenv.Value("BackGroundFileName") = $BackGroundFileName

if(Test-Path $BackGroundFileName)
    {
        takeown /f c:\windows\WEB\wallpaper\Windows\img0.jpg
        icacls c:\windows\WEB\wallpaper\Windows\img0.jpg /Grant ‘System:(F)’
        Remove-Item c:\windows\WEB\wallpaper\Windows\img0.jpg
        Copy-Item $BackGroundFileName c:\windows\WEB\wallpaper\Windows\img0.jpg
        REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization /v LockScreenImage /d "C:\Windows\Web\Wallpaper\Windows\img0.jpg"
    }