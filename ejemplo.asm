    .data           # Sección de datos
num1:   .word 5      # Primer número a sumar
num2:   .word 7      # Segundo número a sumar
result: .word 0      # Resultado de la suma

    .text           # Sección de código
    .globl main      # Declaración de main

main:
    # Cargar los números en los registros
    lw $t0, num1     # Cargar el valor de num1 en el registro $t0
    lw $t1, num2     # Cargar el valor de num2 en el registro $t1
    
    # Sumar los números
    add $t2, $t0, $t1   # Sumar los valores en $t0 y $t1, almacenar en $t2

    # Guardar el resultado
    sw $t2, result   # Guardar el valor de $t2 en result

    # Salida del programa
    li $v0, 10       # Código de syscall para salida del programa
    syscall
