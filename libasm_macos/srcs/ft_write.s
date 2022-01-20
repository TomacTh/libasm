section .text
	global	_ft_write
	extern	__error

_ft_write:
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
	call __error
	pop [rax]
	mov rax, -1
	leave
	ret
	
