; Open Explorer in Downloads

#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon				; Do not show tray icon
#Warn					; Enable warnings to assist with detecting common errors.
#SingleInstance force	; Determines whether a script is allowed to run again when it is already running.

#e::Run explorer.exe %A_Desktop%\..\Downloads\
