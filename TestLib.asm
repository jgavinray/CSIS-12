TITLE Testing Librarys - J. Gavin Ray (6/14/12)


INCLUDE Irvine32.inc
CR = 0Dh		; carriage return
LF = 0Ah		; line feed

.data
rand1   BYTE "Generating 20 random integers between "
        BYTE "0 and 990:",CR,LF,0
rand2   BYTE "Generating 20 random integers between "
        BYTE "0 and FFFFFFFFh:",CR,LF,0
prompt1 BYTE "Press a key: ",0
prompt2 BYTE "Enter a 32-bit signed integer: ",0
prompt3 BYTE "Enter your name: ",0
msg1    BYTE "The following key was pressed: ",0
regs    BYTE "Displaying the registers:",CR,LF,0
hello   BYTE "Hello, ",0

buffer  BYTE 50 dup(0)
dwordVal DWORD ?

.code
main PROC
; Set text color to black text on white background:
	mov  eax,blue
	call SetTextColor
	call Clrscr		; clear the screen
	call Randomize		; reset random number sequence

; Generate 20 random integers between 0 and 999.
; Put a delay between each.
	mov  edx,OFFSET rand1		; display message
	call WriteString
	mov  ecx,20		; loop counter
	mov  dh,2		; screen row 2
	mov  dl,0		; screen column 2

L1:	call Gotoxy
	mov  eax,1000		; indicate top of range + 1
	call RandomRange		; EAX = random integer
	call WriteDec		; display in unsigned decimal
	mov  eax,500
	call Delay		; pause for 500 milliseconds
	inc  dh		; next screen row
	add  dl,2		; move 2 columns to the right
	Loop L1

	call Crlf		; new line
	call WaitMsg		; "Press [Enter]..."
	call Clrscr		; clear screen

; Input a signed decimal integer and redisplay it in
; various formats:
	mov  edx,OFFSET prompt2		; "Enter a 32-bit..."
	call WriteString
	call ReadInt		; input the integer
	mov  dwordVal,eax		; save in a variable
	call Crlf		; new line
	call WriteInt		; display in signed decimal
	call Crlf
	call WriteHex		; display in hexadecimal
	call Crlf
	call WriteBin		; display in binary
	call Crlf

; Display the registers:
	call Crlf
	mov  edx,OFFSET regs		; "Displaying the registers:"
	call WriteString
	call DumpRegs		; display registers and flags
	call Crlf

; Display memory:
	mov  esi,OFFSET dwordVal		; starting OFFSET
	mov  ecx,LENGTHOF dwordVal		; number of units in dwordVal
	mov  ebx,TYPE dwordVal		; size of a doubleword
	call DumpMem		; display memory
	call Crlf		; new line
	call WaitMsg		; "Press [Enter].."

; Ask the user to input their name:
	call Clrscr		; clear screen
	mov  edx,OFFSET prompt3		; "Enter your name: "
	call WriteString
	mov  edx,OFFSET buffer		; point to the buffer
	mov  ecx,SIZEOF buffer - 1		; max. number characters
	call ReadString		; input the name
	mov  edx,OFFSET hello		; "Hello, "
	call WriteString
	mov  edx,OFFSET buffer		; display the name
	call WriteString
	call Crlf

	exit
main ENDP
END main