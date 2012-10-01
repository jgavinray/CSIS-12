TITLE Carry Flag - J. Gavin Ray (6/14/12)


INCLUDE Irvine32.inc
.data

.code
main PROC
	
	mov al,1
	call DumpRegs
	sub al,2
	call DumpRegs
	exit
main ENDP
END main