INCLUDE Irvine32.inc

.data
	input_msg BYTE "Input N: ", 0
	space BYTE " ", 0
	N DWORD ?
	SAVE_COUNTER DWORD ?
	ARRAY DWORD 1000 DUP(?)

.code
main PROC
	; Print input_msg
	mov edx, OFFSET input_msg
	call WriteString

	; Read N
	call ReadInt
	mov N, eax

	; Read array
	mov edi, OFFSET ARRAY
	mov ecx, N
read_loop:
	call ReadInt
	mov [edi], eax
	add edi, TYPE ARRAY
	loop read_loop

	; Sorting
	mov edi, OFFSET ARRAY
	mov ecx, N
loop_1:
	mov SAVE_COUNTER, ecx
	mov esi, edi
	loop_2:
		mov eax, [edi]
		mov ebx, [esi]
		cmp eax, ebx
		jle next
		mov [esi], eax
		mov [edi], ebx
		next:
			add esi, TYPE ARRAY
			loop loop_2
	add edi, TYPE ARRAY
	mov ecx, SAVE_COUNTER
	loop loop_1

	; Print array
	mov edi, OFFSET ARRAY
	mov ecx, N
print_loop:
	mov eax, [edi]
	call WriteInt
	mov edx, OFFSET space
	call WriteString
	add edi, TYPE ARRAY
	loop print_loop
	exit

main ENDP
END main