TITLE Compare - J. Gavin Ray (6/20/12)

INCLUDE Irvine32.inc

Str_compare PROTO,
	string1:PTR BYTE,
	string2:PTR BYTE

.data
string_1 BYTE "ABCDEFG",0
string_2 BYTE "ABCDEFG",0
string_3 BYTE 0
string_4 BYTE 0

.code
main PROC

	INVOKE Str_compare,
	ADDR string_1,
	ADDR string_3
	Call DumpRegs

	INVOKE Str_compare,
	ADDR string_1,
	ADDR string_4
	Call DumpRegs

	INVOKE Str_compare,
	ADDR string_2,
	ADDR string_3
	Call DumpRegs

	INVOKE Str_compare,
	ADDR string_3,
	ADDR string_4
	Call DumpRegs

	exit
main ENDP

END main