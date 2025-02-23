  .intel_syntax noprefix

  .section .text
  .global exit

# rdi : code
exit:
  mov rax, 60
  syscall
