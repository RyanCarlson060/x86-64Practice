.data

.include "input_find_highest.s"

.text

.globl _start
_start:
  mov $0, %eax #rowindex
  mov $0, %r8d #colindex
  mov numRows, %ebx #numRows
  imul $4, %ebx
  mov numCols, %ecx #numCols
  imul $4, %ecx
  mov $0, %r12d #result index

loop:
  mov $0, %r8d
  mov $-1, %edx #highest
  mov $-1, %edi #second highest
  mov $-1, %esi #third highest

rowLoop:
  mov %eax, %r10d
  imul numCols, %r10d
  add %r8d, %r10d
  cmp %edx, arr(%r10d)
  jg highest
  cmp %edi, arr(%r10d)
  jg secHighest
  cmp %esi, arr(%r10d)
  jg thiHighest
  jmp increment

highest:
  mov %edi, %esi
  mov %edx, %edi
  mov arr(%r10d), %edx
  jmp increment

secHighest:
  mov %edi, %esi
  mov arr(%r10d), %edi
  jmp increment

thiHighest:
  mov arr(%r10d), %esi
  jmp increment

increment:
  add $4, %r8d
  cmp %ecx, %r8d
  jl rowLoop


  movl %edx, output(%r12d)
  add $4, %r12d
  movl %edi, output(%r12d)
  add $4, %r12d
  movl %esi, output(%r12d)
  add $4, %r12d


  add $4, %eax
  cmp %ebx, %eax
  jl loop

done:
  nop
