;cooking guild

HotKeySet("{Esc}", _Exit )

HotKeySet("{Tab}", Cook )
HotKeySet("{`}", Bank )

Global $foodClickX[2] = [1561, 1581]
Global $foodClickY[2] = [958, 982]
Global $ovenX[2] = [1038, 1110]
Global $ovenY[2] = [501, 610]


While 1
   Sleep(100)
WEnd

Func Cook()

   $times = 28
   While $times > 0
	  $x = Random($foodClickX[0], $foodClickX[1], 1)
	  $y = Random($foodClickY[0], $foodClickY[1], 1)
	  MouseClick("left", $x, $y, 1, Random(2,4,1))
	  Sleep(Random(220, 270,1))

	  $x = Random($ovenX[0], $ovenX[1], 1)
	  $y = Random($ovenY[0], $ovenY[1], 1)
	  MouseClick("left", $x, $y, 1, Random(2,4,1))
	  Sleep(Random(390,410,1))

	  $times -= 1
	  ToolTip($times, 1401, 594)
   WEnd

EndFunc

Func Bank()
   $x = Random(880, 901, 1)
   $y = Random(800, 820, 1)
   MouseClick("left", $x, $y, 1, Random(3,5,1))
   Sleep(Random(150, 300,1))

   $x = Random(860, 878, 1)
   $y = Random(167, 188, 1)
   MouseClick("left", $x, $y, 1, Random(3,5,1))
   Sleep(Random(150, 300,1))

   $x = Random(935, 948, 1)
   $y = Random(39, 50, 1)
   MouseClick("left", $x, $y, 1, Random(3,5,1))
EndFunc

Func _Exit()
   Exit(0)
EndFunc