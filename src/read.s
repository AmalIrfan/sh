  .intel_syntax noprefix

  .section .bss
buf_size = 256
  .lcomm buf, buf_size

  .section .text
  .global read
  .global readf

# - rdi fd
# - rsi buf
# - rdx count
# + rax nread
readf:
  mov rax, 0
  syscall
  ret

# - rdi rbuf
# + rax nread
read:
  push rdi
  mov rdi, 0
  lea rsi, buf
  mov rdx, buf_size
  call readf
  pop rdi
  mov [rdi], rsi
  ret
