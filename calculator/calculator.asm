#Name: Sai Rama Balakrishnan
#Name: San Tran
	.globl main
	.text
	
main:
	la a0, welcome   # loads welcome statement into a0 
	jal printstring
	
	la a0, operations   # loads operations statement into a0
	jal printstring
	
	li s4, 'y'       # sets s4 as 'y' so that the while_cont loop runs
	li t3, 0	# setting numOper = 0
while_con:
	li t2, 'n'	# loading check
	beq s4, t2, endwhile_con
	la a0, numopers   # loads numopers statement into a0 
	jal printstring
	
	mv a0, t3	# moves in number of operations done in the program
	jal printint
	
	la a0, enternum1   # loads enternuml statement into a0 
	jal printstring
	
	jal readint
	mv s1, a0       # preserve usernumber1 to s1
	
	la a0, enternum2   # loads enternum2 statement into a0 
	jal printstring
	
	jal readint
	mv s2, a0       # preserve usernumber2 to s2
	
	la a0, operSelect   # loads operSelect statement into a0 
	jal printstring
	
	jal readint
	mv s3, a0       # preserve operation selected to t6

ifadd:
	li a6, 1
	bne s3, a6, ifsub # if operation does not equal 1 move to if sub else do operation 
	mv a0, s1
	mv a1, s2
	jal addnums
	mv s0, a0
	
	#print s0
	la a0, response   # loads response statement into a0 
	jal printstring
	
	mv a0, s0	# print out s0
	jal printint
	
	b break

ifsub:
	li a6, 2
	bne s3, a6, ifmult # if operation does not equal 2 move to ifmult else do operation 
	mv a0, s1
	mv a1, s2
	jal subnums
	mv s0, a0

	# print s0
	la a0, response   # loads response statement into a0 
	jal printstring
	
	mv a0, s0
	jal printint
	
	b break

ifmult:
	li a6, 3
	bne s3, a6, ifdiv # if operation does not equal 3 move to ifdiv else do operation 
	mv a0, s1
	mv a1, s2
	jal multnums
	
	mv s0, a0
	
	#print s0
	la a0, response   # loads response statement into a0
	jal printstring
	
	mv a0, s0
	jal printint
	
	b break

ifdiv:
	li a6, 4
	bne s3, a6, ifand # if operation does not equal 4 move to ifand else do operation 
	mv a0, s1
	mv a1, s2
	jal divnums
	
	mv s0, a0
	
	# print s0
	la a0, response   # loads welcome statement into a0
	jal printstring
	
	mv a0, s0
	jal printint
	
	b break
	
ifand:
	li a6, 5
	bne s3, a6, ifor # if operation does not equal 5 move to ifor else do operation 
	mv a0, s1
	mv a1, s2
	jal andnums
	
	mv s0, a0
	
	#print s0
	la a0, response   # loads welcome statement into a0
	jal printstring
	
	mv a0, s0
	jal printint
	
	b break

ifor:
	li a6, 6
	bne s3, a6, ifxor # if operation does not equal 6 move to ifxor else do operation 
	mv a0, s1
	mv a1, s2
	jal ornums
	
	mv s0, a0
	
	#print s0
	la a0, response   # loads response statement into a0
	jal printstring
	
	mv a0, s0
	jal printint
	
	b break

ifxor:
	li a6, 7
	bne s3, a6, iflshift # if operation does not equal 7 move to iflshift else do operation 
	mv a0, s1
	mv a1, s2
	jal xornums
	
	mv s0, a0
	
	#print s0
	la a0, response   # loads welcome statement into a0 
	jal printstring
	
	mv a0, s0
	jal printint
	
	b break

iflshift:
	li a6, 8
	bne s3, a6, ifrshift # if operation does not equal 8 move to ifrshift else do operation 
	mv a0, s1
	mv a1, s2
	jal lshiftnums
	
	mv s0, a0
	
	# print s0
	la a0, response   # loads welcome statement into a0 
	jal printstring
	
	mv a0, s0
	jal printint
	
	b break

ifrshift:
	li a6, 9
	bne s3, a6, default # if operation does not equal 9 move to default else do operation 
	mv a0, s1
	mv a1, s2
	jal rshiftnums
	
	mv s0, a0
	
	#print s0
	la a0, response   # loads welcome statement into a0
	jal printstring 
	
	mv a0, s0
	jal printint
	
	b break

default:
	la a0, invalid   # loads invalid statement into a0 
	jal printstring
	
break:
	addi t3, t3, 1 # adds 1 to nums operation counter which is stored in t3
	
	la a0, continue   # loads continue statement into a0 
	jal printstring
	
	jal readchar
	mv s4, a0 	# moves that value to s4
	
	li a0, '\n'
	jal printchar
	
	b while_con
	

endwhile_con:	
	la a0, numopers	# loads the numopers prompt into a0
	jal printstring
    	
    	mv a0, t3	# loads numeber of operations done
    	jal printint

	la a0, exit	# loads the exit prompt into a0
	jal printstring
	
    	jal exit0
	
		.data
welcome: 	.string "Welcome to the Calculator program.\n"
operations:	.string "Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n"
enternum1:  	.string "\nEnter number: "
enternum2:  	.string "Enter second number: "
operSelect:	.string "Select operation: "
response:  	.string "Result: "
continue:  	.string "\nContinue (y/n)?: "
exit:      	.string "\nExiting"
numopers:	.string "\nNumber of operations performed: "
space:     	.string "\n"
invalid: 	.string "Result: Invalid Operation"
