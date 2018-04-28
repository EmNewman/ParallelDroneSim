	.file	"sim.c"
	.text
.Ltext0:
	.p2align 4,,15
	.type	next_move._omp_fn.0, @function
next_move._omp_fn.0:
.LFB42:
	.file 1 "sim.c"
	.loc 1 46 0
	.cfi_startproc
.LVL0:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	omp_get_num_threads
.LVL1:
	movl	%eax, %r13d
	call	omp_get_thread_num
.LVL2:
	movl	%eax, %ecx
	movl	$6, %eax
	cltd
	idivl	%r13d
	cmpl	%edx, %ecx
	jge	.L12
	addl	$1, %eax
	.loc 1 46 0 discriminator 1
	xorl	%edx, %edx
.L12:
	movl	%ecx, %ebx
	imull	%eax, %ebx
	addl	%edx, %ebx
	leal	(%rbx,%rax), %r12d
	cmpl	%r12d, %ebx
	jl	.L8
	jmp	.L1
.LVL3:
	.p2align 4,,10
	.p2align 3
.L21:
.LBB8:
.LBB9:
	.loc 1 66 0 discriminator 1
	cmpl	$-1, %eax
	je	.L6
	addl	$1, %ebx
.LVL4:
	cmpl	%r12d, %ebx
	.p2align 4,,2
	je	.L1
.LVL5:
.L8:
	.loc 1 53 0
	movq	8(%rbp), %rdx
	movl	16(%rbp), %edi
	movl	%ebx, %esi
	call	calculate_neighbor
.LVL6:
	.loc 1 59 0
	cmpl	$4, %ebx
	je	.L20
	.loc 1 62 0
	movq	0(%rbp), %rdx
	movslq	16(%rbp), %rcx
	.loc 1 61 0
	cmpl	$5, %ebx
	.loc 1 62 0
	movq	32(%rdx), %rdx
	movl	(%rdx,%rcx,4), %ecx
	.loc 1 61 0
	je	.L10
	.loc 1 64 0
	addl	$2, %ecx
.LVL7:
.L11:
	.loc 1 66 0
	cltq
	leaq	(%rdx,%rax,4), %rdx
	movl	(%rdx), %eax
.LVL8:
	cmpl	%eax, %ecx
	jge	.L21
.L6:
	addl	$1, %ebx
.LVL9:
	.loc 1 67 0
	movl	%ecx, (%rdx)
	cmpl	%r12d, %ebx
	jne	.L8
.LVL10:
.L1:
.LBE9:
.LBE8:
	.loc 1 46 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL11:
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL12:
.L20:
	.cfi_restore_state
.LBB11:
.LBB10:
	.loc 1 60 0
	movq	0(%rbp), %rdx
	movslq	16(%rbp), %rcx
	movq	32(%rdx), %rdx
	movl	(%rdx,%rcx,4), %ecx
	addl	$4, %ecx
.LVL13:
	jmp	.L11
.LVL14:
.L10:
	.loc 1 62 0
	addl	$1, %ecx
.LVL15:
	jmp	.L11
.LBE10:
.LBE11:
	.cfi_endproc
.LFE42:
	.size	next_move._omp_fn.0, .-next_move._omp_fn.0
	.p2align 4,,15
	.type	next_move, @function
next_move:
.LFB37:
	.loc 1 12 0
	.cfi_startproc
.LVL16:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	.loc 1 29 0
	movslq	%esi, %rax
	.loc 1 33 0
	movl	$1, %esi
.LVL17:
	.loc 1 12 0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 29 0
	movq	16(%rdi), %rdx
	.loc 1 13 0
	movq	(%rdi), %r12
.LVL18:
	.loc 1 29 0
	movl	(%rdx,%rax,4), %edi
.LVL19:
	.loc 1 30 0
	movq	24(%r14), %rdx
	movl	(%rdx,%rax,4), %r13d
	.loc 1 33 0
	movslq	(%r12), %rdx
	.loc 1 29 0
	movl	%edi, %ebx
	movl	%edi, 12(%rsp)
.LVL20:
	.loc 1 33 0
	movq	40(%r14), %rdi
	call	memset
.LVL21:
	.loc 1 35 0
	movslq	(%r12), %rdx
	movq	32(%r14), %rdi
	movl	$-1, %esi
	salq	$2, %rdx
	call	memset
.LVL22:
	.loc 1 37 0
	movq	32(%r14), %rax
	movslq	%ebx, %rdx
	movl	%ebx, %r9d
	movl	$0, (%rax,%rdx,4)
	movq	40(%r14), %rdx
	movslq	%r13d, %rax
	leaq	0(,%rax,4), %rbx
.LVL23:
	movl	(%rdx,%rax,4), %r10d
.LVL24:
	.p2align 4,,10
	.p2align 3
