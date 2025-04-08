/*
    Ejercicio 3
    Defina una clase Java denominada ContadorArbol cuya función principal es proveer métodos de
    validación sobre árboles binarios de enteros. Para ello la clase tiene como variable de instancia un
    BinaryTree<Integer>. Implemente en dicha clase un método denominado numerosPares() que
    devuelve en una estructura adecuada (sin ningún criterio de orden) todos los elementos pares del
    árbol (divisibles por 2).

    a) Implemente el método realizando un recorrido InOrden.
    b) Implemente el método realizando un recorrido PostOrden.
 */
package Practica2;

import java.util.*;
public class Ejercicio3 {
    
     public static void main(String[] args) {
         
         ContadorArbol enteros;
         BinaryTree<Integer> arbol=new BinaryTree<>(3);
         BinaryTree<Integer> hijo1=new BinaryTree<>(5);
         BinaryTree<Integer> hijo2=new BinaryTree<>(7);
         BinaryTree<Integer> hijo3=new BinaryTree<>(10);
         BinaryTree<Integer> hijo4=new BinaryTree<>(2);
         BinaryTree<Integer> hijo5=new BinaryTree<>(890);
         BinaryTree<Integer> hijo6=new BinaryTree<>(4);
         hijo1.addLeftChild(hijo2);
         hijo2.addRightChild(hijo3);
         hijo2.addLeftChild(hijo5);
         hijo3.addLeftChild(hijo4);
         hijo3.addRightChild(hijo6);
         arbol.addLeftChild(hijo1);
         arbol.addRightChild(hijo2);
         
         enteros=new ContadorArbol(arbol);
         enteros.getArbol().entreNiveles(0, 5);
         List<Integer> pares=new LinkedList<>(enteros.numerosparesInOrder());
         System.out.println();
         System.out.println(pares.toString());
         System.out.println();
         System.out.println(enteros.numerosparesPostOrder().toString());
    }
}