    B main

test    DEFB "A message to fill the screen\n",0
prompt  DEFB "Press any key to clear the screen...\n",0


    ALIGN
main    MOV R7,#15
mLoop   ADR R0, test
        SWI 3
        SUBS R7,R7, #1
        BNE mLoop

        ADR R0, prompt
        SWI 3
        SWI 1
        BL clearScreen
        SWI 2



; clearScreen : Clear the screen
; Input:  none
; Output: none
clearScreen
    MOV R1,#0
B clearcon
loop
    MOV R0,#10
    SWI 0
clearcon
    ADD R1,R1,#1
    CMP R1,#100
    BNE loop
    SWI 0
    MOV PC, R14