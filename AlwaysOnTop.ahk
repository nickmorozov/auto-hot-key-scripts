; Always On Top script
; -------------------------------
; Original: http://www.labnol.org/software/tutorials/keep-window-always-on-top/5213/
; This version uses middle mouse click on the window titlebar instead of ctrl+space

#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon				; Do not show tray icon
#Warn					; Enable warnings to assist with detecting common errors.
#SingleInstance force	; Determines whether a script is allowed to run again when it is already running.

MButton::
	CoordMode, Mouse, Screen

	MouseGetPos, xPos, yPos, WindowUnderMouseID
	WinGetClass, WindowClass, ahk_id %WindowUnderMouseID%
	SendMessage, 0x84, , ( yPos << 16 ) | xPos, , ahk_id %WindowUnderMouseID%

	If (WindowClass <> "Shell_TrayWnd") and (ErrorLevel = 2)
	{
		IfWinNotActive ahk_id %WindowUnderMouseID%
		{
			WinActivate ahk_id %WindowUnderMouseID%
		}
		Winset, AlwaysOnTop, Toggle, ahk_id %WindowUnderMouseID%
	}
	Else
	{
		Click Middle
	}
Return
