#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment=this tool can help you to create a Very strong passwords and easily, this tool was created by nacer baaziz.
#AutoIt3Wrapper_Res_Description=nb-Password generator
#AutoIt3Wrapper_Res_Fileversion=1.0.0.18
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=NB-Password generator
#AutoIt3Wrapper_Res_ProductVersion=1.0
#AutoIt3Wrapper_Res_CompanyName=nacer baaziz
#AutoIt3Wrapper_Res_LegalCopyright=copyright©  2019 by nacer baaziz
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Res_Field=InternalName|Password generator
#AutoIt3Wrapper_Res_Field=OriginalFilename|NB-Password_generator.exe
#AutoIt3Wrapper_Res_File_Add=lang.ini, RT_RCDATA, 0x05
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mo
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GuiButton.au3>
#include <GuiComboBox.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <FileConstants.au3>
#include <ComboConstants.au3>
#include <Restart.au3>
global $LNGFile = @scriptDir & "\NB-Password_generator.lng"
if not (FileExists($LNGFile)) then FileInstall("LNGDef.lng", @scriptDir & "\NB-Password_generator.lng")
global $LNGGet = GetLNG()
if @error then FileInstall("LNGDef.lng", @scriptDir & "\NB-Password_generator.lng")
$LNGGet = GetLNG()
global $LNGDefaultName = $LNGGet[0][1]
global $LNGDefaultRTL = $LNGGet[0][2]
global $RTL = false
if $LNGDefaultRTL = 1 then $RTL = $WS_EX_LAYOUTRTL
main()
func main()
local $hGUI, $hGUI2, $capital, $small, $nums, $symbols, $next, $back, $close, $copy, $regenerate, $save, $exit
local $input, $output
$hGUI = GUICreate("NB-Password generator", 400, 450, -1, -1, BitOR($WS_MAXIMIZEBOX, $WS_MINIMIZEBOX, $WS_SIZEBOX, $WS_SYSMENU), $RTL)
local $fileMenu = GUICtrlCreateMenu(Str("fileMenu", "&file"))
local $MChangeLNG = GUICtrlCreateMenuItem(Str("SelectLNG", "select &language..."), $FileMenu)
GUICtrlCreateMenuItem("", $fileMenu)
local $MExit = GUICtrlCreateMenuItem(Str("exit", "e&xit"), $fileMenu)
local $helpMenu = GUICtrlCreateMenu(Str("helpMenu", "&help"))
local $mWebSite = GUICtrlCreateMenuItem(Str("website", "go to web site"), $HelpMenu)
GUICtrlCreateMenuItem("", $HelpMenu)
local $MAbout = GUICtrlCreateMenuItem(Str("About", "&about"), $HelpMenu)

GUICtrlCreateLabel(Str("Welcome1", "welcome to the NB-Password generator.") & @crlf & Str("Welcome2", "this tool can help you to create a Very strong passwords and it easy to use") & @crlf & Str("Welcome3", "this tool was created by nacer baaziz"), 25, 10, 350, 50)
	GUICtrlSetResizing(-1, 1)
GUICtrlCreateGroup(Str("options", "options"), 50, 80, 300, 200)
	GUICtrlSetResizing(-1, 1)
$capital = GUICtrlCreateCheckBox(Str("capital", "use &capital letterss"), 100, 100, 200, 30)
	GUICtrlSetResizing(-1, 1)
GUICtrlSetState(-1, $GUI_checked)
GUIStartGroup("")
$small = GUICtrlCreateCheckBox(Str("small", "use &small letterss"), 100, 140, 200, 30)
	GUICtrlSetResizing(-1, 1)
GUICtrlSetState(-1, $GUI_checked)
GUIStartGroup("")
$nums = GUICtrlCreateCheckBox(Str("nums", "use &numbers"), 100, 180, 200, 30)
	GUICtrlSetResizing(-1, 1)
GUICtrlSetState(-1, $GUI_checked)
$symbols = GUICtrlCreateCheckBox(Str("symbols", "use &symbols"), 100, 220, 200, 30)
	GUICtrlSetResizing(-1, 1)
GUICtrlCreateGroup("", -1, -1, -1, -1)
GUIStartGroup("")
GUICtrlCreateLabel(Str("maxN", "&max number"), 150, 300, 100, 20)
	GUICtrlSetResizing(-1, 1)
$input = GUICtrlCreateInput("", 150, 320, 100, 30, $ES_NUMBER)
	GUICtrlSetResizing(-1, 1)
GUICtrlSetData(-1, 6)
GUICtrlCreateUpdown($input, $UDS_ARROWKEYS)
	GUICtrlSetResizing(-1, 1)
GUICtrlSetlimit(-1, 150, 6)
GUIStartGroup("")
$next = GUICtrlCreateButton(Str("Generate", "&Generate password"), 10, 380, 90, 30, 0x01)
	GUICtrlSetResizing(-1, 1)
GUIStartGroup("")
$close = GUICtrlCreateButton(Str("exit", "e&xit"), 300, 380, 90, 30)
	GUICtrlSetResizing(-1, 1)
