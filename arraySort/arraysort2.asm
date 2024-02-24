
.globl swap 
.globl selectionSort
 
#void selectionSort(int arr[], int i, int n){
selectionSort:
# callee setup goes here
	addi sp, sp, -24 # move these two lines at top?
	sw ra, 20(sp)
	sw s0, 16(sp) # array
	sw s1, 12(sp) # i
	sw s2, 8(sp) # n
	sw s3, 4(sp) # j
	sw s4, 0(sp) # min
	
	mv s0, a0 # array
	mv s1, a1 # i
	mv s2, a2 # n
#    /* find the minimum element in the unsorted subarray `[i…n-1]`
#    // and swap it with `arr[i]`  */
#    int j;
	mv s3, a3 # int j = 0 (33)
#    int min = i;
	mv s4, s1 # min = i

#    for (j = i + 1; j < n; j++)    {
for:
#j = i + 1;
	addi s3, s1, 1

forloop:
# j < n
	bge s3, s2, endfor 

#        /* if `arr[j]` is less, then it is the new minimum */
#        if (arr[j] < arr[min]) {
if1:
	slli t0, s3, 2 # t0 = offset of s3(j) * 2 
	add t0, t0, s0 # address of t0 in s0
	lw t1, 0(t0) # t1 = t0
	
	slli t2, s4, 2 # t2 = offset of s4(min) * 2
	add t2, t2, s0 # address of t2 in s0
	lw t3, 0(t2) # t3 = t2
	bge t1, t3, endif1 
	
	
	#lw t5, 4(t0) # arr[j]
	#lw t6, 0(t0) # arr[min]
	#bge t5, t6, endif1
#            min = j;    /* update the index of minimum element */
	mv s4, s3
	
#        }
endif1:
	addi s3, s3, 1 # j++
	b forloop
#    }
endfor:
 
#    /* swap the minimum element in subarray `arr[i…n-1]` with `arr[i] */
#    swap(arr, min, i);
#caller setup and subroutine call for swap goes here.	
	# for jal swap 
	mv a0, s0  # arr
	mv a1, s4 # min
	mv a2, s1 # i
	
	jal swap

#caller teardown for swap goes here (if needed).

#    if (i + 1 < n) {
if2:
	addi t6, s1, 1 # i + 1
	bge t6, s2, endif2
	
#        selectionSort(arr, i + 1, n);
#caller setup and subroutine call for selectionSort goes here.
	mv a0, s0
	mv a1, t6
	mv a2, s2

	jal selectionSort
#caller teardown for selectionSort goes here (if needed).
	
#    }
endif2:

# callee teardown goes here
	lw s4, 0(sp) # min
	lw s3, 4(sp) # j
	lw s2, 8(sp) # n
	lw s1, 12(sp)# i
	lw s0, 16(sp) # arr
	
	lw ra, 20(sp)
	addi sp, sp 24
	ret

#}

 

#/* Utility function to swap values at two indices in an array*/
#void swap(int arr[], int i, int j) {
swap: 
# swap callee setup goes here
	addi sp, sp, -16
	sw ra, 12(sp)
	
	sw a0, 8(sp) # store arr
	sw a1, 4(sp) # store min aka i
	sw a2, 0(sp) # store i aka j
	
	#is this viable?
	mv t0, a0 # arr
	mv t1, a1 # i
	mv t2, a2 # j
	
#    int temp = arr[j];
#	lw t3, 16(sp) # arr[i]
	slli t3, t1, 2
	add t3, t3, t0
	lw t4, 0(t3)
#    int temp = arr[i];
#	lw t5, 16(sp) # arr[j]
	slli t5, t2, 2
	add t5, t5, t0
	lw t6, 0(t5) 
#    arr[i] = arr[j];
	sw t6, 0(t3)
	
#    arr[j] = temp;
	sw t4, 0(t5)
	
# swap callee teardown goes here
	lw a2, 0(sp) # store i aka j
	lw a1, 4(sp) # store min aka i
	lw a0, 8(sp) # store arr

	lw ra, 12(sp)
	addi sp, sp, 16
	ret

