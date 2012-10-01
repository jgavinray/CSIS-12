INCLUDE Irvine32.inc
CR = 0Dh		; carriage return
LF = 0Ah		; line feed

.data
colorArray DWORD 1,2,3,4,5,6
name   BYTE "Gavin",0
.code
main PROC

	mov  edi,0
L1:
	mov  eax,colorArray[edi]
	call SetTextColor
	mov  edx,name		; "Gavin "
	call WriteString
	inc edi
	loop L1
	
	call DumpRegs

	exit
main ENDP
END main