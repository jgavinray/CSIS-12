TITLE Array Fill Chapter 8 - J. Gavin Ray (6/20/12)

INCLUDE Irvine32.inc

.data
count = 100
array WORD count DUP(?)

.code
main proc

	push OFFSET array
	push COUNT
	call ArrayFill

	mov esi,OFFSET array
	mov ecx,count
	mov ebx,2
	call DumpMem
	call DumpRegs

	exit
main endp

ArrayFill PROC
	push ebp
	mov ebp,esp
	pushad

	mov esi,[ebp+12]	
	mov ecx,[ebp+8]		
	cmp ecx,0		
	jle L2			
L1:
	mov eax,10000h		
	call RandomRange	
	mov [esi],eax
	add esi,TYPE WORD
	loop L1

L2: popad
	pop ebp
	ret 8			; stack, need to research this a little more
ArrayFill ENDP

END main