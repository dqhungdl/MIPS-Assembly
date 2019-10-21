# Calculate the area of the rectangle with height and width
.data
	input_msg: .asciiz "Nhap chieu dai va chieu rong: "
	output_msg: .asciiz "Dien tich: "
.text
	# Output input_msg
	li $v0,4
	la $a0,input_msg
	syscall
	# Input height
	li $v0,5
	syscall
	move $t0,$v0
	# Input width
	li $v0,5
	syscall
	move $t1,$v0
	# Calculate area
	mul $t2,$t0,$t1
	# Output output_msg
	li $v0,4
	la $a0,output_msg
	syscall
	# Output the area
	li $v0,1
	move $a0,$t2
	syscall