TITLE Add and Subtract              (AddSub2.asm)

INCLUDE Irvine32.inc

.data

value1  WORD	100h
value2  WORD    400h
value3  WORD    500h
finalVal WORD   ?

.code
main PROC


	mov ax, 9000h
	sub ax, value1		
	sub ax, value2		
	sub ax, value3		
	mov finalVal, ax
	call DumpRegs

	exit
main ENDP
END main