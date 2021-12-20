.data

.include "input_bit_add.s"

.text

.globl _start
_start:
  mov numBits, %ecx
  imul $4, %ecx
  sub $4, %ecx #final index
  mov $0, %edx #carry
  movl $0, carryOut

loop:
  mov bits1(%ecx), %eax
  xor bits2(%ecx), %eax
  xor %edx, %eax
  mov %eax, result(%ecx)
  mov bits1(%ecx), %esi
  add bits2(%ecx), %esi
  add %edx, %esi
  cmp $1, %esi
  jle cont
  mov $1, %edx
  cmp $0, %ecx
  jne carryCont
  movl $1, carryOut
  jmp carryCont

cont:
  mov $0, %edx
  sub $4, %ecx
  cmp $0, %ecx
  jge loop

carryCont:
  sub $4, %ecx
  cmp $0, %ecx
  jge loop

done:
  nop
