.data 
	st1: .asciiz "Ingrese el primer lado:\n"
	st2: .asciiz "Ingrese el segundo lado:\n"
	st3: .asciiz "Ingrese el tercer lado:\n"
	st4: .asciiz "El triangulo es valido\n"
	st5: .asciiz "El triangulo no es valido\n"
.text 

main: 

#-------------------

la $a0, st1   
li $v0, 4
syscall 

li $v0, 5 	
syscall
move $t1, $v0


la $a0, st2 	
li $v0, 4
syscall 

li $v0, 5 
syscall
move $t2, $v0


la $a0, st3 	
li $v0, 4
syscall 

li $v0, 5 
syscall
move $t3, $v0

#---------------------

add $a0 , $t1, $t2  
move $t4, $a0
#li $v0, 1 
#syscall

add $a0 , $t1, $t3  
move $t5, $a0
#li $v0, 1
#syscall

add $a0 , $t2, $t3  
move $t6, $a0
#li $v0, 1
#syscall

#---------------------

bge $t3, $t4 LABEL_IF   
LABEL_ELSE: 
	
	bge $t2, $t5 bLABEL_IF 

	bLABEL_ELSE:
	
		bge $t1, $t6 cLABEL_IF 
		
		cLABEL_ELSE: 
		
			la $a0, st4
			b END_LABEL_IF
		cLABEL_IF: 		
			la $a0, st5

	bLABEL_IF: 

		la $a0, st5

#----------------------

LABEL_IF: 
	la $a0, st5

END_LABEL_IF: 
	li $v0, 4
	syscall

jr  $ra