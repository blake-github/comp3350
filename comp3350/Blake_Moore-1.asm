;Blake Moore
;bmm0066
;Blake_Moore.asm
; Got help from template program and lectures from class
; Last modified 2/25/2022

; This program reads a value from an array
; and places that value in another array with the location shifted by a certain amount

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
    shift dword 2
    input byte 1,2,3,4,5,6,7,8
    output byte lengthof input dup(?)	
.code
    main proc
	mov eax, 0			;This loop will iterate length - shift times. 
	mov ebx, 0			;(this loop will place the 'non-wraped' values)
	mov ecx, shift			;Start writing from input at shift
				;Start reading at 0
    l1:	
		neg ecx		;Move the value from input into al
		mov al, input[lengthof input + ecx]		;Move the value from al into output
		mov output[ebx], al		;Increment the input index
		neg ecx		;Increment the output index
		inc ebx
    	loop l1

	mov ecx, LENGTHOF input ;This loop will iterate shift times
	sub ecx, shift 			;Start reading at index length - shift
	mov edx, 0				;Start writing at index 0.  
				;(this loop will place the 'wrapped' values)	
    l2:	
	mov al, input[edx]			;Move the value from input into al
	mov output[ebx], al			;Move the value from al into output
	inc ebx			;Increment the input index
	inc edx			;Increment the output index
	loop l2

INVOKE ExitProcess,0
main ENDP
END main

