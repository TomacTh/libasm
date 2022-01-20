section .text

	global ft_list_size

ft_list_size:
	push rbp
	mov rbp, rsp
	xor rax, rax

.loop:
	test rdi, rdi
	jz .return
	mov rdi, [rdi + 8]
	inc rax
	jmp .loop

.return:
	leave
	ret
