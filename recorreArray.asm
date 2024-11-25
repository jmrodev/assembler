addi $t4,$zero,9

addi $t0,$zero,0x2000
bucle:
lw $t1,0($t0)
addi $t0,$t0,4
lw $t2,0($t0)
beq $t1,$t2,final
slt $t3,$t1,$t2
subi $t4,$t4,1
bne $t3,$zero,bucle

final: