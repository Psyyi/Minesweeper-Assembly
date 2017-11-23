        B main

; Our board:
; 0, represents an empty space
; 1-8 represents the number of bombs around us
; 66 represents there is a bomb at this location
; No more than 8 bombs
board   DEFW  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
boardMask
        DEFW -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
        ALIGN
seed    DEFW    0xC0FFEE
mult    DEFW    65539

prompt  DEFB "Enter square to reveal: ",0
remain  DEFB "There are ",0
remain2 DEFB " squares remaining.\n",0
already DEFB "That square has already been revealed...\n", 0
loseMsg DEFB "You stepped on a mine, you lose!\n",0
winMsg  DEFB "You successfully uncovered all the squares while avoiding all the mines...\n",0

        ALIGN
main    MOV R13, #0x10000

; Your main game code goes here

        SWI 2



; clearScreen : Clear the screen
; Input:  none
; Output: none
clearScreen
        ; Insert your clear screen subroutine here

; boardSquareInput -- read board position from keyboard
; Input:  R0 ---> prompt string address
; Ouptut: R0 <--- index

boardSquareInput

; Copy your readBoardPos subroutine here.


; printMaskedBoard -- print the board 
; Input: R0 <-- Address of board
;        R1 <-- Address of board Mask
printMaskedBoard
    ; Insert your  implementation here


; generateBoard
; Input R0 -- array to generate board in
generateBoard
     ; Insert your subroutine here




; randu -- Generates a random number
; Input: None
; Ouptut: R0 -> Random number
randu   
        ; Insert your subroutine here...