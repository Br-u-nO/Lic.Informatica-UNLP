package Practica1;

public class Ejercicio5 {

	public static void main(String [] args) {
		
		Vector v,v2;
		v=new Vector(0);
		v.VecMultiplos(3);
		Valores test=v.getValores();;
		v2=v.Valores2();
		System.out.println(v.toString());
		System.out.println(test.toString());
		System.out.println(v2.toString());
		
	}
}
