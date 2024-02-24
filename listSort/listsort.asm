#Name: Sai Rama Balakrishnan
#Name: San Tran
.globl	recurSelectionSort
recurSelectionSort:
#struct Node* recurSelectionSort(struct Node* head) {
	addi sp, sp, -24
	sw ra, 20(sp)
	sw a0, 16(sp)#struct Node* head
	sw s0, 12(sp) # Node head
#	sw s1, 8(sp) # ptr
	sw s1 8(sp)# ptr
	sw s2, 4(sp) # min
	sw s3, 0 (sp)# beforemin
	
	mv s0, a0 #param Node* head moved to array

#	if (head->next == NULL)
	lw t1, 16(s0)
	#lw t1, 0(t1) # t1 = NULL
	bnez t1, endif
#		return head;
	b end
endif:

#	struct Node* min = head;
	mv s2, s0
	
#	struct Node* beforeMin = NULL;
	#lw s3, zero# t2 = NULL
	mv s3, zero # t2 = NULL, \0

#	struct Node* ptr;

#	for (ptr = head; ptr->next != NULL; ptr = ptr->next) {
forinit:
	add s1, s0, x0 # ptr = head
	
forloop: 
	lw t1, 16(s1) # ptr -> next
	beqz t1, endfor # t1 = \0
#		if (ptr->next->studentid < min->studentid ) {
ifmin:
	#addi t1, t1, 8
	lw t5, 8(t1) # ptr->next->studentid
	
	#addi 
	lw t6, 8(s2)
	#slli t4, s1, 8
	bge t5, t6, endifmin
#			min = ptr->next;
	mv s2, t1 #t1 = ptr-> next

#			beforeMin = ptr;
	mv s3, s1

endifmin:
#		}
	mv s1, t1 #ptr = ptr->next
	b forloop

endfor:
#	}

if2:
#	if (min != head)
	beq s2, s0, endif2
#		swapNodes(&head, head, min, beforeMin);
	# mv t6, s0
	addi a0, sp, 16
	mv a1, s0 # head
	mv a2, s2 # min
	mv a3, s3 # beforemin
	jal swapNodes

endif2:

#	head->next = recurSelectionSort(head->next);

	lw t0, 16(sp)#struct head*
	lw a0, 16(t0)
	jal recurSelectionSort
	
	lw t0, 16(sp) #struct head*
	sw a0, 16(t0) #head->next
	

end:
#	return head;
	#mv a0, s0
#}
	lw ra, 20(sp)
	lw a0, 16(sp)
	lw s0, 12(sp) # Node head
	lw s1, 8(sp) 
	lw s2, 4(sp)
	lw s3, 0(sp)
	addi sp, sp, 24
	ret
