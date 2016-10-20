/*
 * Hide To Tray
 *
 * Run this from the console or use as a shortcut target:
 * /path/to/HideToTray.exe "/path/to/program.exe"
 */

#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon				; Do not show tray icon
#Warn					; Enable warnings to assist with detecting common errors.
#SingleInstance force	; Determines whether a script is allowed to run again when it is already running.
#Persistent				; Keeps the script running

global WindowHandle
1 = C:\Program Files (x86)\ScreenBloom\ScreenBloom.exe ; DEBUG
TargetPath = %1%

; Check the provided
IfNotExist, %TargetPath%
{
	MsgBox, The target file %TargetPath% does not exist. ; DEBUG
	ExitApp
}

SplitPath, %TargetPath%, , TargetDir, , TargetName ; TODO 1 blag

; Setup Tray icon and add item that will handle double click events
Menu Tray, Icon ; TODO 2 stuff
Menu Tray, Icon, %TargetPath%, %TargetDir%

Menu, Tray, NoStandard
Menu Tray, Add, Toggle Tray, TrayClick
Menu Tray, Add, Exit, ExitLabel
Menu, Tray, Standard

Menu Tray, Default, Toggle Tray

; Run notepad hidden
DetectHiddenWindows On
Run %ExePath%,, Hide, PID
WinWait ahk_pid %PID%
ExeID := WinExist()
DetectHiddenWindows Off
Return

SplitPath, A_ScriptName, , , , thisscriptname
If( !A_IsCompiled && FileExist(A_ScriptDir . "\" . thisscriptname . ".ico")) {
	Menu, Tray, Icon, %A_ScriptDir%\%thisscriptname%.ico
}


; Show / hide notepad on double click
TrayClick:
	; #IfWinNotActive, ahk_id %ExeID%
	; {

	; }
	If DllCall("IsWindowVisible", "Ptr", ExeID)
	{
		WinHide ahk_id %ExeID%
	}
	Else
	{
		WinShow ahk_id %ExeID%
		WinActivate ahk_id %ExeID%
	}
Return

ExitLabel:
	ExitApp
Return
