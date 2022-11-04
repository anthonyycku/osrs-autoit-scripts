HotKeySet("{Esc}", _Exit )

Global $teakColor = 0xa2c261
Global $specialColor = 0x00df00

Global $rightTreeX[2] = [1236, 1329]
Global $rightTreeY[2] = [840, 945]
Global $rightTreeCutX[2] = [1049, 1141]
Global $rightTreeCutY[2] = [637, 734]

Global $leftTreeX[2] = [264, 362]
Global $leftTreeY[2] = [122, 225]
Global $leftTreeCutX[2] = [505, 592]
Global $leftTreeCutY[2] = [358, 428]

Global $specialX[2] = [1432, 1438]
Global $specialY[2] = [207, 218]

Global $cuttingTree = "left"
Global $cutting = False

While 1
   checkSpecial()
   cutTree()
WEnd

Func cutTree()
   if $cuttingTree == "left" And $cutting == False Then
	  $leftTreeFound = PixelSearch($leftTreeX[0], $leftTreeY[0], $leftTreeX[1], $leftTreeY[1], $teakColor, 3)
	  if isArray($leftTreeFound) Then
		 $x = Random($leftTreeFound[0]-10, $leftTreeFound[0]+10, 1)
		 $y = Random($leftTreeFound[1]-10, $leftTreeFound[1]+10, 1)
		 MouseClick("left", $x, $y, 1, Random(3,10,1))
		 $cutting = True
		 Sleep(3000)

		 While 1
			$cuttingLeftTree = PixelSearch($leftTreeCutX[0], $leftTreeCutY[0], $leftTreeCutX[1], $leftTreeCutY[1], $teakColor, 3)
			if @error Then
			   $cuttingTree = "right"
			   $cutting = False
			   Sleep(Random(100,300,1))
			   ExitLoop
			EndIf
			   $slotHasItem = PixelSearch(1569, 965, 1577, 972, 0x3e3529, 3)
			   if @error Then
				  _bagdrop1()
				  Sleep(Random(500,1000,1))
				  $x = Random($leftTreeCutX[0], $leftTreeCutX[1], 1)
				  $y = Random($leftTreeCutY[0], $leftTreeCutY[1], 1)
				  MouseClick("left", $x, $y, 1, Random(3,10,1))
			   EndIf
		 WEnd
	  EndIf

   ElseIf $cuttingTree == "right" And $cutting == False Then
	  $rightTreeFound = PixelSearch($rightTreeX[0], $rightTreeY[0], $rightTreeX[1], $rightTreeY[1], $teakColor, 3)
	  if isArray($rightTreeFound) Then
		 $x = Random($rightTreeFound[0]-10, $rightTreeFound[0]+10, 1)
		 $y = Random($rightTreeFound[1]-10, $rightTreeFound[1]+10, 1)
		 MouseClick("left", $x, $y, 1, Random(3,10,1))
		 $cutting = True
		 Sleep(3000)

		 While 1
			$cuttingRightTree = PixelSearch($rightTreeCutX[0], $rightTreeCutY[0], $rightTreeCutX[1], $rightTreeCutY[1], $teakColor, 3)
			if @error Then
			   $cuttingTree = "left"
			   $cutting = False
			   Sleep(Random(100,300,1))
			   ExitLoop
			EndIf
			   $slotHasItem = PixelSearch(1569, 965, 1577, 972, 0x3e3529, 3)
			   if @error Then
				  _bagdrop1()
				  Sleep(Random(500,1000,1))
				  $x = Random($rightTreeCutX[0], $rightTreeCutX[1], 1)
				  $y = Random($rightTreeCutY[0], $rightTreeCutY[1], 1)
				  MouseClick("left", $x, $y, 1, Random(3,10,1))
			   EndIf
		 WEnd
	  EndIf

   EndIf

EndFunc

Func _bagdrop1()
   Sleep(Random(100,300,1))
   $cutting = False
   For $i = 0 To 6
	  $diffX = 50
	  $diffY = 44
	  For $j = 0 To 3
		 if Mod($i, 2) == 1 Then
			;right to left
			$startX = 1571
			$startY = 710
			   $dropX = Random($startX - $diffX*$j - 15, $startX - $diffX*$j + 15)
			   $dropY = Random($startY + $diffY*$i - 6, $startY + $diffY*$i + 6)

			   MouseClick("left", $dropX, $dropY, 1, Random(3,10,1))
		 Else
			;left to right
			$startX = 1419
			$startY = 710
			   $dropX = Random($startX + $diffX*$j - 15, $startX + $diffX*$j + 15)
			   $dropY = Random($startY + $diffY*$i - 6, $startY + $diffY*$i + 6)

			   MouseClick("left", $dropX, $dropY, 1, Random(3,10,1))
		 EndIf
		 Sleep(Random(50, 200,1))
	  Next
   Next

EndFunc

Func checkSpecial()
   $specialFound = PixelSearch($specialX[0], $specialY[0], $specialX[1], $specialY[1], $specialColor, 10)

   if Not @error Then
	  $x = Random($specialX[0], $specialX[1]+30, 1)
	  $y = Random($specialY[0]-5, $specialY[1]+5, 1)
	  MouseClick("left", $x, $y, 1, Random(3,8,1))
   EndIf

EndFunc

Func _Exit()
   Exit(0)
EndFunc