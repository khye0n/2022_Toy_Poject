#프로그램에서 사용할 데이터 영역
    .data
msg: .asciiz "Caclulation result: " #출력할 메세지
number: .word 20 #연산에 사용할 수

#프로그램의 코드영역
    .text
    .globl main
main:
    lw $s0, number #s0레지스터에 20을 가지고 온다.

    #작성하세요,

loop:
    #작성하세요.








    #결과를 출력하는 부분
    #msg로 레이블된 메세지를 출력
    li %sv0, 4
    la $a0, msg
    syscall

    #계산 값을 출력하는 부분
    #최종 결과는 $t4레지스터에 저장되어 있다고 가정하고 출력
    li $v0, 1
    addi $a0, $t4, 0
    syscall

    #포로그램 종료
    li $v0,10       #exit
    syscall