.L23:
	.loc 1 39 0 discriminator 1
	testl	%r10d, %r10d
	je	.L43
	leaq	16(%rsp), %rsi
	xorl	%edx, %edx
	movl	$next_move._omp_fn.0, %edi
.LBB12:
	.loc 1 46 0
	movl	%r9d, 32(%rsp)
	movq	%r14, 16(%rsp)
	movq	%r12, 24(%rsp)
	call	GOMP_parallel_start
.LVL25:
	leaq	16(%rsp), %rdi
	call	next_move._omp_fn.0
.LVL26:
	call	GOMP_parallel_end
.LVL27:
	movq	16(%rsp), %r14
.LVL28:
.LBE12:
	.loc 1 72 0
	movslq	32(%rsp), %rax
.LBB13:
	.loc 1 46 0
	movq	24(%rsp), %r12
.LVL29:
.LBE13:
	.loc 1 72 0
	movq	40(%r14), %rdx
	movl	$0, (%rdx,%rax,4)
.LVL30:
	.loc 1 76 0
	movl	(%rdx,%rbx), %r10d
	testl	%r10d, %r10d
	jne	.L45
.LVL31:
.L43:
	.loc 1 100 0 discriminator 1
	cmpl	%r13d, 12(%rsp)
	je	.L35
.LVL32:
	.p2align 4,,10
	.p2align 3
.L32:
.LBB14:
	.loc 1 103 0
	movl	(%r12), %eax
.LBB15:
	.loc 1 105 0
	xorl	%ebx, %ebx
.LBE15:
	.loc 1 104 0
	xorl	%r15d, %r15d
	.loc 1 103 0
	leal	1(%rax), %ebp
.LVL33:
	.p2align 4,,10
	.p2align 3
.L31:
.LBB17:
.LBB16:
	.loc 1 107 0
	movq	%r12, %rdx
	movl	%ebx, %esi
	movl	%r13d, %edi
	call	calculate_neighbor
.LVL34:
	.loc 1 108 0
	movq	32(%r14), %rdx
	movslq	%eax, %rcx
	movl	(%rdx,%rcx,4), %edx
	cmpl	%ebp, %edx
	jge	.L29
	.loc 1 108 0 is_stmt 0 discriminator 1
	cmpl	$-1, %edx
	je	.L29
	cmpl	$-1, %eax
	cmovne	%eax, %r15d
.LVL35:
	cmovne	%edx, %ebp
.LVL36:
.L29:
.LBE16:
	.loc 1 105 0 is_stmt 1
	addl	$1, %ebx
.LVL37:
	cmpl	$6, %ebx
	jne	.L31
.LVL38:
.LBE17:
	.loc 1 117 0
	cmpl	12(%rsp), %r15d
	je	.L28
	movl	%r15d, %r13d
.LVL39:
	jmp	.L32
.LVL40:
	.p2align 4,,10
	.p2align 3
.L45:
.LBE14:
.LBB18:
	.loc 1 77 0
	movl	(%r12), %esi
.LBB19:
	.loc 1 80 0
	testl	%esi, %esi
.LBE19:
	.loc 1 77 0
	leal	1(%rsi), %edi
.LVL41:
.LBB20:
	.loc 1 80 0
	jle	.L33
	xorl	%ecx, %ecx
.LBE20:
	.loc 1 78 0
	xorl	%r9d, %r9d
.LVL42:
	.p2align 4,,10
	.p2align 3
.L26:
.LBB21:
	.loc 1 82 0
	movl	(%rdx,%rcx,4), %eax
	testl	%eax, %eax
	je	.L25
	.loc 1 84 0
	movq	32(%r14), %rax
	movl	(%rax,%rcx,4), %eax
	cmpl	%edi, %eax
	jge	.L25
	cmpl	$-1, %eax
	cmovne	%ecx, %r9d
.LVL43:
	cmovne	%eax, %edi
.LVL44:
.L25:
	addq	$1, %rcx
.LVL45:
	.loc 1 80 0
	cmpl	%ecx, %esi
	jg	.L26
	jmp	.L23
.LVL46:
.L35:
.LBE21:
.LBE18:
	.loc 1 100 0
	xorl	%r13d, %r13d
.LVL47:
	.p2align 4,,10
	.p2align 3
.L28:
	.loc 1 125 0
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL48:
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL49:
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL50:
.L33:
	.cfi_restore_state
.LBB22:
	.loc 1 78 0
	xorl	%r9d, %r9d
	jmp	.L23
.LBE22:
	.cfi_endproc
.LFE37:
	.size	next_move, .-next_move
	.p2align 4,,15
	.globl	run_step
	.type	run_step, @function
run_step:
.LFB39:
	.loc 1 141 0
	.cfi_startproc
.LVL51:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
.LBB26:
.LBB27:
	.loc 1 133 0
	xorl	%ebx, %ebx
.LBE27:
.LBE26:
	.loc 1 141 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 147 0
	movl	8(%rdi), %r13d
