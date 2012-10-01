.code
Factorial PROC
	push ebp
	mov  ebp,esp
	mov  eax,[ebp+8]		; get n
	cmp  eax,0		; n < 0?
	ja   L1		; yes: continue
	mov  eax,1		; no: return 1
	jmp  L2

L1:	dec  eax
	push eax		; Factorial(n-1)
	call Factorial

; Instructions from this point on execute when each
; recursive call returns.

ReturnFact:
	mov  ebx,[ebp+8]   		; get n
	mul  ebx          		; eax = eax * ebx

L2:	pop  ebp		; return EAX
	ret  4		; clean up stack
Factorial ENDP
