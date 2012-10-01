TITLE Chapter 7 Exercises - J. Gavin Ray (6/20/12)


INCLUDE Irvine32.inc

.data
op1 QWORD 0A2B2A40674981234h
op2 QWORD 08010870000234502h
sum DWORD 3 dup(?) 	; = 0000000122C32B0674BB5736
binValue DWORD 1234ABCDh		; sample binary value
buffer BYTE 32 dup(0),0

.code
main PROC

	mov eax,binValue		; number to display
	mov ecx,32			; number of bits in EAX
	mov esi,offset buffer

L3:	shl eax,1			; shift high bit into Carry flag
	mov BYTE PTR [esi],'0'		; choose 0 as default digit
	jnc L4				; if no Carry, jump to L2
	mov BYTE PTR [esi],'1'		; else move 1 to buffer

L4:	inc esi				; next buffer position
	loop L3				; shift another bit to left

	mov edx,OFFSET buffer		; display the buffer
	call WriteString
	call Crlf
	call DumpRegs



	mov  esi,OFFSET op1		; first operand
	mov  edi,OFFSET op2		; second operand
	mov  ebx,OFFSET sum		; sum operand
	mov  ecx,2           		; number of doublewords
	call Extended_Add
	mov  esi,OFFSET sum		; dump memory
	mov  ebx,4
	mov  ecx,3
	call DumpMem
	
	exit
main ENDP

;--------------------------------------------------------
Extended_Add PROC
;
; Calculates the sum of two extended integers that are
;   stored as an array of doublewords.
; Receives: ESI and EDI point to the two integers,
; EBX points to a variable that will hold the sum, and
; ECX indicates the number of doublewords to be added.
;--------------------------------------------------------
	pushad
	clc                		; clear the Carry flag

L1:	mov eax,[esi]      		; get the first integer
	adc eax,[edi]      		; add the second integer
	pushfd              		; save the Carry flag
	mov [ebx],eax      		; store partial sum
	add esi,4         		; advance all 3 pointers
	add edi,4
	add ebx,4
	popfd               		; restore the Carry flag
	loop L1           		; repeat the loop

	adc word ptr [ebx],0		; add any leftover carry
	popad
	ret
Extended_Add ENDP
END main