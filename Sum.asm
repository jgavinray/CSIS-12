TITLE Row Sum Calculation               (RowSum.asm)

INCLUDE Irvine32.inc

.data
tableB  BYTE  10h,  20h,  30h,  40h,  50h
        BYTE  60h,  70h,  80h,  90h,  0A0h
        BYTE  0B0h, 0C0h, 0D0h, 0E0h, 0F0h
RowSize = 5
msg1	BYTE "Enter row number: ",0
msg2 BYTE "The sum is: ",0

.code
main PROC

	mov	edx,OFFSET msg1		
	call	WriteString
	call	Readint				

	mov	ebx,OFFSET tableB
	mov	ecx,RowSize
	call	calc_row_sum			   
	mov	edx,OFFSET msg2		
	call	WriteString
	call	WriteHex				
	call	Crlf

	exit
main ENDP


calc_row_sum PROC uses ebx ecx edx esi

	mul	ecx			
	add	ebx,eax		
	mov	eax,0		
	mov	esi,0		

L1:	movzx edx,BYTE PTR[ebx + esi]		
	add	eax,edx					
	inc	esi						
	loop	L1

	ret
calc_row_sum ENDP

END main