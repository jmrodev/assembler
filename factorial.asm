    .data                    # Sección de datos
prompt:   .asciiz "Ingresa un número: "   # Mensaje para el usuario
resultMsg: .asciiz "El factorial es: "    # Mensaje de resultado
newline:  .asciiz "\n"                    # Nueva línea

    .text                    # Sección de código
    .globl main

main:
    # Solicitar número al usuario
    li $v0, 4                 # Syscall para imprimir cadena
    la $a0, prompt            # Cargar la dirección del mensaje
    syscall

    # Leer número ingresado por el usuario
    li $v0, 5                 # Syscall para leer entero
    syscall
    move $t0, $v0             # Guardar el número en $t0

    # Inicializar variables para el cálculo del factorial
    li $t1, 1                 # $t1 = 1 (acumulador para el factorial)
    move $t2, $t0             # Guardar el valor original en $t2 para el bucle

factorial_loop:
    beq $t2, 1, print_result  # Si $t2 == 1, ir a print_result
    mul $t1, $t1, $t2         # $t1 = $t1 * $t2
    sub $t2, $t2, 1           # $t2 = $t2 - 1
    j factorial_loop          # Repetir el bucle

print_result:
    # Imprimir el mensaje de resultado
    li $v0, 4                 # Syscall para imprimir cadena
    la $a0, resultMsg         # Cargar la dirección del mensaje de resultado
    syscall

    # Imprimir el resultado (factorial)
    move $a0, $t1             # Mover el resultado al registro $a0 para imprimir
    li $v0, 1                 # Syscall para imprimir entero
    syscall

    # Imprimir nueva línea
    li $v0, 4                 # Syscall para imprimir cadena
    la $a0, newline           # Cargar nueva línea
    syscall

    # Salir del programa
    li $v0, 10                # Syscall para terminar el programa
    syscall
