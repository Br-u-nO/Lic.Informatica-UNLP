/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;

import java.util.Queue;
import java.util.ArrayList;

public class Ejercicio6 {

    
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
         
         
         Transformacion enteros=new Transformacion(arbol);
         enteros.getArbol().entreNiveles(0, 3);
         BinaryTree<Integer> enteros2=(enteros.suma());
         System.out.println();
         enteros2.entreNiveles(0, 3);
         
    }
     
}
