#프로그램에서 사용할 데이터 영역
    .data
msg: .asciiz "Caclulation result: " #출력할 메세지
number: .word 20 #연산에 사용할 수

#프로그램의 코드영역
    .text
    .globl main
main:
    lw $s0, number          #$s0레지스터에 20을 가지고 온다.
    li $s1, 0               #$s1 임의의 레지스터를 0이라고 정한다.    
    li $t4, 1               #최종 결과값 $t4를 1로 지정한다.
loop:
    addi $s1, $s1, 4        #$s1에 4를 더해주고 $s1 레지스터를 가져온다.
    mult $t4, $s1           #$s1 레지스터와 $t4 레지스터를 곱해준다.
    mflo $t4                #$t4에 값을 가져온다.
    beq $s1, %s0, exit      #$s1 레지스터가 $s0의 값 20일 될때까지 반복하며 20과 일치하면 반복문을 탈출한다.
j loop

exit:
    #결과를 출력하는 부분
    #msg로 레이블된 메세지를 출력
    li $v0, 4
    la $a0, msg
    syscall

    #계산 값을 출력하는 부분
    #최종 결과는 $t4레지스터에 저장되어 있다고 가정하고 출력
    li $v0, 1
    addi $a0, $t4, 0
    syscall

    #포로그램 종료
    li $v0,10
    syscall    