TITLE Endless Recursion                        (Endless.asm)

INCLUDE Irvine32.inc

.data
endlessStr BYTE "This recursion never stops",0

.code
main PROC
	call Endless
	exit
main ENDP

.code
Endless PROC
	mov EDX,offset endlessStr
	call WriteString
	call Endless
	ret	; never reaches this
Endless ENDP
END main