Unit Daugyba;
 Reg a[8], c[15];
 Reg b[8];
 Cnt sk[3];
Begin
     a=input;
     b=input;
     Print a,b;
     sk=7d;
	if a[8]==1 {
	a=a+1;
}
	if b[1]==1 {
	b=b+1;
}
 	Print a,b;
	Print "Ciklo pradþia";
ciklas:
if b[8]==1 {
	c[1:15] = c[1:15] +a;
}
 a = RLS(a);
 b = RLS(b);
 sk = sk -1;
 Print sk, a, b, c;
if sk><0 {
	Goto ciklas;
} 
if b[1]==1 {
	Print "Korekcija";
	c[1:8] =c[1:8] + ^a + 1;  
	Print c;
}


End
