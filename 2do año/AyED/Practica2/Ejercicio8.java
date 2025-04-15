package Practica2;

public class Ejercicio8 {

	public static void main(String[] args) {
		BinaryTree<Integer> arbol=new BinaryTree<>(3);
        BinaryTree<Integer> hijo1=new BinaryTree<>(5);
        BinaryTree<Integer> hijo2=new BinaryTree<>(7);
        BinaryTree<Integer> hijo3=new BinaryTree<>(10);
        BinaryTree<Integer> hijo4=new BinaryTree<>(2);
        BinaryTree<Integer> hijo5=new BinaryTree<>(9);
        BinaryTree<Integer> hijo6=new BinaryTree<>(4);
        hijo1.addRightChild(hijo3);
        hijo3.addLeftChild(hijo2);
        hijo4.addLeftChild(hijo5);
        hijo4.addRightChild(hijo6);
        arbol.addLeftChild(hijo1);
        arbol.addRightChild(hijo4);
        
        BinaryTree<Integer> arbol2=new BinaryTree<>(3);
        BinaryTree<Integer> hija1=new BinaryTree<>(5);
        BinaryTree<Integer> hija2=new BinaryTree<>(7);
        arbol2.addLeftChild(hija1);
        
        
        ParcialArboles enteros=new ParcialArboles(arbol);
        System.out.println(enteros.esPrefijo(arbol2, arbol));
		System.out.println(enteros.esPrefijo(arbol, arbol));
		System.out.println(enteros.esPrefijo(hijo5, arbol));
	}

}
