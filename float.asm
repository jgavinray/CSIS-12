TITLE 32-bit Floating Point

INCLUDE Irvine32.inc

INCLUDE macros.inc

.data
first	REAL8 123.456
second	REAL8 10.0
third	REAL8 ?

.code
main PROC
	finit

	fld first
	fld second
	call ShowFPUStack

	mWrite "Please enter a real number: "
	call ReadFloat

	mWrite "Please enter a real number: "
	call ReadFloat

	fmul ST(0),ST(1)

	mWrite "Their product is: "
	call WriteFloat
	call Crlf

	exit
main ENDP
END main