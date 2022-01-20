section .text
	global ft_read
	extern __errno_location
ft_read:
	push rbp
	mov rbp, rsp
	xor rax, rax
	syscall
	cmp rax, 0
	jl .err
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
