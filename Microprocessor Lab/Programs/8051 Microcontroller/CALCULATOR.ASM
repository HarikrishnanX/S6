	ORG 00H
	MOV R0,#40H;choice of operation
	MOV A,@R0;copy R0 to A
	CJNE A,#01H,L1;compare with 01h and jump to L1 if not equal
	JMP ADDI;jump to label ADDI
L1:	CJNE A,#02H,L2;compare with 02h and jump to L2 if not equal
	JMP SUBT;jump to label SUBT
L2:	CJNE A,#03H,L3;compare with 03h and jump to L3 if not equal
	JMP MULT;jump to label MULT
L3:	CJNE A,#04H,HALT;compare with 04h and jump to HALT if not equal
	JMP DIVI;jump to label DIVI
ADDI:	MOV R0,#20H;source address
	MOV R1,#30H;destination address
	MOV A,@R0;copy value from source to register A
	MOV R5,A;copy value from A to R5
	MOV R4,#00H;set R4 to 00h
	INC R0
	MOV A,@R0;copy next value from source to register A
	ADD A,R5;add contents of A and R5
	JNC SAVE1;if there is no carry jump to label SAVE
	INC R4
	MOV B,R4;copy carry to B
	MOV @R1,B;copy carry to destination
	INC R1
SAVE1:	MOV @R1,A;copy result to destination
HALT1:	SJMP HALT1	
SUBT:	MOV R0,#20H;source address
	MOV R1,#30H;destination address
	MOV A,@R0;copy 1st number to A
	MOV R5,A;copy A to R5
	MOV R4,#00H;set R4 to 00h
	INC R0
	MOV A,@R0;copy 2nd number to A
	MOV R3,A;copy A to R3
	MOV A,R5;copy R5 to A
	SUBB A,R3;subtract A and R3
	JNC SAVE2;if there is no carry jump to label SAVE
	INC R4
	MOV B,R4;copy R4 to B
	INC R4
	MOV @R1,B;store carry in R1
	INC R1
SAVE2:	MOV @R1,A;store result in R1
HALT2:	SJMP HALT2
MULT:	MOV R0,#20H;source address
	MOV R1,#30H;destination address
	MOV A,@R0;copy 1st number to A
	INC R0
	MOV B,@R0;copy 2nd number to B
	MUL AB;multiply A and B
	MOV @R1,B;store higher byte 
	INC R1
	MOV @R1,A;store lower byte
HALT3:	SJMP HALT3
DIVI:	MOV R0,#20H;source address
	MOV R1,#30H;destination address
	MOV A,@R0;copy 1st number to A
	INC R0
	MOV B,@R0;copy 2nd number to B
	DIV AB;divide the 2 numbers
	MOV @R1,A;copy quotient to R1
	INC R1
	MOV @R1,B;copy remainder to R1
HALT4:	SJMP HALT4
HALT:	SJMP HALT
	