.LVL52:
.LBB29:
.LBB28:
	.loc 1 133 0
	testl	%r13d, %r13d
	jle	.L46
.LVL53:
	.p2align 4,,10
	.p2align 3
.L50:
	.loc 1 134 0
	movq	16(%rbp), %rax
	movl	%ebx, %esi
	movq	%rbp, %rdi
	leaq	(%rax,%rbx,4), %r12
	addq	$1, %rbx
.LVL54:
	call	next_move
.LVL55:
	.loc 1 133 0
	cmpl	%ebx, %r13d
	.loc 1 134 0
	movl	%eax, (%r12)
	.loc 1 133 0
	jg	.L50
.L46:
.LBE28:
.LBE29:
	.loc 1 149 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL56:
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL57:
	ret
	.cfi_endproc
.LFE39:
	.size	run_step, .-run_step
	.p2align 4,,15
	.globl	show
	.type	show, @function
show:
.LFB40:
	.loc 1 152 0
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE40:
	.size	show, .-show
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d\n"
	.text
	.p2align 4,,15
	.globl	simulate
	.type	simulate, @function
simulate:
.LFB41:
	.loc 1 157 0
	.cfi_startproc
.LVL58:
	.loc 1 157 0
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
.LBB38:
	.loc 1 167 0
	xorl	%r13d, %r13d
.LBE38:
	.loc 1 157 0
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.LBB46:
	.loc 1 167 0
	testl	%esi, %esi
	jle	.L53
.LVL59:
	.p2align 4,,10
	.p2align 3
.L63:
.LBB39:
.LBB40:
.LBB41:
	.loc 1 147 0
	movl	8(%rbp), %r15d
.LVL60:
.LBB42:
.LBB43:
	.loc 1 133 0
	xorl	%ebx, %ebx
	testl	%r15d, %r15d
	jle	.L60
.LVL61:
	.p2align 4,,10
	.p2align 3
.L64:
	.loc 1 134 0
	movq	16(%rbp), %rax
	movl	%ebx, %esi
	movq	%rbp, %rdi
	leaq	(%rax,%rbx,4), %r12
	addq	$1, %rbx
.LVL62:
	call	next_move
.LVL63:
	.loc 1 133 0
	cmpl	%ebx, %r15d
	.loc 1 134 0
	movl	%eax, (%r12)
	.loc 1 133 0
	jg	.L64
.LBE43:
.LBE42:
.LBE41:
.LBE40:
	.loc 1 171 0
	movl	8(%rbp), %eax
.LVL64:
.LBB44:
	.loc 1 172 0
	testl	%eax, %eax
	jle	.L60
	subl	$1, %eax
.LVL65:
	xorl	%ebx, %ebx
	leaq	4(,%rax,4), %r12
.LVL66:
	.p2align 4,,10
	.p2align 3
.L61:
	.loc 1 173 0 discriminator 2
	movq	24(%rbp), %rax
	movl	$.LC0, %edi
	movl	(%rax,%rbx), %edx
	movq	16(%rbp), %rax
	movl	(%rax,%rbx), %esi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	printf
.LVL67:
	.loc 1 172 0 discriminator 2
	cmpq	%r12, %rbx
	jne	.L61
.L60:
.LBE44:
	.loc 1 175 0
	movl	$10, %edi
.LBE39:
	.loc 1 167 0
	addl	$1, %r13d
.LVL68:
.LBB45:
	.loc 1 175 0
	call	putchar
.LVL69:
.LBE45:
	.loc 1 167 0
	cmpl	%r14d, %r13d
	jne	.L63
