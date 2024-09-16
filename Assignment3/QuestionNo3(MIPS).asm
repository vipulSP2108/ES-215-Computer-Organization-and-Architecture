.data
   # Store data of num1, num2 Consicative position
   array: .word 15, 5
   # lcm is were we will be getting lcm of num1 and num2
   lcm: .word 0
.text main:
     # Load address of num1, num2 at Consicative position
     la $t0, array
     lw $t1, ($t0)
     lw $t2, ($t0 + 4) # Consicative
     # Need to calculate GCD of 2 numbers (using Euclidean algorithm)
    gcd:
       beq  $t2, $zero, gcd_done # t1(rem) is equal to zero then gcd_done and t1 is gcd
       rem $t3, $t1, $t2  # t2(15) divide t1(5)
       move $t1, $t2      # t1 ko t2(5) banao ie, t1 = 5
       move $t2, $t3      # t2 ko t3(rem) banao ie, t2 = rem
j gcd
gcd_done:
       # Calculate LCM
       mul  $t5, $t1, $t2  # Multiply num1(15) and num2(5)
       div  $t5, $t5, $t4  # LCM (num1 * num2) / GCD(num1, num2) ie, t4
       # store output in lcm
sw $t5, lcm
     # printing lcm
     li $v0, 1
     lw $a0, $t5 # lcm
     syscall
#Temiate
     li $v0, 10
     syscall
