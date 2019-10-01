#Georgeo Thanathara -- 01/10/19
#question2.asm -- a user wants to classify numbers in terms of whether they are divisible by
#2 divisible 3 both visible by 2 and 3 and neither divisible by 2 nor 3. 
#registers used:a0 --syscall pram
#		v0 --syscall param and return


	.text
main:					#main method
	li	$t0, 2			#storing 2 to t0
	li	$t1, 3			#storing 3 to t1
	li	$t2, 5			#storing 6 to t2 to get 5 inputs
	li 	$t3, 0

loop:					#loop for 5 input
	
	beq	$t3, $t2, exit
	la	$a0, enter_msg		#giving the address of enter_msg
	li	$v0, 4			#assigning 4 to v0
	syscall 			#syscall

	li	$v0, 5			#get_int
	syscall
	move	$t4, $v0		#moving the input to register $t1
	
	div	$t4, $t0		#divide input by 2
	mfhi	$t5			#get remainder
	div	$t4, $t3		#divide input by 3
	mfhi	$t6			#get remainder

	add	$t3, $t3, 1		#incrementing input counter
	b loop
	

exit:
	li	$v0, 10
	syscall
	
	.data

enter_msg:	.asciiz "Enter a number: "
output.msg:	.asciiz "It is divisible by "
new_line:	.asciiz "\n"