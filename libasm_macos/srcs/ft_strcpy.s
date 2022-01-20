section .text
	global _ft_strcpy

_ft_strcpy:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

.loop:
	cmp BYTE [rsi + rcx], BYTE 0
	je .return
	mov dl, BYTE [rsi + rcx]
	mov BYTE [rdi + rcx], dl
	inc rcx
	jmp .loop

.return:
	mov BYTE [rdi + rcx], BYTE 0
	mov rax, rdi
	leave
	ret
