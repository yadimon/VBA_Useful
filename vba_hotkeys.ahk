#IfWinActive ahk_class wndclass_desked_gsk
{
	;navigate to
	^b::
	send +{F2}
	return

	;move back ctrl + alt + left
	^!Left::
	send +^{F2}
	return

	;quick info
	^q::
	send ^i
	return

	;parameter
	^p::
	send ^+i
	return

	;double line
	^d::
	ClipSaved := ClipboardAll ; save clipborad
	send {End}+{Home} 	;goto endsend {End}+{Home}
	send ^c 			;copy
	send {End} 			;goto end
	send {Enter} 		;new line
	send ^v 			;paste
	Clipboard := ClipSaved   ; Restore the original clipboard.
	return
	
	;remove line
	^y::
	send {up}{End}
	send {Shift Down}
	send {down}{End}
	send {Shift Up}
	send {Del}
	send {Down}{End}
	return
}