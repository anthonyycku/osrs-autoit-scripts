#include <MsgBoxConstants.au3>

HotKeySet("{Esc}", _Exit )

Global $prayerX[2] = [1427, 1441]
Global $prayerY[2] = [131, 148]


Global $hpX_topLeft = 1363
Global $hpY_topLeft = 833
Global $hpX_bottomRight = 1377
Global $hpY_bottomRight = 842

Global $bagX_topLeft = 1390
Global $bagY_topLeft = 686
Global $bagX_bottomRight = 1604
Global $bagY_bottomRight = 990

Global $bloodColor = 0x83240e
Global $overloadColor = 0xa59441
Global $prayerOn = 0xf6f21a

Global $startTime = TimerInit()
Global $timeout = Random(5000, 10000, 1)

While 1
   if TimerDiff($startTime) >= $timeout Then
	  resetHealth()
   EndIf

   drinkOverload()
WEnd

Func drinkOverload()
   $health = PixelSearch($hpX_topLeft, $hpY_topLeft, $hpX_bottomRight, $hpY_bottomRight, $bloodColor, 5)

   if isArray($health) Then
	  Sleep(Random(300,600,1))
	  $overload = PixelSearch($bagX_topLeft, $bagY_topLeft, $bagX_bottomRight, $bagY_bottomRight, $overloadColor, 3)
	  if Not @error Then
		 $x = Random($overload[0]-10,$overload[0]+10,1)
		 $y = Random($overload[1]-10,$overload[1]+10,1)
		 MouseClick("left", $x, $y + 16, 1, Random(5,10,1))
	  EndIf
   EndIf

EndFunc

Func resetHealth()
   $mouseSpeed = Random(3,10,1)
   $x = Random($prayerX[0], $prayerX[1], 1)
   $y = Random($prayerY[0], $prayerY[1], 1)
   MouseClick("left", $x, $y, 1, $mouseSpeed)
   Sleep(Random(300, 600, 1))
   MouseClick("left")

   Sleep(Random(2000, 3000, 1))
   $prayer = PixelSearch($prayerX[0], $prayerY[0], $prayerX[1], $prayerY[1], $prayerOn, 3)
   if isArray($prayer) Then
	  MouseClick("left")
   EndIf

   $timeout = Random(3000, 15000, 1)
   $startTime = TimerInit()

EndFunc

Func _Exit()
   Exit(0)
EndFunc
