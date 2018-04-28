	.file	"sim.c"
	.text
.Ltext0:
	.p2align 4,,15
	.type	process_batch._omp_fn.0, @function
process_batch._omp_fn.0:
.LFB42:
	.file 1 "sim.c"
	.loc 1 152 0
	.cfi_startproc
.LVL0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
.LVL1:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
.LBB18:
	.loc 1 154 0
	movl	12(%rdi), %r12d
	movl	8(%rdi), %ebx
.LBE18:
	.loc 1 152 0
	movq	%rdi, 32(%rsp)
	call	omp_get_num_threads
.LVL2:
	movl	%eax, %ebp
	call	omp_get_thread_num
.LVL3:
	movl	%eax, %esi
	movl	%r12d, %eax
	cltd
	idivl	%ebp
	cmpl	%edx, %esi
	jge	.L23
	addl	$1, %eax
.LBB42:
	.loc 1 154 0 discriminator 1
	xorl	%edx, %edx
.L23:
	imull	%eax, %esi
	addl	%esi, %edx
	leal	(%rdx,%rax), %ecx
	cmpl	%ecx, %edx
	jge	.L1
	leal	(%rbx,%rdx), %eax
	leal	(%rbx,%rcx), %esi
	movl	%eax, 12(%rsp)
.LVL4:
	cltq
.LVL5:
	movl	%esi, 44(%rsp)
	salq	$2, %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	.loc 1 155 0
	movq	32(%rsp), %rax
	movq	16(%rsp), %rdi
.LBB19:
.LBB20:
	.loc 1 36 0
	movl	$1, %esi
.LBE20:
.LBE19:
	.loc 1 155 0
	movq	(%rax), %rbx
	movq	%rdi, %rax
	addq	16(%rbx), %rax
.LBB39:
.LBB36:
	.loc 1 16 0
	movq	(%rbx), %rbp
	.loc 1 36 0
	movslq	0(%rbp), %rdx
.LBE36:
.LBE39:
	.loc 1 155 0
	movq	%rax, 24(%rsp)
.LVL6:
.LBB40:
.LBB37:
	.loc 1 32 0
	movl	(%rax), %eax
	movl	%eax, %r12d
	movl	%eax, 8(%rsp)
.LVL7:
	.loc 1 33 0
	movq	24(%rbx), %rax
.LVL8:
	movl	(%rax,%rdi), %r13d
.LVL9:
	.loc 1 36 0
	movq	40(%rbx), %rdi
	call	memset
.LVL10:
	.loc 1 38 0
	movslq	0(%rbp), %rdx
	movq	32(%rbx), %rdi
	movl	$-1, %esi
	salq	$2, %rdx
	call	memset
.LVL11:
	.loc 1 40 0
	movq	32(%rbx), %rax
	movslq	%r12d, %rdx
	movl	%r13d, 40(%rsp)
	movl	$0, (%rax,%rdx,4)
	movq	40(%rbx), %rdx
	movslq	%r13d, %rax
	leaq	0(,%rax,4), %rsi
	movl	(%rdx,%rax,4), %r8d
	movq	%rsi, (%rsp)
.LVL12:
	.p2align 4,,10
	.p2align 3
.L4:
	.loc 1 42 0
	testl	%r8d, %r8d
	je	.L14
	movslq	%r12d, %r15
	xorl	%r13d, %r13d
	leaq	0(,%r15,4), %r14
	jmp	.L15
.LVL13:
	.p2align 4,,10
	.p2align 3
.L40:
.LBB21:
.LBB22:
	.loc 1 69 0
	cmpl	$-1, %edx
	je	.L9
.LVL14:
.L5:
.LBE22:
	.loc 1 51 0
	addl	$1, %r13d
.LVL15:
	cmpl	$6, %r13d
	je	.L37
.LVL16:
.L15:
.LBB23:
	.loc 1 56 0
	movq	%rbp, %rdx
	movl	%r13d, %esi
	movl	%r12d, %edi
	call	calculate_neighbor
.LVL17:
	.loc 1 58 0
	testl	%eax, %eax
	js	.L5
	.loc 1 62 0
	cmpl	$4, %r13d
	.loc 1 63 0
	movq	32(%rbx), %rdx
	.loc 1 62 0
	je	.L38
	.loc 1 64 0
	cmpl	$5, %r13d
	je	.L39
	.loc 1 67 0
	movl	(%rdx,%r14), %edi
	leal	2(%rdi), %ecx
