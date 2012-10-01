TITLE Linked List

INCLUDE Irvine32.inc

ListNode STRUCT
  Data DWORD ?
  NextPointer  DWORD ?
ListNode ENDS

TotalNodeCount = 150
NULL = 0
Counter = 0

.data
LinkedList LABEL PTR ListNode
REPT TotalNodeCount
	Counter = Counter + 1
	ListNode <Counter, ($ + Counter * SIZEOF ListNode)>
ENDM
ListNode <0,0>	; tail node

.code
main PROC
	mov  esi,OFFSET LinkedList

NextNode:
	mov  eax,(ListNode PTR [esi]).NextPointer
	cmp  eax,NULL
	je   quit

	mov  eax,(ListNode PTR [esi]).Data
	call WriteDec
	call Crlf

	mov  esi,(ListNode PTR [esi]).NextPointer
	jmp  NextNode

quit:
	exit
main ENDP
END main