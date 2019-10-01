#Georgeo Thanathara -- 01/10/19
#question1.asm --  a SPIM program which for a user entered integer, determines all its one-digitpositive devisors (strictly less than 10) but not 1.
#Registers Used:
#		$a0 --syscall parameter
#		$v0 -- ssyscall parameter
#		$t0 -- holds the input
#		$t1 -- holds 1 incrementer
#		$t2 -- holds 9. max numbers

	.text
main:
	la	$a0, enter_msg		#loading the address of enter_msg toa0
	li	$v0, 4			#loading print_string to v0	
	syscall

	li	$v0, 5			#load read_int to v0
	syscall				#syscall
	move	$t0, $v0		#moving $v0 return val to a register t0

	li	$t1, 2			#loading int 1 into t1
	li	$t2, 10			#loading int 9 into t2

loop:					#loop to find divisors
	beq	$t1, $t2, exit		#if 9 is reached jump to endloop
	div	$t0, $t1		#divide integer by t1
	mfhi	$t3			#move remainder to t4
	beq	$t3, 0, printr		#checks if remainder is 0
	add	$t1, $t1, 1
	b	loop
	

printr:
	move	$a0, $t1		#move t1 to a0
	li	$v0, 1			#print int to v0
	syscall					
	add	$t1, $t1, 1		#incrementing t1
	b loop
	

				
exit:
	li	$v0, 10
	syscall

	.data
enter_msg:	.asciiz "Enter a number: \n"




