.globl main
.text
main:
	#line 5
	li t1, 'y' #load t1 as y
	
	#line 7
	la a0, welcome
	li a7, 4 #this is a string 
	ecall	#print welcome



loop:
	# lines 8-9
	li t2, 'n' #load t2 as n
	beq t1, t2, end_loop # if t1 is equal to t2 then end loop 
	li t3,1	# set to 1
	li t4, 0 # set count = 0
	
	li a0, '\n'
	li a7, 11
	ecall #print new line
	
	# lines 12-14
	#print /n
	li a0, '\n'
	li a7, 11
	ecall #print new line
	
	la a0, number
	li a7, 4 #this is a string
	ecall #print number prompt 
	li a7, 5
	ecall #what number do we want?
	mv t0, a0 #store number in t0
	
	# math of bitwise: lines 17-22
	for_start: 
		mv t5, zero # i = 0, line 11
		li t6, 32
		li a4, 31 # for bit shifting left (line 23)
		li a3, 0 # reversed = 0
	for_loop:
		bgt t5, t6, for_end # if t5 is greater than t6 = 32 stop the for loop
		
		srl a1, t0, t5 # temp = num right shift by i
		andi a1, a1, 1 # temp = temp & 1
		sub a2, a4, t5 # a2 = 31-i
		sll a1, a1, a2 # temp = temp << (31-i)
		or a3, a3, a1 # reversed = reversed | temp
		
		addi t5, t5, 1 # i++
		b for_loop # loop for loop
	for_end:
	
	# countine? lines 25-27
	la a0, bits
	li a7, 4 #this is a string
	ecall #print number prompt 
	
	mv a0, a3
	li a7, 34 #this is a hexdecimal
	ecall #print number prompt 
	
	#print /n
	li a0, '\n'
	li a7, 11 #asciii character
	ecall #print new line
	
	la a0, continue # put continue into a0 for printing 
	li a7, 4 #print a string 
	ecall # print continue 
	
	li a7, 12 # scan for character (also tried it with a string 4. printed double countinue)
	ecall
	mv t1, a0 # set t1 to a0
	b loop # loop while
	
	#print /n
	li a0, '\n'
	li a7, 11 #asciii character
	ecall #print new line


end_loop:
	#print /n
	li a0, '\n'
	li a7, 11 #asciii character
	ecall #print new line
	
	la a0, exit
	li a7, 4 #this is a string 
	ecall	#print exit
	
	li a7, 10
	ecall # exit function
	


.data
welcome: .string "Welcome to the Reverse program."
number: .string "Please enter a number: "
character: .ascii 	"y"
noCharacter: .ascii  "n"
continue: .string "Continue (y/n)?: "
exit: .string "Exiting"
bits: .string "The bit reversed value in hex is: "
