section .text

	global ft_atoi_base
	extern ft_strlen

check_base:
	push rbp
	mov rbp, rsp
	push rdi

.first_loop: 
	cmp BYTE [rdi], BYTE 0
	jz .get_old_rdi
	call is_space
	test rax, rax
	jnz .err1
	cmp BYTE [rdi], BYTE 43
	jz .err1
	cmp BYTE [rdi], BYTE 45
	jz .err1
	inc rdi
	jmp .first_loop

.get_old_rdi:
	mov rax, 1
	pop rdi

.begin_loop:
	cmp BYTE [rdi], BYTE 0
	jz .return
	mov rdx, rdi
	inc rdx
	
.detect_double_loop:
	cmp BYTE [rdx], BYTE 0
	jz .next_rdi
	mov r8b , BYTE [rdx]
	cmp BYTE [rdi], r8b
	jz .err
	inc rdx
	jmp .detect_double_loop

.next_rdi: 
	inc rdi
	jmp .begin_loop
	
.err1:	
	pop rdi
.err:
	xor rax, rax
.return:
	leave
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

is_space:
	push rbp
	mov rbp, rsp
	xor rax, rax
	cmp BYTE [rdi],  BYTE 32
	jz .is
	cmp BYTE [rdi], BYTE 9
	jl .return
	cmp BYTE [rdi], BYTE 13
	jg .return
.is:
	mov rax, 1
.return:
	leave
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

is_in_base:
	push rbp
	mov rbp, rsp
	xor rdx, rdx
	xor rax, rax
.loop:	
	mov r9b, BYTE [rdi]
	cmp BYTE [rsi + rdx], BYTE 0
	jz .return
	cmp r9b, BYTE [rsi + rdx]
	jz .found
	inc rdx
	jmp .loop
.found:
	mov rax, 1
.return:
	leave
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ft_atoi_base:
	push rbp
	mov rbp, rsp
	test rdi, rdi
	jz .err
	test rsi, rsi 
	jz .err
	push rdi
	mov rdi, rsi
	call ft_strlen
	cmp rax, 2 
	jl .err1
	mov rcx, rax ;baselen ->rcx
	call check_base
	pop rdi
	test rax, rax
	jz .err
	mov r8, 1

.skip_space:
	push rdi
	call is_space
	pop rdi
	test rax, rax
	jz .skip_sign
	inc rdi
	jmp .skip_space

.skip_sign:
	cmp BYTE [rdi], BYTE 43
	jz .sign_pos
	cmp BYTE [rdi], BYTE 45
	jz .sign_neg
	jmp .calc

.sign_pos:
	imul r8, 1
	inc rdi
	jmp .skip_sign

.sign_neg:
	imul r8, -1
	inc rdi
	jmp .skip_sign

.calc:
	xor rax, rax
	
.calc_loop:
	push rax
	call is_in_base
	test rax, rax
	jnz .add
	pop rax
	jmp .return_num

.add:
	pop rax
	imul rax, rcx
	add rax, rdx
	inc rdi
	jmp .calc_loop

.return_num:
	imul rax, r8
	jmp .end

.err1: 
	pop rdi
.err:	
	xor rax, rax
	
.end:
	leave
	ret
