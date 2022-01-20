section .text

global ft_strlen

ft_strlen:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

.loop:
	cmp	BYTE [rdi + rcx], BYTE 0
	je .return
	inc rcx
	jmp .loop

.return:
	mov rax, rcx
	leave
	ret
