# Calculate a+b
.data
	input_msg: .asciiz "Nhap hai so nguyen: "
	output_msg: .asciiz "Tong: "
.text
	# Output input_msg
	li $v0,4
	la $a0,input_msg
	syscall
	# First input in $t0
	li $v0,5
	syscall
	move $t0,$v0
	# Second input in $t1
	li $v0,5
	syscall
	move $t1,$v0
	# a+b
	add $s0,$t0,$t1
	# Output output_msg
	li $v0,4
	la $a0,output_msg
	syscall
	# Output a+b
	move $a0,$s0
	li $v0,1
	syscall
