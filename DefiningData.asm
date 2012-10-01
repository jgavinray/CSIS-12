TITLE        (DefiningData.asm)

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
one    SWORD  10h,20h,30h,40h,50h,60h
two    BYTE  "ABCDEFG"
three  SBYTE  10h,20h,30h,40h,50h,60h
four   QWORD  20000h,30000h,40000h
five   SDWORD "900h"

.code
main PROC

	mDump one, Y	; #1 16-bit signed integer, S for signed.
	mDump two, Y	; #2 8-bit unsigned integer, B for byte
	mDump three, Y	; #3 8-bit signed Integer, S stands for Signed
	mDump four, Y	; #4 64-bit integer.  Q stands for Quad
	mDump five,Y	; #5 An SDWORD is a signed integer, SD stands for signed double

	exit
main ENDP
END main