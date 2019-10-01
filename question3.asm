#Georgeo Thanathara -- 01/10/19
#question3.asm --  program to find weather two numbers are relatively prime.
#registers used:$a0--syscall param
#		$v0--syscall param and return
#		$t0--input
#		$t1--loop counter to test both words
#		$t2--mid point of number
#		$t3--internal incrementer
#		$t4--tempvar
#		$t5-- int 2
#		$t6--second varr temp

	.text
main:
	li	$t5, 2
	la 	$a0, first_msg		#first_msg to a0
	li	$v0, 4			#print_string
	syscall

	li	$v0, 5			#read_int
	syscall
	move	$t0, $v0		#moving to t0,first int
	
	add	$t1, $t1, 1		#increment t1
	

	la 	$a0, second_msg		#second_msg to a0
	li	$v0, 4			#print_string
	syscall

	li	$v0, 5			#read_int
	syscall
	move	$t7, $v0		#moving to t0

	b checkprime

return: 				#get second input
	

	move	$t0, $t7		#moving to t0
	
	add	$t1, $t1, 1		#increment t1
	
	b checkprime
	
checkprime:
	li	$t3, 2
	div	$t0, $t5		#dividing the int
	mflo	$t2			#storing in t2
	b internalcheck			#branches to actual check if both words havent been checked

internalcheck:
	blt	$t3, $t2, primeornot		#checking if all primes have been cheked
	bne	$t1, 2, return		#checking of both words have been checked
	b printyes

primeornot:	
	div 	$t0, $t3
	mfhi	$t4
	beq	$t4, 0, printnot
	add	$t3, $t3, 1
	b internalcheck

printyes:
	la 	$a0, prime_msg		#prime_msg to a0
	li	$v0, 4			#print_string
	syscall
	b exit

printnot:
	la 	$a0, nonprime_msg	#nonprime_msg to a0
	li	$v0, 4			#print_string
	syscall
	b exit

exit:
	li	$v0, 10
	syscall
	
	.data
first_msg:	.asciiz "Enter the first number: \n"
second_msg:	.asciiz "Enter the second number: \n"
prime_msg:	.asciiz "The two numbers are relatively prime"
nonprime_msg:	.asciiz "The two numbers are not relatively prime"

