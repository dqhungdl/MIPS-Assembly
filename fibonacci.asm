# Calculate first N fibonacci numbers
.data
	array_space: .space 4000
	input_msg: .asciiz "Input N: "
	output_msg: .asciiz "List of first N fibonacci numbers: "
	space_msg: .asciiz " "
.text
	# Output input_msg
	li $v0,4
	la $a0,input_msg
	syscall
	# Read N
	li $v0,5
	syscall
	move $s0,$v0
	# Init first 2 fibonacci numbers
	la $t0,array_space
	li $t1,1
	sw $t1,0($t0)
	sw $t1,4($t0)
	addi $t0,$t0,8
	# Calculate first N fibonacci numbers
calLoop:
	bgt $t1,$s0,calExit
	lw $t2,-8($t0)
	lw $t3,-4($t0)
	add $t4,$t2,$t3
	sw $t4,0($t0)
	addi $t0,$t0,4
	addi $t1,$t1,1
	j calLoop
calExit:
	# Output output_msg
	li $v0,4
	la $a0,output_msg
	syscall
	# Init
	la $t0,array_space
	li $t1,1
	# Output first N fibonacci numbers
printLoop:
	lw $t2,0($t0)
	li $v0,1
	move $a0,$t2
	syscall
	addi $t0,$t0,4
	addi $t1,$t1,1
	bgt $t1,$s0,printExit
	# Print space
	li $v0,4
	la $a0,space_msg
	syscall
	j printLoop
printExit: