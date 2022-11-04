#include <MsgBoxConstants.au3>

HotKeySet("{Esc}", _Exit )

$oreColor = 0x2f1a12
; 0x77512f - copper
; 0x402419 - iron
$emptyBagColor = 0x3e3529

Global $mineX
Global $mineY
Global $currentColor
Global $mouseDropChance = 30

Global $rock1X_tl = 637
Global $rock1Y_tl = 413
Global $rock1X_br = 797
Global $rock1Y_br = 597

Global $rock2X_tl = 827
Global $rock2Y_tl = 222
Global $rock2X_br = 1003
Global $rock2Y_br = 389

Global $rock3X_tl = 1031
Global $rock3Y_tl = 411
Global $rock3X_br = 1204
Global $rock3Y_br = 593

While 1
   start()
WEnd

Func start()
   $roll = Random(1,10,1)
   if $roll <= 8 Then
	  _dropItems()
	  Sleep(Random(200,400,1))
	  _findRock($rock2X_tl, $rock2Y_tl, $rock2X_br, $rock2Y_br)
   EndIf

   _dropItems()
   _findRock($rock1X_tl, $rock1Y_tl, $rock1X_br, $rock1Y_br)
   _dropItems()
   _findRock($rock2X_tl, $rock2Y_tl, $rock2X_br, $rock2Y_br)
   _dropItems()
   _findRock($rock3X_tl, $rock3Y_tl, $rock3X_br, $rock3Y_br)
EndFunc

Func _dropItems()
   $lastBag = PixelSearch(1817, 970, 1817, 970, $emptyBagColor)

   if @error Then
	  $bagRoll = Random(1,100,1)
	  if $bagRoll > 25 Then
		 _bagdrop1()
	  Else
		 _bagdrop2()
	  EndIf
	  Sleep(Random(100,600,1))
   EndIf

EndFunc

Func _findRock($x1, $y1, $x2, $y2)
   $foundRock = PixelSearch($x1, $y1, $x2, $y2, $oreColor, 5)

   if isArray($foundRock) Then
	  While 1
		 $clickRockX = Random($foundRock[0], $foundRock[0] + 150, 1)
		 $clickRockY = Random($foundRock[1], $foundRock[1] + 150, 1)
		 $availableRock = PixelSearch($clickRockX, $clickRockY, $clickRockX, $clickRockY, $oreColor, 10)
		 if isArray($availableRock) Then
			$mineX = $clickRockX
			$mineY = $clickRockY
			;MsgBox($MB_SYSTEMMODAL, "Title", "X: " & $mineX & " Y: " & $mineY)
			ExitLoop
		 EndIf

	  WEnd
	  $currentColor = PixelGetColor($mineX, $mineY)
	  _mineRock()
   EndIf
EndFunc

Func _mineRock()
   MouseMove($mineX, $mineY, Random(5,10,1))
   Sleep(Random(10,100,1))
   MouseClick("left")

   $errorCounter = 0
   While 1
   $clickedColor = PixelSearch($mineX - 5, $mineY - 5, $mineX + 5, $mineY + 5, $currentColor, 12)
   if @error Then
	  ExitLoop
   EndIf
   $errorCounter += 1
   Sleep(Random(50,150,1))
   if ($errorCounter == 30) Then
	  ExitLoop
   EndIf

   WEnd
   Sleep(Random(50,200,1))
   ;MsgBox($MB_SYSTEMMODAL, "Title", $clickedColor & " " & $currentColor)

EndFunc

Func _bagdrop1()
   For $i = 0 To 6
	  $diffX = 50
	  $diffY = 44
	  For $j = 0 To 3
		 if Mod($i, 2) == 1 Then
			;right to left
			$startX = 1814
			$startY = 710
			$unidentifiedColor = PixelSearch($startX-$diffX*$j, $startY+$diffY*$i, $startX-$diffX*$j, $startY+$diffY*$i, 0x231b03, 3)
			if Not isArray($unidentifiedColor) Then
			   $dropX = Random($startX - $diffX*$j - 15, $startX - $diffX*$j + 15)
			   $dropY = Random($startY + $diffY*$i - 6, $startY + $diffY*$i + 6)

			   $mouseRoll = Random(1,100,1)
			   if $mouseRoll < 90 Then
				  MouseClick("left", $dropX, $dropY, 1, Random(3,10,1))
				  $mouseRoll = Random(1,100,1)
				  Sleep(Random(10,50,1))
				  if $mouseRoll < 20 Then
						MouseClick("left")
				  EndIf
			   EndIf
			EndIf
		 Else
			;left to right
			$startX = 1664
			$startY = 710
			$unidentifiedColor = PixelSearch($startX+$diffX*$j-10, $startY+$diffY*$i-10, $startX+10+$diffX*$j, $startY+$diffY*$i+10, 0x231b03, 3)
			if Not isArray($unidentifiedColor) Then
			   $dropX = Random($startX + $diffX*$j - 15, $startX + $diffX*$j + 15)
			   $dropY = Random($startY + $diffY*$i - 6, $startY + $diffY*$i + 6)

			   $mouseRoll = Random(1,100,1)
			   if $mouseRoll < 90 Then
				  MouseClick("left", $dropX, $dropY, 1, Random(3,10,1))
				  $mouseRoll = Random(1,100,1)
				  Sleep(Random(10,50,1))
				  if $mouseRoll < 20 Then
					 MouseClick("left")
				  EndIf
			   EndIf
			EndIf
		 EndIf
		 Sleep(Random(10,50,1))
	  Next
   Next

   	  $rollCleanup = Random(1,100,1)
	  if $rollCleanup < 75 Then
		 _bagCleanup()
	  EndIf
EndFunc

Func _bagdrop2()
   For $i = 0 To 6
		 $startX = 1664
		 $startY = 710
		 $diffX = 50
		 $diffY = 44
		 For $j = 0 To 3
			$unidentifiedColor = PixelSearch($startX+$diffX*$j-10, $startY+$diffY*$i-10, $startX+10+$diffX*$j, $startY+$diffY*$i+10, 0x231b03, 3)
			if @error Then
			   $dropX = Random($startX + $diffX*$j - 15, $startX + $diffX*$j + 15)
			   $dropY = Random($startY + $diffY*$i - 6, $startY + $diffY*$i + 6)

			   $mouseRoll = Random(1,100,1)
			   if $mouseRoll < 90 Then
			   MouseClick("left", $dropX, $dropY, 1, Random(3,10,1))
				  $mouseRoll = Random(1,100,1)
				  Sleep(Random(10,50,1))
				  if $mouseRoll < 20 Then
					 MouseClick("left")
				  EndIf
			   EndIf
			EndIf
		 Next
	  Next
	  $rollCleanup = Random(1,100,1)
	  if $rollCleanup < 60 Then
		 _bagCleanup()
	  EndIf
   EndFunc

Func _bagCleanup()
   Sleep(Random(200,600,1))
   while 1
	  $foundOres = PixelSearch(1637, 686, 1849, 991, 0x281610, 3)
	  if Not @error Then
		 $dropX = Random($foundOres[0] - 10, $foundOres[0] + 10, 1)
		 $dropY = Random($foundOres[1], $foundOres[1] + 25, 1)

		 MouseClick("left", $dropX, $dropY, Random(3,7,1))
		 Sleep(Random(25,100,1))
	  Else
		 ExitLoop
	  EndIf
   WEnd
EndFunc

Func _Exit()
   Exit(0)
EndFunc


