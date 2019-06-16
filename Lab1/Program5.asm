	.data
enterNumberOfElements: .asciiz "\nEnter the number of elements: "
enterElement: .asciiz "\nEnter the element: "
menu: .asciiz "\n\n1.Find summation of numbers stored in the array which is greater than an input number.\n2.Find summation of numbers within a value range specified two numbers and display that value.\n3.Display the number of occurrences of the array elements divisible by a certain input number.\n4.Display number of unique numbers in the array.\n5.Quit.\nEnter the number of your selection: "
enterThreshold: .asciiz "\nEnter the threshold: "
result: .asciiz "\nThe result is: "
enterLowerBoundry: .asciiz "\nEnter the lower boundry: "
enterUpperBoundry: .asciiz "\nEnter the upper boundry: "
enterDivisor: .asciiz "\nEnter the divisor: "

	.text
main:
	#Gets the number of elements
	li $v0, 4
	la $a0, enterNumberOfElements
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	#Creates the array
	mul $t0, $s0, 4
	move $a0, $t0
	li $v0, 9
	syscall
	

	move $s1, $v0 	#First index of the array
	
	#Last index of the array
	mul $s2, $s0, 4  
	add $s2, $s2, $s1
	add $t0, $s1, $zero

getElements: #Gets the elements one by one adds into the array
	li $v0, 4
	la $a0, enterElement
	syscall

	li $v0, 5
	syscall
	
	sw $v0, ($t0)
	addi $t0, $t0, 4

	blt $t0, $s2, getElements
	
getMenuSelection: #Displays the menu and gets the selection
	li $v0, 4
	la $a0, menu
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	beq $t0, 1, sumGreater
	beq $t0, 2, sumWithinRange
	beq $t0, 3, numberOfDivisible
	beq $t0, 4, numberOfUniques
	beq $t0, 5, quit
	
	
sumGreater:
	#Gets the threshold
	li $v0, 4
	la $a0, enterThreshold
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	add $t0, $s1, $zero #First index
	li $t1, 0 #Result
	
checkBoundry:  
	bge $t0, $s2, sumGreaterExit
	lw $t2, ($t0)
	addi $t0, $t0, 4
	bgt $t2, $s3, addToSum
	j checkBoundry

addToSum:
	add $t1, $t1, $t2
	j checkBoundry
	
sumGreaterExit:
	#Shows the result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	j getMenuSelection

sumWithinRange:
	#Gets the lower boundry
	li $v0, 4
	la $a0, enterLowerBoundry
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	#Gets the upper boundry	
	li $v0, 4
	la $a0, enterUpperBoundry
	syscall
	
	li $v0, 5
	syscall
	move $s4, $v0
	
	add $t0, $s1, $zero #First index
	li $t1, 0 #Result
	
checkRange1:  
	bge $t0, $s2, sumWithinRangeExit
	lw $t2, ($t0)
	addi $t0, $t0, 4
	bgt $t2, $s3, checkRange2
	j checkRange1

checkRange2:
	blt $t2, $s4, addToSum2	
	j checkRange1

addToSum2:
	add $t1, $t1, $t2
	j checkRange1
	
sumWithinRangeExit:
	#Shows the result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	j getMenuSelection

numberOfDivisible:
	#Gets the divisor
	li $v0, 4
	la $a0, enterDivisor
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	add $t0, $s1, $zero #First index
	li $t1, 0 #Result
	
checkDivisible:
	bge $t0, $s2, numberOfDivisibleExit
	lw $t2, ($t0)
	addi $t0, $t0, 4
	
	div $t2, $s3
	mfhi $t3 #Remainder
	beq $t3, $zero, addToSum3
	j checkDivisible
	
addToSum3:
	addi $t1, $t1, 1
	j checkDivisible

numberOfDivisibleExit:
	#Shows the result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	j getMenuSelection

numberOfUniques:
	add $t0, $s1, $zero #First index
	li $t4, 0 #Result
	
firstLoop:
	bge $t0, $s2, firstLoopExit
	add $t1, $s1, $zero
	lw $t2, ($t0)

	
secondLoop:
	bge $t1, $t0, addToSum4
	lw $t3, ($t1)
	addi $t1, $t1, 4
	beq $t2, $t3, secondLoopExit
	j secondLoop

addToSum4:
	addi $t4, $t4, 1
	
secondLoopExit:
	addi $t0, $t0, 4
	j firstLoop
		
firstLoopExit:
	#Shows the result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	j getMenuSelection

quit:
	li $v0, 10
	syscall
