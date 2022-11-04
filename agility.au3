;look north
;bird eye view 20 scrolls
HotKeySet("{Esc}", _Exit )

Global $oneColor = 0x3300cc
Global $agilityColor = 0xbd2726
Global $fourColor = 0xd72f2c
Global $endColor = 0xedc308
Global $xpColor = 0x000001

Global $timer = 0

Global $oneX[2] = [642, 1250]
Global $oneY[2] = [26, 472]
Global $twoX[2] = [309, 338]
Global $twoY[2] = [403, 452]
Global $threeX[2] = [632, 706]
Global $threeY[2] = [755, 819]
Global $fourX[2] = [800, 896]
Global $fourY[2] = [800, 820]
Global $fiveX[2] = [383, 457]
Global $fiveY[2] = [690, 720]
Global $sixX[2] = [822, 849]
Global $sixY[2] = [748, 775]

Global $reset = False
Global $timeLimit = 15000

While 1
   one()
   if $reset == False Then
	  two()
   EndIf
   if $reset == False Then
	  three()
   EndIf
   if $reset == False Then
	  four()
   EndIf
   if $reset == False Then
	  five()
   EndIf
   if $reset == False Then
	  six()
   EndIf
   if $reset == False Then
	  end()
   EndIf
WEnd

Func one()
   $reset = False
   $timer = 0
   $timer = TimerInit()

   While 1
	  $foundOne = PixelSearch($oneX[0], $oneY[0], $oneX[1], $oneY[1], $oneColor)

	  if Not @error Then
		 ToolTip("one found", 1390, 604)
		 Sleep(Random(100,250,1))
		 $x = Random($foundOne[0]+15, $foundOne[0]+35, 1)
		 $y = Random($foundOne[1]+5, $foundOne[1]+10, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))
		 Sleep(4000)
		 ExitLoop
	  Else
		 ToolTip("one not found", 1390, 604)
		 if TimerDiff($timer) > $timeLimit Then
			reset()
			ExitLoop
		 EndIf
	  EndIf

   WEnd
EndFunc

Func two()
   $timer = 0
   $timer = TimerInit()

   While 1
	  $foundTwo = PixelSearch($twoX[0], $twoY[0], $twoX[1], $twoY[1], $agilityColor, 40)

	  if Not @error Then
		 ToolTip("two found", 1390, 604)
		 Sleep(Random(150,250,1))
		 $x = Random(343, 406, 1)
		 $y = Random(390, 463, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))
		 ExitLoop
	  Else
		 ToolTip("two not found", 1390, 604)
		 if TimerDiff($timer) > $timeLimit Then
			reset()
			ExitLoop
		 EndIf
	  EndIf
   WEnd
EndFunc

Func three()
   $timer = 0
   $timer = TimerInit()

      While 1
	  $foundTwo = PixelSearch($threeX[0], $threeY[0], $threeX[1], $threeY[1], $agilityColor, 20)

	  if Not @error Then
		 ToolTip("three found", 1390, 604)
		 Sleep(Random(180,300,1))
		 $x = Random(654, 685, 1)
		 $y = Random(769, 800, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))
		 sleep(4000)
		 ExitLoop
	  Else
		 ToolTip("three not found", 1390, 604)
		 $fallen = PixelSearch(204, 124, 295, 204, 0xffff00, 5)
		 if TimerDiff($timer) > $timeLimit Or isArray($fallen) Then
			sleep(Random(100,200,1))
			reset()
			ExitLoop
		 EndIf
	  EndIf
   WEnd
EndFunc

Func four()
   $timer = 0
   $timer = TimerInit()

      While 1
	  $foundTwo = PixelSearch($fourX[0], $fourY[0], $fourX[1], $fourY[1], $fourColor, 10)

	  if Not @error Then
		 ToolTip("four found", 1390, 604)
		 Sleep(Random(100,150,1))
		 $x = Random(795, 862, 1)
		 $y = Random(820, 850, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))
		 ExitLoop
	  Else
		 ToolTip("four not found", 1390, 604)
		 $fallen = PixelSearch(33, 497, 123, 582, 0xffff00, 5)
		 if TimerDiff($timer) > $timeLimit Or isArray($fallen) Then
			reset()
			ExitLoop
		 EndIf
	  EndIf
   WEnd
EndFunc

Func five()
   $timer = 0
   $timer = TimerInit()

      While 1
	  $foundTwo = PixelSearch($fiveX[0], $fiveY[0], $fiveX[1], $fiveY[1], $fourColor, 10)

	  if Not @error Then
		 ToolTip("five found", 1390, 604)
		 Sleep(Random(10, 150, 1))
		 $x = Random(403, 470, 1)
		 $y = Random(700, 730, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))
		 Sleep(2000)
		 ExitLoop
	  Else
		 ToolTip("five not found", 1390, 604)
		 if TimerDiff($timer) > $timeLimit Then
			reset()
			ExitLoop
		 EndIf
	  EndIf
   WEnd
EndFunc

Func six()
   $timer = 0
   $timer = TimerInit()

      While 1
	  $foundTwo = PixelSearch($sixX[0], $sixY[0], $sixX[1], $sixY[1], $agilityColor, 10)

	  if Not @error Then
		 ToolTip("six found", 1390, 604)
		 Sleep(Random(180, 250,1))
		 $x = Random(849, 895, 1)
		 $y = Random(531, 597, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))
		 Sleep(2000)
		 ExitLoop
	  Else
		 ToolTip("six not found", 1390, 604)
		 if TimerDiff($timer) > $timeLimit Then
			reset()
			ExitLoop
		 EndIf
	  EndIf
   WEnd
EndFunc

Func end()
   $timer = 0
   $timer = TimerInit()

   While 1
	  ToolTip("Looking for end trigger", 1390, 604)
	  $isEnd = PixelSearch(703, 569, 736, 647, $endColor, 5)

	  if Not @error Then
		 Sleep(Random(100,200,1))
		 ToolTip("end found", 820, 535)
		 reset()
		 ExitLoop
	  Else
		 ToolTip("end not found", 1390, 604)
		 if TimerDiff($timer) > $timeLimit Then
			reset()
			ExitLoop
		 EndIf
	  EndIf

   WEnd

EndFunc

Func reset()
   ToolTip("reset",  1390, 604)
   $reset = True
   Sleep(Random(100,250,1))
   $x = Random(1553, 1565, 1)
   $y = Random(776, 787, 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))
   Sleep(Random(2000,2500,1))
EndFunc

Func _Exit()
   Exit(0)
EndFunc