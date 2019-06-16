	.data
getStringMessage: .asciiz "Enter a string: "
palindrome: .asciiz "The string is a palindrome."
notPalindrome: .asciiz "The string is not a palindrome."
stringInput: .space 30 #Space for input string

	.text
main:
	#Display the get string message and puts the input to $a0
	li $v0, 4
	la $a0, getStringMessage
	syscall
	
	li $v0, 8
	la $a0, stringInput # gets input
	li $a1, 30
	syscall
	
	la $s1, stringInput
	
stringLengthLoop: #Counts the length of the string
	lb $t0, 0($s1)
	beq $t0, $zero, stringLengthLoopExit
	addi $s1, $s1, 1
	j stringLengthLoop
	
stringLengthLoopExit: 
	la $s0, stringInput #First index of the string
	addi $s1, $s1, -2 #Last index of the string
	
	
palindromeLoop: #Checks whether the string is palindrome or not
	bge $s0, $s1, displayPalindrome
	bne $t0, $t1, displayNotPalindrome
	lb $t0, 0($s0)
	lb $t1, 0($s1)
	addi $s1, $s1, -1
	addi $s0, $s0, +1
	j palindromeLoop

displayNotPalindrome: #Display the string is not palindrome
	li $v0 , 4
	la $a0, notPalindrome
	syscall
	j end
	
displayPalindrome: #Display the string is palindrome
	li $v0, 4
	la $a0, palindrome
	syscall
	j end

end:
	li $v0, 10
	syscall

	
