package Practica3;

public class Ejercicio8 {

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
        GeneralTree<Integer> hijo1_0=new GeneralTree<>(42);
        GeneralTree<Integer> raiz_1=new GeneralTree<>(42);
        GeneralTree<Integer> raiz_2=new GeneralTree<>(42);
        GeneralTree<Integer> hijo2_0=new GeneralTree<>(42);
        GeneralTree<Integer> hijo2_1=new GeneralTree<>(42);
        GeneralTree<Integer> hijo2_2=new GeneralTree<>(42);
        
        raiz.addChild(hijo1);
        raiz.addChild(hijo2);
        hijo2.addChild(hijo3);
        hijo3.addChild(hijo4);
        hijo3.addChild(hijo5);
        hijo3.addChild(hijo9);
        hijo3.addChild(hijo10);
        hijo3.addChild(hijo11);
        
        
        hijo1.addChild(hijo6);
        hijo1.addChild(hijo7);
        hijo1.addChild(hijo1_0);
        
        hijo2.addChild(hijo2_0);
        hijo2.addChild(hijo2_1);
        hijo2.addChild(hijo2_2);
        
        raiz.addChild(raiz_1);
        raiz.addChild(raiz_2);
        raiz.addChild(hijo8);
        
        
        
        Navidad<Integer> abeto = new Navidad<>(raiz);
        
        System.out.println(abeto.esAbetoNavidenio());
	}

}
