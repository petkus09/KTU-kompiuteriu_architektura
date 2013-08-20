Unit daugyba;
 Reg a[8], c[15] , b[8];
 Reg ak[8] , bk[8] , ck[1];
 Reg bz[1];
 Cnt sk[3];
 Begin
     a=input;
     b=input;
     Print a,b;
     sk=7d;
     bz[1]=b[1];     
     if b[1]==1 {
         bk = ^b;
         b=b+1;
     }
     if b[1]==0 {
          bk=^b;
          bk = bk+1;
          bk[1] = 1;
     }
     ak=^a;
     a=a+1;
     ak[1]=0;
     a[1]=0;
ciklas:        
        c = LLS(c);   
        b = LLS(b);        
	if b[1]==1 { 
		c=c+a; 
	}
	sk = sk-1;
	Print sk, b , c;
	if sk<>0 { 
		Goto ciklas; 
	}     
        c[1:8]=c[1:8]+bk; 
        if bz[1]==0 {
           c=c-1;  
        }
        if bz[1]==1 {
           c[1:8]=c[1:8]+ak;   
           ck[1]=c[1];  
           c[1]=^ck;
        }
  	Print c; 
End
 
