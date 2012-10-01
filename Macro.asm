INCLUDE Irvine32.inc

.data
str1 BYTE"Please enter something: ",0
.code
main PROC
mWriteString str1

mWriteString MACRO buffer:REQ

	push 	edx
	mov	edx,OFFSET buffer
	call	WriteString
	pop	edx
ENDM
main ENDP
END main