package ejercicio1_practica1;

public class ejer{
	public static void main(String[]args) {
		int a=1;
	    int b=10;
		modulo1(a,b);
	        modulo2(a,b);
		modulo3(a,b);
	}
  public static void modulo1 (int a,int b) {
	for (int j=a;j<=10;j++) {
	   System.out.print(j);
  }
  }
  public static void modulo2(int a,int b) {
     int j=a;
	 while (j<=b) {
		 System.out.print(" "+j);
		 j+=1;
	 }
  }
  public static void modulo3 (int a,int b) {
	  System.out.print(a);
	  a+=1;
	  if(a<=b) {
		  modulo3(a,b);
	  }
  }
}
