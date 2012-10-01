TITLE Drunkard's Walk              (Walk.asm)

; Drunkard's walk program. This is a simple version that
; starts at coordinate 50,50 and wanders around the immediate area.
;  Line 62: inc currY
;  Line 65: dec currY

INCLUDE Irvine32.inc

WalkMax = 30
StartX = 25
StartY = 25

DrunkardWalk STRUCT
	path COORD WalkMax DUP(<0,0>)
	pathsUsed WORD 0
DrunkardWalk ENDS

DisplayPosition PROTO currX:WORD, currY:WORD

.data
aWalk DrunkardWalk <>

.code
main PROC
	mov esi,offset aWalk
	call TakeDrunkenWalk
	exit
main ENDP

;-------------------------------------------------------
TakeDrunkenWalk PROC
LOCAL currX:WORD, currY:WORD
;
; Take a walk in random directions (north, south, east,
; west).
; Receives: ESI points to a DrunkardWalk structure
; Returns:  the structure is initialized with random values
;-------------------------------------------------------
	pushad

; Point EDI to the array of COORD objects.
	mov edi,esi
	add edi,OFFSET DrunkardWalk.path
	mov ecx,WalkMax	; loop counter
	mov currX,StartX	; current X-location
	mov currY,StartY	; current Y-location

Again:
	; Insert current location in array.
	mov ax,currX
	mov (COORD PTR [edi]).X,ax
	mov ax,currY
	mov (COORD PTR [edi]).Y,ax

	INVOKE DisplayPosition, currX, currY

	mov eax,4	; choose a direction (0-3)
	call RandomRange

	.IF eax == 0	; North
	  inc currY
	.ELSEIF eax == 1	; South
	  dec currY
	.ELSEIF eax == 2	; West
	  dec currX
	.ELSE	; East (EAX = 3)
	  inc currX
	.ENDIF

next:
	add edi,TYPE COORD	; point to next COORD
	loop Again

finish:
	mov ax,WalkMax	; count the steps taken
	sub ax,cx
	mov (DrunkardWalk PTR [esi]).pathsUsed, ax
	popad
	ret
TakeDrunkenWalk ENDP

;-------------------------------------------------------
DisplayPosition PROC currX:WORD, currY:WORD
;
; Display the current X and Y positions.
; Optional: used for debugging.
;-------------------------------------------------------
.data
commaStr BYTE ",",0
.code
	pushad
	movzx eax,currX	; current X position
	call WriteDec
	mov edx,OFFSET commaStr	; "," string
	call WriteString
	movzx eax,currY	; current Y position
	call WriteDec
	call Crlf
	popad
	ret
DisplayPosition ENDP
END main