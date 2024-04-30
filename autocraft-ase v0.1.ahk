#Requires AutoHotkey v2.0
Esc::ExitApp     ; Exit the Script: Escape
+CapsLock::
{
	startScript
}

+SC029::
{
	craftingSelect.Show
	MouseMove 75, -18
}


MouseGetPos &startxpos, &startypos

	craftingSelect := Gui()
	craftingSelect.AddText(, "SELECT CRAFTING PRESET")
	craftingSelect.Add("Button", "Default", "CRAFT GP").OnEvent("Click", GP)
	craftingSelect.Add("Button", "Default", "CRAFT SP").OnEvent("Click", SP)
	craftingSelect.Add("Button", "Default", "CRAFT CP").OnEvent("Click", CP)
	craftingSelect.Add("Button", "Default", "CRAFT ARB").OnEvent("Click", ARB)


	craftingSelect.Show
	MouseMove 75, -18


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
	MouseClick "left", 1330, 35	;click pull amount bar
	Sleep 50
	Send "{Delete}"
	Sleep 150
	Send "{Delete}"
	Sleep 50
	Send "{Delete}"
	Sleep 50
	Send "{Delete}"
	Sleep 50
	Send "{Delete}"
	Sleep 50
	Send "1000{Enter}"		;enter pull amount
	Sleep 50	
	MouseClick "left", 1285, 275	;move cursor to bp and select
	Sleep 50
	MouseClick "left", 1440, 35	;click pull button
	Sleep 50	
	MouseClick "left", 1285, 275	;move cursor to bp and select
	Sleep 50
	start := 0
	while start < 12
	{
		Send "A"
		Sleep 60
		start++
	}
	Sleep 50
	Send "{F}"
	BlockInput "Off"
}

craftARB(*)
{	
	BlockInput "On"
	MouseClick "left", 1255, 180	;move cursor to inventory search and select
	Sleep 50
	Send "{Control down} A {Control up}"
	Sleep 50
	Send "{Delete}"
	Sleep 50
	Send "ri bu{Enter}"	;search for arb
	Sleep 1000
	pullCrafting
}

craftSP(*)
{	
	BlockInput "On"
	MouseClick "left", 1255, 180	;move cursor to inventory search and select
	Sleep 50
	Send "{Control down} A {Control up}"
	Sleep 100
	Send "{Delete}"
	Sleep 50
	Send "sp{Enter}"	;search for sparkpowder
	Sleep 100
	pullCrafting
	
}

craftGP(*)
{	
	BlockInput "On"
	MouseClick "left", 1255, 180	;move cursor to inventory search and select
	Sleep 50
	Send "{Control down} A {Control up}"
	Sleep 100
	Send "{Delete}"
	Sleep 50
	Send "gu{Enter}"	;search for gunpowder
	Sleep 100
	pullCrafting
}

craftCP(*)
{
	BlockInput "On"
	MouseClick "left", 1255, 180	;move cursor to inventory search and select
	Sleep 50
	Send "{Control down} A {Control up}"
	Sleep 100
	Send "{Delete}"
	Sleep 50
	Send "ce{Enter}"	;search for gunpowder
	Sleep 100
	pullCrafting
}

startScript(*)
{
	Send "{F}"
	Sleep 500
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


