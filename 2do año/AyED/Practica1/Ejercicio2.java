package Practica1;

import java.util.Scanner;

public class Ejercicio2 {
  public static void main(String[]args) {
	  int n;
	  Vector vec=new Vector(0);
	  try (Scanner s = new Scanner(System.in)) {
		n=s.nextInt();
	  }
	  vec.VecMultiplos(n);;
	  System.out.print(vec.toString());
  }
  
}	 
