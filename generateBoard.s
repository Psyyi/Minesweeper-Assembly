        B main

; Our board 
; 0, represents an empty space
; 1-8 represents the number of bombs around us
; 66 represents there is a bomb at this location
; No more than 8 bombs
board   DEFW  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
seed    DEFW    8
magic   DEFW    65539
mask    DEFW    0x7FFFFFFF
space DEFB "  ",0
newline DEFB "\n\n",0
singlespace DEFB " ",0
_M DEFB "M",0
_A DEFB "A",0
_B DEFB "B",0
_C DEFB "C",0
_D DEFB "D",0
_E DEFB "E",0
_F DEFB "F",0
_G DEFB "G",0
_H DEFB "H",0

        ALIGN
main    MOV R13, #0x10000
	ADR R0, board 
        BL generateBoard
        ADR R0, board 
        BL printBoard
        SWI 2


; generateBoard
; Input R0 -- array to generate board in
generateBoard
        LDR R3,seed
        STMFD R13!,{R1-R10}
        ADRL R2, newline
        

;; Your routine to generate the board should be inserted here
        MOV R5,#1
        LDR R3,seed
    loop1
        LDR R2,mask
        STMFD R13!,{R14}
        BL randu   
        LDMFD R13,{R14}
        MOV R4,R0 
        ADR R11,board
        MOV R10,#4
        MUL R4,R4,R10
        LDR R7,[R11,R4]
        CMP R7,#66
        BEQ loop1;
        MOV R6,#66
        STR R6,[R11,R4]
        ADD R5,R5,#1
        
    

    
    cond1
    CMP R5,#8
    BLE loop1
        ;FINISHED PRINTING THE MINES
        











;START TO PRINT NUMBERS
        MOV R1,#0
        MOV R2,#0
        MOV R9,#8
        B con_Y
        loopY
        CMP R1,#0
        

        loopX
        MUL R3,R1,R9
        ADD R3,R3,R2
        LDR R0,[R11,R3] ;trying to access the array memeber num which is inR3
        CMP R0,#66
        BNE con_X
        CMP R1,#0 ;check if y is 0
        BEQ y0
        SUB R4,R1,#4 ;P=Y-1
        B ynot0
        y0 
        MOV R4,R1
        ynot0
        B con_Y2
        loopY2
        CMP R2,#0 ;start with q=x if r2 is 0
        BEQ xisz
        SUB R5,R2,#4
        B xnotz
        xisz
        MOV R5,R2
        xnotz

        loopX2
        
        MUL R6,R4,R9
        ADD R6,R6,R5
        LDR R0,[R11,R6] ;trying to access the array memeber num which is inR6
        CMP R0,#66
        BEQ con_X2
        LDR R10,[R11,R6] ;LOAD
        ADD R10,R10,#1 ;ADD
        MOV R0,R10
        STR R10,[R11,R6];STORE
        B con_X2

        con_Y
        CMP R1,#28
        BLE loopY 
        B printbo
        
        con_X
        ADD R2,R2,#4
        CMP R2,#28
        BLE loopX
        MOV R2,#0 ;so when loop start again ;)
        ADD R1,R1,#4 ; changed it place to here to start 0 then increment
        B con_Y
                
        
        con_Y2
        CMP R1,#28 ;if y=7 case 2
        BEQ yiss
        ADD R8,R1,#4
        B ynots
        yiss
        MOV R8,R1
        ynots
        CMP R4,R8
        BLE loopY2
        B con_X
        
        con_X2
        ADD R5,R5,#4
        CMP R2,#28 ;IF X=7 CASE 2
        BEQ xiss
        ADD R8,R2,#4
        B xnots
        xiss
        MOV R8,R2
        xnots
        CMP R5,R8
        BLE loopX2
        ADD R4,R4,#4
        B con_Y2


printbo
LDMFD R13,{R1-R10} 
MOV PC,R14 


; printBoard -- print the board 
; Input: R0 <-- Address of board
printBoard
        ADRL R3, space
        ADRL R0,singlespace
        ADRL R2, newline
        SWI 3

        MOV R1,#1;
eight
        MOV R0,R3;
        SWI 3;
        SWI 3;

        MOV R0,R1
        SWI 4
        ADD R1,R1,#1
        CMP R1,#9
        BLT eight

        MOV R0,R2
        SWI 3
        
        ADRL R0,_A
        SWI 3
        MOV R0,R3
        SWI 3
        
        MOV R0,R3; print first number with space before and after
        SWI 3;
        
        
 
        LDR R0, [R11];
        CMP R0,#0;
        BNE secc;
        ADRL R0,singlespace;
        SWI 3;
        B herea
        
        secc
        CMP R0,#66;
        BNE numm;
        ADRL R0,_M;
        SWI 3;
        B herea
        
        numm
        SWI 4;
        herea
        MOV R1,#4;

        MOV R0,R3;
        SWI 3;
loop
        MOV R0,R3;
        SWI 3;
        LDR R0,[R11,R1];
        
        CMP R0,#0;
        BNE sec;
        ADRL R0,singlespace;
        SWI 3;
        B check
        
        sec
        CMP R0,#66;
        BNE num;
        ADRL R0,_M;
        SWI 3;
        B check
        
        num
        SWI 4;
        
        check
        MOV R0,R3;
        SWI 3;
        ADD R1,R1,#4;  
        
        CMP R1,#32;
        BNE l2;
        MOV R0,R2;
        SWI 3
        ADRL R0,_B
        SWI 3
        MOV R0,R3
        SWI 3
        B l2

        l2
        CMP R1,#64
        BNE l3;
        MOV R0,R2;
        SWI 3
        ADRL R0,_C
        SWI 3
        MOV R0,R3
        SWI 3
        B l3

        l3
        CMP R1,#96
        BNE l4;
        MOV R0,R2;
        SWI 3
        ADRL R0,_D
        SWI 3
        MOV R0,R3
        SWI 3
        B l4

        l4
        CMP R1,#128
        BNE l5;
        MOV R0,R2;
        SWI 3
        ADRL R0,_E
        SWI 3
        MOV R0,R3
        SWI 3
        B l5
        
        l5
        CMP R1,#160
        BNE l6;
        MOV R0,R2;
        SWI 3
        ADRL R0,_F
        SWI 3
        MOV R0,R3
        SWI 3
        B l6

        l6
        CMP R1,#192
        BNE l7;
        MOV R0,R2;
        SWI 3
        ADRL R0,_G
        SWI 3
        MOV R0,R3
        SWI 3
        B l7


        l7
        CMP R1,#224
        BNE loop_condition;
        MOV R0,R2;
        SWI 3
        ADRL R0,_H
        SWI 3
        MOV R0,R3
        SWI 3
        B loop_condition

        loop_condition
        CMP R1,#256
        BLT loop
        

        
        


        MOV PC,R14

; randu -- Generates a random number
; Input: None
; Ouptut: R0 -> Random number
randu
LDR R0,magic
LDR R2,mask
MUL R1,R0,R3
AND R1, R1, R2
MOV R3,R1
MOV R0,R1
MOV R0,R0 ASR #8
AND R0, R0, #0x3f  ; take the modulo by 64 


MOV PC,R14