TITLE Arithmetic Expression - J. Gavin Ray (6/14/12)


INCLUDE Irvine32.inc
.data
val1 SDWORD 8
val2 SDWORD -15
val3 SDWORD 20

.code
main PROC
	

	mov eax,val2
	add eax,7
	sub eax,val3
	add eax, val1
	call DumpRegs
	exit
main ENDP
END main