.LVL70:
.L53:
.LBE46:
	.loc 1 186 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL71:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL72:
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	simulate, .-simulate
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "run.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "<built-in>"
	.file 8 "pos.h"
	.file 9 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9d3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF101
	.byte	0x1
	.long	.LASF102
	.long	.LASF103
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x8c
	.long	0x5e
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x8d
	.long	0x5e
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x8a
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x6
	.byte	0x8
	.long	0x97
	.uleb128 0x7
	.long	0x8a
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0xd4
	.long	0x42
	.uleb128 0x8
	.long	.LASF43
	.byte	0xd8
	.byte	0x4
	.byte	0xf6
	.long	0x236
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0xf7
	.long	0x57
	.byte	0
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xfc
	.long	0x84
	.byte	0x8
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xfd
	.long	0x84
	.byte	0x10
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0xfe
	.long	0x84
	.byte	0x18
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0xff
	.long	0x84
	.byte	0x20
	.uleb128 0xa
	.long	.LASF19
	.byte	0x4
	.value	0x100
	.long	0x84
	.byte	0x28
	.uleb128 0xa
	.long	.LASF20
	.byte	0x4
	.value	0x101
	.long	0x84
	.byte	0x30
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.value	0x102
	.long	0x84
	.byte	0x38
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.value	0x103
	.long	0x84
	.byte	0x40
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x105
	.long	0x84
	.byte	0x48
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x106
	.long	0x84
	.byte	0x50
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x107
	.long	0x84
	.byte	0x58
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x109
	.long	0x26e
	.byte	0x60
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x10b
	.long	0x274
	.byte	0x68
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x10d
	.long	0x57
	.byte	0x70
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x111
	.long	0x57
	.byte	0x74
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x113
	.long	0x65
	.byte	0x78
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x117
	.long	0x34
	.byte	0x80
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x118
	.long	0x49
	.byte	0x82
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x119
	.long	0x27a
	.byte	0x83
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x11d
	.long	0x28a
	.byte	0x88
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x126
	.long	0x70
	.byte	0x90
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x12f
	.long	0x82
	.byte	0x98
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x130
	.long	0x82
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x131
	.long	0x82
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x132
	.long	0x82
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.value	0x133
	.long	0xaa
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF41
	.byte	0x4
	.value	0x135
	.long	0x57
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF42
	.byte	0x4
	.value	0x137
	.long	0x290
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF104
	.byte	0x4
	.byte	0x9b
	.uleb128 0x8
	.long	.LASF44
	.byte	0x18
	.byte	0x4
	.byte	0xa1
	.long	0x26e
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0xa2
	.long	0x26e
	.byte	0
	.uleb128 0x9
	.long	.LASF46
	.byte	0x4
	.byte	0xa3
	.long	0x274
	.byte	0x8
	.uleb128 0x9
	.long	.LASF47
	.byte	0x4
	.byte	0xa7
	.long	0x57
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x23d
	.uleb128 0x6
	.byte	0x8
	.long	0xb5
	.uleb128 0xc
	.long	0x8a
	.long	0x28a
	.uleb128 0xd
	.long	0x7b
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x236
	.uleb128 0xc
	.long	0x8a
	.long	0x2a0
	.uleb128 0xd
	.long	0x7b
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x57
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF48
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF49
	.uleb128 0xe
	.byte	0x18
	.byte	0x5
	.byte	0x21
	.long	0x2f9
	.uleb128 0x9
	.long	.LASF50
	.byte	0x5
	.byte	0x22
	.long	0x57
	.byte	0
	.uleb128 0x9
	.long	.LASF51
	.byte	0x5
	.byte	0x23
	.long	0x57
	.byte	0x4
	.uleb128 0x9
	.long	.LASF52
	.byte	0x5
	.byte	0x24
	.long	0x57
	.byte	0x8
	.uleb128 0x9
	.long	.LASF53
	.byte	0x5
	.byte	0x25
	.long	0x57
	.byte	0xc
	.uleb128 0x9
	.long	.LASF54
	.byte	0x5
	.byte	0x26
	.long	0x2a0
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.long	.LASF55
	.byte	0x5
	.byte	0x27
	.long	0x2b4
	.uleb128 0xe
	.byte	0x30
	.byte	0x5
	.byte	0x29
	.long	0x35f
	.uleb128 0xf
	.string	"g"
	.byte	0x5
	.byte	0x2a
	.long	0x35f
	.byte	0
	.uleb128 0x9
	.long	.LASF56
	.byte	0x5
	.byte	0x2c
	.long	0x57
	.byte	0x8
	.uleb128 0x9
	.long	.LASF57
	.byte	0x5
	.byte	0x2e
	.long	0x57
	.byte	0xc
	.uleb128 0x9
	.long	.LASF58
	.byte	0x5
	.byte	0x31
	.long	0x2a0
	.byte	0x10
	.uleb128 0x9
	.long	.LASF59
	.byte	0x5
	.byte	0x33
	.long	0x2a0
	.byte	0x18
	.uleb128 0x9
	.long	.LASF60
	.byte	0x5
	.byte	0x35
	.long	0x2a0
	.byte	0x20
	.uleb128 0x9
	.long	.LASF61
	.byte	0x5
	.byte	0x36
	.long	0x2a0
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2f9
	.uleb128 0x4
	.long	.LASF62
	.byte	0x5
	.byte	0x37
	.long	0x304
	.uleb128 0x10
	.long	.LASF105
	.byte	0x4
	.byte	0x8
	.byte	0x1d
	.long	0x3a1
	.uleb128 0x11
	.long	.LASF63
	.sleb128 0
	.uleb128 0x11
	.long	.LASF64
	.sleb128 1
	.uleb128 0x11
	.long	.LASF65
	.sleb128 2
	.uleb128 0x11
	.long	.LASF66
	.sleb128 3
	.uleb128 0x11
	.long	.LASF67
	.sleb128 4
	.uleb128 0x11
	.long	.LASF68
	.sleb128 5
	.byte	0
	.uleb128 0x12
	.long	.LASF106
	.byte	0x1
	.byte	0x8d
	.byte	0x1
	.long	0x3b7
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0x8d
	.long	0x3b7
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x365
	.uleb128 0x14
	.long	.LASF107
	.byte	0x1
	.byte	0x81
	.byte	0x1
	.long	0x3f6
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0x81
	.long	0x3b7
	.uleb128 0x15
	.long	.LASF69
	.byte	0x1
	.byte	0x81
	.long	0x57
	.uleb128 0x15
	.long	.LASF70
	.byte	0x1
	.byte	0x81
	.long	0x57
	.uleb128 0x16
	.uleb128 0x17
	.long	.LASF73
	.byte	0x1
	.byte	0x85
	.long	0x57
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF108
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x4e5
	.uleb128 0x19
	.long	0x50c
	.long	.LLST0
	.uleb128 0x1a
	.string	"s"
	.byte	0x1
	.byte	0xc
	.long	0x3b7
	.long	.LLST1
	.uleb128 0x1a
	.string	"g"
	.byte	0x1
	.byte	0xd
	.long	0x35f
	.long	.LLST2
	.uleb128 0x1b
	.long	.LASF71
	.byte	0x1
	.byte	0x1f
	.long	0x57
	.long	.LLST3
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x30
	.long	0x57
	.long	.LLST4
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0
	.long	0x4ca
	.uleb128 0x1a
	.string	"d"
	.byte	0x1
	.byte	0x31
	.long	0x57
	.long	.LLST5
	.uleb128 0x1a
	.string	"nbr"
	.byte	0x1
	.byte	0x35
	.long	0x57
	.long	.LLST6
	.uleb128 0x1b
	.long	.LASF72
	.byte	0x1
	.byte	0x3a
	.long	0x57
	.long	.LLST7
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0
	.uleb128 0x1a
	.string	"d"
	.byte	0x1
	.byte	0x31
	.long	0x57
	.long	.LLST5
	.uleb128 0x1a
	.string	"nbr"
	.byte	0x1
	.byte	0x35
	.long	0x57
	.long	.LLST6
	.uleb128 0x1b
	.long	.LASF72
	.byte	0x1
	.byte	0x3a
	.long	0x57
	.long	.LLST7
	.uleb128 0x1e
	.quad	.LVL6
	.long	0x913
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL1
	.long	0x932
	.uleb128 0x20
	.quad	.LVL2
	.long	0x941
	.byte	0
	.uleb128 0x21
	.byte	0x18
	.long	0x50c
	.uleb128 0xf
	.string	"s"
	.byte	0x1
	.byte	0xc
	.long	0x3b7
	.byte	0
	.uleb128 0xf
	.string	"g"
	.byte	0x1
	.byte	0xd
	.long	0x35f
	.byte	0x8
	.uleb128 0x9
	.long	.LASF71
	.byte	0x1
	.byte	0x1f
	.long	0x57
	.byte	0x10
	.byte	0
	.uleb128 0x22
	.byte	0x8
	.long	0x4e5
	.uleb128 0x23
	.long	.LASF109
	.byte	0x1
	.byte	0xc
	.long	0x57
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x707
	.uleb128 0x24
	.string	"s"
	.byte	0x1
	.byte	0xc
	.long	0x3b7
	.long	.LLST11
	.uleb128 0x25
	.long	.LASF73
	.byte	0x1
	.byte	0xc
	.long	0x57
	.long	.LLST12
	.uleb128 0x1a
	.string	"g"
	.byte	0x1
	.byte	0xd
	.long	0x35f
	.long	.LLST13
	.uleb128 0x1b
	.long	.LASF74
	.byte	0x1
	.byte	0x1d
	.long	0x57
	.long	.LLST14
	.uleb128 0x1b
	.long	.LASF75
	.byte	0x1
	.byte	0x1e
	.long	0x57
	.long	.LLST15
	.uleb128 0x1b
	.long	.LASF71
	.byte	0x1
	.byte	0x1f
	.long	0x57
	.long	.LLST16
	.uleb128 0x1b
	.long	.LASF76
	.byte	0x1
	.byte	0x62
	.long	0x57
	.long	.LLST17
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x30
	.long	0x5d1
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.byte	0x30
	.long	0x57
	.uleb128 0x27
	.quad	.LVL26
	.long	0x3f6
	.long	0x5c3
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x20
	.quad	.LVL27
	.long	0x950
	.byte	0
	.uleb128 0x28
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x675
	.uleb128 0x1b
	.long	.LASF77
	.byte	0x1
	.byte	0x66
	.long	0x57
	.long	.LLST18
	.uleb128 0x1b
	.long	.LASF78
	.byte	0x1
	.byte	0x67
	.long	0x57
	.long	.LLST19
	.uleb128 0x1b
	.long	.LASF79
	.byte	0x1
	.byte	0x68
	.long	0x57
	.long	.LLST20
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x60
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x69
	.long	0x57
	.long	.LLST21
	.uleb128 0x29
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0x1a
	.string	"d"
	.byte	0x1
	.byte	0x6a
	.long	0x370
	.long	.LLST22
	.uleb128 0x1a
	.string	"nbr"
	.byte	0x1
	.byte	0x6b
	.long	0x57
	.long	.LLST23
	.uleb128 0x1e
	.quad	.LVL34
	.long	0x913
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x90
	.long	0x6b0
	.uleb128 0x1b
	.long	.LASF80
	.byte	0x1
	.byte	0x4d
	.long	0x57
	.long	.LLST24
	.uleb128 0x1b
	.long	.LASF81
	.byte	0x1
	.byte	0x4e
	.long	0x57
	.long	.LLST25
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0xc0
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x50
	.long	0x57
	.long	.LLST26
	.byte	0
	.byte	0
	.uleb128 0x27
	.quad	.LVL21
	.long	0x95b
	.long	0x6c7
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x27
	.quad	.LVL22
	.long	0x95b
	.long	0x6df
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.uleb128 0x1e
	.quad	.LVL25
	.long	0x97a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	next_move._omp_fn.0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	0x3a1
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x77b
	.uleb128 0x2b
	.long	0x3ad
	.long	.LLST27
	.uleb128 0x2c
	.long	0x3bd
	.quad	.LBB26
	.long	.Ldebug_ranges0+0x100
	.byte	0x1
	.byte	0x93
	.uleb128 0x2d
	.long	0x3d2
	.byte	0
	.uleb128 0x2b
	.long	0x3dd
	.long	.LLST28
	.uleb128 0x2b
	.long	0x3c9
	.long	.LLST29
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x100
	.uleb128 0x2e
	.long	0x3e9
	.long	.LLST30
	.uleb128 0x1e
	.quad	.LVL55
	.long	0x512
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.long	.LASF89
	.byte	0x1
	.byte	0x98
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x30
	.long	.LASF110
	.byte	0x1
	.byte	0x9d
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x8f6
	.uleb128 0x24
	.string	"s"
	.byte	0x1
	.byte	0x9d
	.long	0x3b7
	.long	.LLST31
	.uleb128 0x25
	.long	.LASF82
	.byte	0x1
	.byte	0x9d
	.long	0x57
	.long	.LLST32
	.uleb128 0x25
	.long	.LASF83
	.byte	0x1
	.byte	0x9d
	.long	0x57
	.long	.LLST33
	.uleb128 0x25
	.long	.LASF84
	.byte	0x1
	.byte	0x9d
	.long	0x8f6
	.long	.LLST34
	.uleb128 0x31
	.long	.LASF85
	.byte	0x1
	.byte	0x9f
	.long	0x8f6
	.byte	0x1
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x130
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0xa7
	.long	0x57
	.long	.LLST35
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x160
	.uleb128 0x1a
	.string	"n"
	.byte	0x1
	.byte	0xab
	.long	0x57
	.long	.LLST36
	.uleb128 0x32
	.long	0x3a1
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.byte	0x1
	.byte	0xa8
	.long	0x8a2
	.uleb128 0x2b
	.long	0x3ad
	.long	.LLST37
	.uleb128 0x33
	.long	0x3bd
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.byte	0x1
	.byte	0x93
	.uleb128 0x2b
	.long	0x3d2
	.long	.LLST38
	.uleb128 0x2b
	.long	0x3dd
	.long	.LLST39
	.uleb128 0x2b
	.long	0x3c9
	.long	.LLST40
	.uleb128 0x29
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.uleb128 0x2e
	.long	0x3e9
	.long	.LLST41
	.uleb128 0x1e
	.quad	.LVL63
	.long	0x512
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.long	0x8e0
	.uleb128 0x1a
	.string	"j"
	.byte	0x1
	.byte	0xac
	.long	0x57
	.long	.LLST42
	.uleb128 0x1e
	.quad	.LVL67
	.long	0x9aa
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LVL69
	.long	0x9c1
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF86
	.uleb128 0x34
	.long	.LASF87
	.byte	0x6
	.byte	0xa8
	.long	0x274
	.uleb128 0x34
	.long	.LASF88
	.byte	0x6
	.byte	0xa9
	.long	0x274
	.uleb128 0x35
	.long	.LASF94
	.byte	0x8
	.byte	0x22
	.long	0x57
	.long	0x932
	.uleb128 0x36
	.long	0x57
	.uleb128 0x36
	.long	0x370
	.uleb128 0x36
	.long	0x35f
	.byte	0
	.uleb128 0x37
	.long	.LASF90
	.byte	0x7
	.byte	0
	.long	.LASF92
	.long	0x57
	.uleb128 0x37
	.long	.LASF91
	.byte	0x7
	.byte	0
	.long	.LASF93
	.long	0x57
	.uleb128 0x38
	.long	.LASF111
	.byte	0x7
	.byte	0
	.long	.LASF112
	.uleb128 0x35
	.long	.LASF95
	.byte	0x9
	.byte	0x3e
	.long	0x82
	.long	0x97a
	.uleb128 0x36
	.long	0x82
	.uleb128 0x36
	.long	0x57
	.uleb128 0x36
	.long	0xaa
	.byte	0
	.uleb128 0x39
	.long	.LASF96
	.byte	0x7
	.byte	0
	.long	.LASF99
	.long	0x999
	.uleb128 0x36
	.long	0x999
	.uleb128 0x36
	.long	0x82
	.uleb128 0x36
	.long	0x3b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x99f
	.uleb128 0x3a
	.long	0x9aa
	.uleb128 0x36
	.long	0x82
	.byte	0
	.uleb128 0x3b
	.long	.LASF97
	.byte	0x6
	.value	0x16a
	.long	0x57
	.long	0x9c1
	.uleb128 0x36
	.long	0x91
	.uleb128 0x3c
	.byte	0
	.uleb128 0x3d
	.long	.LASF98
	.byte	0x7
	.byte	0
	.long	.LASF100
	.long	0x57
	.uleb128 0x36
	.long	0x57
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL1-1-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL12-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-1-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL1-1-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 0
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.quad	.LVL12-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 0
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-1-.Ltext0
	.value	0x4
	.byte	0x75
	.sleb128 0
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL1-1-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x4
	.byte	0x76
	.sleb128 0
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL12-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x4
	.byte	0x76
	.sleb128 0
	.byte	0x23
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-1-.Ltext0
	.value	0x4
	.byte	0x75
	.sleb128 0
	.byte	0x23
	.uleb128 0x10
	.quad	.LVL1-1-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x4
	.byte	0x76
	.sleb128 0
	.byte	0x23
	.uleb128 0x10
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x23
	.uleb128 0x10
	.quad	.LVL12-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x4
	.byte	0x76
	.sleb128 0
	.byte	0x23
	.uleb128 0x10
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL0-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL3-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL12-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL3-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL4-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL5-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL12-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL6-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL12-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL3-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL7-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL13-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL15-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL16-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL19-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL50-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL16-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL17-.Ltext0
	.quad	.LVL21-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL21-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL18-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL50-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL20-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL23-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL24-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -100
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL20-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL40-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL50-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL20-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL23-.Ltext0
	.quad	.LVL25-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL29-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL30-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL31-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL38-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL40-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL46-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL50-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL31-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL46-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL32-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL33-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL36-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL33-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL33-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL37-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL34-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL41-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL50-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL42-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL44-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL50-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.quad	.LVL50-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL51-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL53-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL56-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL52-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL53-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL56-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL54-.Ltext0
	.quad	.LVL55-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL59-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL71-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL59-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL72-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL59-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL59-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL59-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL68-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL69-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL64-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL65-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 8
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL59-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL60-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL60-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL60-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL60-.Ltext0
	.quad	.LVL61-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL64-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB8-.Ltext0
	.quad	.LBE8-.Ltext0
	.quad	.LBB11-.Ltext0
	.quad	.LBE11-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB12-.Ltext0
	.quad	.LBE12-.Ltext0
	.quad	.LBB13-.Ltext0
	.quad	.LBE13-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB15-.Ltext0
	.quad	.LBE15-.Ltext0
	.quad	.LBB17-.Ltext0
	.quad	.LBE17-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB18-.Ltext0
	.quad	.LBE18-.Ltext0
	.quad	.LBB22-.Ltext0
	.quad	.LBE22-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB19-.Ltext0
	.quad	.LBE19-.Ltext0
	.quad	.LBB20-.Ltext0
	.quad	.LBE20-.Ltext0
	.quad	.LBB21-.Ltext0
	.quad	.LBE21-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB26-.Ltext0
	.quad	.LBE26-.Ltext0
	.quad	.LBB29-.Ltext0
	.quad	.LBE29-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB38-.Ltext0
	.quad	.LBE38-.Ltext0
	.quad	.LBB46-.Ltext0
	.quad	.LBE46-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB39-.Ltext0
	.quad	.LBE39-.Ltext0
	.quad	.LBB45-.Ltext0
	.quad	.LBE45-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF85:
	.string	"show_counts"
