#Hanoi Towers Recursive Algorithm
#Authors: S�nchez Valderrama Jos� David, Cervantes Amezcua Adri�n Alejandro
#Exp: is708346, is708376
.data
.text

#Store in $s0 the number of disks
addi $s0, $zero, 3
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
#Store number of disks in $a0
add $a0, $zero, $s0
#Store reference for start rod in $a1
add $a1, $zero, $s1
#Store reference for end rod in $a2
add $a2, $zero, $s3
#Store reference for aux rod in $a3
add $a3, $zero, $s2
#Set $s7 to 1 for comparison for the base case(n==1)
addi $s7, $zero, 1
#Call Hanoi function
jal hanoi_function
#End
j end

#Recursive implementation of the Hanoi Towers algorithm
#public static void hanoi_function(int n, int start, int end, int aux)
hanoi_function:
#Save return address in the stack
addi $sp, $sp, -4
sw $ra, 0($sp)
#Check if the disk is equal to 1, go to the base_case
beq $a0, $s7, base_case
#Substract 1 to the number of disks
addi $a0, $a0, -1
#Backup of $a2
add $s6, $zero, $a2
#Invert the aux rod and end rod
add $a2, $zero, $a3
add $a3, $zero, $s6
#Call the recursive function
jal hanoi_function

#Backup of $a2
add $s6, $zero, $a2
#Revert to the original addresses for the aux rod and end rod
add $a2, $zero, $a3
add $a3, $zero, $s6
#Substract 4 from the stack pointer of $a1 to get the value
addi $a1, $a1, -4
#Load the value from the start rod
lw $v0, 0($a1)
#Set a 0 in the current address of the start rod
sw $zero, 0($a1)
#Save the value into the end rod
sw $v0, 0($a2)
#Increment the stack pointer of $a2 for the next value to be stored
addi $a2, $a2, 4
#Substract 1 to the number of disks
addi $a0, $a0, -1
#Backup of $a1
add $s6, $zero, $a1
#Invert the aux rod and start rod
add $a1, $zero, $a3
add $a3, $zero, $s6
#Call the recursive function again
jal hanoi_function
#Backup of $a1
add $s6, $zero, $a1
#Invert the aux rod and start rod
add $a1, $zero, $a3
add $a3, $zero, $s6
#Restore the disk of the previous call
addi $a0, $a0, 1
#Get the return address to return to the main function
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

#Base case when the number of disks is equal to 1
base_case:
#Substract 4 from the stack pointer of $a1 to get the value
addi $a1, $a1, -4
#Load the value from the start rod
lw $v0, 0($a1)
#Set a 0 in the current address of the start rod
sw $zero, 0($a1)
#Save the value into the end rod
sw $v0, 0($a2)
#Increment the stack pointer of $a2 for the next value to be stored
addi $a2, $a2, 4
#Restore the disk of the previous call
addi $a0, $a0, 1
#Get the return address to return to the Hanoi function
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

end:
