#Requires AutoHotkey v2.0
#SingleInstance Force
RepoOwner := "Yavanari"
RepoName := "Config-Helper-For-Salmon-s-Anime_Vanguard-Macro-2"
Branch := "main" 
GitHubUrl := "https://github.com/" RepoOwner "/" RepoName "/archive/refs/heads/" Branch ".zip"
ZipFileName := RepoName "-Latest.zip"
DownloadFolder := A_ScriptDir 
WinClose("ConfigHelper.ahk")

DownloadZIP() {
    global GitHubUrl, ZipFileName, DownloadFolder
    
    MsgBox("Click to start updating `nWill take ~15-20 sec")
    
    try {
        ; Create HTTP request
        whr := ComObject("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", GitHubUrl, false)
        whr.SetRequestHeader("User-Agent", "AHK-Downloader/2.0")
        whr.Send()
        
        if (whr.Status = 200) {
            FilePath := DownloadFolder "\" ZipFileName
            ado := ComObject("ADODB.Stream")
            ado.Type := 1 ;
            ado.Open()
            ado.Write(whr.ResponseBody)
            ado.SaveToFile(FilePath, 2) 
            ado.Close()
            return FilePath
    }
}
}
DownloadExtractBtn(*)
{
    path := A_ScriptDir . "\Config-Helper-For-Salmon-s-Anime_Vanguard-Macro-2-Latest.zip"
    psCommand := 'Expand-Archive -Path \"' path '\" -DestinationPath \"' A_ScriptDir '\" -Force'
    RunWait('powershell -Command ' psCommand, , "Hide")
    
        loop files A_ScriptDir . "\Config-Helper-For-Salmon-s-Anime_Vanguard-Macro-2-main" "\*", "F"
        {
            if (A_LoopFileName = "UpdateHelper.ahk")
            {
                continue
            }
            FileMove A_LoopFileFullPath , A_ScriptDir , 1
        }
        loop files A_ScriptDir . "\Config-Helper-For-Salmon-s-Anime_Vanguard-Macro-2-main" "\*", "D" 
        {
        DirMove A_LoopFileFullPath , A_ScriptDir , 1
        }
}

DownloadZIP()
DownloadExtractBtn()
DirDelete A_ScriptDir . "\Config-Helper-For-Salmon-s-Anime_Vanguard-Macro-2-main" , 1
FileDelete A_ScriptDir . "\Config-Helper-For-Salmon-s-Anime_Vanguard-Macro-2-Latest.zip"
MsgBox("Updated Successfully")
