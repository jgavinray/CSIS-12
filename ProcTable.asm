
INCLUDE Irvine32.inc
.data
CaseTable  BYTE   'A'			
           DWORD   Process_A		
           BYTE   'B'
           DWORD   Process_B
           BYTE   'C'
           DWORD   Process_C
           BYTE   'D'
           DWORD   Process_D
	   BYTE	  'F'
	   DWORD   Process_F
NumberOfEntries = 5

prompt BYTE "Press select your grade (A,B,C, etc.) to check your overall %:", 0
msgA BYTE "You scored between 90 and 100%!",0
msgB BYTE "You scored between 80 and 89%",0
msgC BYTE "You scored between 70 and 79%",0
msgD BYTE "You scored between 60 and 69%",0
msgF BYTE "You scored between 0 and 59%, better luck next time.",0

.code
main PROC
	mov  edx,OFFSET prompt		
	call WriteString
	call ReadChar				
	mov  ebx,OFFSET CaseTable	
	mov  ecx,NumberOfEntries
	call Crlf 	
L1:
	cmp  al,[ebx]				
	jne  L2					
	call NEAR PTR [ebx + 1]		
	call WriteString			
	call Crlf
	jmp  L3					
L2:
	add  ebx,5				
	loop L1					

L3:
	exit
main ENDP

Process_A PROC
	mov  edx,OFFSET msgA
	ret
Process_A ENDP

Process_B PROC
	mov  edx,OFFSET msgB
	ret
Process_B ENDP

Process_C PROC
	mov  edx,OFFSET msgC
	ret
Process_C ENDP

Process_D PROC
	mov  edx,OFFSET msgD
	ret
Process_D ENDP

Process_F PROC
	mov  edx,OFFSET msgF
	ret
Process_F ENDP

END main