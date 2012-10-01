TITLE Data Types and Initialization - J. Gavin Ray (6-8-12)

INCLUDE Irvine32.inc

.data
byte1 	BYTE 	10
byte2 	SBYTE 	20
word1 	WORD 	30
word2	SWORD 	40
word3	DWORD	50
word4	SDWORD	60
word5	FWORD	70
word6	QWORD	80
byte3	TBYTE	90
real1	REAL4	1.00
real2	REAL8	1.10
real3	REAL10	1.20

.code


main PROC
	mov eax,word3
	mov ebx,word4
	call DumpRegs
	
	exit
main ENDP
END main
