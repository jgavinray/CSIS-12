TITLE SetColor and WriteColorChar

INCLUDE Irvine32.inc

SetColor PROTO forecolor:BYTE, backcolor:BYTE
WriteColorChar PROTO char:BYTE,forecolor:BYTE, backcolor:BYTE

.data
.code
main PROC
INVOKE WriteColorChar, 'A', white, blue 
INVOKE WriteColorChar, 'B', blue, white 
INVOKE WriteColorChar, 'C', green, black 
INVOKE WriteColorChar, 'D', yellow, gray 
INVOKE SetColor, lightGray, black

call Crlf
exit 
main ENDP


WriteColorChar PROC

         pop ebp       
        pop ecx        
        pop ebx        
        pop eax        

        push eax       
        push ebx       
        push ecx       ;

        call SetColor  
        call WriteChar 

        ret

WriteColorChar ENDP


SetColor PROC 
        push ebp       
        mov ebp, esp   

        mov ecx, [ebp + 16] 
        mov eax, [ebp + 12] 

        mov ebx, 16   
        mul ebx                                                                        
        add ecx, eax                                                        

        mov eax, ecx  
        call SetTextColor

        mov eax, [ ebp + 8 ]
		pop ebp             

        ret

SetColor ENDP 
END main