#Name: Sai Rama Balakrishnan
#Name: San Tran
.globl	recurSelectionSort
recurSelectionSort:
#struct Node* recurSelectionSort(struct Node* head) {
	addi sp, sp, -20
	sw ra, 16(sp)
	sw s0, 12(sp) # Node head
	sw s1, 8(sp) # min
	sw s2, 4(sp) # ptr
	sw s3, 0(sp) # beforemin
	
	mv s0, a0 #param Node* head moved to array

#	if (head->next == NULL)

	lw t1, 16(a0)
	#lw t1, 0(t1) # t1 = NULL
	bnez t1, endif

#		return head;
	mv a0, s0
	ret
endif:

#	struct Node* min = head;
	mv s1, s0
	
#	struct Node* beforeMin = NULL;
	#lw s3, zero# t2 = NULL
	mv s3, zero # t2 = NULL, \0

#	struct Node* ptr;

#	for (ptr = head; ptr->next != NULL; ptr = ptr->next) {
forinit:
	add s2, s0, x0 # ptr = head
	
forloop: 
	lw t1, 16(s2) # ptr -> next
	beqz t1, endfor # t2  = \0
#		if (ptr->next->studentid < min->studentid ) {
ifmin:
	#addi t1, t1, 8
	lw t3, 8(t1) # ptr->next->studentid
	
	#addi 
	lw t4, 8(s1)
	#slli t4, s1, 8
	bge t3, t4, endifmin
#			min = ptr->next;
	mv s1, t1

#			beforeMin = ptr;
	mv s3, s2

endifmin:
#		}
	mv s2, t1
	b forloop

endfor:
#	}

if2:
#	if (min != head)
	beq s1, s0, endif2
#		swapNodes(&head, head, min, beforeMin);
	# mv t6, s0
	#addi a0, sp, 12
	# mv a0, s0
	lw a0, 12(sp)
	mv a1, s0 # head
	mv a2, s1 # min
	mv a3, s3 # beforemin
	
	jal swapNodes
	
	

endif2:

#	head->next = recurSelectionSort(head->next);
	#lw a0, 20(s0)
	jal recurSelectionSort
	
#	return head;
	mv a0, s0
#}
	lw ra, 16(sp)
	lw s0, 12(sp) # Node head
	lw s1, 8(sp) # min
	lw s2, 4(sp) # ptr
	lw s3, 0(sp) # beforemin
	addi sp, sp, 20

	ret