.LASF57:
	.string	"nthread"
.LASF79:
	.string	"min_nbr"
.LASF11:
	.string	"float"
.LASF69:
	.string	"bstart"
.LASF65:
	.string	"Y_POS"
.LASF12:
	.string	"double"
.LASF55:
	.string	"grid_t"
.LASF89:
	.string	"show"
.LASF99:
	.string	"GOMP_parallel_start"
.LASF110:
	.string	"simulate"
.LASF25:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF13:
	.string	"size_t"
.LASF9:
	.string	"sizetype"
.LASF35:
	.string	"_offset"
.LASF100:
	.string	"putchar"
.LASF108:
	.string	"next_move._omp_fn.0"
.LASF51:
	.string	"x_dim"
.LASF105:
	.string	"direction"
.LASF14:
	.string	"_flags"
.LASF29:
	.string	"_flags2"
.LASF21:
	.string	"_IO_buf_base"
.LASF106:
	.string	"run_step"
.LASF54:
	.string	"visited_set"
.LASF64:
	.string	"X_NEG"
.LASF26:
	.string	"_markers"
.LASF16:
	.string	"_IO_read_end"
.LASF78:
	.string	"min_w"
.LASF60:
	.string	"node_dist_vals"
.LASF107:
	.string	"process_batch"
