  .intel_syntax noprefix

  .section .bss
buf_size = 256
  .lcomm buf, buf_size

  .section .text
  .global getcwd

# - rdi rbuf
# + rax nread
getcwd:
  push rdi
  mov rax, 79
  lea rdi, buf
  mov rsi, buf_size
  syscall
  pop rsi
  mov [rsi], rdi 
  ret
