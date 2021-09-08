.data
 ite: .asciiz "Ingrese la cantidad de numeros: "
 num: .asciiz "Ingrese un numero: "
 suma: .asciiz "La suma es: "
 prom: .asciiz "\nEl promedio es: "
 mayor: .asciiz "\nEl mayor es: "
 menor: .asciiz "\nEl menor es: "

.text
main:

 li $v0, 4
 la $a0, ite
 syscall

 li $v0, 5
 syscall
 move $t0, $v0

 li $t1, 0 #index
 li $t4, 0
 li $t7, 10000000000000000
 li.s $f1, 1.0



 loop:
  beq $t1, $t0, exit

  li $v0, 4
  la $a0, num
  syscall

  li $v0, 5
  syscall
  move $t2, $v0
  move $t6, $v0
  move $t9, $v0
  
  mtc1 $t9, $f2
  cvt.s.w $f2, $f2

  add $t3, $t3, $t2

  add.s $f12, $f12, $f2
  add.s $f3, $f3, $f1

  bge $t4, $t2, if
  else:
   move $t5, $t2
   move $t4, $t2
  if:
   move $t5, $t4
  end_if:

  ble $t7, $t6, if2
  else2:
   move $t8, $t6
   move $t7, $t6
  if2:
   move $t8, $t7
  end_if2:

  add $t1, $t1,1 
  j loop 

 exit:

 #-------------SUMA
 li $v0, 4
 la $a0, suma
 syscall

 li $v0, 1
 move $a0, $t3
 syscall

 #------------MAYOR
 li $v0, 4
 la $a0, mayor
 syscall

 li $v0, 1
 move $a0, $t5
 syscall

 #------------MENOR
 li $v0, 4
 la $a0, menor
 syscall

 li $v0, 1
 move $a0, $t8
 syscall

 jr $ra

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