#Georgeo Thanathara -- 01/10/19
#question2.asm -- a user wants to classify numbers in terms of whether they are divisible by
#2 divisible 3 both visible by 2 and 3 and neither divisible by 2 nor 3. 
#registers used:a0 --syscall pram
#		v0 --syscall param and return


	.text
main:					#main method
	li	$t0, 2			#storing 2 to t0
	li	$t1, 3			#storing 3 to t1
	li	$t2, 6			#storing 6 to t2 to get 5 inputs

loop:					#loop for 5 input
	
	
	la	$a0, enter_msg		#giving the address of enter_msg
	li	$v0, 4			#assigning 4 to v0
	syscall 			#syscall

	li	$v0, 5			#get_int
	syscall
	move	$t2, $v0		#moving the input to register $t1
	
	

exit:
	li	$v0, 10
	syscall
	
	.data

enter_msg:	.asciiz "Enter a number: "
output.msg:	.asciiz "It is divisible by "
new_line:	.asciiz "\n"