#Requires AutoHotkey v2.0
ToolTip("Downloading config data")
class GithubClass {
    link := ''

    __new(github_user, repo) {
        this.link := 'https://github.com/' github_user '/' repo
    }

    GetLatestVersionURL(item) {
        return this.link '/releases/latest/download/' item
    }
}
macro_path := A_ScriptDir '\configs.ini'
try FileDelete(macro_path)
Sleep 500
try {
    g := GithubClass('Yavanari', 'Config-Helper-For-Salmon-s-Anime_Vanguard-Macro-2')
    Download(g.GetLatestVersionURL('configs.ini'), macro_path)
} catch Error as e {
    MsgBox e.Message
}
ToolTip()