.LVL18:
.L7:
	.loc 1 69 0
	cltq
	leaq	(%rdx,%rax,4), %rax
.LVL19:
	movl	(%rax), %edx
	cmpl	%ecx, %edx
	jle	.L40
.L9:
.LBE23:
	.loc 1 51 0
	addl	$1, %r13d
.LVL20:
.LBB24:
	.loc 1 70 0
	movl	%ecx, (%rax)
.LBE24:
	.loc 1 51 0
	cmpl	$6, %r13d
	jne	.L15
.LVL21:
.L37:
.LBE21:
	.loc 1 75 0
	movq	40(%rbx), %rcx
	.loc 1 79 0
	movq	(%rsp), %rax
	.loc 1 75 0
	movl	$0, (%rcx,%r15,4)
	.loc 1 79 0
	movl	(%rcx,%rax), %r8d
	testl	%r8d, %r8d
	jne	.L41
.LVL22:
.L14:
	movl	40(%rsp), %r13d
.LVL23:
	.loc 1 110 0
	cmpl	%r13d, 8(%rsp)
	je	.L26
.LVL24:
	.p2align 4,,10
	.p2align 3
.L20:
.LBB26:
	.loc 1 113 0
	movl	0(%rbp), %eax
	.loc 1 114 0
	xorl	%r15d, %r15d
.LBB27:
	.loc 1 118 0
	xorl	%r12d, %r12d
.LBE27:
	.loc 1 113 0
	leal	1(%rax), %r14d
.LVL25:
	.p2align 4,,10
	.p2align 3
.L19:
.LBB29:
.LBB28:
	.loc 1 120 0
	movq	%rbp, %rdx
	movl	%r12d, %esi
	movl	%r13d, %edi
	call	calculate_neighbor
.LVL26:
	.loc 1 121 0
	movq	32(%rbx), %rdx
	movslq	%eax, %rcx
	movl	(%rdx,%rcx,4), %edx
	cmpl	%r14d, %edx
	jge	.L17
	cmpl	$-1, %edx
	je	.L17
	cmpl	$-1, %eax
	cmovne	%eax, %r15d
.LVL27:
	cmovne	%edx, %r14d
.LVL28:
.L17:
.LBE28:
	.loc 1 118 0
	addl	$1, %r12d
.LVL29:
	cmpl	$6, %r12d
	jne	.L19
.LVL30:
.LBE29:
	.loc 1 135 0
	cmpl	%r15d, 8(%rsp)
	je	.L16
	movl	%r15d, %r13d
.LVL31:
	jmp	.L20
.LVL32:
	.p2align 4,,10
	.p2align 3
.L41:
.LBE26:
.LBB30:
	.loc 1 80 0
	movl	0(%rbp), %esi
.LBB31:
	.loc 1 85 0
	testl	%esi, %esi
.LBE31:
	.loc 1 80 0
	leal	1(%rsi), %edi
.LVL33:
.LBB32:
	.loc 1 85 0
	jle	.L24
	xorl	%eax, %eax
.LBE32:
	.loc 1 81 0
	xorl	%r12d, %r12d
.LVL34:
	.p2align 4,,10
	.p2align 3
.L13:
.LBB33:
	.loc 1 87 0
	movl	(%rcx,%rax,4), %edx
	testl	%edx, %edx
	je	.L12
	.loc 1 89 0
	movq	32(%rbx), %rdx
	movl	(%rdx,%rax,4), %edx
	cmpl	%edi, %edx
	jge	.L12
	cmpl	$-1, %edx
	cmovne	%eax, %r12d
.LVL35:
	cmovne	%edx, %edi
.LVL36:
.L12:
	addq	$1, %rax
.LVL37:
	.loc 1 85 0
	cmpl	%eax, %esi
	jg	.L13
	jmp	.L4
.LVL38:
.L26:
.LBE33:
.LBE30:
	.loc 1 110 0
	xorl	%r13d, %r13d
.LVL39:
	.p2align 4,,10
	.p2align 3
.L16:
.LBE37:
.LBE40:
	.loc 1 155 0
	movq	24(%rsp), %rax
	addl	$1, 12(%rsp)
.LVL40:
	addq	$4, 16(%rsp)
	movl	%r13d, (%rax)
	movl	12(%rsp), %eax
	cmpl	%eax, 44(%rsp)
	jg	.L22