.LASF102:
	.string	"sim.c"
.LASF31:
	.string	"_cur_column"
.LASF73:
	.string	"drone_id"
.LASF62:
	.string	"state_t"
.LASF90:
	.string	"__builtin_omp_get_num_threads"
.LASF111:
	.string	"__builtin_GOMP_parallel_end"
.LASF48:
	.string	"long long int"
.LASF76:
	.string	"result_pos"
.LASF83:
	.string	"dinterval"
.LASF95:
	.string	"memset"
.LASF56:
	.string	"num_drones"
.LASF50:
	.string	"nnode"
.LASF81:
	.string	"cur_min"
.LASF67:
	.string	"Z_POS"
.LASF74:
	.string	"start_node"
.LASF61:
	.string	"unvisited_nodes"
.LASF112:
	.string	"GOMP_parallel_end"
.LASF46:
	.string	"_sbuf"
.LASF47:
	.string	"_pos"
.LASF70:
	.string	"bcount"
.LASF58:
	.string	"drone_position"
.LASF32:
	.string	"_vtable_offset"
.LASF71:
	.string	"cur_node"
.LASF0:
	.string	"unsigned char"
.LASF52:
	.string	"y_dim"
.LASF39:
	.string	"__pad4"
.LASF4:
	.string	"signed char"
