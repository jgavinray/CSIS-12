TITLE ASCII Add - J. Gavin Ray (6/20/12)

INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5
.data 
startTime DWORD ?
decimal_one BYTE "100123456789765"
decimal_two BYTE "900702076502015"
sum BYTE (SIZEOF decimal_one + 1) DUP(0),0

.code
main PROC


mov	esi,SIZEOF decimal_one - 1
mov 	edi,SIZEOF decimal_one
mov	ecx,SIZEOF decimal_one
mov	bh,0

L1:	mov ah,0
mov	al,decimal_one[esi]
add 	ah,bl
aaa
mov	bh,al
or	bh,30h
add	al,decimal_two[esi]
aaa
or 	bh,al
or	bh,30h
or	al,30h
mov 	sum[edi],bh
dec	esi
dec	edi
loop	L1
mov	sum[edi],bh

mov 	edx,OFFSET sum
call 	WriteString
call	Crlf

; Added by me
call	GetMseconds
mov	startTime,eax
call 	WriteDec
call	Crlf


exit
main ENDP
END main