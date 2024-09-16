.data
   # list is our array, find is the number we have to find in array
   # and len is length of total string ie, 5
   list: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
   find: .word 7
   len: .word 10
   # findIndex is where we will be geting index of array where found number in
   findIndex: .word -1 # Assuming -1 when not find number (find) in array (list)
   # Asked in question
   output: .word 0 # Assuming not found
   iterations: .word 0 # Assuming no iterations done
   index: .word -1 # Assuming -1 when not find number (find) in array (list)
.text main:
     # Load address of str, find and len
     la $t0, list
     lw $t1, find
     li $t2, 0   # initial index is 0
     li $t3, len
     li $t4, 0   # initial iteration count
loop:
      # Load the number at current index into $t5
lw $t5, ($t0)
     # Compare character and if yes jump to found
     beq $t5, $t1, found
# Increment the index counter
     addi $t2, $t2, 1 # add
     addi $t0, $t0, 4  # Move to next number
     blt $t2, $t3, loop # curr index < len
notfound:
     # store output in findindex
     li $t6, 0
     sw $t6, output
     # as we are asked for iterations and index only if, found
     # sw $t2, iterations
     # sw $t2, index ie, it will be 10
     j exit
found:
     # store output in findindex
     li $t6, 1
     sw $t6, output
     sw $t2, iterations
     sw $t2, index
     j exit
exit:
     # Not asked in Question
     # # printing findindex
     # li $v0, 1
     # lw $a0, $t3 # findindex
     # syscall
#Temiate
     li $v0, 10
     syscall
