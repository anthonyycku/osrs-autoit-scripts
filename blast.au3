;look north
;birds eye view 10 scrolls

HotKeySet("{Esc}", _Exit )

HotKeySet("{Tab}", Bank )
HotKeySet("{`}", Smelt)
HotKeySet("{F1}", Collect)

Global $bagColor = 0x32c935
Global $barColor = 0xb19015

While 1
   Sleep(100)
WEnd

Func Bank()
   $x = Random(1178, 1193, 1)
   $y = Random(47, 71, 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))

   While 1
	  $depositFound = PixelSearch(871, 808, 887, 823, $bagColor, 10)

	  if Not @error Then
		 Send("{LSHIFT down}")
		 Sleep(Random(150,200,1))
		 $x = Random(1457, 1479, 1)
		 $y = Random(698, 718, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))

		 Sleep(Random(150,350,1))
		 $x = Random(859, 878, 1)
		 $y = Random(127, 145, 1)
		 MouseClick("left", $x, $y, 1, Random(3,6,1))

		 Sleep(Random(150,200,1))
		 Send("{LSHIFT up}")
		 ExitLoop
	  EndIf
   WEnd
EndFunc

Func Smelt()
   $x = Random(242, 292, 1)
   $y = Random(784, 823, 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))
EndFunc

Func Collect()
   $x = Random(1408, 1431, 1)
   $y = Random(698, 720, 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))
   Sleep(Random(400,600,1))

   $x = Random(814, 839, 1)
   $y = Random(472, 495, 1)
   MouseClick("left", $x, $y, 1, Random(3,6,1))

   While 1
	  $foundBar = PixelSearch(41, 863, 581, 1000, $barColor, 20, 1)

	  if Not @error Then
		 Sleep(Random(100,200,1))
		 Send("{SPACE}")
		 ExitLoop
	  EndIf
   WEnd

EndFunc

Func _Exit()
   Exit(0)
EndFunc