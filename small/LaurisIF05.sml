Unit Daugyba;
	Reg C[9];
	Reg A[8];
	Reg Azenklas[1];
	Reg B[4];
	Reg Bzenklas[1];
	Cnt SK[3];
	Alu alu[9];
 
MicroOperations

	1: Bzenklas.B = input;/1
	2: Azenklas.A[5:8] = input;/1
	3: C = 0; /1
	4: SK = 100;/1
	5: L = A; /1
	6: R = C; /1
	7: F = 1000;/2
	8: C = W.M;/3
	9: A = LLS(A);/1
	10: B = RCS(B);/1
	11: SK = SK - 1;/1
	12: L = C[2:5];/1
	13: R = A[1:4];/1
	14: R = B;/1
	15: F = 0111;/2
	16: C[2:5] = M[6:9];/3
	17: C[1] = 0;/1
	18: C[1] = 1;/1

Trace     A,B,C,SK;

Conditions
           1: B[4]==0;
           2: SK<>0;
	   3: Azenklas==0;
	   4: Bzenklas==0;

AddressingMode N;
 
Format    0:Y1,Y2,Y3,Y4;
	  1:X,A;

Yfields
	1: 1, 5, 10, 13, 14;
	2: 2, 6, 9, 15;
	3: 3, 7, 11, 16, 17;
	4: 4, 8, 12, 18;

Xfield 	   1, 2, 3, 4;

MiMemory
0:	0 0 1 1 1;
1:	0 1 0 0 0;
2:	1 1 4;
3:	0 2 2 2 2;
4: 	0 3 3 3 0;
5:	1 2 2;
6:	1 3 9;
7:	0 5 4 4 3;
8:	0 0 0 0 4;
9:	1 4 12;
10:	0 4 4 4 3;
11:	0 0 0 5 0;
12:	0;
Begin
End
