	.file	"main_part.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"time"
.LC1:
	.string	"random"
.LC2:
	.string	"file"
.LC3:
	.string	"r"
.LC4:
	.string	"Cannot open input file."
.LC5:
	.string	"w"
.LC6:
	.string	"Cannot open output file."
.LC7:
	.string	"Not valid command!"
.LC9:
	.string	"Work time: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	lea	r11, -1048576[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 96
	mov	DWORD PTR -1048660[rbp], edi
	mov	QWORD PTR -1048672[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	BYTE PTR -1048646[rbp], 127
	mov	DWORD PTR -1048644[rbp], 0
	mov	DWORD PTR -1048640[rbp], 1
	cmp	DWORD PTR -1048660[rbp], 1
	jle	.L2
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L3
	mov	DWORD PTR -1048640[rbp], 2
.L3:
	mov	eax, DWORD PTR -1048640[rbp]
	cmp	eax, DWORD PTR -1048660[rbp]
	jge	.L2
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L4
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	edx, eax
	lea	rax, -1048592[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	generateStr@PLT
	mov	DWORD PTR -1048644[rbp], 1
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L5
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -1048632[rbp], rax
	cmp	QWORD PTR -1048632[rbp], 0
	jne	.L6
	lea	rdi, .LC4[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L18
.L6:
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	add	rax, 2
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -1048624[rbp], rax
	cmp	QWORD PTR -1048624[rbp], 0
	jne	.L8
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -1048632[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 1
	jmp	.L18
.L8:
	mov	DWORD PTR -1048644[rbp], 2
	jmp	.L2
.L5:
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L18
.L2:
	cmp	DWORD PTR -1048644[rbp], 0
	je	.L9
	cmp	DWORD PTR -1048644[rbp], 2
	jne	.L10
	mov	rdx, QWORD PTR -1048632[rbp]
	lea	rax, -1048592[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	readStrFile@PLT
	mov	rax, QWORD PTR -1048632[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L10
.L9:
	lea	rax, -1048592[rbp]
	mov	rdi, rax
	call	readStr@PLT
.L10:
	cmp	DWORD PTR -1048640[rbp], 2
	je	.L11
	lea	rdx, -1048646[rbp]
	lea	rax, -1048592[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	findMinMax@PLT
	mov	BYTE PTR -1048645[rbp], al
	jmp	.L12
.L11:
	call	clock@PLT
	mov	QWORD PTR -1048616[rbp], rax
	mov	DWORD PTR -1048636[rbp], 0
	jmp	.L13
.L14:
	lea	rdx, -1048646[rbp]
	lea	rax, -1048592[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	findMinMax@PLT
	mov	BYTE PTR -1048645[rbp], al
	add	DWORD PTR -1048636[rbp], 1
.L13:
	cmp	DWORD PTR -1048636[rbp], 999999
	jle	.L14
	call	clock@PLT
	mov	QWORD PTR -1048608[rbp], rax
	mov	rax, QWORD PTR -1048608[rbp]
	sub	rax, QWORD PTR -1048616[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC8[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -1048600[rbp], xmm0
	cmp	DWORD PTR -1048644[rbp], 2
	jne	.L15
	mov	rdx, QWORD PTR -1048600[rbp]
	mov	rax, QWORD PTR -1048624[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	jmp	.L12
.L15:
	mov	rax, QWORD PTR -1048600[rbp]
	movq	xmm0, rax
	lea	rdi, .LC9[rip]
	mov	eax, 1
	call	printf@PLT
.L12:
	cmp	DWORD PTR -1048644[rbp], 2
	jne	.L16
	movzx	eax, BYTE PTR -1048646[rbp]
	movsx	ecx, al
	movsx	eax, BYTE PTR -1048645[rbp]
	mov	rdx, QWORD PTR -1048624[rbp]
	mov	esi, ecx
	mov	edi, eax
	call	writeStrFile@PLT
	mov	rax, QWORD PTR -1048624[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L17
.L16:
	movzx	eax, BYTE PTR -1048646[rbp]
	movsx	edx, al
	movsx	eax, BYTE PTR -1048645[rbp]
	mov	esi, edx
	mov	edi, eax
	call	writeStr@PLT
.L17:
	mov	eax, 0
.L18:
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC8:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
