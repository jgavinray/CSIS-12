TITLE Recursion Chapter 8 - J. Gavin Ray (6/20/12)


INCLUDE Irvine32.inc

.data
menuStr BYTE "1. Choice one",0dh,0ah
	    BYTE "2. Choice two",0dh,0ah
	    BYTE "3. Exit",0dh,0ah,0dh,0ah
	    BYTE "Choice: ",0
OneStr  BYTE "Executing Choice One",0dh,0ah,0
TwoStr  BYTE "Executing Choice Two",0dh,0ah,0
leavingMsg BYTE "Leaving ShowMenu",0dh,0ah,0
gavin   BYTE "Hello, Gavin checking in!",0dh,0ah,0
dennie 	BYTE "Hi Dennie, hope this is interesting.",0dh,0ah,0

.code
main PROC
	call ShowMenu
	exit
main ENDP

ShowMenu PROC
	call DumpRegs		; register dump

	mov  edx,OFFSET menuStr		; display menu
	call WriteString
	call ReadInt
	call Dispatcher

	mov  edx,OFFSET leavingMsg		; "leaving ShowMenu"
	call WriteString
	ret
ShowMenu endp

Dispatcher proc
	cmp  eax,1	; choice 1?
	jne  L1
	call ChoiceOne
L1:
	cmp  eax,2	; choice 2?
	jne  L2
	call ChoiceTwo
L2:
	cmp  eax,3	; choice 3?
	je   L3
	call ShowMenu	; unknown choice

; start unwinding the stack
L3:	ret
Dispatcher endp

ChoiceOne PROC	; menu choice 1
	mov edx,OFFSET OneStr
	call WriteString
	mov edx,OFFSET gavin
	call WriteString
	call WaitMsg
	call ShowMenu	; recursive call
	ret
ChoiceOne endp

ChoiceTwo proc	; menu choice 2
	mov edx,OFFSET TwoStr
	call WriteString
	mov edx,OFFSET dennie
	call WriteString
	call WaitMsg
	call ShowMenu
	ret
ChoiceTwo endp


END main