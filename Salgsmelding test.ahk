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
#Include, D:\Macros\TF-master\tf.ahk


F12::
Orgnr:
Click, 2820, 324 Left, 1  
Sleep, 10
Click, 2606, 400 Left, 1
Sleep, 10
Click, 3129, 608 Left, 1
Sleep,10
Send, {Control Down}{a}{Control Up} 
Send, {Control Down}{c}{Control Up}  
Sleep, 100
FileDelete, D:\Macros\Forhandler info.txt  
FileAppend, %Clipboard%, D:\Macros\Forhandler info.txt  


File=!Forhandler info.txt
TF_Removelines(File,1,13)
TF_Removelines(File,3,10)
TF_TrimLeft(File, 2,"", 5)
TF_TrimRight(File, 2,"", 17)

Orgnr:=TF_ReadLines(File, 1, 1)
Tlf:=TF_ReadLines(File,2, 2)

Sleep, 200

Click, 2716, 628 Left, 1  

Sleep, 10

SendRaw, %Orgnr%

Send, {Enter}
Sleep, 200
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, 2473, 691, 2634, 847, C:\Users\tzmh\AppData\Roaming\MacroCreator\Screenshots\Screen_20230113144023.png
CenterImgSrchCoords("C:\Users\tzmh\AppData\Roaming\MacroCreator\Screenshots\Screen_20230113144023.png", FoundX, FoundY)
If ErrorLevel = 0
	Click, %FoundX%, %FoundY% Left, 1
Sleep, 200
Send, {Tab}

SendRaw, %Tlf%

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
