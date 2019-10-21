.data
	hello_world: .asciiz "Hello world!"
.text
	li $v0,4			# Code for printing string is 4
	la $a0,hello_world	# Assign address of hello_world in $a0
	syscall				# Print string
	
