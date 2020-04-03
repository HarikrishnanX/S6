	ORG 00H
	MOV R0,#0020H;source address
	MOV R1,#0030H;destination address
	MOVX A,@R0;copy value from source to register A
	MOV R3,A;copy value from A to R5
	MOV R4,#00H;set R4 to 00H
	INC R0
	MOVX A,@R0;copy next value from source to register A
	MOV R2,A;copy A to R2
	MOV A,R3;copy R3 to A
	DEC R2
MULT:	ADD A,R3;add contents of A and R3
	JNC SAVE;if no carry jump to label SAVE
	INC R4
SAVE:	DJNZ R2,MULT;decrement R2 and jump to label MULT if not zero
	MOV B,R4;copy R4 to B
	MOV R5,A;copy A to R5
	MOV A,B;copy B to A
	MOVX @R1,A;store carry in R1
	INC R1
	MOV A,R5;copy R5 to A
	MOVX @R1,A;copy result to R1
HALT:	SJMP HALT
