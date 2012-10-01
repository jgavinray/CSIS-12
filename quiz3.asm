TITLE Chapter three quiz - J. Gavin Ray (6-8-12)

INCLUDE Irvine32.inc

.data

val1 DWORD 1
val2 DWORD 3
val3 DWORD 10

.code
main PROC

	mov ecx,val1
	mov edx,val2
	add ecx,edx
	mov ebx,ecx
	sub ecx,edx
	mov ebx,ecx

	mov eax,val3
	call DumpRegs

	exit
main ENDP
END main