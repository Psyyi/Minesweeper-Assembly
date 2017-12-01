        B main

; Our board 
; 0, represents an empty space
; 1-8 represents the number of bombs around us
; 66 represents there is a bomb at this location
; No more than 8 bombs
board   DEFW  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

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
     ; Copy and convert your generateBoard routine into a subroutine here



; printBoard -- print the board 
; Input: R0 <-- Address of board
printBoard
        ; Copy your implementation of printBoard here 


        MOV PC,R14

; randu -- Generates a random number
; Input: None
; Ouptut: R0 -> Random number
randu
        ; Copy your implementation of randu from the previous coursework here
