; This script was created using Pulover's Macro Creator
; www.macrocreator.com

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1


F1::
Betpaminnelse:
Send, {Tab 2}{Home}{Delete}{Right 3}{Delete}
Click, 535, 332 Left, 1
Sleep, 10
Send, {Home}
Sleep, 100
SendRaw, 
(LTrim
%Clipboard% - Betalingspåminnelse
Ber om at utestående faktura blir betalt for å unngå gebyr og lagerleie.
Mvh Nettbil


)
Sleep, 300
Click, 562, 517, 0
Sleep, 10
Return

F3::
Betsjekk:
Click, Left, 2
Sleep, 10
Clipboard := 
Send, {Control Down}{c}{Control Up}
ClipWait, 1
If (ErrorLevel or StrLen(Clipboard) < 7)
{
    Return
}
Clipboard := RegExReplace(Clipboard, "\s")
Click, 1820, 525 Left, 1  ; ADD COPY HERE
Sleep, 100
Send, {Control Down}{a}{Control Up}{Control Down}{v}{Control Up}
Click, 1793, 1024 Left, 1
Sleep, 100
Click, 2262, 485, 0
Sleep, 100
Return

F4:: 
    clipboard := ""
    Send ^c
    Clipwait, 1
    If ErrorLevel
        Return
    Run, % "chrome.exe ""https://w2.brreg.no/motorvogn/heftelser_motorvogn.jsp?regnr=" clipboard """"
        
	KeyWait, F4, [T2]
	If ErrorLevel
		Return
	Else
		Send ^w
	
F6::
	Send ^c ; copy
	return

F7::
	SendInput, ^a^v ; Paste
	return

F8::
Brreg:
Send, {Control Down}{c}{Control Up}
Click, 1970, 233 Left, 1
Sleep, 10
Click, 2885, 668 Left, 1
Sleep, 300
/*
Click, 1986, 417 Left, 2
Sleep, 200
*/
Send, {Space}
Sleep, 100
Send, {Control Down}{v}{Control Up}
Sleep, 300
Send, {Tab}
Sleep, 50
Send, {1}
Sleep, 50
Click, 2422, 696 Left, 1
Sleep, 10
Return

F9::
Hentemelding:
Send, {Control Down}{c}{Control Up}
Click, 2548, 966 Left, 1
Sleep, 100
SendRaw, 
(LTrim
%Clipboard% hm

)
Click, 280, 490, 0
Sleep, 10
Return

F10::
SalgOgHentemelding:
Click, Left, 2
Sleep, 10
Clipboard := 
Send, {Control Down}{c}{Control Up}
ClipWait, 1
If (ErrorLevel or StrLen(Clipboard) < 7)
{
    Return
}
Clipboard := RegExReplace(Clipboard, "\s")
Click, 2279, 161 Left, 1
Sleep, 10
SendRaw, 
(LTrim
%Clipboard%

)
Sleep, 300
Click, 3595, 230 Left, 1
Sleep, 50
Send, {Control Down}{a}{Control Up}
Sleep, 50
SendRaw, 
(LTrim
%Clipboard%

)
Click, 352, 505, 0
Sleep, 10
Return

F12::
Macro6:
Click, 2820, 324 Left, 1
Sleep, 10
Click, 2606, 400 Left, 1
Sleep, 10
Sleep, 300
Click, 3151, 408 Left, 2
Sleep, 10
Send, {Control Down}{c}{Control Up}
Sleep, 200
Orgnr := RegExMatch(Clipboard, "^\d")
If (Orgnr = 0)
{
    Sleep, 200
    Click, 3164, 430 Left, 2
    Sleep, 10
    Sleep, 200
    Send, {Control Down}{c}{Control Up}
    Sleep, 300
    Click, 2712, 635 Left, 1
    Sleep, 10
    Sleep, 300
    
    Send, ^v
    Send, {Enter}
}
Else
{
    Click, 2716, 627 Left, 1
    Sleep, 10
    
    Send, ^v
    Send, {Enter}
}
Click, 3151, 408 Left, 2
Sleep, 10
Send, {Control Down}{c}{Control Up}
Sleep, 200
Orgnr := RegExMatch(Clipboard, "^\d")
If (Orgnr = 0)
{
    Click, 3198, 455 Left, 2
    Sleep, 10
    Send, {Control Down}{c}{Control Up}
}
Else
{
    Click, 3192, 428 Left, 2
    Send, {Control Down}{c}{Control Up}
}
Sleep, 200
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, 2343, 395, 2904, 969, C:\Users\tzmh\AppData\Roaming\MacroCreator\Screenshots\Screen_20230106142848.png
CenterImgSrchCoords("C:\Users\tzmh\AppData\Roaming\MacroCreator\Screenshots\Screen_20230106142848.png", FoundX, FoundY)
If ErrorLevel = 0
	Click, %FoundX%, %FoundY% Left, 1
Sleep, 300
Send, {Tab}
Sleep, 300

Send, ^v
Return


CenterImgSrchCoords(File, ByRef CoordX, ByRef CoordY)
{
	static LoadedPic
	LastEL := ErrorLevel

	Gui, Pict:Add, Pic, vLoadedPic, % RegExReplace(File, "^(\*\w+\s)+")
	GuiControlGet, LoadedPic, Pict:Pos
	Gui, Pict:Destroy
	CoordX += LoadedPicW // 2
	CoordY += LoadedPicH // 2
	ErrorLevel := LastEL
}
