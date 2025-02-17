#include <ScreenCapture.au3>
#include <GDIPlus.au3>
#include "..\UWPOCR.au3"


_Example()

Func _Example()

	_GDIPlus_Startup()
	;hImage/hBitmap GDI
	Local $hTimer = TimerInit()
	Local $hHBitmap = _ScreenCapture_Capture("", 0, 0, @DesktopWidth / 2, @DesktopHeight / 2, False)
	Local $hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)

	;Get OCR Text From hImage/hBitmap
;~ 	_UWPOCR_Log(__UWPOCR_Log) ;Enable Log
	Local $sOCRTextResult = _UWPOCR_GetText($hBitmap)
	MsgBox(0, "Time Elapsed: " & TimerDiff($hTimer), $sOCRTextResult)
	_WinAPI_DeleteObject($hHBitmap)
	_GDIPlus_BitmapDispose($hBitmap)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Example
