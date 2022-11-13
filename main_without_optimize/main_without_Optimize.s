	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	readStr
	.type	readStr, @function
readStr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rdx, QWORD PTR stdin[rip]
	mov	rax, QWORD PTR -8[rbp]
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
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
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
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	BYTE PTR -9[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -4[rbp], eax
	cmp	DWORD PTR -4[rbp], 1
	jne	.L4
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al
	mov	rax, QWORD PTR -32[rbp]
	movzx	edx, BYTE PTR -9[rbp]
	mov	BYTE PTR [rax], dl
	jmp	.L5
.L4:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L6
.L9:
	mov	edx, DWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	BYTE PTR -9[rbp], al
	jge	.L7
	mov	edx, DWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al
.L7:
	mov	edx, DWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jge	.L8
	mov	edx, DWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
.L8:
	add	DWORD PTR -8[rbp], 1
.L6:
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cmp	DWORD PTR -8[rbp], eax
	jb	.L9
.L5:
	movzx	eax, BYTE PTR -9[rbp]
	leave
	ret
	.size	findMinMax, .-findMinMax
	.globl	generateStr
	.type	generateStr, @function
generateStr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -4[rbp], 0
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
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -28[rbp]
	sub	eax, 1
	cmp	DWORD PTR -4[rbp], eax
	jb	.L13
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 10
	mov	eax, DWORD PTR -28[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
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
	mov	BYTE PTR -4[rbp], dl
	mov	BYTE PTR -8[rbp], al
	movsx	edx, BYTE PTR -4[rbp]
	movsx	eax, BYTE PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	movsx	edx, BYTE PTR -8[rbp]
	movsx	eax, BYTE PTR -8[rbp]
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
	mov	QWORD PTR -16[rbp], rdx
	mov	edx, ecx
	mov	BYTE PTR -4[rbp], dl
	mov	BYTE PTR -8[rbp], al
	movsx	ecx, BYTE PTR -4[rbp]
	movsx	edx, BYTE PTR -4[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	movsx	ecx, BYTE PTR -8[rbp]
	movsx	edx, BYTE PTR -8[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	nop
	leave
	ret
	.size	writeStrFile, .-writeStrFile
# представление константных строк 
	.section	.rodata
.LC2:
	.string	"time"
.LC3:
	.string	"random"
.LC4:
	.string	"file"
.LC5:
	.string	"r"
.LC6:
	.string	"Cannot open input file."
.LC7:
	.string	"w"
.LC8:
	.string	"Cannot open output file."
.LC9:
	.string	"Not valid command!"
.LC11:
	.string	"Work time: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
	# пушим указатель фрейма
	push	rbp
	mov	rbp, rsp
	# выделяем место под массив char
	lea	r11, -1048576[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 96
	# переменная int argc
	mov	DWORD PTR -1048660[rbp], edi
	# начало массива указателей на char char *argv[]
	mov	QWORD PTR -1048672[rbp], rsi
	# кладём канарейку на стек
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	# переменная char charMin
	mov	BYTE PTR -1048646[rbp], 127
	# переменная int amount
	mov	DWORD PTR -1048644[rbp], 0
	# переменная int timeInd
	mov	DWORD PTR -1048640[rbp], 1
	# условие на обработку аргументов командной строки с помощью переменной int argc
	cmp	DWORD PTR -1048660[rbp], 1
	jle	.L17
	# начало массива указателей на char char *argv[] кладем в rax для включения определенного режима работы программы
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L18
	# переменная int timeInd
	mov	DWORD PTR -1048640[rbp], 2
.L18:
	# переменная int timeInd
	mov	eax, DWORD PTR -1048640[rbp]
	# сравнение с переменной int argc для определенного режима работы программы 
	cmp	eax, DWORD PTR -1048660[rbp]
	jge	.L17
	# переменная int timeInd
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	# начало массива указателей на char char *argv[] кладем в rax для включения определенного режима работы программы
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L19
	# переменная int timeInd
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	# начало массива указателей на char char *argv[] кладем в rax для изъятия размера генерируемого массива
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	edx, eax
	# адрес на начало массива strMain
	lea	rax, -1048592[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	generateStr
	# переменная int amount
	mov	DWORD PTR -1048644[rbp], 1
	jmp	.L17
.L19:
	# переменная int timeInd
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	# начало массива указателей на  char *argv[] кладем в rax для включения определенного режима работы программы
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L20
	# переменная int timeInd
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	# начало массива указателей на char *argv[] кладём в rax для изъятия файла ввода
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	# указатель на файл с входными данными input_file 
	mov	QWORD PTR -1048632[rbp], rax
	cmp	QWORD PTR -1048632[rbp], 0
	jne	.L21
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L33
.L21:
	# переменная int timeInd
	mov	eax, DWORD PTR -1048640[rbp]
	cdqe
	add	rax, 2
	lea	rdx, 0[0+rax*8]
	# начало массива указателей на char *argv[] кладём в rax для изъятия файла вывода
	mov	rax, QWORD PTR -1048672[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	# указатель на файл с входными данными output_file 
	mov	QWORD PTR -1048624[rbp], rax
	cmp	QWORD PTR -1048624[rbp], 0
	jne	.L23
	lea	rdi, .LC8[rip]
	call	puts@PLT
	# указатель на файл с входными данными input_file 
	mov	rax, QWORD PTR -1048632[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 1
	jmp	.L33
.L23:
	# переменная int amount
	mov	DWORD PTR -1048644[rbp], 2
	jmp	.L17
.L20:
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L33
.L17:
	# сравнения с переменной int amount для определения считывания данных
	cmp	DWORD PTR -1048644[rbp], 0
	je	.L24
	# сравнения с переменной int amount для определения считывания данных
	cmp	DWORD PTR -1048644[rbp], 2
	jne	.L25
	# указатель на файл с входными данными input_file 
	mov	rdx, QWORD PTR -1048632[rbp]
	# адрес на начало массива strMain
	lea	rax, -1048592[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	readStrFile
	# указатель на файл с входными данными input_file 
	mov	rax, QWORD PTR -1048632[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L25
.L24:
	# адрес на начало массива strMain
	lea	rax, -1048592[rbp]
	mov	rdi, rax
	call	readStr
.L25:
	# переменная int timeInd индикатор для режима подсчёта времени
	cmp	DWORD PTR -1048640[rbp], 2
	je	.L26
	# берём адрес переменной char charMin и кладём в функцию findMinMax
	lea	rdx, -1048646[rbp]
	# адрес на начало массива strMain
	lea	rax, -1048592[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	findMinMax
	# кладём в переменную char charMax результат выполненной функции
	mov	BYTE PTR -1048645[rbp], al
	jmp	.L27
.L26:
	call	clock@PLT
	# переменная clock_t start 
	mov	QWORD PTR -1048616[rbp], rax
	# переменная int i
	mov	DWORD PTR -1048636[rbp], 0
	jmp	.L28
.L29:
	# берём адрес переменной char charMin и кладём в функцию findMinMax
	lea	rdx, -1048646[rbp]
	# адрес на начало массива strMain
	lea	rax, -1048592[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	findMinMax
	# кладём в переменную char charMax результат выполненной функции
	mov	BYTE PTR -1048645[rbp], al
	# переменная int i
	add	DWORD PTR -1048636[rbp], 1
.L28:
	# переменная int i
	cmp	DWORD PTR -1048636[rbp], 999999
	jle	.L29
	call	clock@PLT
	# переменная clock_t end 
	mov	QWORD PTR -1048608[rbp], rax
	# переменная clock_t end 
	mov	rax, QWORD PTR -1048608[rbp]
	sub	rax, QWORD PTR -1048616[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm1
	#  кладём результат вычитания в перемеенную int result
	movsd	QWORD PTR -1048600[rbp], xmm0
	# сравнения с переменной int amount для определения вывода данных
	cmp	DWORD PTR -1048644[rbp], 2
	jne	.L30
	#  переменную int result кладём в функцию writeStrFile
	mov	rdx, QWORD PTR -1048600[rbp]
	# указатель на файл с входными данными output_file кладём в функцию fprintf и fclose
	mov	rax, QWORD PTR -1048624[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC11[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	jmp	.L27
.L30:
	#  переменную int result кладём в функцию writeStr
	mov	rax, QWORD PTR -1048600[rbp]
	movq	xmm0, rax
	lea	rdi, .LC11[rip]
	mov	eax, 1
	call	printf@PLT
.L27:
	# сравнения с переменной int amount для определения считывания данных
	cmp	DWORD PTR -1048644[rbp], 2
	jne	.L31
	# берём значение переменной char charMin и кладём в функцию writeStrFile
	movzx	eax, BYTE PTR -1048646[rbp]
	movsx	ecx, al
	# берём значение переменной char charMax и кладём в функцию writeStrFile
	movsx	eax, BYTE PTR -1048645[rbp]
	# указатель на файл с входными данными output_file 
	mov	rdx, QWORD PTR -1048624[rbp]
	mov	esi, ecx
	mov	edi, eax
	call	writeStrFile
	# указатель на файл с входными данными output_file 
	mov	rax, QWORD PTR -1048624[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L32
.L31:
	# берём значение переменной char charMin и кладём в функцию writeStr
	movzx	eax, BYTE PTR -1048646[rbp]
	movsx	edx, al
	# берём значение переменной char charMax и кладём в функцию writeStr
	movsx	eax, BYTE PTR -1048645[rbp]
	mov	esi, edx
	mov	edi, eax
	call	writeStr
.L32:
	mov	eax, 0
.L33:
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC10:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
