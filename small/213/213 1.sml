Unit daugyba;
 Reg a[15], c[15], a1[8];
 Reg b[8];
 Reg x[1];
 Cnt sk[4];
 Begin
     a1=input;
     b=input;
     Print a1,b;
     sk=7d;
  Print "Ciklo pradzia";

if b[1]==1 {
	b = ^b;
	a1 = ^a1;
}
a = a1;
if a1[1]==1 {
	a[1:8] = 11111111;
	a = a + 1;	
}
Print a, b;
ciklas:
	b = LLS(b);
	c = LLS(c);
	if b[1]==1 { 
		x.c=c+a; 
	}
	sk = sk-1;
	Print sk, a, b, c;
	if sk<>0 { 
		Goto ciklas; 
	}
	Print c; 
	c = c - 1;
	Print c;
End
