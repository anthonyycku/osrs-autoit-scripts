HotKeySet("{Esc}", _Exit )

HotKeySet("{Tab}", RightClick)
HotKeySet("{1}", Knockout)
HotKeySet("{2}", Pickpocket)

Global $npcX[2] = [961, 988]
Global $npcY[2] = [549, 570]

Global $pickpocket[2] = [46, 54]
Global $knockout[2] = [82, 89]

Global $clickX = Random($npcX[0], $npcX[1], 1)
Global $clickY = Random($npcY[0], $npcY[1], 1)

While 1
   Sleep(100)
WEnd

Func RightClick()
   $clickX = Random($npcX[0], $npcX[1], 1)
   $clickY = Random($npcY[0], $npcY[1], 1)
   MouseClick("right", $clickX, $clickY, 1, Random(2,4,1))
EndFunc

Func Knockout()
   $x = Random($clickX - 20, $clickX + 20, 1)
   $y = Random($clickY + $knockout[0], $clickY + $knockout[1], 1)
   MouseClick("left", $x, $y, 1, Random(1,2,1))
EndFunc

Func Pickpocket()
   $x = Random($clickX - 20, $clickX + 20, 1)
   $y = Random($clickY + $pickpocket[0], $clickY + $pickpocket[1], 1)
   MouseClick("left", $x, $y, 1, Random(1,2,1))
EndFunc

Func _Exit()
   Exit(0)
EndFunc