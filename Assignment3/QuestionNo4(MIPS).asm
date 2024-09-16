.data
   # Storing data of num1 and num2
   num1: .word 7
   num2: .word 21
   # multi is where we will be finding final output (ie, num1 * num2)
   multi: .word 0
.text 
  main:
     # Load address of num1, num2
     lw $t0, num1
     lw $t1, num2
     li $t2, 0     # initial loop countor (incimentor)
     li $t3, 0     # initial multiplication is 0
    loop:
       # Performing calcutations (t3 = t3 + num1(7))
       add $t3, $t3, $t0
       # Increment the loop counter
       addi $t2, $t2, 1
       #Check condition
      blt $t2, $t1, loop # t2 < num2(21)
     
      # store output in multi
     sw $t3, multi# store output in multi
     sw $t3, mult
     # printing multi
     li $v0, 1
     lw $a0, $t3 # multi
     syscall
#Temiate
     li $v0, 10
     syscall
