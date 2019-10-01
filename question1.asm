#Georgeo Thanathara -- 01/10/19
#question1.asm --  a SPIM program which for a user entered integer, determines all its one-digitpositive devisors (strictly less than 10) but not 1.
#Registers Used:
#		$a0 --syscall parameter
#		$v0 -- ssyscall parameter
#		$t0 -- holds the input

	.text
main:
	la	$a0, enter_msg		#loading the address of enter_msg toa0
	li	$v0, 4			#loading print_string to v0	
	syscall

	li	$v0, 5			#load read_int to v0
	syscall				#syscall
	move	$t0, $v0		#moving $v0 return val to a register t0

exit:
	li	$v0, 10
	syscall

	.data
enter_msg:	.asciiz "Enter a number: \n"




