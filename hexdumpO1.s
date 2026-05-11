.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hexdump.c"
.LC1:
	.string	"argc >= 1"
.LC2:
	.string	"Usage: %s <filename>\n"
.LC3:
	.string	"filename != NULL"
.LC4:
	.string	"rb"
.LC5:
	.string	"hexdump: cannot open '%s'\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"count >= 1 && count <= BYTES_PER_LINE"
	.section	.rodata.str1.1
.LC7:
	.string	"%08lx "
.LC8:
	.string	"%02x "
.LC9:
	.string	"   "
.LC10:
	.string	"|"
.LC11:
	.string	"hexdump: read error on '%s'\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB44:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	testl	%edi, %edi
	jle	.L22
	cmpl	$2, %edi
	je	.L3
	movq	(%rsi), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$1, %eax
.L1:
	movq	56(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L23
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$182, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L3:
	movq	8(%rsi), %rax
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L24
	leaq	.LC4(%rip), %rsi
	movq	24(%rsp), %rdi
	call	fopen@PLT
	movq	%rax, 16(%rsp)
	movq	$0, 8(%rsp)
	leaq	.LC9(%rip), %r15
	leaq	.LC8(%rip), %r14
	testq	%rax, %rax
	jne	.L6
	movq	24(%rsp), %rcx
	leaq	.LC5(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	call	__fprintf_chk@PLT
	movl	$1, %ebx
	jmp	.L7
.L24:
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$147, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L27:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$96, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
.L9:
	movq	%r15, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.L10:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L25
.L11:
	cmpl	%ebx, %ebp
	jle	.L9
	movzbl	(%rbx,%r12), %edx
	movq	%r14, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L10
.L25:
	movl	$124, %edi
	call	putchar@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r12
	movl	$0, %ebx
	movl	$46, %r13d
.L13:
	movzbl	32(%rsp,%rbx), %edi
	movzbl	%dil, %edx
	movq	(%r12), %rax
	testb	$64, 1(%rax,%rdx,2)
	cmove	%r13d, %edi
	movzbl	%dil, %edi
	movq	stdout(%rip), %rsi
	call	putc@PLT
	addq	$1, %rbx
	cmpl	%ebx, %ebp
	jg	.L13
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movq	(%rsp), %rcx
	addq	%rcx, 8(%rsp)
.L6:
	leaq	32(%rsp), %rdi
	movq	16(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L26
	movq	(%rsp), %rax
	movl	%eax, %ebp
	subl	$1, %eax
	cmpl	$15, %eax
	ja	.L27
	movq	8(%rsp), %rdx
	leaq	.LC7(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %ebx
	leaq	32(%rsp), %r12
	jmp	.L11
.L26:
	movq	16(%rsp), %rdi
	call	ferror@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L28
	movq	16(%rsp), %rdi
	call	fclose@PLT
.L7:
	testl	%ebx, %ebx
	setne	%al
	movzbl	%al, %eax
	jmp	.L1
.L28:
	movq	24(%rsp), %rcx
	leaq	.LC11(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movq	16(%rsp), %rdi
	call	fclose@PLT
	movl	$1, %ebx
	jmp	.L7
.L23:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE44:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 15
__PRETTY_FUNCTION__.0:
	.string	"print_hex_line"
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 8
__PRETTY_FUNCTION__.1:
	.string	"hexdump"
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 5
__PRETTY_FUNCTION__.2:
	.string	"main"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
