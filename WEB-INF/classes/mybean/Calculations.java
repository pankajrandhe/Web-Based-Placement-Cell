package mybean;
public class Calculations
{
int num1,num2,A,S,M,D;
public void setNum1(int a)
{
num1=a;
}
public void setNum2(int b)
{
num2=b;
calculate();
}
public void calculate()
{
A=num1+num2;
S=num1-num2;
M=num1*num2;
try{D=num1/num2;}
catch(Exception e){D=0;}
}
public int getAdd()
{
return(A);
}
public int getSub()
{
return(S);
}
public int getMulti()
{
return(M);
}
public int getDiv()
{
return(D);
}
}