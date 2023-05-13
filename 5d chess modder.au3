#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Blue.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------






#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
#include <Zip.au3>
#include <File.au3>
#include <Array.au3>
#include <GuiListBox.au3>
#include <WindowsConstants.au3>

$folderknown = 0
$error = IniRead("modder.sav","steamfolder","5dchess","notfound")
if $error <> "notfound" Then
	if DirGetSize($error) > 0 Then
		$folderknown = 1
		$folder = $error
	EndIf
EndIf
If $folderknown = 0 Then
	$i = 0
	$uninstallKey = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
	$folder = ""
	$folderknown = 0
	While 1
		$i += 1
		$subkey = RegEnumKey($uninstallKey, $i)
		If @error <> 0 Then ExitLoop
		Switch $subkey
			Case StringInStr($subkey,"Steam App") <> 0
				$temp = RegRead($uninstallKey & "\" & $subkey, "InstallLocation")
				$temp2 = StringSplit($temp,"\")
				For $j = 1 to $temp2[0]-1
					$folder &= $temp2[$j] & "\"
				Next
				$folder &= "5dchesswithmultiversetimetravel"
				If DirGetSize($folder) > 0 Then
					$folderknown = 1
					ExitLoop
				EndIf
			Case "steam"
					$temp = RegRead($uninstallkey & "\" & "Steam","UninstallString")
					$temp2 = StringSplit($temp,"\")
					For $j = 1 to $temp2[0]-1
						$folder &= $temp2[$j] & "\"
					Next
					$folder &= "steamapps\common\5dchesswithmultiversetimetravel"
					If DirGetSize($folder) > 0 Then
						$folderknown = 1
						ExitLoop
					EndIf
		EndSwitch
	WEnd
EndIf
If $folderknown = 0 Then
	$i = 0
	$uninstallKey = "HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
	$folder = ""
	$folderknown = 0
	While 1
		$i += 1
		$subkey = RegEnumKey($uninstallKey, $i)
		If @error <> 0 Then ExitLoop
		Switch $subkey
			Case StringInStr($subkey,"Steam App") <> 0
				$temp = RegRead($uninstallKey & "\" & $subkey, "InstallLocation")
				$temp2 = StringSplit($temp,"\")
				For $j = 1 to $temp2[0]-1
					$folder &= $temp2[$j] & "\"
				Next
				$folder &= "5dchesswithmultiversetimetravel"
				If DirGetSize($folder) > 0 Then
					$folderknown = 1
					ExitLoop
				EndIf
			Case "steam"
					$temp = RegRead($uninstallkey & "\" & "Steam","UninstallString")
					$temp2 = StringSplit($temp,"\")
					For $j = 1 to $temp2[0]-1
						$folder &= $temp2[$j] & "\"
					Next
					$folder &= "steamapps\common\5dchesswithmultiversetimetravel"
					If DirGetSize($folder) > 0 Then
						$folderknown = 1
						ExitLoop
					EndIf
		EndSwitch
	WEnd
EndIf
If $folderknown = 0 Then
	MsgBox(32,"5dchessfolder not found","I couldnt find the installation path of your 5d chess game pls select it in the next window")
	_changedir()
EndIf
if $folderknown = 0 Then
	MsgBox(16,"Folder still Unknown","We were unable to find the correct folder." & @lf & "Programm will terminate" & @LF &"EVERYTH*COUGH**COUGH")
	Exit
EndIf

#cs  file names
ambience = ambience
animation_activate = animation activate
bell = joining online game
cym_whooosh = ???
fanfare = winning game
guiro_long = undo move / reset guide and puzzle
guiro_short = ??? (potentially something to do with long laggy games)
lightswitch = click sound
music = menu music
paper_shuffle = copy code and discord link
timpani_hit_a2 = exiting to menu
timpani_hit_c3 = first part of joining offline game
timpani_hit_e3 = submit move in offline game / opponents
timpani_hit_e3_delayed = ???
timpani_hit_f3 = traveling piece lands / joins the animation
timpani_hit_g2 = ???
timpani_roll_f3 = travel sound
vibraslap_long = losing a game, time ran out in singleplayer
vibraslap_short = opponent disconnected, draw, losing a puzzle
violin_tremolo_as3 = travel animation sound between parallel universes
violin_tremolo_cs3 = ???
wind = travel animation sound between time (gets combined with as3 when using both to travel)
wind_half_second = ???
#ce

$sound = "assets\sounds\"
dim $files[2][25]
$files[0][0] = "24"
$files[0][1] = "assets\pieces\pieces.png"
$files[0][2] = $sound & "ambience.ogg"
$files[0][3] = $sound & "animation_activate.ogg"
$files[0][4] = $sound & "bell.ogg"
$files[0][5] = $sound & "cym_whoosh.ogg"
$files[0][6] = $sound & "fanfare.ogg"
$files[0][7] = $sound & "guiro_long.ogg"
$files[0][8] = $sound & "guiro_short.ogg"
$files[0][9] = $sound & "lightswitch.ogg"
$files[0][10] = $sound & "music.ogg"
$files[0][11] = $sound & "paper_shuffle.ogg"
$files[0][12] = $sound & "timpani_hit_a2.ogg"
$files[0][13] = $sound & "timpani_hit_c3.ogg"
$files[0][14] = $sound & "timpani_hit_e3.ogg"
$files[0][15] = $sound & "timpani_hit_e3_delayed.ogg"
$files[0][16] = $sound & "timpani_hit_f3.ogg"
$files[0][17] = $sound & "timpani_hit_g2.ogg"
$files[0][18] = $sound & "timpani_roll_f3.ogg"
$files[0][19] = $sound & "vibraslap_long.ogg"
$files[0][20] = $sound & "vibraslap_short.ogg"
$files[0][21] = $sound & "violin_tremolo_as3.ogg"
$files[0][22] = $sound & "violin_tremolo_cs3.ogg"
$files[0][23] = $sound & "wind.ogg"
$files[0][24] = $sound & "wind_half_second.ogg"
$files[1][1] = "Pieces"
$files[1][2] = "Ambience"
$files[1][3] = "Animation activate"
$files[1][4] = "joining online game"
$files[1][5] = "???"
$files[1][6] = "winning a game"
$files[1][7] = "undo move / reset guide and puzzle"
$files[1][8] = "???"
$files[1][9] = "click sound"
$files[1][10] = "menu music"
$files[1][11] = "copy code and discord link"
$files[1][12] = "exiting to menu"
$files[1][13] = "joining offline game"
$files[1][14] = "opponent submits / all submits in offline game"
$files[1][15] = "???"
$files[1][16] = "traveling piece lands / piece joins travel animation"
$files[1][17] = "???"
$files[1][18] = "normal travel sound"
$files[1][19] = "losing a game / time ran out in singleplayer"
$files[1][20] = "opponent disconnected, draw, losing a puzzle"
$files[1][21] = "travel animation sound between parallel universes"
$files[1][22] = "???"
$files[1][23] = "travel animation sound between time"
$files[1][24] = "???"

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("5d chess mod", 364, 307, 770, 254)
$targetfile = GUICtrlCreateList("", 8, 8, 249, 286,$WS_BORDER+$WS_VSCROLL+$LBS_EXTENDEDSEL)
For $i = 1 to $files[0][0]
	if $files[1][$i] <> "???" Then
		GUICtrlSetData($targetfile,$files[1][$i])
	EndIf
Next
$replace = GUICtrlCreateButton("Replace", 264, 8, 83, 25)
$zipsave = GUICtrlCreateButton("Save to zip", 264, 48, 83, 25)
$zipload = GUICtrlCreateButton("Load from zip", 264, 88, 83, 25)
$foldersave = GUICtrlCreateButton("Save to folder",264, 128, 83, 25)
$folderload = GUICtrlCreateButton("Load from folder",264, 168, 83, 25)
$toggleall = GUICtrlCreateButton("toggle Select all", 264, 208, 83, 25)
$changefolder = GUICtrlCreateButton("Change folder", 264, 248, 83, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
$beginn = 1
While 1
	$nMsg = GUIGetMsg(1)

	Switch $nMsg[0]
		Case $GUI_EVENT_CLOSE
			Exit

		Case $targetfile
		Case $toggleall
			$selected = _GUICtrlListBox_GetSelItems($targetfile)
			if $selected[0] Then
				For $i = 1 to $selected[0]
					_GUICtrlListBox_SetSel($targetfile,$selected[$i],0)
				Next
			Else
				_GUICtrlListBox_SetSel($targetfile)
			EndIf
		Case $replace
			GUISetState(@SW_DISABLE)
			_changefile()
			GUISetState(@SW_ENABLE)
			GUISetState(@SW_RESTORE)
		Case $zipsave
			GUISetState(@SW_DISABLE)
			if _GUICtrlListBox_GetSelCount($targetfile) > 0 Then
				$tempfilesave = FileSaveDialog("Select the save spot and name",@WorkingDir,"files (*.zip)")
				if @error Then
					MsgBox(16,"file selection failed","File selection failed returning to programm")
				Else
					$currentzipfile = _Zip_Create($tempfilesave)
					$r_targetfile = _GUICtrlListBox_GetSelItemsText($targetfile)
					ProgressOn("Creating Zip","might take a while with ambient.ogg and music.ogg")
					For $i = 1 to $r_targetfile[0]
						ProgressSet($i / $r_targetfile[0] * 100,"current file: " & $r_targetfile[$i])
						$found = 0
						$j = 1
						While $found = 0
							if $r_targetfile[$i] = $files[1][$j] Then
								$found = $j
							EndIf
							$j += 1
						WEnd
						_Zip_Addfile($currentzipfile,$folder & "\" & $files[0][$found])
					Next
					ProgressOff()
				EndIf
			Else
				MsgBox(32,"nothing selected","you gotta select the files you wanna save")
			EndIf
			GUISetState(@SW_ENABLE)
			GUISetState(@SW_RESTORE)
		Case $zipload
			GUISetState(@SW_DISABLE)
			$tempfolder = @TempDir & "\5d chess package temporaer transportation services"
			$temploadsave = FileOpenDialog("select the package you wanna apply",@WorkingDir,"files (*.zip)",3)
			if @error = 1 Then
				MsgBox(16,"file selection failed","File selection failed returning to programm")
			Else
				DirCreate($tempfolder)
				_Zip_UnzipAll($temploadsave,$tempfolder)
				$files2 = _FileListToArray($tempfolder)
				if @error = 4 Then
					MsgBox(16,"Zip package empty","pls select a different zip package that actual has stuff")
				Else

					If FileExists($tempfolder & "\pieces.png") Then
						FileMove($tempfolder & "\pieces.png",$folder & "\" & $files[0][1],1)
					EndIf
					For $i = 1 to $files2[0]
						FileMove($tempfolder & "\" & $files2[$i],$folder & "\" & $sound,1)
					Next
					DirRemove($tempfolder,1)
				EndIf

			EndIf

			GUISetState(@SW_ENABLE)
			GUISetState(@SW_RESTORE)
		Case $foldersave
			GUISetState(@SW_DISABLE)
			if _GUICtrlListBox_GetSelCount($targetfile) > 0 Then
				$tempfilesave = FileSelectFolder("Select a folder to save all selected items",@WorkingDir,1)
				if @error Then
					MsgBox(16,"Folder Selection Failed","Folder selection failed returning to programm")
				Else
					$currentzipfile = _Zip_Create($tempfilesave)
					$r_targetfile = _GUICtrlListBox_GetSelItemsText($targetfile)
					ProgressOn("Creating Folder","Please wait until all files are copied")
					For $i = 1 to $r_targetfile[0]
						ProgressSet($i / $r_targetfile[0] * 100,"current file: " & $r_targetfile[$i])
						$found = 0
						$j = 1
						While $found = 0
							if $r_targetfile[$i] = $files[1][$j] Then
								$found = $j
							EndIf
							$j += 1
						WEnd
						FileCopy($folder & "\" & $files[0][$found],$currentzipfile,1)
					Next
					ProgressOff()
				EndIf
			Else
				MsgBox(32,"nothing selected","you gotta select the files you wanna save")
			EndIf
			GUISetState(@SW_ENABLE)
			GUISetState(@SW_RESTORE)
		Case $folderload
			GUISetState(@SW_DISABLE)
			$temploadsave = FileSelectFolder("select the folder you wanna copy from",@WorkingDir)
			if @error = 1 Then
				MsgBox(16,"folder selection failed","File selection failed returning to programm")
			EndIf
			$files2 = _FileListToArray($temploadsave)
			if @error = 4 Then
				MsgBox(16,"folder empty","Folder selection failed returning to programm")
			Else
				ProgressOn("Loading Folder","Please wait until all files are copied")
				If FileExists($temploadsave & "\pieces.png") Then
					ProgressSet(0,$files[1][1])
					FileCopy($temploadsave & "\pieces.png",$folder & "\" & $files[0][1],1)
				EndIf
				For $i = 1 to $files2[0]
					ProgressSet($i / $files2[0] * 100,$files2[$i])
					FileCopy($temploadsave & "\" & $files2[$i],$folder & "\" & $sound,1)
				Next
				ProgressOff()
			EndIf
			GUISetState(@SW_ENABLE)
			GUISetState(@SW_RESTORE)
		Case $changefolder
			_changedir()
	EndSwitch
WEnd


Func _changedir()
	$folder = FileSelectFolder("Select the 5dchess folder","")
	if FileGetSize($folder & "\5dchesswithmultiversetimetravel.exe") > 0 Then
		$folderknown = 1
		IniWrite("modder.sav","steamfolder","5dchess",$folder)
	Else
		MsgBox(16,"Wrong Folder","5dchesswithmultiversetimetravel.exe not found within folder please try again")
	EndIf
EndFunc


Func _changefile()
	$r_targetfile = _GUICtrlListBox_GetSelItemsText($targetfile)
	For $i = 1 to $r_targetfile[0]
		$found = 0
		$j = 1
		While $found = 0
			if $r_targetfile[$i] = $files[1][$j] Then
				$found = $j
			EndIf
			$j += 1
		WEnd
		If $found = 1 then
			$tempfile = FileOpenDialog("select the replacement of: Pieces","","images (*.png)",3)
			FileCopy($tempfile,$folder & "\" & $files[0][$found],1)
		Else
			$tempfile = FileOpenDialog("select the replacement of: " & $r_targetfile[$i],"","music (*.ogg)",3)
			If @error Then
				MsgBox(16,"file selection failed","going to the next file")
			Else
				FileCopy($tempfile,$folder & "\" & $files[0][$found],1)
			EndIf
		EndIf
	Next
EndFunc
Func _IntegerInRange($value, $target, $range)
    Return Abs($value - $target) <= $range
EndFunc