/*
 Su tarea es calcular el mayor retardo posible, en el camino que realiza un mensaje desde la raíz
 hasta llegar a las hojas en una red binaria llena. En el ejemplo, debería retornar 10+3+9+12=34
 (Si hay más de un máximo retorne el último valor hallado).
 Nota: asuma que cada nodo tiene el dato de retardo de reenvío expresado en cantidad de
 segundos.
 a) Indique qué estrategia (recorrido en profundidad o por niveles) utilizará para resolver el
 problema.
 b) Cree una clase Java llamada RedBinariaLlena donde implementará lo solicitado en el
 método retardoReenvio():int
 */
package Practica2;



public class Ejercicio4 {

    public static void main(String[] args) {
         
         RedBinariaLlena enteros;
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
         
        enteros=new RedBinariaLlena(arbol);
        System.out.println("El retardo es de: "+enteros.retardoRenvio()+ " segundos.");
    }
}
