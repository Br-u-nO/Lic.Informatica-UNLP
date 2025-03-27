package Practica1;

import java.util.Scanner;

public class Ejercicio2 {
  public static void main(String[]args) {
	  int n;
	  Vector vec;
	  try (Scanner s = new Scanner(System.in)) {
		n=s.nextInt();
	  }
	  vec=new Vector(n);
	  System.out.print(vec.toString());
  }
  
}	 
