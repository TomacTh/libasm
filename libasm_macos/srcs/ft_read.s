section .text
	global _ft_read
	extern __errno_location
_ft_read:
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
	call __errno_location
	pop [rax]
	mov rax, -1
	leave
	ret
