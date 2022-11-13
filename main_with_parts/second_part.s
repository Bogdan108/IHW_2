	.file	"second_part.c"
	.intel_syntax noprefix
	.text
	.globl	readStr
	.type	readStr, @function
readStr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
    # получили адрес на строку ptrStr, которую нужно заполнить и положили 
    # на стек функции по смещению PTR -8[rbp]
	# положим адрес на строку ptrStr в регистр r12 
	mov	 r12, rdi 
	mov	rdx, QWORD PTR stdin[rip]
	mov	rax, r12
	mov	esi, 1048576
	mov	rdi, rax
	call	fgets@PLT
	nop
	leave
	ret
	.size	readStr, .-readStr
	.globl	readStrFile
	.type	readStrFile, @function
readStrFile:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
    # получили адрес на строку ptrStr, которую нужно заполнить и положили 
    # на стек функции по смещению PTR -8[rbp]
	# положим адрес на строку ptrStr в регистр r12
	mov	r12, rdi
    # получили адрес на файл s, с которого нужно считать данные и положили 
    # на стек функции по смещению PTR -16[rbp]
	# положим аадрес на файл s в регистр r13
	mov	r13, rsi
	mov	rdx, r13
	mov	rax, r12
	mov	esi, 1048576
	mov	rdi, rax
	call	fgets@PLT
	nop
	leave
	ret
	.size	readStrFile, .-readStrFile
	.globl	findMinMax
	.type	findMinMax, @function
findMinMax:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
    # получили адрес на строку ptrStr, которую нужно проанализировать и положили 
    # на стек функции по смещению PTR -24[rbp]
	# положим адрес на строку ptrStr в регистр r12
	mov	r12, rdi
    # получили адрес на charMin, который нужно найти и положили 
    # на стек функции по смещению PTR -32[rbp]
	# адрес на charMin положим  в регистр r13
	mov	r13, rsi
    # определили локальную переменную char charMax и положили 
    # на стек функции по смещению PTR -9[rbp]
	# локальную переменную char charMax положим в r14
	mov	r14b, 0
	mov	rax, r12
	mov	rdi, rax
	call	strlen@PLT
    # определили локальную переменную unsigned int sizeStr и положили 
    # на стек функции по смещению PTR -4[rbp]
	# локальную переменную unsigned int sizeStr положим в регистр r15
	mov	r15d, eax
	cmp	r15d, 1
	jne	.L4
	mov	rax, r12
	movzx	eax, BYTE PTR [rax]
	mov	r14b, al
	mov	rax, r13
	movzx	edx, r14b
	mov	BYTE PTR [rax], dl
	jmp	.L5
.L4:
    # определили локальную переменную unsigned int i и положили 
    # на стек функции по смещению PTR -8[rbp]
	# локальную переменную unsigned int i положим в регистр rbx
	mov	ebx, 0
	jmp	.L6
.L9:
	mov	edx, ebx
	mov	rax,  r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	r14b, al
	jge	.L7
	mov	edx, ebx
	mov	rax, r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	r14b, al
.L7:
	mov	edx, ebx
	mov	rax, r12
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, r13
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jge	.L8
	mov	edx, ebx
	mov	rax, r12
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, r13
	mov	BYTE PTR [rax], dl
.L8:
	add	ebx, 1
.L6:
	mov	eax, r15d
	sub	eax, 1
	cmp	ebx, eax
	jb	.L9
.L5:
    # возвращаем локальную переменную charMax
	movzx	eax, r14b
	leave
	ret
	.size	findMinMax, .-findMinMax
	.globl	generateStr
	.type	generateStr, @function
generateStr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
    # получили адрес на строку ptrStr, которую нужно проанализировать и положили 
    # на стек функции по смещению PTR -24[rbp]
	# адрес на строку ptrStr положим в регистр r12
	mov	r12, rdi
    # получили размер массива size_array, который нужно сгенерировать и положили 
    # на стек функции по смещению PTR -28[rbp]
	# размер массива size_array кладём в регистр r13
	mov	r13d, esi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
    # определили локальную переменную unsigned int i и положили 
    # на стек функции по смещению PTR -4[rbp]
	# локальную переменную unsigned int i кладём в регистр r14
	mov	r14d, 0
	jmp	.L12
.L13:
	call	rand@PLT
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 715827883
	shr	rax, 32
	mov	ecx, eax
	sar	ecx, 4
	mov	eax, edx
	sar	eax, 31
	sub	ecx, eax
	mov	eax, ecx
	add	eax, eax
	add	eax, ecx
	sal	eax, 5
	sub	edx, eax
	mov	ecx, edx
	mov	eax, ecx
	lea	ecx, 32[rax]
	mov	edx, r14d
	mov	rax, r12
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	r14d, 1
.L12:
	mov	eax, r13d
	sub	eax, 1
	cmp	r14d, eax
	jb	.L13
	mov	eax, r13d
	cdqe
	lea	rdx, -1[rax]
	mov	rax, r12
	add	rax, rdx
	mov	BYTE PTR [rax], 10
	mov	eax, r13d
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	leave
	ret
	.size	generateStr, .-generateStr
	.section	.rodata
	.align 8
.LC0:
	.string	"A symbol with a huge numerical value %c (value - %d)\n"
	.align 8
.LC1:
	.string	"A symbol with a small numerical value %c (value - %d)\n"
	.text
	.globl	writeStr
	.type	writeStr, @function
writeStr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	edx, edi
	mov	eax, esi
    # получаем перемеенную charMax и положили 
    # на стек функции по смещению PTR -4[rbp]
	# перемеенную charMax кладём в регистр r12
	mov	r12b, dl
    # получаем перемеенную charMin и положили 
    # на стек функции по смещению PTR -8[rbp]
	# перемеенную charMin кладём в регистр r13
	mov	r13b, al
	movsx	edx, r12b
	movsx	eax, r12b
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	movsx	edx, r13b
	movsx	eax, r13b
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	nop
	leave
	ret
	.size	writeStr, .-writeStr
	.globl	writeStrFile
	.type	writeStrFile, @function
writeStrFile:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	ecx, edi
	mov	eax, esi
    # получаем адрес на файл, куда нам нужно вывести данные и положили 
    # на стек функции по смещению PTR -16[rbp]
	# адрес на файл кладём в регистр r12
	mov	r12, rdx
	mov	edx, ecx
    # получаем перемеенную charMax и положили 
    # на стек функции по смещению PTR -4[rbp]
	# перемеенную charMax кладём в регистр r13
	mov	r13b, dl
    # получаем перемеенную charMin и положили 
    # на стек функции по смещению PTR -8[rbp]
	# перемеенную charMin кладём в регистр r14
	mov	r14b, al
	movsx	ecx, r13b
	movsx	edx, r13b
	mov	rax, r12
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	movsx	ecx, r14b
	movsx	edx, r14b
	mov	rax, r12
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	nop
	leave
	ret
	.size	writeStrFile, .-writeStrFile
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
