TITLE Show Time - J. Gavin Ray (6/21/12)

INCLUDE Irvine32.inc


.data
sysTime SYSTEMTIME <>
XYPos   COORD <10,5>
consoleHandle DWORD ?
colonStr BYTE ":",0
TheTimeIs BYTE "The time is ",0

.code
main PROC
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov consoleHandle,eax

	INVOKE SetConsoleCursorPosition, consoleHandle, XYPos
	INVOKE GetLocalTime,ADDR sysTime

	mov   edx,OFFSET TheTimeIs		; "The time is "
	call  WriteString

; Display the system time (hh:mm:ss).
	movzx eax,sysTime.wHour		; hours
	call  WriteDec
	mov   edx,offset colonStr		; ":"
	call  WriteString
	movzx eax,sysTime.wMinute		; minutes
	call  WriteDec
	mov   edx,offset colonStr		; ":"
	call  WriteString
	movzx eax,sysTime.wSecond		; seconds
	call  WriteDec

	call Crlf
	call Crlf
	exit
main ENDP
END main