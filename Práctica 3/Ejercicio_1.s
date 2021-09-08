.data
    lin1:    .asciiz "Ingresa un numero: "
    lin2:    .asciiz "Ingresa otro numero: "
    lin3:    .asciiz "\nLa suma es: "
    lin4:    .asciiz "\nLa resta es: "
    lin5:    .asciiz "\nLa multiplicacion es: "
    lin6:    .asciiz "\nLa division es: " 
    lin7:    .asciiz "\nEl promedio es: " 
.text
main:
#--------------------------
    li        $v0, 4
    la        $a0, lin1
    syscall
    
    li        $v0, 5
    syscall    
    move    $t0, $v0


    li        $v0, 4
    la        $a0, lin2
    syscall

    li        $v0, 5
    syscall    
    move    $t1, $v0
#--------------------------

#Suma
    add     $t2,$t0,$t1

#Diferencia
    sub     $t3,$t0,$t1

#Multiplicacion
    mul     $t4,$t0,$t1

#Division
    mtc1     $t0, $f1
    cvt.s.w $f1, $f1

    mtc1     $t1, $f2
    cvt.s.w $f2, $f2

exit:

#Mostrar suma
    li        $v0,4
    la        $a0,lin3
    syscall

    move $a0, $t2     
       li $v0, 1     
       syscall


#Mostrar diferencia
    li        $v0,4
    la        $a0,lin4
    syscall

    move $a0, $t3     
       li $v0, 1     
       syscall

#Mostrar multiplicacion
    li    $v0,4
    la        $a0,lin5
    syscall

    move $a0, $t4     
       li $v0, 1     
       syscall

#Mostrar division
    li        $v0,4
    la        $a0,lin6
    syscall

    div.s     $f12,$f1,$f2   
       li $v0, 2  
       syscall

#fin
   	mov.s $f8, $f1

       li    $v0,10
    syscall