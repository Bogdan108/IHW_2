	.file	"main.c"
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
	# адрес на начало массива strMain кладём в функцию generateStr
	lea	rax, -1048592[rbp]
    # кладём размер массива для генерации в  функцию generateStr
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
	# указатель на файл с входными данными input_file передаём в функцию readStrFile 
	mov	rdx, QWORD PTR -1048632[rbp]
	# адрес на начало массива strMain передаём в функцию readStrFile
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
	# адрес на начало массива strMain передаём в функцию readStr
	lea	rax, -1048592[rbp]
	mov	rdi, rax
	call	readStr
.L25:
	# переменная int timeInd индикатор для режима подсчёта времени
	cmp	DWORD PTR -1048640[rbp], 2
	je	.L26
	# берём адрес переменной char charMin и кладём в функцию findMinMax
	lea	rdx, -1048646[rbp]
	# адрес на начало массива strMain кладём в функцию findMinMax
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
	# адрес на начало массива strMain кладём в функцию findMinMax
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
	#  переменную int result кладём в функцию printf
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
    # проверка на целосьность массива
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