.LVL41:
.L1:
.LBE42:
	.loc 1 152 0
	addq	$56, %rsp
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
.LVL42:
.L24:
	.cfi_restore_state
.LBB43:
.LBB41:
.LBB38:
.LBB34:
	.loc 1 81 0
	xorl	%r12d, %r12d
.LVL43:
	jmp	.L4
.LVL44:
.L38:
.LBE34:
.LBB35:
.LBB25:
	.loc 1 63 0
	movl	(%rdx,%r14), %esi
	leal	4(%rsi), %ecx
.LVL45:
	jmp	.L7
.LVL46:
.L39:
	.loc 1 65 0
	movl	(%rdx,%r14), %esi
	leal	1(%rsi), %ecx
.LVL47:
	jmp	.L7
.LBE25:
.LBE35:
.LBE38:
.LBE41:
.LBE43:
	.cfi_endproc
.LFE42:
	.size	process_batch._omp_fn.0, .-process_batch._omp_fn.0
	.p2align 4,,15
	.globl	run_step
	.type	run_step, @function
run_step:
.LFB39:
	.loc 1 160 0
	.cfi_startproc
.LVL48:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 166 0
	movl	8(%rdi), %eax
.LVL49:
	xorl	%edx, %edx
	movq	%rsp, %rsi
.LBB47:
.LBB48:
	.loc 1 152 0
	movq	%rdi, (%rsp)
	movl	$process_batch._omp_fn.0, %edi
.LVL50:
	movl	$0, 8(%rsp)
	movl	%eax, 12(%rsp)
	call	GOMP_parallel_start
.LVL51:
	movq	%rsp, %rdi
	call	process_batch._omp_fn.0
.LVL52:
	call	GOMP_parallel_end
.LVL53:
.LBE48:
.LBE47:
	.loc 1 168 0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
.LVL54:
	ret
	.cfi_endproc
.LFE39:
	.size	run_step, .-run_step
	.p2align 4,,15
	.globl	show
	.type	show, @function
show:
.LFB40:
	.loc 1 171 0
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
	.loc 1 176 0
	.cfi_startproc
.LVL55:
	.loc 1 176 0
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
.LBB57:
	.loc 1 186 0
	xorl	%r13d, %r13d
.LBE57:
	.loc 1 176 0
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
.LBB65:
	.loc 1 186 0
	testl	%esi, %esi
	jle	.L45
.LVL56:
	.p2align 4,,10
	.p2align 3
.L53:
.LBB58:
.LBB59:
.LBB60:
	.loc 1 166 0
	movl	8(%rbp), %eax
.LVL57:
	xorl	%edx, %edx
	movq	%rsp, %rsi
	movl	$process_batch._omp_fn.0, %edi
.LBB61:
.LBB62:
	.loc 1 152 0
	movq	%rbp, (%rsp)
	movl	$0, 8(%rsp)
	movl	%eax, 12(%rsp)
	call	GOMP_parallel_start
.LVL58:
	movq	%rsp, %rdi
	call	process_batch._omp_fn.0
.LVL59:
	call	GOMP_parallel_end
.LVL60:
.LBE62:
.LBE61:
.LBE60:
.LBE59:
	.loc 1 192 0
	movl	8(%rbp), %eax
.LVL61:
.LBB63:
	.loc 1 193 0
	testl	%eax, %eax
	jle	.L50
	subl	$1, %eax
.LVL62:
	xorl	%ebx, %ebx
	leaq	4(,%rax,4), %r12
.LVL63:
	.p2align 4,,10
	.p2align 3
.L51:
	.loc 1 194 0 discriminator 2
	movq	24(%rbp), %rax
	movl	$.LC0, %edi
	movl	(%rax,%rbx), %edx
	movq	16(%rbp), %rax
	movl	(%rax,%rbx), %esi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	printf
.LVL64:
	.loc 1 193 0 discriminator 2
	cmpq	%r12, %rbx
	jne	.L51
.L50:
.LBE63:
	.loc 1 196 0
	movl	$10, %edi
.LBE58:
	.loc 1 186 0
	addl	$1, %r13d
.LVL65:
.LBB64:
	.loc 1 196 0
	call	putchar
.LVL66:
.LBE64:
	.loc 1 186 0
	cmpl	%r14d, %r13d
	jne	.L53
