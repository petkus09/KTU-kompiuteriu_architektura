Unit Untitled2;
 Reg a[8], b[8];
 Reg x[1], y[2];
 Reg c[15];
 Cnt sk[3];
 Alu alu[15];
 Reg g[1];
MicroOperations
 1: a=input;/1
 2: b=input;/1
 3: c=0;/1
 4: x=0;/1
 5: sk=111;/1 
 6: y=0;/1
 7: g=1;/1
 8: L=a[2:8];/1
 9: R=g;/1
 10: F=1000;/2
 11: a[2:8]=M[9:15];/3
 12: L=y;/1
 14: y=M[14:15];/3
 15: b[2:8]=M[9:15];/3
 16: L=b[2:8];/1
 17: R=c[1:8];/1
 18: L=a;/1
 19: x.c[1:8]=M[8:15];/3
 20: c=RLS(c);/1
 21: x.c=RLS(x.c);/1
 22: c=RAS(c);/1
 23: b=RLS(b);/1
 24: L=sk;/1
 25: F=1011;/2 
 26: sk=M[13:15];/3
 27: L=a;/1
 28: F=0011;/2
 29: a=M[9:15];/3
 30: R=c;/1
 31: F=1011;/2
 32: c=M;/3 
Trace a,b,c,sk;
Conditions
 1: a[1]==1;
 2: b[1]==1;
 3: b[8]==1;
 4: a[1]==0;
 5: x[1]==1;
 6: sk<>0;
AddressingMode F2;
Format Y1,Y2,Y3,Y4,X,A0,A1;
Yfields
 1: 1,5,9,17,22,26,30;
 2: 2,6,10,20,21,23,27,31;
 3: 3,7,11,14,15,18,24,28,32; 
 4: 4,8,12,16,19,25,29;
Xfield 1,2,3,4,5,6;
MiMemory
0: 1 2 1 0 0 1 1;
1: 2 1 0 1 1 5 2;
2: 0 0 2 0 0 3 3;
3: 3 3 3 2 0 4 4;
4: 3 3 4 3 0 5 5;
5: 0 0 0 0 2 8 6;
6: 3 3 5 4 0 7 7;
7: 3 3 4 3 0 8 8;
8: 0 0 0 0 3 10 9;
9: 4 3 6 5 0 10 10;
10: 0 0 0 0 4 12 11;
11: 0 4 0 0 0 15 15;
12: 0 0 0 0 5 14 13;
13: 0 5 0 0 0 15 15;
14: 5 0 0 0 0 15 15;
15: 6 6 7 6 6 16 8;
16: 0 0 0 0 3 20 17;
17: 0 7 8 7 0 18 18;
18: 4 3 6 5 1 20 19;
19: 7 8 9 0 0 20 20;
20: 0;
Begin
End