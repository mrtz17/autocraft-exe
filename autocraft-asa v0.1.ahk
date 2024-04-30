#Requires AutoHotkey v2.0
;autocraft script for the ark asa QoL+(https://www.curseforge.com/ark-survival-ascended/mods/qol) mod by https://github.com/mrtz17

Esc::ExitApp     ; Exit the Script: Escape
+CapsLock::
{
	startScript
}

+SC029::
{
	craftingSelect.Show
}


MouseGetPos &startxpos, &startypos

	craftingSelect := Gui()
    craftingSelect.AddText(, "AUTO CRAFT SCRIPT FOR ARK ASA QoL+ MOD")
    craftingSelect.AddText(, "by gandalf on speed")
    craftingSelect.AddText(, "")
	craftingSelect.Add("Button", "Default", "CRAFT GP").OnEvent("Click", GP)
	craftingSelect.Add("Button", "Default", "CRAFT SP").OnEvent("Click", SP)
	craftingSelect.Add("Button", "Default", "CRAFT CP").OnEvent("Click", CP)
	craftingSelect.Add("Button", "Default", "CRAFT ARB").OnEvent("Click", ARB)


	craftingSelect.Show
	global running := 0


GP(*)
{
	SetEnum("GP")
}

SP(*)
{
	SetEnum("SP")
}

CP(*)
{
	SetEnum("CP")
}

ARB(*)
{
	SetEnum("ARB")
}

exitProgram(*)
{
	;MouseMove startxpos, startypos
	ExitApp
}

pullCrafting()
{
	MouseClick "left", 1345, 35	;click pull amount bar
	Sleep 200
	Send "{Delete}"
	Sleep 1200
	Send "{Delete}"
	Sleep 200
	Send "{Delete}"
	Sleep 200
	Send "{Delete}"
	Sleep 200
	Send "{Delete}"
	Sleep 200
	Send "1000{Enter}"		
	Sleep 200	
	MouseClick "left", 1245, 275	;move cursor to bp and select
	Sleep 200
	MouseClick "left", 1440, 35	;click pull button
	Sleep 200
	MouseClick "left", 1245, 275	;move cursor to bp and select
	Sleep 200
	start := 0
	while start < 10
	{
		Send "A"
		Sleep 200
		start++
	}
	Sleep 200
	Send "{F}"
	BlockInput "Off"
	Sleep 20000
	startScript
}

craftARB(*)
{	
	BlockInput "On"
	MouseClick "left", 1265, 195	;move cursor to inventory search and select
	Sleep 200
	Send "{Control down} A {Control up}"
	Sleep 200
	Send "{Delete}"
	Sleep 200
	Send "ri bu{Enter}"
	Sleep 1000
	pullCrafting
}

craftSP(*)
{	
	BlockInput "On"
	MouseClick "left", 1265, 195	;move cursor to inventory search and select
	Sleep 200
	Send "{Control down} A {Control up}"
	Sleep 200
	Send "{Delete}"
	Sleep 200
	Send "sp{Enter}"
	Sleep 200
	pullCrafting
	
}

craftGP(*)
{	
	BlockInput "On"
	MouseClick "left", 1265, 195	;move cursor to inventory search and select
	Sleep 200
	Send "{Control down} A {Control up}"
	Sleep 200
	Send "{Delete}"
	Sleep 200
	Send "gu{Enter}"
	Sleep 200
	pullCrafting
}

craftCP(*)
{	BlockInput "On"
	MouseClick "left", 1265, 195	;move cursor to inventory search and select
	Sleep 200
	Send "{Control down} A {Control up}"
	Sleep 200
	Send "{Delete}"
	Sleep 200
	Send "ce{Enter}"
	Sleep 200
	pullCrafting
}

startScript(*)
{
	Send "{F}"
	Sleep 1000
	switch enum
	{
	case "GP": craftGP
	case "SP": craftSP
	case "ARB": craftARB
	case "CP": craftCP
	}
}

SetEnum(enumValue) {
	global enum := enumValue
	craftingSelect.Hide
}

