#void initspi(void)
initspi:
#	char junk; 
#	SPI2CONbits.ON = 0; // disable SPI to reset any previous state
	lui $t0, 0xBF80
	ori $t0, $t0, 0x5A00
	lw $t1, 0($t0)
	andi $t1, $t1, 0x7FFF
	sw $t1, 0($t0)
#	junk = SPI2BUF; // read SPI buffer to clear the receive buffer
	lui $t2, 0xBF80 
	ori $t2, $t2, 0x5A20
	lw $t3, 0($t2) # $t3 is junk
#	SPI2BRG = 7; 
	lui $t4, 0xBF80
	ori $t4, $t4, 0x5A30
	addi $t5, $0, 7
	sw $t5, 0($t4)
#	SPI2CONbits.MSTEN = 1;// enable master mode 
	lw $t1, 0($t0)
	ori $t1, $t1, 0x0020
	sw $t1, 0($t0)
#	SPI2CONbits.CKE = 1; // set clock-to-data timing 
	lw $t1, 0($t0)
	ori $t1, $t1, 0x0100
	sw $t1, 0($t0)
#	while(!SPI2CONbits.SSEN); // Check the SSEN bit
	while: 	lw $t1, 0($t0)
		andi $t6, $t1, 0x0080
		beq $t6, $0, while
#	SPI2CONbits.ON = 1; // turn SPI on  
	lw $t1, 0($t0)
	ori $t1, $t1, 0x8000
	sw $t1, 0($t0)
#}
	jr $ra


#// This code shows and rotates the pattern (10001000) right or stops based on the input coming from the user. The pattern is to be shown on the LEDs.
#
#int stop = 0;
addi $s0, $zero, 0 # $s0 is stop
#int initial  = 0b01110111; //Initial pattern. Note that 0 means on, while 1 means off.
addi $s1, $zero, 119 # $s1 is initial
#int right = 1;
addi $s2, $zero, 1 # $s2 is right
#void main(){
main:	
	addi $sp, $sp, -24
	sw $s4, 20($sp)
	sw $s3, 16($sp)
	sw $s2, 12($sp)
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
#	TRISD = 0x0; // All bits of PORTD are output. ~0 means output~
	lui $t0, 0xBF88
	ori $t0, $t0, 0x60C0
	sw $zero, 0($t0)
#
#// Three bits of PORTA are inputs but only one of them is used in this example as a stop button, others are redundant. ~1 means input~ 
#   
#     	TRISA = 0b111; 
	lui $t0, 0xBF88
	ori $t0, $t0, 0x6000
	addi $t1, $zero, 7
	sw $t1, 0($t0)
#
#// From PORTD, outputs will be sent to LEDs. Make sure that you physically connected them by looking at the Figure 1, in the directives document.
#// Initial pattern is sent to the LEDs through PORTD.
#
#     	PORTD = initial;
	lui $t0, 0xBF88
	ori $t0, $t0, 0x60D0
	sw $s1, 0($t0)

#     	while(1){
	while1: bne $0, $0, endwhile1
#              	int lsb;
#              	int mask;
#		 // Stop button is the push-button which is labeled as 1 on the board.
#              	if(PORTABits.RA1 == 0){ // If stop button clicked
		if1: 	lui $t0, 0xBF88
			ori $t0, $t0, 0x6010
			lw $t1, 0($t0)
			andi $t1, $t1, 0x0002
			bne $t1, $zero, endif1
#                   		stop = !stop;
			not $s0, $s0
#                   		if(!stop){ 
			if2:	bne $s0, $zero if2end
#// If process restarted, copy initial pattern into PORTD.
#                        			PORTD = initial;
				lui $t0, 0xBF88
				ori $t0, $t0, 0x60D0
				sw $s1, 0($t0)
#                   		}
			if2end:
#              	}
		endif1:
#              	if(!stop){
		if3:	bne $s0, $zero if3else
#		 	//Rotate right
#              	 	lsb = PORTD & 0x1; // Extract least significant bit
			lui $t0, 0xBF88
			ori $t0, $t0, 0x60D0
			lw $t1, 0($t0)
			andi $s3, $t1, 0x1 # $s3 is lsb
#              		mask = lsb << 7; // Least significant bit will be the msb of the   						 
#				// shifted pattern
			sll $s4, $s3, 7 # $s4 is mask
#                		PORTD = (PORTD >> 1) | mask; // Paste lsb to the leftmost bit the							      
#					// right shifted portd
			lui $t0, 0xBF88
			ori $t0, $t0, 0x60D0
			lw $t1, 0($t0)
			sra $t1, $t1, 1
			or $t1, $t1, $s4
			sw $t1, 0($t0)
			j if3end
#              	} else {
		if3else:
#                		//Do not shift anything, that is, stop.
#                		PORTD = 0b11111111;
			lui $t0, 0xBF88
			ori $t0, $t0, 0x60D0
			li $t1, 255
			sw $t1, 0($t0)
#              	}
		if3end:
#              	delay_ms(1000); // Wait 1 second.
		li $a0, 1000
		jal delay_ms
#     	}
	endwhile1:
#}
	lw $s4, 20 ($sp)
	lw $s3, 16 ($sp)
	lw $s2, 12 ($sp)
	lw $s1, 8 ($sp)
	lw $s0, 4 ($sp)
	lw $ra, 0 ($sp)
	addi $sp, $sp, 24
	jr $ra

