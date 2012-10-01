INCLUDE Irvine32.inc
CR = 0Dh		; carriage return
LF = 0Ah		; line feed

.data
colorArray DWORD 1,2,3,4,5,6
prompt BYTE "Enter your name: ",0
hello   BYTE "Hello, ",0
buffer  BYTE 50 dup(0)
.code
main PROC

	mov  edx,OFFSET prompt		; "Enter your name: "
	call WriteString
	mov  edx,OFFSET buffer		; point to the buffer
	mov  ecx,SIZEOF buffer - 1		; max. number characters
	call ReadString		; input the name

	mov  edi,0
L1:
	mov  eax,colorArray[edi]
	call SetTextColor
	mov  edx,OFFSET hello		; "Hello, "
	call WriteString
	mov  edx,OFFSET buffer		; display the name
	call WriteString
	inc edi
	loop L1
	
	call DumpRegs

	exit
main ENDP
END main