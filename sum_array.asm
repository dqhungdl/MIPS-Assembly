# Calculate sum of array
.data
	array_space: .space 4000
	input1_msg: .asciiz "Input N: "
	input2_msg: .asciiz "Input array: \n"
	output_msg: .asciiz "Sum of array: "
.text
	# Output input1_msg
	li $v0,4
	la $a0,input1_msg
	syscall
	# Read N
	li $v0,5
	syscall
	move $s0,$v0
	# Output input2_msg
	li $v0,4
	la $a0,input2_msg
	syscall
	#Init
	la $t0,array_space
	li $t1,1
	# Read array
readLoop:
	# Load address
	li $v0,5
	syscall
	sw $v0,0($t0)
	addi $t0,$t0,4
	addi $t1,$t1,1
	bgt $t1,$s0,readExit
	j readLoop
readExit:
	#Init
	la $t0,array_space
	li $s1,0
	li $t1,1
sumLoop:
	lw $t2,0($t0)	
	add $s1,$s1,$t2
	addi $t0,$t0,4
	addi $t1,$t1,1
	bgt $t1,$s0,sumExit
	j sumLoop
sumExit:
	# Output output_msg
	li $v0,4
	la $a0,output_msg
	syscall
	# Output sum array
	li $v0,1
	move $a0,$s1
	syscall