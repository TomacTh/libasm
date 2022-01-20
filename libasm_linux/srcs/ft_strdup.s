section .text

	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

ft_strdup:
	push rbp
	mov rbp, rsp

.loop:
	call ft_strlen
	inc rax
	push rdi
	mov rdi, rax
	call malloc wrt ..plt
	pop rdi
	test rax, rax
	jz .return
	mov rsi, rdi
	mov rdi, rax
	call ft_strcpy

.return:
	leave
	ret
