Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

' Detecta automaticamente a pasta onde o script está salvo
AppDir = FSO.GetParentFolderName(WScript.ScriptFullName)
LocalAppData = WshShell.ExpandEnvironmentStrings("%LOCALAPPDATA%")
ProfileDir = LocalAppData & "\MultiStreamHub\profile"

' Inicia o servidor HTTP na porta 8765 de forma oculta (0)
WshShell.Run "python -m http.server 8765 --bind 127.0.0.1 --directory """ & AppDir & """", 0, False

' Aguarda 500ms e abre o Microsoft Edge em modo App com perfil isolado
WScript.Sleep 500
WshShell.Run "msedge.exe --app=http://localhost:8765/index.html --user-data-dir=""" & ProfileDir & """ --window-size=1600,900 --autoplay-policy=no-user-gesture-required", 1, False
