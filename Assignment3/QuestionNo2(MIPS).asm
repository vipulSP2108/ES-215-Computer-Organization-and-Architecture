.data
   # array is our list of numbers and len is length of total numbers ie, 15
   array: .word 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75
   len: .word 15
   # avg is were we will be getting avrage of all numbers# avg is were we will be getting
 avrage of all numbers
   avg: .word 0
 .text
main:
     # Load address of num1, num2 and out
     la $t0, array
     li $t1, 0   # initial index in array
     lw $t2, len
     li $t3, 0  # initial sum is 0 (to store sum of number upto current index)
loop:
       # Performing calcutations (sum = sum + array[i])
       lw $t4, ($t0)
       add $t3, $t3, $t4
       #Incrementing index and array  (ie, moving to next index of array)
       addi $t1, $t1, 1 # can also use add
       add $t0, $t0, 4
       #Check condition
       blt $t1, $t2, loop # $t1 < $t2
     # Calculating avrage (sum/length)
     div $t5, $t3, $t2
     # store output(avrage) in avg
sw $t5, avg
     # printing avg
     li $v0, 1
     lw $a0, $t5 # avg
     syscall
#Temiate
     li $v0, 10
     syscall
