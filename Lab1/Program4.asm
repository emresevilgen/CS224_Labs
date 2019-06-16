	.data
enterA: .asciiz "\nEnter the a: "
enterB: .asciiz "\nEnter the b: "
enterC: .asciiz "\nEnter the c: "
result: .asciiz "\nThe result is: "

	.text
main:
	#Gets the number of elements
	li $v0, 4
	la $a0, enterA
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	#Gets the number of elements
	li $v0, 4
	la $a0, enterB
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	#Gets the number of elements
	li $v0, 4
	la $a0, enterC
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	mul $t0, $s0, $s1
	mul $t0, $t0, 4
	
	sub $t1, $s2, 2
	div $t1, $t1, 3
	
	div $t0, $t1
	mfhi $t3 #Remainder
	
	#Shows the result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall
