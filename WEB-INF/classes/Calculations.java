package mybean;
public class Calculations
{
double num1,num2,A,S,M,D;
public void setNum1(double a)
{
num1=a;
}
public void setNum2(double b)
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
public double getAdd()
{
return(A);
}
public double getSub()
{
return(S);
}
public double getMulti()
{
return(M);
}
public double getDiv()
{
return(D);
}
}