package Practica2;
/*
 Escribir en una clase ParcialArboles que contenga UNA ÚNICA variable de instancia de tipo
  BinaryTree de valores enteros NO repetidos y el método público con la siguiente firma:
  public boolean isLeftTree (int num)
El método devuelve true si el subárbol cuya raíz es “num”, tiene en su subárbol izquierdo una
  cantidad mayor estricta de árboles con un único hijo que en su subárbol derecho. Y false en caso
  contrario. Consideraciones:

 ● Si“num” no se encuentra en el árbol, devuelve false.
 ● Si el árbol con raíz “num” no cuenta con una de sus ramas, considere que en esa rama hay-1 árboles con único hijo.

*/
public class Ejercicio7 {
    
    public static void main(String [] args){
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
         
         ParcialArboles enteros=new ParcialArboles(arbol);
         System.out.println(enteros.isLeftTree(5));
    }
}
