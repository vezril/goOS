.set ALIGN,    1<<0
.set MEMINFO,  1<<1
.set FLAGS,    ALIGN | MEMINFO
.set MAGIC,    0x1BADB002
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

.section .bootstrap_stack, "aw", @nobits
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

.section .text
.global _start
.type _start, @function
_start:
	movl $stack_top, %esp
	call go.kernel.Main
	cli
	hlt
.Lhang:
	jmp .Lhang

.size _start, . - _start


.global _itop
.type _itop, @function
_itop:
	push %ebp
	mov %esp, %ebp
	mov 8(%ebp), %eax
	mov %ebp, %esp
	pop %ebp
	ret
.size _itop, . - _itop

.global __go_register_gc_roots
.type __go_register_gc_roots, @function
__go_register_gc_roots:
	ret
.size __go_register_gc_roots, . - __go_register_gc_roots

.global __go_runtime_error
.type __go_runtime_error, @function
__go_runtime_error:
	ret
.size __go_runtime_error, . - __go_runtime_error
