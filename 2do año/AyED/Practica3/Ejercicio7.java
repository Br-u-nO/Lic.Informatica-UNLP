package Practica3;

public class Ejercicio7 {

	public static void main(String[] args) {
		GeneralTree<Integer> raiz=new GeneralTree<>(2);
        GeneralTree<Integer> hijo1=new GeneralTree<>(4);
        GeneralTree<Integer> hijo2=new GeneralTree<>(12);
        GeneralTree<Integer> hijo3=new GeneralTree<>(5);
        GeneralTree<Integer> hijo4=new GeneralTree<>(3);
        GeneralTree<Integer> hijo5=new GeneralTree<>(1);
        GeneralTree<Integer> hijo6=new GeneralTree<>(7);
        GeneralTree<Integer> hijo7=new GeneralTree<>(6);
        GeneralTree<Integer> hijo8=new GeneralTree<>(65);
        GeneralTree<Integer> hijo9=new GeneralTree<>(17);
        GeneralTree<Integer> hijo10=new GeneralTree<>(24);
        GeneralTree<Integer> hijo11=new GeneralTree<>(42);
        
        raiz.addChild(hijo1);
        raiz.addChild(hijo2);
        hijo2.addChild(hijo3);
        hijo3.addChild(hijo4);
        hijo3.addChild(hijo5);
        hijo3.addChild(hijo9);
        hijo3.addChild(hijo10);
        hijo3.addChild(hijo11);
        hijo5.addChild(hijo8);
        hijo1.addChild(hijo6);
        hijo1.addChild(hijo7);
        
        Caminos caminos = new Caminos(raiz);
        
        System.out.println(caminos.caminoAHojaMasLejana());
	}

}
