.data
   # str is our string, find is the char we have to find in str
   # and len is length of total string ie, 5
   str: .asciiz "Vipul"
   find: .byte 'u'
   len: .word 5
   # findIndex is where we will be geting index of str where found char in
   findIndex: .word -1 # Assuming -1 when not find char (find) in sting (str)
.text main:
     # Load address of str, find and len
     la $t0, str
     lw $t1, find #lb
     lw $t2, len
     li $t3, 0     # initial index is 0
     li $t4, -1     # initial findindex is -1 same reson (as in findIndex)
loop:
       # Load the character at current index into $t3
       lw $t5, ($t0) #lb
       # Compare character and if yes jump to found
       beq  $t3, $t5, found
       # Increment the index counter
       addi $t3, $t3, 1 #add
       # Check condition for notfound
       # bge $t1, $t2, notfound # If index >= len, jump to notfound
       # Check condition for loop
       blt $t3, $t2, loop # curr index < len
notfound:
       # store output in findindex
       sw $t3, findindex
       j exit
found:
       # store output in findindex
       sw $t3, findindex
       j exit
exit:
       # printing findindex
       li $v0, 1
       lw $a0, $t3 # findindex
       syscall
#Temiate
       li $v0, 10
       syscall
