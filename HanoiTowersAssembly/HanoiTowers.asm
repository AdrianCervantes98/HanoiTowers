#Hanoi Towers Recursive Algorithm
#Authors: Sánchez Valderrama José David, Cervantes Amezcua Adrián Alejandro
#Exp: is708346, is708376
.data
.text

#Store in $s0 the number of disks
addi $s0, $zero, 8
#Store in $s1 the high portion of the initial address
addi $s1, $zero, 0x1001
#Shift left 16 bits for the low portion of the initial address
#Start rod address
sll $s1, $s1, 16
#Aux rod address 
addi $s2, $s1, 0x0020
#End rod address
addi $s3, $s1, 0x0040

#Initialize $t0 with 0, which will be a counter for the for cycle
add $t0, $zero, $zero
#For cycle to insert each disk value into the Start rod ($s1)
fill_start_rod:
#If there's no more disks, jump to main
beq $t0, $s0, main
#Increment counter
addi $t0, $t0, 1
#Store the $t0 disk
sw $t0, 0($s1)
#Increment 4 bits in the $s1 stack pointer
addi $s1, $s1, 4
#Start the cycle again
j fill_start_rod

#Main function
main: 
#Store biggest disk in $a0
addi $a0, $zero, 1
#Store reference for start rod in $a1
add $a1, $zero, $s1
#Store reference for end rod in $a2
add $a2, $zero, $s3
#Store reference for aux rod in $a3
add $a3, $zero, $s2
#Call Hanoi function
jal hanoi_function
#End
j end

hanoi_function:

end:







