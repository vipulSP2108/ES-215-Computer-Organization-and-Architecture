.data
   # num1 is s0 and num2 is s1
   num1: .word 21 # 0x1234
   num2: .word 7 # 0x4321
   out: .word 0
.text
   # Load address of num1, num2 and out
   la $s0, num1
   la $s1, num2
   la $s2, out
   # Load the num1 and num2 from memory
   lw $t0, 0($s0)
   lw $t1, 0($s1)
   # 2's complement of num2
   not $t1, $t1
   addi $t1, $t1, 1
   # addition on complement of num2
   add  $t2, $t0, $t1
   # store output in out
   sw $t2, 0($s2)
   # printing out
   li $v0, 1
   lw $a0, 0($s2) # add $a0, $zero, $s2
   syscall