.LASF49:
	.string	"long long unsigned int"
.LASF66:
	.string	"Y_NEG"
.LASF2:
	.string	"unsigned int"
.LASF44:
	.string	"_IO_marker"
.LASF33:
	.string	"_shortbuf"
.LASF91:
	.string	"__builtin_omp_get_thread_num"
.LASF30:
	.string	"_old_offset"
.LASF18:
	.string	"_IO_write_base"
.LASF38:
	.string	"__pad3"
.LASF15:
	.string	"_IO_read_ptr"
.LASF22:
	.string	"_IO_buf_end"
.LASF59:
	.string	"drone_goal"
.LASF10:
	.string	"char"
.LASF43:
	.string	"_IO_FILE"
.LASF94:
	.string	"calculate_neighbor"
.LASF97:
	.string	"printf"
.LASF45:
	.string	"_next"
.LASF36:
	.string	"__pad1"
.LASF37:
	.string	"__pad2"
.LASF63:
	.string	"X_POS"
.LASF86:
	.string	"_Bool"
.LASF40:
	.string	"__pad5"
.LASF98:
	.string	"__builtin_putchar"
.LASF109:
	.string	"next_move"
.LASF1:
	.string	"short unsigned int"
.LASF3:
	.string	"long unsigned int"
.LASF19:
	.string	"_IO_write_ptr"
