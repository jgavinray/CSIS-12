TITLE Copying Strings                    (CopyStr.asm)

; Testing the Str_copy procedure
; Last update: 9/8/01

INCLUDE Irvine32.inc

Str_copy PROTO,
 	source:PTR BYTE, 		; source string
 	target:PTR BYTE		; target string

Str_length PROTO,
	pString:PTR BYTE		; pointer to string

Str_trim PROTO,
	pString:PTR BYTE,
	char:BYTE
.data
string_1 BYTE "ABCDEFGHIJKLMNOPQRSTUVWXYZ",0
string_2 BYTE 100 DUP(?)

.code
main PROC
	; call Clrscr

	INVOKE Str_copy,	; copy string_1 to string_2
	  ADDR string_1,
	  ADDR string_2
	INVOKE Str_trim,
	  ADDR string_1, 'A'

	mov  edx,OFFSET string_2
	call WriteString
	call Crlf
	call DumpRegs
	exit
main ENDP

END main
