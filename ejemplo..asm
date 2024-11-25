.data
mensaje: .asciiz "x es mayor que 5\n"

.text
main:
    li $t0, 7           # Supongamos x = 7
    li $t1, 5           # Valor a comparar
    
    ble $t0, $t1, fin   # Si x <= 5, salta a fin
    
    # Código dentro del if
    li $v0, 4           # Imprimir string
    la $a0, mensaje
    syscall

fin:
    li $v0, 10          # Salir del programa
    syscall