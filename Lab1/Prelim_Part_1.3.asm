	.data
enterC: .asciiz "Enter c: "
enterD: .asciiz "Enter d: "

	.text
main:
	#Gets c and puts it to $s1
	li $v0, 4
	la $a0, enterC
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	#Gets d and puts it to $s2
	li $v0, 4
	la $a0, enterD
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	
	sub $s0, $s1, $s2 
	rem $s0, $s0, 16
	
	#Displays result
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall
