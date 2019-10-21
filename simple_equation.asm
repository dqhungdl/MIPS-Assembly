# Calculate ax+b=0
.data
	input_msg: .asciiz "Nhap a va b: "
	output_msg: .asciiz "Nghiem la: "
	inf_msg: .asciiz "Vo so nghiem"
	nan_msg: .asciiz "Vo nghiem"
	zero: .float 0
.text
	# Output input_msg
	li $v0,4
	la $a0,input_msg
	syscall
	# Input real number a
	li $v0,6
	syscall
	mov.s $f1,$f0
	# Input real number b
	li $v0,6
	syscall
	mov.s $f2,$f0
	# Set $f4=0
	l.s $f4,zero
	# Check special case a=0
	c.eq.s $f1,$f4
	bc1t special_case
	# Get -b/a
	sub.s $f3,$f4,$f2
	div.s $f3,$f3,$f1
	# Output output_msg
	li $v0,4
	la $a0,output_msg
	syscall
	# Output -b/a
	li $v0,2
	mov.s $f12,$f3
	syscall
	j exit

special_case:
	c.eq.s $f2,$f4
	bc1t inf_case
	li,$v0,4
	la $a0,nan_msg
	syscall
	j exit

inf_case:
	li,$v0,4
	la $a0,inf_msg
	syscall
	j exit

exit:
