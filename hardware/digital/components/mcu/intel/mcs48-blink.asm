	;;   ******************************************
	;;   *
	;;   *  8049 LED FLUSHING PROGRAM
	;;   *
	;;   *  1992-MAY-18 BY S.FUKUDA
	;;   *
	;;   ******************************************

.org 000H

	;;  -----Register initialization-----
	MOV R0, #0 ; Assign D'00 to general-purpose register R0

	;; -----Main-----

START:
	MOV   A, R0 ; Assign the value stored in R0 to the accumulator
	MOVP3 A, @A ; Assign the address value stored in the accumulator on page 3 to the accumulator
	CPL   A     ; Invert the value in the accumulator
	OUTL  P1, A ; Output port 1 to the accumulator bit
	INC   R0    ; Increment general register R0 (add 1 to internal value)

	;;  -----Loop 1 starts here-----
	MOV R1, #0 ; Assign D'00 to general register R1

	;; -----Loop 2 starts here-----

LOOP:
	MOV R2, #77 ;; Assign D'77 to general register R2

LOOP2:
	DEC R2    ; Decrement general register R2 (subtract 1 from internal value)
	MOV A, R2 ; Assign value stored in R2 to accumulator
	JNZ LOOP2 ; Jump to LOOP2 if accumulator is not 0

	;;  -----End of loop 2-----
	DEC R1    ; Decrement general register R1 (subtract 1 from internal value)
	MOV A, R1 ; Assign value stored in R1 to accumulator
	JNZ LOOP  ; If the accumulator is not 0, jump to LOOP

	;; -----End of loop 1-----

	;;  -----Has the pattern written on page 3 reached the end? -----
	MOV A, R0  ; Assign the value stored in R0 to the accumulator
	ADD A, LEN ; Add (#-LEN) to the accumulator
	JNZ START  ; Jump to START if the accumulator is not 0

	;;  -----The pattern has reached the end and the program has finished-----
	;;  -----Reinitialize the registers and loop-----
	MOV R0, #0 ; Assign D'00 to general-purpose register R0
	JMP START  ; Jump to START


.org 300H

	;; -----Write output pattern-----

TABLE:
	.DB 001H ; The output pattern of port 1 is written
	.DB 002H

	;;  (Omitted)
	.DB 0FFH
	.DB 000H

	;; -----Symbol-----

LEN:
	.EQU $-TABLE; The symbol "LEN" is the current address ($) minus the address of TABLE
	.END
