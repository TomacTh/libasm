section .text
	global _ft_list_sort

_ft_list_sort:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	xor rax, rax
	cmp rdi, 0
	jz .return
	cmp rsi, 0
	jz .return
	cmp qword [rdi], 0
	jz .return
	mov rcx, rsi
	mov r8, [rdi]
	

.beginlist: 
	mov r9, r8

.loop:
	cmp qword [r9 + 8],  0
	jz .return
	mov rdx, [r9 + 8]
	mov rdi, [r9];
	mov rsi, [rdx];
	mov [rsp], r8       ; push r8
	mov [rsp + 8], r9   ;push r9
	mov [rsp + 16], rdx ;push rdx
	mov [rsp + 24], rcx ; push rcx
	call rcx
	mov rcx, [rsp + 24]
	mov rdx, [rsp + 16]
	mov r9, [rsp + 8]
	mov r8, [rsp]
	cmp rax, 0
	jg .swap
	mov r9, [r9 + 8]
	jmp .loop

.swap:	
	mov r10, [rdx] ;el->next->data
	mov r11, [r9]; el->data
	mov [rdx], r11
	mov [r9], r10
	jmp .beginlist
	
.return
	add rsp, 32
	leave
	ret