GUIStartGroup("")
####
$hGUI2 = GUICreate("NB-Password generator", 440, 450, -1, -1, BitOR($WS_MAXIMIZEBOX, $WS_MINIMIZEBOX, $WS_SIZEBOX, $WS_SYSMENU), $RTL)
GUICtrlCreateLabel(Str("Welcome1", "welcome to the NB-Password generator.") & @crlf & Str("Welcome2", "this tool can help you to create a Very strong passwords and it easy to use") & @crlf & Str("Welcome3", "this tool was created by nacer baaziz"), 25, 10, 350, 50)
GUICtrlCreateLabel(Str("Pass", "&password"), 10, 80, 380, 20)
	GUICtrlSetResizing(-1, 1)
$outPut = GUICtrlCreateInput("", 10, 100, 380, 30, bitOr($ES_ReadOnly,$WS_TABSTOP))
	GUICtrlSetResizing(-1, 1)
GUIStartGroup("")
$regenerate = GUICtrlCreateButton(Str("regenerate", "&regenerate password"), 120, 150, 100, 30)
	GUICtrlSetResizing(-1, 1)
GUIStartGroup("")
$copy = GUICtrlCreateButton(Str("copy", "&copy password"), 10, 150, 100, 30)
	GUICtrlSetResizing(-1, 1)
GUIStartGroup("")
$save = GUICtrlCreateButton(Str("SaveToF", "save to &file"), 330, 150, 100, 30)
	GUICtrlSetResizing(-1, 1)
GUIStartGroup("")
$back = GUICtrlCreateButton(Str("main", "&main"), 10, 250, 90, 30)
	GUICtrlSetResizing(-1, 1)
GUIStartGroup("")
$exit = GUICtrlCreateButton(Str("exit", "e&xit"), 300, 250, 90, 30)
	GUICtrlSetResizing(-1, 1)

GUISetState(@sw_show, $hGUI)
WinActivate($hGUI)
local $GetMSG, $pass
local $passV1, $passV2, $passV3, $PassV4
while 1
$getMSG = GUIGetMSG()
Switch $GetMSG
case $GUI_event_close, $close, $exit, $MExit
exit
case $capital, $small, $nums, $symbols
if not (_IsChecked($capital)) and not (_IsChecked($small)) and not (_IsChecked($nums)) and not (_IsChecked($symbols)) then
GUICtrlSetState($GetMSG, $GUI_checked)
endIf
case $mChangeLNG
GUISetState(@sw_Disable, $hGUI)
if (SelectLNG($hGUI) = 1) then _ScriptRestart()
GUISetState(@sw_enable, $hGUI)
WinActivate($hGUI)
case $mAbout
msgBox(64, "about NB-Password_generator", "This is a small tool that enables you to create powerful and random passwords, which are easy to use" & @crlf & "This tool was created by nacer baaziz" & @crlf & "to contact me my e-mail is : nacerStile@gmail.com", "", $hGUI)
case $MWebsite
ShellExecute("https://mx-blind.com/")
case $next
if _IsChecked($capital) then
$passV1 = true
else
$passV1 = false
endIf
if _IsChecked($small) then
$passV2 = true
else
$passV2 = false
endIf
if _IsChecked($nums) then
$passV3 = true
else
$passV3 = false
endIf
if _IsChecked($symbols) then
$passV4 = true
else
$passV4 = false
endIf
for $i = 1 to GUICtrlRead($input)
$pass &= rndm($passV1, $passV2, $PassV3, $PassV4)
next
GUICtrlSetData($OutPut, $pass)
GUISetState(@sw_hide, $hGUI)
GUISetState(@sw_show, $hGUI2)
WinActivate($hGUI2, "")
$pass = ""
GUICtrlSetState($OutPut, $GUI_focus)
case $back
GUISetState(@sw_hide, $hGUI2)
GUISetState(@sw_show, $hGUI)
WinActivate($hGUI, "")

case $regenerate
if _IsChecked($capital) then
$passV1 = true
else
$passV1 = false
endIf
if _IsChecked($small) then
$passV2 = true
else
$passV2 = false
endIf
if _IsChecked($nums) then
$passV3 = true
else
$passV3 = false
endIf
if _IsChecked($symbols) then
$passV4 = true
else
$passV4 = false
endIf
for $i = 1 to GUICtrlRead($input)
$pass &= rndm($passV1, $passV2, $PassV3, $PassV4)
next
GUICtrlSetData($OutPut, $pass)
$pass = ""
GUICtrlSetState($OutPut, $GUI_focus)
case $copy
ClipPut(GUICtrlRead($outPut))
if @error then
msgBox(16, "copy", "the password couldn't copy to the ClipBord.", "", $hGUI2)
else
msgBox(64, "copy", "the password was copyed to the ClipBord and ready to past.", "", $hGUI2)
endIf
case $save

local $selectFile = FileSaveDialog("select the path wen you want to save the password", "", "text file (*.txt)", $FD_PROMPTOVERWRITE, "NBPassword", $hGUI2)
if not (@error) then
fileWrite($selectFile, GUICtrlRead($outPut))
if @error then
msgBox(16, "save to file", "error: we couldn't write the password into this file, please try again with an other file.", "", $hGUI2)
endIf
endIf
EndSwitch
Wend
endFunc

