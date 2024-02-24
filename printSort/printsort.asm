.text 
.global main 

main:
	la t0, mylist 	# get start of mylist  
	li s5, 0 	# int i = 0
	li s6, 0 	# int f = 0	
	

	
while:
# add true 
	#variables 
	li s2, 0	# load size = 0
	li s0, 'z' 	# loads "z" as min 
	li s1, 'A' 	# loads "A" as max 
	li s5, 0	# run0 = true, now it is going to be set to 0
	
for_loop_size:
	li s5, 0 	# i = 0

	jal readString
	la t0, mylist 	# put it into t0
	li t3, 20 	# less than 20
	blt t1, t3, if_end_size
	if_size:
		li s4, '\0' 	# set a value to null ('\0') 
		la t0, mylist
		add t0, t0, s5 	# index by s5 (i)
		lb t4, 0(t0)
		bne s3, s4, if_end_size
	if_else :
		addi s2, s2, 1 # size += 1
		addi s5, s5, 1 
	if_end_size:	
	b for_loop_size 
for_loop_size_end:

for_start_sort:
	li s6, 0 # int f = 0
	blt s5, s2, for_end_sort
	li t2, 0 	# repeats = 0
	if_iteration:
		bne s5, zero, if_iteration_end
		
		# min loop
		li s5, 0 # i = 0
		for_min: 
			if_min:
			la t0, mylist
			add t0, t0, s5
			lb t6, 0(t0)
			bge t6, s0, for_min_end 	#str[i] < min
			mv s0, t6 			# min = str[i]
			if_min_end:
		addi s5, s5, 1	# i++
		b for_min
		for_min_end:
		
		li s5, 0 # i = 0
		for_max: 
			if_max:
			la t0, mylist
			add t0, t0, t1
			lb t6, 0(t0)
			bge t6, s0, for_max_end 	#str[i] > max
			mv s1, s3 	# max = str[i]
			if_max_end:
		addi s5, s5, 1 	# i++
		b for_max
		for_max_end:	
		li a5, 1 	# run0 = false (run0 is now 1 and not 0)
	addi s5, s5, 1 # f++
	if_iteration_end: 
	if_iteration_else:
		mv _, s0	# prev = min 
		mv s0, s1	# min = max 
		li s5, 0	# i = 0
		for_sorting:
			bge t1, s2, for_sorting_end
			 if_sorting:
			 ble s3, s5, if_sorting_end # str[i] > prev
			 	if_sorting_min:
			 	bge s3, s0 , if_sorting_min_end # str[i] < min 
			 	mv s0, s3
			 	if_sorting_min_end:
			 if_sorting_end:
			 addi s5, s5, 1 # i++
		for_sorting_end:
	b for_start_sort
for_end_sort:

li s5, 0	# i = 0
forrepeats:
	bge s5, s2, for_repeats_end # for (i < size)
	if_repeats:
		bne s3, s0, if_repeats_end # str[i] == min 
		addi t2, t2, 1 	# repeats += 1
for_repeats_end:
li a3, 1	# save 1 for subtraction
sub t5, t2, a3	# repeats - 1 
add s6, s6, t5 # f += t5

li t0, 0 # i = 0
for_print:
	bge t0, t5, for_print_end	# for (i < repeats)
	mv a0, s0 
	jal printChar
for_print_end:	
addi s6, s6, 1
b while 
while_end:

	
mylist:
	.space 20 #allocates 1*20 spaces 
		.data
welcome: 	.string "Welcome to the Calculator program.\n"
orginal 	.string "Original word: "
alp		.string "Alphabetized word: "
exit 		.string "\nExiting"

