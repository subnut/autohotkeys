#Requires AutoHotKey v2

/*
	Include this file if you want to run
	a script with Admin Privileges.

	Mostly used for defining keybinds that work
	on programs running as Administrator.
	(Task Manager is the most famous example.)
*/

if not A_IsAdmin 
{
	full_command_line := DllCall("GetCommandLine", "str")
	if not RegExMatch(full_command_line, " /restart(?!\S)") {
		try
			if A_IsCompiled
				Run '*RunAs "' A_ScriptFullPath '" /restart'
			else
				Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
		ExitApp
	}
	else {
		; UAC disabled most likely
		MsgBox "Unable to obtain Elevated Privileges. Exiting."
		ExitApp
	}
}
