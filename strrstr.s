.data

.include "input_strrstr.s"

.text

.globl _start
_start:
  mov $-1, %eax #lastMatch

  mov $0, %ebx #stringLen
  mov $0, %ecx #targetLen

  mov $0, %edx #stringIndex then loop index
  mov $0, %esi #targetIndex

stringLen:
  mov haystack(%edx), %r12b
  cmp $0, %r12b
  je targetLen
  inc %ebx
  inc %edx
  jmp stringLen

targetLen:
  mov needle(%esi), %r12b
  cmp $0, %r12b
  je search
  inc %ecx
  inc %esi
  jmp targetLen

search:
  mov $0, %edx #outer loop

  sub %ecx, %ebx
  add $1, %ebx
  cmp %ebx, %edx
  jge end
loop:
  mov $0, %esi #inner loop

inner:
  mov %esi, %edi
  add %edx, %edi
  mov haystack(%edi), %r12b
  mov needle(%esi), %r13b
  cmp %r12b, %r13b
  je increment
  jmp loopCont

increment:
  inc %esi
  cmp %esi, %ecx
  je match
  jmp inner

match:
  mov %edx, %eax
  jmp loopCont

loopCont:
  inc %edx
  cmp %edx, %ebx
  je end
  jmp loop

end:
  mov %eax, lastMatch

done:
  nop
