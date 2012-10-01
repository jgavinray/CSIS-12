INCLUDE Irvine32.inc

.data
packed_1 WORD 4536h
packed_2 WORD 7207h
sum DWORD ?

.code
main PROC

mov	sum,0
mov	esi,0

mov	al,BYTE PTR packed_1[esi]
mov	al,BYTE PTR packed_2[esi]
daa
mov	BYTE PTR sum[esi],al

inc	esi
mov	al,BYTE PTR packed_1[esi]
adc	al,BYTE PTR packed_2[esi]
daa
mov	BYTE PTR sum[esi],al

inc esi
mov	al,0
adc	al,0
mov	BYTE PTR sum[esi],al

mov	eax,sum
call	WriteHex
call	Crlf
exit

main ENDP
END main