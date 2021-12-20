.text

transpose:
  push %r8
  push %r9
  push %r11
  push %r12
  push %r13
  push %r14
  push %r15
  push %rcx
  push %rax
  push %rdx
  push %rbx


  mov 112(%rsp), %r8d #numRows
  mov 104(%rsp), %r9d #numCols

  mov 120(%rsp), %r11 #input start address
  mov 96(%rsp), %r12 #ouput start address

  mov $0, %r13d #rowindex
  mov $0, %r14d #colindex

  mov %r9d, %r15d
  imul $4, %r15d

  mov %r8d, %ecx
  imul %r9d, %ecx
  imul $4, %ecx
  mov $0, %eax


loop:
  mov $0, %r14d #colindex

innerLoop:
  mov %r14d, %edx
  imul $4, %edx
  add %r13d, %edx
  mov (%r11, %rdx, 1), %ebx
  mov %r14d, %edx
  imul %r8d, %edx
  imul $4, %edx
  add %eax, %edx
  mov %ebx, (%r12, %rdx,1)

  inc %r14d
  cmp %r14d, %r9d
  jne innerLoop

  add %r15d, %r13d
  add $4, %eax
  cmp %r13d, %ecx
  jne loop

  pop %rbx
  pop %rdx
  pop %rax
  pop %rcx
  pop %r15
  pop %r14
  pop %r13
  pop %r12
  pop %r11
  pop %r9
  pop %r8

  ret
