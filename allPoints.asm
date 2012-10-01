TITLE Loop through Array - J. Gavin Ray (6/21/12)


INCLUDE Irvine32.inc
.data
NumPoints = 3
AllPoints COORD NumPoints DUP(<0,0>)

.code
main PROC
	mov edi,0	
	mov ecx,NumPoints
	mov ax,1
L1:
	mov (COORD PTR AllPoints[edi]).X,ax
	mov (COORD PTR AllPoints[edi]).Y,ax
	add edi,TYPE COORD
	inc ax
	call DumpRegs
	Loop L1

	exit
main ENDP
END main