.text
main:
	# Test for new instructions
	nop
	
	addi $t0, $zero, 3
	addi $t1, $zero, 3
	addi $t0, $t0, -2
	subi $t1, $t1, 2
	
	bne $t0, $t1, subiError
	
	addi $t2, $zero, 1
	
	j continue
	
	subiError:
		move $t2, $zero
continue:
	# Test for other instruction that is 
	# taken from the given system verilog file
	addi $v0, $zero, 5
	addi $v1, $zero, 12
	addi $a3, $v1, -9
	or $a0, $a3, $v0
	and $a1, $v1, $a0
	add $a1, $a1, $a0
	beq $a1, $a3, c
	slt $a0, $v1, $a0
	beq $a0, $zero, a
	addi $a1, $zero, 0
	a:
	slt $a0, $a3, $v0
	add $a3, $a0, $a1
	sub $a3, $a3, $v0
	sw $a3, 68($v1)
	lw $v0, 80($zero)
	j c
	addi $v0, $zero, 1
	c:
	sw $v0, 84($zero)
	d:
	j d
