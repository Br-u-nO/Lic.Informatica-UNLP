/*
 Ejercicio 5
 Implemente una clase Java llamada ProfundidadDeArbolBinario que tiene como variable de
 instancia
 un árbol binario de números enteros y un método de instancia
 sumaElementosProfundidad (int p):int el cuál devuelve la suma de todos los nodos del árbol
 que se encuentren a la profundidad pasada como argumento.
 */
package Practica2;


public class Ejercicio5 {

    
    public static void main(String[] args) {
         BinaryTree<Integer> arbol=new BinaryTree<>(3);
         BinaryTree<Integer> hijo1=new BinaryTree<>(5);
         BinaryTree<Integer> hijo2=new BinaryTree<>(7);
         BinaryTree<Integer> hijo3=new BinaryTree<>(10);
         BinaryTree<Integer> hijo4=new BinaryTree<>(2);
         BinaryTree<Integer> hijo5=new BinaryTree<>(7);
         BinaryTree<Integer> hijo6=new BinaryTree<>(4);
         hijo1.addLeftChild(hijo2);
         hijo1.addRightChild(hijo3);
         hijo4.addLeftChild(hijo5);
         hijo4.addRightChild(hijo6);
         arbol.addLeftChild(hijo1);
         arbol.addRightChild(hijo4);
         
         ProfundidadDeArbolBinario enteros=new ProfundidadDeArbolBinario(arbol);
         
         System.out.println(enteros.sumaElementosProfundidad(2));
    }
    
}