.LVL67:
.L45:
.LBE65:
	.loc 1 207 0
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL68:
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL69:
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
	.file 7 "pos.h"
	.file 8 "/usr/include/string.h"
	.file 9 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa6b
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
	.byte	0x7
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
	.byte	0xa0
	.byte	0x1
	.long	0x3b7
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0xa0
	.long	0x3b7
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x365
	.uleb128 0x14
	.long	.LASF107
	.byte	0x1
	.byte	0x93
	.byte	0x1
	.long	0x3f6
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0x93
	.long	0x3b7
	.uleb128 0x15
	.long	.LASF69
	.byte	0x1
	.byte	0x93
	.long	0x57
	.uleb128 0x15
	.long	.LASF70
	.byte	0x1
	.byte	0x93
	.long	0x57
	.uleb128 0x16
	.uleb128 0x17
	.long	.LASF71
	.byte	0x1
	.byte	0x9a
	.long	0x57
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF108
	.byte	0x1
	.byte	0xf
	.long	0x57
	.byte	0x1
	.long	0x4eb
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0xf
	.long	0x3b7
	.uleb128 0x15
	.long	.LASF71
	.byte	0x1
	.byte	0xf
	.long	0x57
	.uleb128 0x19
	.string	"g"
	.byte	0x1
	.byte	0x10
	.long	0x35f
	.uleb128 0x17
	.long	.LASF72
	.byte	0x1
	.byte	0x20
	.long	0x57
	.uleb128 0x17
	.long	.LASF73
	.byte	0x1
	.byte	0x21
	.long	0x57
	.uleb128 0x17
	.long	.LASF74
	.byte	0x1
	.byte	0x22
	.long	0x57
	.uleb128 0x17
	.long	.LASF75
	.byte	0x1
	.byte	0x6c
	.long	0x57
	.uleb128 0x1a
	.long	0x47f
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0x33
	.long	0x57
	.uleb128 0x16
	.uleb128 0x19
	.string	"d"
	.byte	0x1
	.byte	0x34
	.long	0x57
	.uleb128 0x19
	.string	"nbr"
	.byte	0x1
	.byte	0x38
	.long	0x57
	.uleb128 0x17
	.long	.LASF76
	.byte	0x1
	.byte	0x3d
	.long	0x57
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	0x4a6
	.uleb128 0x17
	.long	.LASF77
	.byte	0x1
	.byte	0x50
	.long	0x57
	.uleb128 0x17
	.long	.LASF78
	.byte	0x1
	.byte	0x51
	.long	0x57
	.uleb128 0x16
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0x55
	.long	0x57
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x17
	.long	.LASF79
	.byte	0x1
	.byte	0x70
	.long	0x57
	.uleb128 0x17
	.long	.LASF80
	.byte	0x1
	.byte	0x71
	.long	0x57
	.uleb128 0x17
	.long	.LASF81
	.byte	0x1
	.byte	0x72
	.long	0x57
	.uleb128 0x16
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0x76
	.long	0x57
	.uleb128 0x16
	.uleb128 0x19
	.string	"d"
	.byte	0x1
	.byte	0x77
	.long	0x370
	.uleb128 0x19
	.string	"nbr"
	.byte	0x1
	.byte	0x78
	.long	0x57
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF109
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x6ef
	.uleb128 0x1c
	.long	0x718
	.long	.LLST0
	.uleb128 0x1d
	.string	"s"
	.byte	0x1
	.byte	0x93
	.long	0x3b7
	.long	.LLST1
	.uleb128 0x1e
	.long	.LASF69
	.byte	0x1
	.byte	0x93
	.long	0x57
	.long	.LLST2
	.uleb128 0x1e
	.long	.LASF70
	.byte	0x1
	.byte	0x93
	.long	0x57
	.long	.LLST3
	.uleb128 0x1e
	.long	.LASF71
	.byte	0x1
	.byte	0x9a
	.long	0x57
	.long	.LLST4
	.uleb128 0x1f
	.long	0x3f6
	.quad	.LBB19
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x9b
	.long	0x6d4
	.uleb128 0x20
	.long	0x40f
	.long	.LLST5
	.uleb128 0x20
	.long	0x406
	.long	.LLST6
	.uleb128 0x21
	.long	.Ldebug_ranges0+0
	.uleb128 0x22
	.long	0x41a
	.long	.LLST7
	.uleb128 0x22
	.long	0x423
	.long	.LLST8
	.uleb128 0x22
	.long	0x42e
	.long	.LLST9
	.uleb128 0x22
	.long	0x439
	.long	.LLST10
	.uleb128 0x22
	.long	0x444
	.long	.LLST11
	.uleb128 0x23
	.long	.Ldebug_ranges0+0x50
	.long	0x5f8
	.uleb128 0x22
	.long	0x454
	.long	.LLST12
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x80
	.uleb128 0x22
	.long	0x45e
	.long	.LLST13
	.uleb128 0x22
	.long	0x467
	.long	.LLST14
	.uleb128 0x22
	.long	0x472
	.long	.LLST15
	.uleb128 0x24
	.quad	.LVL17
	.long	0x9ab
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.long	0x67c
	.uleb128 0x22
	.long	0x4a7
	.long	.LLST16
	.uleb128 0x22
	.long	0x4b2
	.long	.LLST17
	.uleb128 0x22
	.long	0x4bd
	.long	.LLST18
	.uleb128 0x21
	.long	.Ldebug_ranges0+0xd0
	.uleb128 0x22
	.long	0x4c9
	.long	.LLST19
	.uleb128 0x27
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.uleb128 0x22
	.long	0x4d3
	.long	.LLST20
	.uleb128 0x22
	.long	0x4dc
	.long	.LLST21
	.uleb128 0x24
	.quad	.LVL26
	.long	0x9ab
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.Ldebug_ranges0+0x100
	.long	0x6a7
	.uleb128 0x22
	.long	0x484
	.long	.LLST22
	.uleb128 0x22
	.long	0x48f
	.long	.LLST23
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x130
	.uleb128 0x22
	.long	0x49b
	.long	.LLST24
	.byte	0
	.byte	0
	.uleb128 0x28
	.quad	.LVL10
	.long	0x9ca
	.long	0x6be
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x24
	.quad	.LVL11
	.long	0x9ca
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL2
	.long	0x9e9
	.uleb128 0x29
	.quad	.LVL3
	.long	0x9f8
	.byte	0
	.uleb128 0x2a
	.byte	0x10
	.long	0x718
	.uleb128 0xf
	.string	"s"
	.byte	0x1
	.byte	0x93
	.long	0x3b7
	.byte	0
	.uleb128 0x9
	.long	.LASF69
	.byte	0x1
	.byte	0x93
	.long	0x57
	.byte	0x8
	.uleb128 0x9
	.long	.LASF70
	.byte	0x1
	.byte	0x93
	.long	0x57
	.byte	0xc
	.byte	0
	.uleb128 0x2b
	.byte	0x8
	.long	0x6ef
	.uleb128 0x2c
	.long	0x3a1
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x7dc
	.uleb128 0x20
	.long	0x3ad
	.long	.LLST25
	.uleb128 0x2d
	.long	0x3bd
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.byte	0x1
	.byte	0xa6
	.long	0x7b5
	.uleb128 0x20
	.long	0x3d2
	.long	.LLST26
	.uleb128 0x20
	.long	0x3dd
	.long	.LLST27
	.uleb128 0x20
	.long	0x3c9
	.long	.LLST28
	.uleb128 0x27
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.uleb128 0x2e
	.long	0x3e9
	.uleb128 0x28
	.quad	.LVL52
	.long	0x4eb
	.long	0x7a6
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.quad	.LVL53
	.long	0xa07
	.byte	0
	.byte	0
	.uleb128 0x24
	.quad	.LVL51
	.long	0xa12
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	process_batch._omp_fn.0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.long	.LASF91
	.byte	0x1
	.byte	0xab
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x30
	.long	.LASF110
	.byte	0x1
	.byte	0xb0
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x98e
	.uleb128 0x31
	.string	"s"
	.byte	0x1
	.byte	0xb0
	.long	0x3b7
	.long	.LLST29
	.uleb128 0x32
	.long	.LASF82
	.byte	0x1
	.byte	0xb0
	.long	0x57
	.long	.LLST30
	.uleb128 0x32
	.long	.LASF83
	.byte	0x1
	.byte	0xb0
	.long	0x57
	.long	.LLST31
	.uleb128 0x32
	.long	.LASF84
	.byte	0x1
	.byte	0xb0
	.long	0x98e
	.long	.LLST32
	.uleb128 0x33
	.long	.LASF85
	.byte	0x1
	.byte	0xb2
	.long	0x98e
	.byte	0x1
	.uleb128 0x23
	.long	.Ldebug_ranges0+0x170
	.long	0x967
	.uleb128 0x1d
	.string	"i"
	.byte	0x1
	.byte	0xba
	.long	0x57
	.long	.LLST33
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x1a0
	.uleb128 0x1d
	.string	"n"
	.byte	0x1
	.byte	0xc0
	.long	0x57
	.long	.LLST34
	.uleb128 0x2d
	.long	0x3a1
	.quad	.LBB59
	.quad	.LBE59-.LBB59
	.byte	0x1
	.byte	0xbc
	.long	0x914
	.uleb128 0x20
	.long	0x3ad
	.long	.LLST35
	.uleb128 0x34
	.long	0x3bd
	.quad	.LBB61
	.quad	.LBE61-.LBB61
	.byte	0x1
	.byte	0xa6
	.uleb128 0x20
	.long	0x3d2
	.long	.LLST36
	.uleb128 0x20
	.long	0x3dd
	.long	.LLST37
	.uleb128 0x20
	.long	0x3c9
	.long	.LLST38
	.uleb128 0x27
	.quad	.LBB62
	.quad	.LBE62-.LBB62
	.uleb128 0x2e
	.long	0x3e9
	.uleb128 0x28
	.quad	.LVL59
	.long	0x4eb
	.long	0x904
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.quad	.LVL60
	.long	0xa07
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.quad	.LBB63
	.quad	.LBE63-.LBB63
	.long	0x952
	.uleb128 0x1d
	.string	"j"
	.byte	0x1
	.byte	0xc1
	.long	0x57
	.long	.LLST39
	.uleb128 0x24
	.quad	.LVL64
	.long	0xa42
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.byte	0
	.uleb128 0x24
	.quad	.LVL66
	.long	0xa59
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.quad	.LVL58
	.long	0xa12
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	process_batch._omp_fn.0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF86
	.uleb128 0x35
	.long	.LASF87
	.byte	0x6
	.byte	0xa8
	.long	0x274
	.uleb128 0x35
	.long	.LASF88
	.byte	0x6
	.byte	0xa9
	.long	0x274
	.uleb128 0x36
	.long	.LASF89
	.byte	0x7
	.byte	0x22
	.long	0x57
	.long	0x9ca
	.uleb128 0x37
	.long	0x57
	.uleb128 0x37
	.long	0x370
	.uleb128 0x37
	.long	0x35f
	.byte	0
	.uleb128 0x36
	.long	.LASF90
	.byte	0x8
	.byte	0x3e
	.long	0x82
	.long	0x9e9
	.uleb128 0x37
	.long	0x82
	.uleb128 0x37
	.long	0x57
	.uleb128 0x37
	.long	0xaa
	.byte	0
	.uleb128 0x38
	.long	.LASF92
	.byte	0x9
	.byte	0
	.long	.LASF94
	.long	0x57
	.uleb128 0x38
	.long	.LASF93
	.byte	0x9
	.byte	0
	.long	.LASF95
	.long	0x57
	.uleb128 0x39
	.long	.LASF111
	.byte	0x9
	.byte	0
	.long	.LASF112
	.uleb128 0x3a
	.long	.LASF96
	.byte	0x9
	.byte	0
	.long	.LASF99
	.long	0xa31
	.uleb128 0x37
	.long	0xa31
	.uleb128 0x37
	.long	0x82
	.uleb128 0x37
	.long	0x3b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa37
	.uleb128 0x3b
	.long	0xa42
	.uleb128 0x37
	.long	0x82
	.byte	0
	.uleb128 0x3c
	.long	.LASF97
	.byte	0x6
	.value	0x16a
	.long	0x57
	.long	0xa59
	.uleb128 0x37
	.long	0x91
	.uleb128 0x3d
	.byte	0
	.uleb128 0x3e
	.long	.LASF98
	.byte	0x9
	.byte	0
	.long	.LASF100
	.long	0x57
	.uleb128 0x37
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
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.uleb128 0x3a
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
	.uleb128 0x3b
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
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
	.uleb128 0x3d
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3e
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
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x4
	.byte	0x75
	.sleb128 0
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x4
	.byte	0x75
	.sleb128 0
	.byte	0x23
	.uleb128 0xc
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.byte	0x23
	.uleb128 0xc
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.quad	.LVL4-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL5-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -100
	.quad	.LVL42-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -100
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL6-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -100
	.quad	.LVL42-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -100
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL6-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL42-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL6-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL42-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL7-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL8-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL12-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	.LVL42-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL9-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL12-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL42-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL9-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL23-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL30-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL32-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL34-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL42-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL43-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL44-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL23-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL38-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL13-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL32-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL42-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL13-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL15-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL16-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL20-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL44-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL17-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL44-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL13-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL18-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL45-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL47-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL24-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL25-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL25-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL28-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL25-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL25-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL29-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL26-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL33-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL33-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL34-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL36-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL33-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL34-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL48-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL50-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL51-1-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL49-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL53-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL53-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL49-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL50-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL51-1-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL54-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL55-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL56-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL68-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL55-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL56-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL69-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL55-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL56-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL55-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL56-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL55-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL56-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL65-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL66-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 8
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL56-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL57-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL60-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -56
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL60-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -52
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL57-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL60-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL61-.Ltext0
	.quad	.LVL63-.Ltext0
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
	.quad	.LBB19-.Ltext0
	.quad	.LBE19-.Ltext0
	.quad	.LBB39-.Ltext0
	.quad	.LBE39-.Ltext0
	.quad	.LBB40-.Ltext0
	.quad	.LBE40-.Ltext0
	.quad	.LBB41-.Ltext0
	.quad	.LBE41-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB21-.Ltext0
	.quad	.LBE21-.Ltext0
	.quad	.LBB35-.Ltext0
	.quad	.LBE35-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB22-.Ltext0
	.quad	.LBE22-.Ltext0
	.quad	.LBB23-.Ltext0
	.quad	.LBE23-.Ltext0
	.quad	.LBB24-.Ltext0
	.quad	.LBE24-.Ltext0
	.quad	.LBB25-.Ltext0
	.quad	.LBE25-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB27-.Ltext0
	.quad	.LBE27-.Ltext0
	.quad	.LBB29-.Ltext0
	.quad	.LBE29-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB30-.Ltext0
	.quad	.LBE30-.Ltext0
	.quad	.LBB34-.Ltext0
	.quad	.LBE34-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB31-.Ltext0
	.quad	.LBE31-.Ltext0
	.quad	.LBB32-.Ltext0
	.quad	.LBE32-.Ltext0
	.quad	.LBB33-.Ltext0
	.quad	.LBE33-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB57-.Ltext0
	.quad	.LBE57-.Ltext0
	.quad	.LBB65-.Ltext0
	.quad	.LBE65-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB58-.Ltext0
	.quad	.LBE58-.Ltext0
	.quad	.LBB64-.Ltext0
	.quad	.LBE64-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF85:
	.string	"show_counts"
