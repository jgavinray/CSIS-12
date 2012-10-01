TITLE Message Boxes - J. Gavin Ray (6/21/12)

INCLUDE Irvine32.inc


.data
captionW	BYTE "Warning",0
warningMsg	BYTE "The current operation may take years "
		BYTE "to complete.",0
captionQ	BYTE "Question",0
questionMsg	BYTE "A matching user acount was not found."
		BYTE 0dh,0ah,"Do you wish to continue?",0

captionC	BYTE "Information",0
infoMsg		BYTE "Select Yes to save a backupfile "
		BYTE "before continuing.",0dh,0ah
		BYTE "or click Cancel to stop the operation",0

captionH	BYTE "Cannot View User List", 0
haltMsg		BYTE "This operation not supported by your "
		BYTE "user acount.",0

.code
main PROC

	INVOKE MessageBox, NULL, ADDR warningMsg,
		ADDR captionW,
		MB_OK + MB_ICONEXCLAMATION

	INVOKE MessageBox, NULL, ADDR questionMsg,
		ADDR captionQ, MB_YESNO + MB_ICONQUESTION

	cmp	eax,IDYES


	INVOKE MessageBox, NULL, ADDR infoMsg,
		ADDR captionC, MB_YESNOCANCEL + MB_ICONINFORMATION \
		+ MB_DEFBUTTON2

	INVOKE MessageBox, NULL, ADDR haltMsg,
		ADDR captionH,
		MB_OK + MB_ICONSTOP

	exit
main ENDP
END main