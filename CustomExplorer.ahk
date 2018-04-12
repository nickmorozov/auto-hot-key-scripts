; Always On Top script
; -------------------------------
; Original: http://www.labnol.org/software/tutorials/keep-window-always-on-top/5213/
; This version uses middle mouse click on the window titlebar instead of ctrl+space

#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon				; Do not show tray icon
#Warn					; Enable warnings to assist with detecting common errors.
#SingleInstance force	; Determines whether a script is allowed to run again when it is already running.

#e::Run explorer.exe %A_Desktop%\..\Downloads\