.LASF57:
	.string	"nthread"
.LASF81:
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
.LASF91:
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
.LASF80:
	.string	"min_w"
.LASF60:
	.string	"node_dist_vals"
.LASF107:
	.string	"process_batch"
.LASF102:
	.string	"sim.c"
.LASF31:
	.string	"_cur_column"
.LASF71:
	.string	"drone_id"
.LASF62:
	.string	"state_t"
.LASF92:
	.string	"__builtin_omp_get_num_threads"
.LASF111:
	.string	"__builtin_GOMP_parallel_end"
.LASF48:
	.string	"long long int"
.LASF75:
	.string	"result_pos"
.LASF83:
	.string	"dinterval"
.LASF90:
	.string	"memset"
.LASF56:
	.string	"num_drones"
.LASF50:
	.string	"nnode"
.LASF78:
	.string	"cur_min"
.LASF67:
	.string	"Z_POS"
.LASF72:
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
.LASF74:
	.string	"cur_node"
.LASF0:
	.string	"unsigned char"
.LASF52:
	.string	"y_dim"
.LASF39:
	.string	"__pad4"
.LASF109:
	.string	"process_batch._omp_fn.0"
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
.LASF93:
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
.LASF89:
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
.LASF108:
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
.LASF94:
	.string	"omp_get_num_threads"
.LASF27:
	.string	"_chain"
.LASF77:
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
.LASF95:
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
.LASF79:
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
.LASF73:
	.string	"goal_node"
.LASF88:
	.string	"stdout"
.LASF104:
	.string	"_IO_lock_t"
.LASF76:
	.string	"tentative_dist"
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-28)"
	.section	.note.GNU-stack,"",@progbits
