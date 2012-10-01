TITLE Chapter 5 review # 7 - J. Gavin Ray (6-14-2012)
INCLUDE Irvine32.inc

cha = '*'
howmany = 100

.code
main PROC
	call Clrscr
	mov  ecx,howmany	; how many characters

L1:	mov  eax,25	; random row
	call RandomRange
	mov  dh,al
	mov  eax,80	; random col
	call RandomRange
	mov  dl,al
	call Gotoxy	; locate cursor
	mov  al,cha	; display cha
	call WriteChar
	mov  edx,100
	call Delay	
	loop L1	

	mov dx,0	; move cursor to 0,0
	call Gotoxy

	exit
main ENDP
END main
