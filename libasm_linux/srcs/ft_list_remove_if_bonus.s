section .text
	extern free
	global ft_list_remove_if

ft_list_remove_if:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	test rdi, rdi
	jz .return
	mov [rsp], rdi ; **begin_list -> top of the stack
	mov [rsp + 8], rsi ; dataref -> -1 stack
	mov [rsp + 16], rdx ; fcmp -> -2 stack
	mov [rsp + 24], rcx ; free_fct-> -3 stack
	mov QWORD [rsp + 32], 0 ; previous to 0
	mov r9, [rdi]
	mov [rsp + 40], r9 ; *beginlist/curr

.loop:	

	mov r8, [rsp + 40] ;r8 = *curr
	test r8, r8 ; test *curr
	jz .return
	mov rdi, [r8] ; rdi = curr->data
	mov rsi, [rsp + 8]
	mov [rsp + 48], r8 ; save curr to stack
	call [rsp + 16] ;
	mov r8, [rsp + 48] ;recup curr on stack
	test rax, rax
	jz .del
	mov [rsp + 32], r8 ; previous = current
	mov r8, [r8 + 8]
	mov [rsp + 40], r8 ; curr = curr->next
	jmp .loop

.del:
	mov r10, [rsp + 32]
	test r10, r10
	jz .del_begin


.del_elem:
	mov r9, [r8 + 8] ; r9 = curr->next
	mov [r10 + 8], r9 ; previous->next = r9
	mov [rsp + 48], r9 ; push curr->next to stack
	mov [rsp + 56], r8
	jmp .free_and_del

.del_begin:
	mov rdi, [rsp] ; rdi = **begin_list
	mov r9, [r8 + 8] ; r9 = curr->next
	mov [rdi], r9 ; *begin_list = curr->next 
	mov [rsp + 48], r9 ;push curr-next to stack
	mov [rsp + 56], r8
	jmp .free_and_del

.free_and_del:
	mov r8, [rsp + 56] ;recup curr
	mov rdi, [r8]  ; mov curr->data to rdi
	call [rsp + 24] ; call free_fct
	mov rdi, [rsp + 40] ; mov curr to rdi
	call free wrt ..plt ; free curr
	mov r9, [rsp + 48] ; r9 = oldcurr->next
	mov [rsp + 40], r9 ; curr = r9
	jmp .loop

.return:

	add rsp, 64
	leave
	ret
