    B main

prompt  DEFB "Enter square to reveal: ",0
mesg    DEFB "YOu entered the index ",0

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


    MOV PC,R14