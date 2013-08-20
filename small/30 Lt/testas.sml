Unit variantoNr81;
Reg a[8], c[15];
Reg a_p[15];
Reg b[8];
Reg x[1];
Cnt sk[3]; 
Begin
	a=input;
	b=input;
	Print a,b;
if b[1]==1{
a=^a;
b=^b;	
}
if a[1]==1{
a=a+1;
a_p[1:8]=^a_p[1:8];
}
a_p[9:15]=a[2:8];
Print a,a_p;
sk=7d;
Print "Ciklo pradzia";
ciklas:
	if b[8]==1 {
		x.c[1:15]=c[1:15]+a_p;
	}
	a_p=LLS(a_p);
	b=RLS(b);
	sk=sk-1;
	Print sk, a_p, b, c;
	if sk<>0 {
		Goto ciklas;
	}
if c[1]==1{
c=c-1;
}
Print c;
End