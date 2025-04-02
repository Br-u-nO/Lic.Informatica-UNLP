package Practica1;

public class Ejercicio5 {

	public static void main(String [] args) {
		int [] v2;
		Vector v;
		v=new Vector(0);
		v.VecMultiplos(3);
		Valores test=v.getValores();
		v2=v.Valores2();
		System.out.println(v.toString());
		System.out.println(test.toString());
		System.out.println("minimo: "+v2[0]+" maximo: "+v2[1]+" promedio: "+v2[2]);
		v.Valores3();
	}
}
