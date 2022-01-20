section .text

	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

_ft_strdup:
	push rbp
	mov rbp, rsp

.loop:
	call _ft_strlen
	inc rax
	push rdi
	mov rdi, rax
	call _malloc
	pop rdi
	test rax, rax
	jz .return
	mov rsi, rdi
	mov rdi, rax
	call _ft_strcpy

.return:
	leave
	ret
