INCLUDE Irvine32.inc

.data
	input_msg1 BYTE "Input A: ", 0
	input_msg2 BYTE "Input B: ", 0
	A DWORD ?
	B DWORD ?
	GCD DWORD ?

.code
main PROC
	; Print input_msg1
	mov edx, OFFSET input_msg1
	call WriteString

	; Read A
	call ReadInt
	mov A, eax

	; Print input_msg2
	mov edx, OFFSET input_msg2
	call WriteString

	; Read B
	call ReadInt
	mov B, eax
	
	; Calculate greatest common divisor (GCD)
	mov eax, A
	mov ebx, B

	; Check special case
	cmp eax, 0
	je special_case_1
	cmp ebx, 0
	je special_case_2
		
enter_loop:
	cmp eax, ebx
	je exit_loop
	cmp eax, ebx
	ja condition
	sub ebx, eax
	jmp enter_loop

condition:
	sub eax, ebx
	jmp enter_loop

special_case_1:
	mov eax, ebx
	jmp exit_loop

special_case_2:
	jmp exit_loop

	; Calculate lowest common multiple (LCM)
exit_loop:
	mov GCD, eax
	mov eax, A
	mov ebx, B
	mul ebx
	mov ebx, GCD
	div ebx
	call WriteInt
	exit

main ENDP
END main