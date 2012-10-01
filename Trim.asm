TITLE Trim - J. Gavin Ray (6/20/12)

INCLUDE Irvine32.inc

Str_trim PROTO,
	pString:PTR BYTE,		
	char:BYTE		
Str_length PROTO,
	pString:PTR BYTE		
ShowString PROTO,
	pString:PTR BYTE

.data
; Test data:
string_1 BYTE "Printing lots of strings#",0		
string_2 BYTE "#",0		
string_3 BYTE "Hello World###",0		
string_4 BYTE "Hello World",0		
string_5 BYTE "H#",0		
string_6 BYTE "#H",0		


.code
main PROC
	call Clrscr

	INVOKE Str_trim,ADDR string_1,'#'
	INVOKE ShowString,ADDR string_1

	INVOKE Str_trim,ADDR string_2,'#'
	INVOKE ShowString,ADDR string_2

	INVOKE Str_trim,ADDR string_3,'#'
	INVOKE ShowString,ADDR string_3

	INVOKE Str_trim,ADDR string_4,'#'
	INVOKE ShowString,ADDR string_4

	INVOKE Str_trim,ADDR string_5,'#'
	INVOKE ShowString,ADDR string_5

	INVOKE Str_trim,ADDR string_6,'#'
	INVOKE ShowString,ADDR string_6

	exit
main ENDP

ShowString PROC USES edx, pString:PTR BYTE
.data
lbracket BYTE "(",0
rbracket BYTE ")",0
.code
	mov  edx,OFFSET lbracket
	call WriteString
	mov  edx,pString
	call WriteString
	mov  edx,OFFSET rbracket
	call WriteString
	call Crlf
	ret
ShowString ENDP

END main