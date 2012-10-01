TITLE Extended Add - J. Gavin Ray (6/26/2012)
INCLUDE Irvine32.inc

.data
op1 QWORD 0A2B2A40674981234h
op2 QWORD 08010870000234502h
op3 DWORD 57
op4 DWORD 58
sum DWORD 3 dup(?) 	; = 0000000122C32B0674BB5736

.code
main PROC

	mov  esi,OFFSET op1		; first operand
	mov  edi,OFFSET op2		; second operand
	mov  ebx,OFFSET sum		; sum operand
	mov  ecx,2           		; number of doublewords
	call Extended_Add
	mov  esi,OFFSET sum		; dump memory
	mov  ebx,4
	mov  ecx,3
	call DumpMem
	mov  esi,OFFSET op3		; first operand
	mov  edi,OFFSET op4		; second operand
	mov  ebx,OFFSET sum		; sum operand
;	mov  ecx,2           		; number of doublewords
	call Extended_Add
	mov  esi,OFFSET sum		; dump memory
	mov  ebx,4
	mov  ecx,3
	call DumpMem


	exit
main ENDP

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