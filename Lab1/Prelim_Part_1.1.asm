	.data
array: .space 80
sizeMessage: .asciiz "Enter the number of elements (at most 20): "
maxSizeError: .asciiz "Error: Invalid number of elements. Please enter the number of elements (at most 20): "
enterElement: .asciiz "Enter an element: "
messageOfArray: .asciiz "Array: "
messageOfReversedArray: .asciiz "\nReversed array: "

	.text
main:
	#Shows the size message to the user
	li $v0, 4
	la $a0, sizeMessage
	syscall
	
	#Gets the size and puts it to $t0
	li $v0, 5 
	syscall
	move $t0, $v0 
	
	#Checks whether the size is less than or equal to 20
	li $t1, 20
	slt, $t2, $t1, $t0
		
getSize:
	beq $t2, $zero, getElements #If the size input is valid then it jumps to the getElements part 
	
	#Shows the error message to the user and gets the size again
	li $v0, 4
	la $a0, maxSizeError
	syscall
		
	li $v0, 5
	syscall
	
	move $t0, $v0
	slt $t2, $t1, $t0
	
	j getSize #Jumps to the beginning of the getSize to check the size input again
	
getElements:
	li $t1, 0 #Counter i of the for loop
	la $s0, array #Makes $s0 point to the beginning of the array
	
forOfGetElements:#For loop to get the elements one by one
	beq $t1, $t0, displayArray #Exits the loop and continues with displaying the contents of the array
	
	#Displays a message to make the user enter an element
	li $v0, 4
	la $a0, enterElement
	syscall
	
	#Gets the element and move it to the $t2
	li $v0, 5
	syscall
	move $t2, $v0
	
	#Adds the element to the array and passes to the next index of the array
	sw $t2, 0($s0)
	addi $s0, $s0, 4
	
	#Increments the counter
	addi $t1, $t1, 1
	j forOfGetElements
	
displayArray:
	#Gets the first and the last index location of the array
	la $t1, array
	la $t2, ($t0)
	sll $t2, $t2, 2 #Multiply $t2 to get the lenght of the array in the memory
	add $t3, $t1, $t2
	
	#Displays a message to make the user enter an element
	li $v0, 4
	la $a0, messageOfArray
	syscall
	
forOfDisplayArray: #For loop to display the array
	beq $t1, $t3, reverseArray #Exits the loop and continues with reversing the contents of the array
	
	#Load the integer to $a0 and displat it
	lw $a0, ($t1)
	li $v0, 1
	syscall
	
	#Increments the counter
	addi $t1, $t1, 4
	j forOfDisplayArray
	
reverseArray:
	#Gets the first and the last index location of the array
	la $t1, array
	la $t2, ($t0)
	sll $t2, $t2, 2 #Multiply $t2 to get the lenght of the array in the memory
	add $t3, $t1, $t2
	
forOfReverseArray: #For loop to reverse the array
	slt $t6, $t1, $t3
	beq $t6, $0, displayReversedArray
	addi $t3, $t3, -4
	lw $t5, ($t3)
	lw $t4, ($t1)
	sw $t5, ($t1)
	sw $t4, ($t3)
	addi $t1, $t1, 4
	j forOfReverseArray

displayReversedArray:
	la $t1, array

	la $t2, ($t0)
	sll $t2, $t2, 2 #Multiply $t2 to get the lenght of the array in the memory
	add $t3, $t1, $t2
	
	#Displays a message to make the user enter an element
	li $v0, 4
	la $a0, messageOfReversedArray
	syscall
	
forOfDisplayReversedArray: #For loop to display the array
	beq $t1, $t3, done #Exits the loop and continues with reversing the contents of the array
	
	#Load the integer to $a0 and displat it
	lw $a0, ($t1)
	li $v0, 1
	syscall
	
	#Increments the counter
	addi $t1, $t1, 4
	j forOfDisplayReversedArray

done:
	li $v0, 10
	syscall