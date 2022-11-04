HotKeySet("{Esc}", _Exit )

Global $bankerX[2] = [984, 1032]
Global $bankerY[2] = [477, 532]

Global $depositX[2] = [879, 903]
Global $depositY[2] = [800, 819]

Global $potX[2] = [515, 529]
Global $potY[2] = [220, 231]

Global $matX[2] = [572, 587]
Global $matY[2] = [212, 231]

Global $closeX[2] = [935, 947]
Global $closeY[2] = [38, 52]

Global $potionX[2] = [1408, 1431]
Global $potionY[2] = [699, 720]
Global $limpX[2] = [1509, 1530]
Global $limpY[2] = [831, 849]

Global $limpColor = 0xbbb8b1

While 1
   findBanker()
   deposit()
   getMats()
   closeBank()
   mix()
WEnd

Func findBanker()
   $x = Random($bankerX[0], $bankerX[1], 1)
   $y = Random($bankerY[0], $bankerY[1], 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))
   Sleep(Random(800,900,1))
EndFunc

Func deposit()
   $x = Random($depositX[0], $depositX[1], 1)
   $y = Random($depositY[0], $depositY[1], 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))
   Sleep(Random(200,400,1))
EndFunc

Func getMats()
   $x = Random($potX[0], $potX[1], 1)
   $y = Random($potY[0], $potY[1], 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))
   Sleep(Random(200,400,1))

   $x = Random($matX[0], $matX[1], 1)
   $y = Random($matY[0], $matY[1], 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))
   Sleep(Random(200,400,1))

EndFunc

Func closeBank()
   $x = Random($closeX[0], $closeX[1], 1)
   $y = Random($closeY[0], $closeY[1], 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))

   Sleep(Random(500,800,1))
EndFunc

Func mix()
   $x = Random($potionX[0], $potionX[1], 1)
   $y = Random($potionY[0], $potionY[1], 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))

   $x = Random($limpX[0], $limpX[1], 1)
   $y = Random($limpY[0], $limpY[1], 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))

   Sleep(Random(1000,1200,1))
   Send("{SPACE}")

   While 1
	  $foundLimp = PixelSearch(1566, 962, 1580, 979, $limpColor, 5)

	  if @error Then
		 ExitLoop
	  EndIf
   WEnd

EndFunc

Func _Exit()
   Exit(0)
EndFunc