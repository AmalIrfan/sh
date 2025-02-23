  .intel_syntax noprefix

  .section .text
  .global write
  .global writef

# - rdi fd
# - rsi buf
# - rdx count
# + rax nwrite
writef:
  mov rax, 1
  syscall
  ret

# - rdi buf
# - rsi count
# + rax nwrite
write:
  mov rdx, rsi
  mov rsi, rdi
  mov rdi, 1
  call writef
  ret
