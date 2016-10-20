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
#Persistent				; Keeps the script in memory

global WindowHandle
TargetPath = %1%

; Check the provided
IfNotExist, %TargetPath%
{
	MsgBox, The target file %TargetPath% does not exist.
	ExitApp
}

SplitPath, TargetPath, , TargetDir, , TargetName

; Setup Tray icon and add item that will handle click events
Menu Tray, Click, 1

Menu Tray, Icon
Menu Tray, Icon, %TargetPath%

Menu Tray, NoStandard
Menu Tray, Add, Toggle Tray, TrayClick
Menu Tray, Add, Exit, ExitLabel

Menu Tray, Default, Toggle Tray

; Run notepad hidden
DetectHiddenWindows On
Run %TargetPath%, %TargetDir%, Hide, PID
WinWait ahk_pid %PID%
ExeID := WinExist()

; Handle closed window
WinWaitClose ahk_id %ExeID%
{
	ExitApp
}

Return

; Show / hide notepad on click
TrayClick:
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
	WinClose ahk_id %ExeID%
Return
