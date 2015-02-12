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
	send {End}+{Home}   ;select full line
	send ^c             ;copy
	send {End}          ;goto end
	send {Enter}        ;new line
	send ^v             ;paste
	Clipboard := ClipSaved ;Restore the original clipboard.
	return
	
	;remove line
	^y::
	;if anything selected now, delete it to let only 1 line to delete after
	if isAnythingSelected(){
		send {Del}
	}
	send {End}+{Up}+{End}   ;select full line with newline of predecessor
	send {Del}              ;remove line
	send {Down}{Home}{Home} ;move to first position
	return
}


isAnythingSelected(){
	ClipSaved := ClipboardAll 	;save clipborad
	Clipboard:= ;				;clear it
	send ^c
	sleep, 1					;copy to clipboard to slow?			
	result:= (StrLen(Clipboard) > 0) ;true if something copied
	Clipboard := ClipSaved 		;Restore the original clipboard.

	return result
}