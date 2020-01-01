INCLUDE Irvine32.inc

.data
	input_msg1 BYTE "Input N: ", 0
	input_msg2 BYTE "Input U: ", 0
	input_msg3 BYTE "Input D: ", 0
	space BYTE " ", 0
	N DWORD ?
	U DWORD ?
	D DWORD ?

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

	; Read U
	call ReadInt
	mov U, eax

	; Print input_msg3
	mov edx, OFFSET input_msg3
	call WriteString

	; Read D
	call ReadInt
	mov D, eax

	; Print first N numbers of arithmetic sequence
	mov ecx, N
	mov eax, U
	mov ebx, D

enter_loop:
	; Print number
	call WriteInt
	add eax, ebx
	; Print a space
	mov edx, OFFSET space
	call WriteString
	loop enter_loop

exit_loop:
	exit
main ENDP
END main