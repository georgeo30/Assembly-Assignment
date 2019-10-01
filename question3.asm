#Georgeo Thanathara -- 01/10/19
#question3.asm --  program to find weather two numbers are relatively prime.
#registers used:$a0--syscall param
#		$v0--syscall param and return
#		$t0--first int
#		$t1--second int

	.text
main:
	la 	$a0, first_msg		#first_msg to a0
	li	$v0, 4			#print_string
	syscall

	li	$v0, 5			#read_int
	move	$t0, $v0		#moving to t0,first int
	syscall

	la 	$a0, second_msg		#second_msg to a0
	li	$v0, 4			#print_string
	syscall

	li	$v0, 5			#read_int
	move	$t1, $v0		#moving to t0
	syscall
exit:
	li	$v0, 10
	syscall
	
	.data
first_msg:	.asciiz "Enter the first number: \n"
second_msg:	.asciiz "Enter the second number: \n"
prime_msg:	.asciiz "The entered numbers are relatively prime."
nonprime_msg:	.asciiz "The entered numbers are not relatively prime."

