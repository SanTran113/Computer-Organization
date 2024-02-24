#Name: Sai Rama Balakrishnan
#Name: San Tran
.globl swap
.globl selectionSort
.globl printArray

#struct def'n for reference
#struct studentNode {
#   char name[6];
#	li s0, 24() # load a word of max 6 characters
#   int studentid;
#	li s1, 0
#   int coursenum;
#	li s2, 0

#};

 
#/* Recursive function to perform selection sort on subarray `arr[i…n-1]` */
#void selectionSort(studentNode arr[], int i, int n) {
selectionSort:
#callee setup goes here
    addi sp, sp, -24 # move these two lines at top?
	sw ra, 20(sp)
	sw s3, 16(sp) # Node array
	sw s4, 12(sp) # i
	sw s5, 8(sp) # n
	
	sw s6, 4(sp) # j
	sw s7, 0(sp) # min
	
	mv s3, a0 # array
	mv s4, a1 # i
	mv s5, a2 # n
#    /* find the minimum element in the unsorted subarray `[i…n-1]`
#    // and swap it with `arr[i]`  */
#    int j;
	li s6, 0 # int j = 0 (33)
#    int min = i;
	mv s7, s4

#    for (j = i + 1; j < n; j++)    {
for1:
	addi s6, s4, 1 # j = i + 1

forloop1:
	bge s6, s5, endfor1  # j < n
#        /* if `arr[j]` is less, then it is the new minimum */
#        if (arr[j].studentid < arr[min].studentid) {
if1:
	# finding arr[j].studentid
	slli t0, s6, 4 # t0 = offset of s3(j) * 16
	add t1, t0, s3 # address of t0 in s0
	addi t1, t1, 8
	lw t4, 0(t1) # arr[j].studentid

	
	# finding arr[min].student
	slli t2, s7, 4 # t2 = offset of s4(min) * 16
	add t3, t2, s3 # address of t3 in s0
	addi t3, t3, 8
	lw t5, 0(t3) #arr{min}.studenti

	# actual if statement
	bge t4, t5, endif1 
	
#            min = j;    /* update the index of minimum element */
	mv s7, s6

#        }
endif1:
	addi s6, s6, 1 # j++
	b forloop1

endfor1:

#    }
 
#    /* swap the minimum element in subarray `arr[i…n-1]` with `arr[i] */
#caller setup goes here
	mv a0, s3  # arr
	mv a1, s7 # min
	mv a2, s4 # i

#    swap(arr, min, i);
	jal swap

#caller teardown goes here (if needed)
 
#    if (i + 1 < n) {
if2:
	addi t6, s4, 1 # i + 1
	bge t6, s5, endif2 # t6 < n
#caller setup goes here
	mv a0, s3 # arr
	mv a1, t6 # i + 1
	mv a2, s5 # n

#        selectionSort(arr, i + 1, n);
	jal selectionSort
#caller teardown goes here (if needed)


#    }
endif2:
    
#callee teardown goes here (if needed)
	lw s7, 0(sp) # min
	lw s6, 4(sp) # j
	lw s5, 8(sp) # n
	lw s4, 12(sp)# i
	lw s3, 16(sp) # arr
	
	lw ra, 20(sp)
	addi sp, sp 24
	ret

#}
 
#/* Function to print `n` elements of array `arr` */ 
#void printArray(studentNode arr[], int n) {
printArray:
#callee setup goes here
        addi    sp, sp, -16
        sw      ra, 12(sp) 
        sw      s0, 8(sp) # arr{}
        sw      s1, 4(sp) # n
        sw      s2, 0(sp) # i
        
        mv      s0, a0 # move arr into s0
        mv      s1, a1 # move n into s1
#    int i;
	mv s2, zero # move 0 into s2 aka i
#    for (i = 0; i < n; i++) {
for2:
	bge s2, s1, endfor2

forloop2:

#use ecalls to implement printf
#        printf("%d ", arr[i].studentid);
        slli    t0, s2, 4  # multiply index by 16 (each node is 16)
        add     t1, s0, t0 # add full index to base address.
        addi 	 t1, t1, 8 # go to studentID
        lw      a0, 0(t1)  # load arr[i].studentID
        
        li      a7, 1
        ecall              #print the arr[i].studentID
        
        li      a0, 0x20   
        li      a7, 11
        ecall              # print a space



#       printf("%s ", arr[i].name);
        slli    t2, s2, 4  # multiply index by 16
        add     t3, s0, t2 # add full index to base address.

       
       
       # print each character of the name:
       #li t0, 0 # i
       #li t1, 5 # 5
       #for3:
       #bge t0, t1, endfor3 # i < 5
        #addi   t6, t3, t0
        addi 	 t3, t3, 0 # start at t0 = 0
        #lw    a0, 0, (t6)
        #lw 	t2, 0(t1)
        #lw 	a0, 0(t3)
        mv 	a0, t3  # load arr[i]
        #mv a0, t0
       
        li      a7, 4
        ecall              #print the name
        #addi t0, t0, 1
        #b for3
       #endfor3:
         li      a0, 0x20   
         li      a7, 11
        ecall              # print a space


#        printf("%d\n", arr[i].coursenum);
        slli    t4, s2, 4  # multiply index by 4
        add     t5, s0, t4 # add full index to base address.
        addi 	 t5, t5, 12
        lw      a0, 0(t5)  # load arr[i]
       
        li      a7, 1
        ecall              #print the course number

         li      a0, 0x20   
         li      a7, 11
        ecall              # print a space
        
        
#i++
	li a0, '\n'
	li a7, 11
	ecall 
	
        addi    s2, s2, 1  # increment i
        b       for2

#    }
endfor2:

#caller teardown goes here
        lw      ra, 12(sp)
        lw      s0, 8(sp)
        lw      s1, 4(sp)
        lw      s2, 0(sp)
        addi    sp, sp, 16
        ret
#}
 
 

#/* Utility function to swap values at two indices in an array*/
#void swap(studentNode arr[], int i, int j) {
swap:
#caller setup goes here
	addi sp, sp, -16
	sw ra, 12(sp)
	
	sw a0, 8(sp) # store arr
	sw a1, 4(sp) # store min aka i
	sw a2, 0(sp) # store i aka j
	
#    studentNode temp = arr[i];
	slli t0, a1, 4
	add a3, a0, t0 # arr[i]
	lw t1, 12(a3)
	lw t2, 8(a3)
	lw t3, 4(a3)
	lw t4, 0(a3)


#    arr[i] = arr[j];
	slli t5, a2, 4
	add a4, a0, t5 # arr[j]
	
	lw t6, 12(a4)
	sw t6, 12(a3)

	lw t6, 8(a4)
	sw t6, 8(a3)
	
	lw t6, 4(a4)
	sw, t6, 4(a3)
	
	lw t6, 0(a4)
	sw t6, 0(a3)

#    arr[j] = temp;

	sw t1, 12(a4)
	sw t2, 8(a4)
	sw t3, 4(a4)
	sw t4, 0(a4)

#caller teardown goes here
	lw a2, 0(sp) # store i aka j
	lw a1, 4(sp) # store min aka i
	lw a0, 8(sp) # store arr

	lw ra, 12(sp)
	addi sp, sp, 16
	ret

#}
