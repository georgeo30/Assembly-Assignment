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
	div	$t4, $t1		#divide input by 3
	mfhi	$t6			#get remainder
	
	bne	$t5, $t6, eitherOne	#checking if t5 and t6 is not equal jump to individual
	bne	$t5, 0, neitherOne		#its neither jump to that
	la	$a0, both_msg		#giving the address of both_msg
	li	$v0, 4			#assigning 4 to v0
	syscall 

	add	$t3, $t3, 1		#incrementing input counter
	b loop

neitherOne: 				#its neither
	
	la	$a0, neither_msg	#giving the address of neither_msg
	li	$v0, 4			#assigning 4 to v0
	syscall
	add	$t3, $t3, 1		#incrementing input counter
	b loop 

eitherOne: 				#it can only be 3 or 2
	beq	$t5, 0, itsTwo		#if mod against 2
	beq	$t6, 0, itsThree	#if mode against 3

	b neitherOne			#jump to neither loop

	 

itsThree:				#its Three

	la	$a0, three_msg		#giving the address of three_msg
	li	$v0, 4			#assigning 4 to v0
	syscall 
	add	$t3, $t3, 1		#incrementing input counter
	b loop
	
itsTwo:					#its Two
	
	la	$a0, two_msg		#giving the address of two_msg
	li	$v0, 4			#assigning 4 to v0
	syscall 
	add	$t3, $t3, 1		#incrementing input counter
	b loop

	
exit:
	li	$v0, 10
	syscall
	
	.data

enter_msg:	.asciiz "Enter a number:"
output.msg:	.asciiz "It is divisible by "
both_msg:	.asciiz	"It is divisible by both 2 and 3 \n"
two_msg:	.asciiz "It is divisible by 2 \n"
three_msg:	.asciiz "It is divisible by 3 \n"
neither_msg:	.asciiz "It is neither divisible by 2 nor 3 \n"

new_line:	.asciiz "\n"