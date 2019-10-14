.data
	N: .word 15
.text
	lw $t1,N
	addi $t1,$t1,1
	add $s0,$zero,$zero
	addi $t0,$zero,1
	Loop:
		add $s0,$s0,$t0
		addi $t0,$t0,1
		beq $t0,$t1,Exit
		j Loop
	Exit: