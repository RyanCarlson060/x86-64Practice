.text

aaronize:

  push %rdi
  push %rsi
  push %rdx
  push %rcx
  push %rbx
  push %r8
  push %r10
  push %r15
  push %rax
  push %r11
  push %r12
  push %r9
  push %r13

  mov 136(%rsp), %rdi #input address
  mov 128(%rsp), %esi #length of array
  mov 120(%rsp), %edx #times to aaronize
  mov 112(%rsp), %rcx #output address

  mov $0, %ebx #aaronize index
  mov $0, %r8d #inner aaron index

  mov %esi, %r10d #last index
  dec %r10d

  mov $1, %r15d

copyArray:
  mov (%rdi, %r8, 4), %eax
  mov %eax, (%rcx, %r8, 4)
  inc %r8d
  cmp %r8d, %esi
  jne copyArray

loop:
  mov $0, %r8d
  cmp $0, %ebx
  je aaronLoop
  mov %r10d, %r11d

updateNewArr:
  pop %r12
  mov %r12d, (%rcx, %r11, 4)
  dec %r11d
  cmp $0, %r11d
  jge updateNewArr


aaronLoop:
  mov (%rcx, %r8, 4), %r9d
  cmp $0, %r8d
  jne notFirst

  mov %r8d, %r13d
  add %r15d, %r13d
  add (%rcx, %r13, 4), %r9d
  jmp nextElement

notFirst:
  cmp %r8d, %r10d
  jne notLast
  mov %r8d, %r13d
  sub %r15d, %r13d
  add (%rcx, %r13, 4), %r9d
  jmp nextElement

notLast:
  mov %r8d, %r13d
  add %r15d, %r13d
  add (%rcx, %r13, 4), %r9d
  mov %r8d, %r13d
  sub %r15d, %r13d
  add (%rcx, %r13, 4), %r9d

nextElement:
  push %r9
  inc %r8d
  cmp %r8d, %esi
  jne aaronLoop

  inc %ebx
  cmp %ebx, %edx
  jne loop

  mov %r10d, %r11d

finalArr:
  pop %r12
  mov %r12d, (%rcx, %r11, 4)
  dec %r11d
  cmp $0, %r11d
  jge finalArr

  pop %r13
  pop %r9
  pop %r12
  pop %r11
  pop %rax
  pop %r15
  pop %r10
  pop %r8
  pop %rbx
  pop %rcx
  pop %rdx
  pop %rsi
  pop %rdi

  ret
