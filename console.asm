
TITLE Pre-made message written to console - J. Gavin Ray (6/21/12)

INCLUDE Irvine32.inc

.data
endl EQU <0dh,0ah>		; end of line sequence
message  \
BYTE "-------------------- Console.asm ------------------------"
BYTE endl,endl
BYTE "This program is a simple demonstration of console ",endl
BYTE "mode output, using the GetStdHandle and WriteConsole ",endl
BYTE "functions.  This is a great book Dennie!  The memory",endl
BYTE "lessons contained with this book in addition to the stack",endl
BYTE "have given me vast insight, and alot of understanding. Top",endl
BYTE "notch!",endl
BYTE "---------------------------------------------------------"
BYTE endl,endl,endl
messageSize = ($-message)

consoleHandle DWORD 0     
bytesWritten  DWORD ?     

.code
main PROC

	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov consoleHandle,eax

  ; Write a string to the console:
	INVOKE WriteConsole,
	  consoleHandle,		
	  ADDR message,       		
	  messageSize,		
	  ADDR bytesWritten,		
	  0		
	INVOKE ExitProcess,0
main ENDP
END main