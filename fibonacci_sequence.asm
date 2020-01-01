INCLUDE Irvine32.inc

.data
	input_msg BYTE "Input N: ", 0
	space BYTE " ", 0
	N DWORD ?
	TMP DWORD ?

.code
main PROC
	; Print input_msg
	mov edx, OFFSET input_msg
	call WriteString

	; Read N
	call ReadInt
	mov N, eax

	; Print first N fibonacci numbers
	mov ecx, N
	mov eax, 0
	mov ebx, 1

enter_loop:
	; Print fibonacci number
	mov TMP, ebx
	add ebx, eax
	mov eax, TMP
	call WriteInt
	; Print a space
	mov edx, OFFSET space
	call WriteString
	loop enter_loop

exit_loop:
	exit
main ENDP
END main