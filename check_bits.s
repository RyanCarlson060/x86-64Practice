.text

checkBits:
  push %rcx
  push %r8
  push %r9


  mov $0, %rax #returnVal
  mov 32(%rsp), %cl #bit b
  mov 48(%rsp), %r8d #number
  mov %r8d, %r9d

  shr %cl, %r8d
  shr $1, %r8d
  jnc end

  mov 40(%rsp), %cl #bit a
  shr %cl, %r9d
  shr $1, %r9d
  jnc end

  mov $1, %rax

  pop %r9
  pop %r8
  pop %rcx

end:
  ret