func capitalLetters()
dim $CPL = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
return $CPL[Random(0, UBound($CPL)-1, 1)]
endFunc
func SmallLetters()
dim $CPL = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","zz"]
return $CPL[Random(0, UBound($CPL)-1, 1)]
endFunc
func Nums()
return Random(0, 9, 1)
endFunc
func Symbols()
dim $CPL = ["+","-","_",";",".",":","/","%","$","*","£","µ","€","¥","\","|","'",'"',"(",")","&",">","<"]
return $CPL[Random(0, UBound($CPL)-1, 1)]
endFunc
func rndm($b_capital = true, $b_small = true, $b_nums = true, $b_symbols = false)
dim $rndm[1]
$rndm[0] = 0
if $b_capital = true then
ReDim $rndm[UBound($rndm)+1]
$rndm[0] = UBound($rndm)-1
$rndm[$rndm[0]] = capitalLetters()
endIf
if $b_small = true then
ReDim $rndm[UBound($rndm)+1]
$rndm[0] = UBound($rndm)-1
$rndm[$rndm[0]] = smallLetters()
endIf
if $b_nums = true then
ReDim $rndm[UBound($rndm)+1]
$rndm[0] = UBound($rndm)-1
$rndm[$rndm[0]] = nums()
endIf

if $b_symbols = true then
ReDim $rndm[UBound($rndm)+1]
$rndm[0] = UBound($rndm)-1
$rndm[$rndm[0]] = Symbols()
endIf

return $rndm[random(1, $Rndm[0], 1)]
endFunc
Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked
Func SelectLNG($HWindow)
local $h_LNGW = GUICreate("change Language", 300, 200, -1, -1, $WS_CLIPCHILDREN, $RTL, $hWindow)
GUICtrlCreateLabel("languages", 100, 10, 200, 20)
local $LNGCombo = GUICtrlCreateCombo("", 100, 30, 200, 30, $CBS_DROPDOWNLIST)
$LNGS = GetLNG()
if not @error then
for $i = 1 to $LNGS[0][0]
GUICtrlSetData(-1, $LNGS[$i][0], $LNGS[0][1])
next
endIf
local $LNGOk = GUICtrlCreateButton("&OK", 10, 100, 130, 50, 0x01)
local $LNGCancel = GUICtrlCreateButton("&Cancel", 150, 100, 130, 50)
GUISetState(@sw_Show, $h_LNGW)
local $LNGMsg = "", $LNGReturn = 0
While 1
$LNGMsg = GUIGetMSG()
Switch $LNGMsg
Case $GUI_Event_close, $LNGCancel
$LNGReturn = 0
exitLoop
case $LNGOk
if $LNGDefaultName = GUICtrlRead($LNGCombo) then
$LNGReturn = 0
exitLoop
else
INIWrite($LNGFile, "default", "defaultLNG", GUICtrlRead($LNGCombo))
if (@error) and not (isAdmin()) then
MSGBox(16, "error", "please run the program as admin to do this action", "", $h_LNGW)
elseIf (@error) and isAdmin() then
MSGBox(16, "error", "we got an error when we try to edit the LNG file, please try again later" & @crlf & "we got this error number: " & @error, "", $h_LNGW)
elseIf not (@error) then
$LNGReturn = 1
endIf
endIf
exitLoop
EndSwitch
Wend
GUIDelete($h_LNGW)
return $LNGReturn
endFunc
func GetLNG($s_LNG_File = $LNGFile)
local $LNGRead = INIReadSectionNames($s_LNG_File)
if @error then return SetError(1,0, 0)
dim $A_LNGS[1][3]
local $LNGName, $LNGRTL, $LNGSection
for $i = 0 to $LNGRead[0]
if not ($LNGRead[$i] = "default") then
$LNGName = INIRead($s_LNG_File, $LNGRead[$i], "lngName", "")
$LNGRTL = INIRead($s_LNG_File, $LNGRead[$i], "lngRtl", 0)
$LNGSection = $LNGRead[$i]
if not ($LNGName = "") then
ReDim $A_LNGS[UBound($A_LNGS)+1][3]
$A_LNGS[UBound($A_LNGS)-1][0] = $LNGName
$A_LNGS[UBound($A_LNGS)-1][1] = $LNGRTL
$A_LNGS[UBound($A_LNGS)-1][2] = $LNGSection
EndIf
endIf
next
if UBound($A_LNGS) <= 1 then Return SetError(2, 0, 0)
$A_LNGS[0][0] = UBound($A_LNGS)-1
$A_LNGS[0][1] = INIRead($s_LNG_File, "default", "defaultLNG", "english")
$A_LNGS[0][2] = INIRead($s_LNG_File, $A_LNGS[0][1], "LNGRTL", 0)
return $A_LNGS
endFunc
func STR($S_Text, $S_Return = "")
return INIRead($LNGFile, $LNGDefaultName, $s_Text, $s_Return)
endFunc