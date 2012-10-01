TITLE Read from Console and show memory  addresses - J. Gavin Ray (6/21/12)

INCLUDE Irvine32.inc

BufSize = 80

.data
buffer BYTE BufSize DUP(?),0,0
stdInHandle DWORD ?
bytesRead   DWORD ?

.code
main PROC
	INVOKE GetStdHandle, STD_INPUT_HANDLE
	mov stdInHandle,eax

	INVOKE ReadConsole, stdInHandle, ADDR buffer,
	  BufSize - 2, ADDR bytesRead, 0

	mov  esi,OFFSET buffer
	mov  ecx,16	
	mov  ebx,TYPE buffer
	call DumpMem

	exit
main ENDP
END main