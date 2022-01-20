section .text
	global	ft_write
	extern	__errno_location

ft_write:
	push rbp
	mov rbp, rsp
	xor rax, rax
	inc rax
	syscall
	cmp rax, 0
	js .err
	leave
	ret

.err:
	neg rax
	push rax
	call __errno_location wrt ..plt
	pop [rax]
	mov rax, -1
	leave
	ret
	
