TITLE Data Transfer Examples - J. Gavin Ray page 103-103 (6-11-12)

INCLUDE Irvine32.inc

.data

val1 WORD 1000h
val2 WORD 2000h
arrayB BYTE 10h,20h,30h,40h,50h
arrayW WORD 100h,200h,300h
arrayD DWORD 10000h,20000h

.code
main PROC

;	Demonstrating movZX instructions"

	mov bx,0A69Bh
	movzx eax,bx
	movzx edx,bl
	movzx cx,bl

;	Demonstrating movsx instructions:

	mov bx,0A69Bh
	movsx eax,bx
	movsx edx,bl
	mov bl,7Bh
	movsx cx,bl

;	Memory to Memory exchange:

	mov ax,val1
	xchg ax,val1
	mov val1,ax

;	Direct-Offset Addressing (Byte Array):

	mov al,arrayB
	mov al,[arrayB+1]
	mov al,[arrayB+2]

;	Direct-Offset Addressing (WORD Array):

	mov ax,arrayW
	mov ax,[arrayW+2]

;	Direct-Offset Addressing (Double Word Array):

	mov eax,arrayD
	mov eax,[arrayD+4]
	mov eax,[arrayD+4]

; New by me
	
	mov ax,[arrayW+1]
	mov val1,ax
	mov bx,val1


	exit
main ENDP
END main