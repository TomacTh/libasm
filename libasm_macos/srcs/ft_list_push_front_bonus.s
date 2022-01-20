section .text
	global _ft_list_push_front
	extern _malloc

_ft_list_push_front:
	push rbp
	mov rbp, rsp
	xor rax, rax
	test rdi, rdi
	jz .return

.create_el:
	push rdi
	mov rdi, 16
	push rsi
	call malloc wrt ..plt
	pop rsi
	pop rdi
	test rax, rax
	jz .return

.swap:	
	mov [rax], rsi
	mov r8, [rdi]
	mov [rax + 8], r8
	mov [rdi], rax

.return:
	leave ; pop rbp
	ret
