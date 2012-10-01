TITLE Symbolic Contants and section review 3.5.5 (symbolicConstants.asm) - J. Gavin Ray (6-7-12)

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
backSpace = 08h				; #1 

SecondsInDay = (60 * 60) * 24		; #2

myArray WORD 20 DUP(?)			; #3
arraySize = ($ - myArray)		; #3

myArray1 WORD 30 DUP(?)			; #4
ArraySize1 = ($ - myArray1) / 2		; #4

.code
main PROC

	mov eax,backSpace			; #1
	mov ecx,SecondsInDay			; #2
	mov edi,arraySize			; #3
	mov esi,ArraySize1			; #4
	call DumpRegs	
	
	exit
main ENDP
END main		