.LASF20:
	.string	"_IO_write_end"
.LASF8:
	.string	"__off64_t"
.LASF84:
	.string	"display"
.LASF28:
	.string	"_fileno"
.LASF92:
	.string	"omp_get_num_threads"
.LASF27:
	.string	"_chain"
.LASF80:
	.string	"cur_min_dist"
.LASF7:
	.string	"__off_t"
.LASF82:
	.string	"count"
.LASF96:
	.string	"__builtin_GOMP_parallel_start"
.LASF24:
	.string	"_IO_backup_base"
.LASF87:
	.string	"stdin"
.LASF93:
	.string	"omp_get_thread_num"
.LASF53:
	.string	"z_dim"
.LASF103:
	.string	"/afs/andrew.cmu.edu/usr22/epnewman/private/15418/project"
.LASF34:
	.string	"_lock"
.LASF41:
	.string	"_mode"
.LASF17:
	.string	"_IO_read_base"
.LASF77:
	.string	"prev_node"
.LASF42:
	.string	"_unused2"
.LASF101:
	.string	"GNU C 4.8.5 20150623 (Red Hat 4.8.5-28) -mtune=generic -march=x86-64 -g -O3 -std=gnu11 -fopenmp"
.LASF68:
	.string	"Z_NEG"
.LASF23:
	.string	"_IO_save_base"
.LASF6:
	.string	"long int"
.LASF75:
	.string	"goal_node"
.LASF88:
	.string	"stdout"
.LASF104:
	.string	"_IO_lock_t"
.LASF72:
	.string	"tentative_dist"
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-28)"
	.section	.note.GNU-stack,"",@progbits
