TITLE Reversing a String - J. Gavin Ray (6/14/12)

INCLUDE Irvine32.inc

.data
aName BYTE "J. Gavin Ray",0
nameSize = ($ - aName) - 1

.code
main PROC

; Push the name on the stack.
	mov ecx,nameSize
	mov esi,0

L1:	movzx eax,aName[esi]	; get character
	push eax	; push on stack
	inc esi
	Loop L1

; Pop the name from the stack, in reverse,
; and store in the aName array.
	mov ecx,nameSize
	mov esi,0

L2:	pop eax	; get character
	mov aName[esi],al	; store in string
	inc esi
	Loop L2

; Display the name.
	mov edx,OFFSET aName
	call Writestring
	call Crlf

	exit
main ENDP
END main