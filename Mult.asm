TITLE Multiply an Array - J. Gavin Ray (6/20/12)

INCLUDE Irvine32.inc

.data
array DWORD 1,2,3,4,5,6,7,8,9,10
multiplier DWORD 10		

.code
main PROC
	cld 		
	mov esi,OFFSET array  		
	mov edi,esi		
	mov ecx,LENGTHOF array		

L1:	lodsd                   		
	mul multiplier	
	stosd                   	
	call DumpRegs
	loop L1

	exit
main ENDP
END main