#Georgeo Thanathara -- 01/10/19
#question1.asm --  a SPIM program which for a user entered integer, determines all its one-digitpositive devisors (strictly less than 10) but not 1.
#Registers Used:
#		$a0 --syscall parameter
#		$v0 -- ssyscall parameter

	.text
main:
	la	$a0, enter_msg		#loading the address of enter_msg toa0
	li	$v0, 4			#loading print_string to v0	
	syscall

exit:
	li	$v0, 10
	syscall

	.data
enter_msg:	.asciiz "Enter a number"




