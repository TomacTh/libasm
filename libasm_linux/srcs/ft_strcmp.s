section .text
	global ft_strcmp

ft_strcmp:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rdx, rdx

.loop:
	mov al, BYTE [rdi]
	test al, al
	jz .return
	cmp al, BYTE [rsi]
	jnz .return
	inc rdi 
	inc rsi
	jmp .loop

.return:
	mov dl, BYTE [rsi]
	sub rax, rdx
	leave
	ret
