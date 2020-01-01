INCLUDE Irvine32.inc

.data
	input_msg1 BYTE "Input N: ", 0
	input_msg2 BYTE "Input A: ", 0
	input_msg3 BYTE "Input R: ", 0
	space BYTE " ", 0
	N DWORD ?
	A DWORD ?
	R DWORD ?

.code
main PROC
	; Print input_msg1
	mov edx, OFFSET input_msg1
	call WriteString

	; Read N
	call ReadInt
	mov N, eax

	; Print input_msg2
	mov edx, OFFSET input_msg2
	call WriteString

	; Read A
	call ReadInt
	mov A, eax

	; Print input_msg3
	mov edx, OFFSET input_msg3
	call WriteString

	; Read R
	call ReadInt
	mov R, eax

	; Print first N numbers of geometric sequence
	mov ecx, N
	mov eax, A
	mov ebx, R

enter_loop:
	; Print number
	call WriteInt
	mul ebx
	; Print a space
	mov edx, OFFSET space
	call WriteString
	loop enter_loop

exit_loop:
	exit
main ENDP
END main