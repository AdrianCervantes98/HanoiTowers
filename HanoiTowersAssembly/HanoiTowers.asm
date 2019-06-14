#Hanoi Towers Recursive Algorithm
#Authors: Sánchez Valderrama José David, Cervantes Amezcua Adrián Alejandro
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





