.data
	N: .word 10
.text
	lw $t1,N
	addi $t1,$t1,1
	addi $s0,$zero,1
	addi $t0,$zero,1
	Loop:
		mul $s0,$s0,$t0
		addi $t0,$t0,1
		beq $t0,$t1,Exit
		j Loop
	Exit:
