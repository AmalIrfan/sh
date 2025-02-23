  .intel_syntax noprefix

  .section .text
  .global chdir

# rdi : path
chdir:
  mov rax, 80
  syscall
  ret
