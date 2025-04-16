/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;

import java.util.Queue;
import java.util.LinkedList;

public class Transformacion {
        
    private BinaryTree<Integer> arbol;

    public Transformacion(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }

    public BinaryTree<Integer> getArbol() {
        return arbol;
    }

    private void setArbol(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }
    
     public BinaryTree<Integer> suma(){
         return suma(this.getArbol());
        
     }
     private BinaryTree<Integer> suma(BinaryTree<Integer> original) {
         if (original == null) 
             return null; 
         Integer nuevoValor;
         if (original.hasLeftChild() || original.hasRightChild()) {
             nuevoValor = busqueda(original, 0) - original.getData();
         } else {
             nuevoValor = 0;
         }
        BinaryTree<Integer> nuevoArbol = new BinaryTree<>(nuevoValor);
        nuevoArbol.addLeftChild(suma(original.getLeftChild()));
        nuevoArbol.addRightChild(suma(original.getRightChild()));
        
        return nuevoArbol; 
}

     
             
     private int busqueda (BinaryTree hijo,int suma){
        if(hijo!=null){
            suma+=(int) hijo.getData()+ busqueda(hijo.getLeftChild(),suma)+ busqueda(hijo.getRightChild(),suma);
            }
        return suma;
     }
     
    }
        

