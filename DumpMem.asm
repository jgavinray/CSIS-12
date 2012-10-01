INCLUDE Irvine32.inc
INCLUDE Macros.inc

 ShowFlag MACRO flagName,shiftCount


.data
saveIP  DWORD ?
saveESP DWORD ?
.code
main PROC
	pop saveIP	
	mov saveESP,esp	
	push saveIP	
	push eax	

	pushfd	

	pushfd	
	pop  eflags	

	mNewLine
	mShowRegister EAX,EAX
	mShowRegister EBX,EBX
	mShowRegister ECX,ECX
	mShowRegister EDX,EDX
	mNewLine
	mShowRegister ESI,ESI
	mShowRegister EDI,EDI

	mShowRegister EBP,EBP

	mov eax,saveESP
	mShowRegister ESP,EAX
	mNewLine

	mov eax,saveIP
	mShowRegister EIP,EAX
	mov eax,eflags
	mShowRegister EFL,EAX

	ShowFlag CF,1
	ShowFlag SF,8
	ShowFlag ZF,7
	ShowFlag OF,12

	mNewLine
	mNewLine

	popfd
	pop eax
	ret

	exit
main ENDP
END main
