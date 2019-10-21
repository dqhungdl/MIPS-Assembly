# Calculate 1+2+...+N
.data
	input_msg: .asciiz "Input N: "
	output_msg: .asciiz "Sum of first N numbers: "
.text
	# Output input_msg
	li $v0,4
	la $a0,input_msg
	syscall
	# Read N
	li $v0,5
	syscall
	move $t0,$v0
	# Init
	li $s0,0
	li $t1,1
	# Calculate 1+2+...+N
Loop:
	add $s0,$s0,$t1
	addi $t1,$t1,1
	bgt $t1,$t0,Exit
	j Loop
Exit:
	# Print output_msg
	li $v0,4
	la $a0,output_msg
	syscall
	# Output sum
	li $v0,1
	move $a0,$s0
	syscall
