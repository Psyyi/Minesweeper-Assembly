    B main

prompt  DEFB "Enter square to reveal: ",0
mesg    DEFB "YOu entered the index ",0
newline DEFB "\n",0

    ALIGN
main    ADR R0, prompt
        BL boardSquareInput

        MOV R1, R0
        ADR R0, mesg
        SWI 3
        MOV R0,R1
        SWI 4
        MOV R0,#10
        SWI 0
        SWI 2


; boardSquareInput -- read board position from keyboard
; Input:  R0 ---> prompt string address
; Ouptut: R0 <--- index

boardSquareInput
    ADR R0, prompt
    SWI 3
    ADR R0,newline
    SWI 3
    
    SWI 1

firstinput 
    CMP R0,#65
    BLT boardSquareInput
    CMP R0,#72
    BGT boardSquareInput ;finished checking the first input
    MOV R1,R0 ;saves first input in r1

    SWI 1

secondinput
    CMP R0,#49
    BLT boardSquareInput
    CMP R0,#56
    BGT boardSquareInput ;finished checking the second input
    MOV R2,R0 ;saves first seond in r2
    

    SWI 1
    CMP R0,#10
    BNE boardSquareInput

    SUB R1,R1,#65
    SUB R2,R2,#49
    ;8r+c
    MOV R0,#8
    MUL R1,R1,R0
    ADD R3,R1,R2
    MOV R0,R3

    MOV PC,R14