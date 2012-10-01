INCLUDE Irvine32.inc
.data
    array DWORD ?
    
.code
main PROC
    call Randomize
    mov array,EAX
    mov ECX, 50

    L1:
	call Random32
	call WriteInt
	call DumpRegs
    loop L1

    exit
main ENDP
END main