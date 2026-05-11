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
	.section	.text.startup,"ax",@progbits
	.p2align 4
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
	jle	.L26
	cmpl	$2, %edi
	jne	.L27
	movq	8(%rsi), %rax
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L28
	movq	24(%rsp), %rdi
	leaq	.LC4(%rip), %rsi
	leaq	32(%rsp), %rbp
	leaq	.LC9(%rip), %r13
	leaq	.LC8(%rip), %r12
	call	fopen@PLT
	xorl	%edx, %edx
	movq	%rax, 16(%rsp)
	movq	%rdx, 8(%rsp)
	testq	%rax, %rax
	je	.L29
	.p2align 4,,10
	.p2align 3
.L6:
	movq	16(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	fread@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L30
	movl	%eax, %ebx
	subl	$1, %eax
	cmpl	$15, %eax
	ja	.L31
	movq	8(%rsp), %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	leaq	.LC7(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L33:
	movzbl	0(%rbp,%r14), %edx
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	$16, %r14
	je	.L32
.L11:
	cmpl	%r14d, %ebx
	jg	.L33
	movq	%r13, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	$16, %r14
	jne	.L11
.L32:
	movl	$124, %edi
	xorl	%r15d, %r15d
	call	putchar@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L15:
	movzbl	0(%rbp,%r15), %ecx
	movq	(%r14), %rax
	movq	stdout(%rip), %rsi
	movq	%rcx, %rdi
	testb	$64, 1(%rax,%rcx,2)
	jne	.L24
	movl	$46, %edi
.L24:
	call	putc@PLT
	addq	$1, %r15
	cmpl	%r15d, %ebx
	jg	.L15
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movq	(%rsp), %rcx
	addq	%rcx, 8(%rsp)
	jmp	.L6
.L27:
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	movl	$1, %ebx
	call	__fprintf_chk@PLT
.L1:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L34
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
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
.L30:
	.cfi_restore_state
	movq	16(%rsp), %rdi
	call	ferror@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L35
	movq	16(%rsp), %rdi
	call	fclose@PLT
	jmp	.L1
.L35:
	movq	stderr(%rip), %rdi
	movq	24(%rsp), %rcx
	leaq	.LC11(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	__fprintf_chk@PLT
	movq	16(%rsp), %rdi
	call	fclose@PLT
.L7:
	movl	$1, %ebx
	jmp	.L1
.L34:
	call	__stack_chk_fail@PLT
.L26:
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$182, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L28:
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$147, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L29:
	movq	24(%rsp), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC5(%rip), %rdx
	call	__fprintf_chk@PLT
	jmp	.L7
.L31:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$96, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
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
