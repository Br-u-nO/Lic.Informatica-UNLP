/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;

import java.util.Queue;
import java.util.LinkedList;

public class ProfundidadDeArbolBinario {
        
        private BinaryTree<Integer> arbol;

        public ProfundidadDeArbolBinario() {
        }

    public ProfundidadDeArbolBinario(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }
        

    public BinaryTree<Integer> getArbol() {
        return arbol;
    }

    private void setArbol(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }
        
        public int sumaElementosProfundidad (int p){
           Queue<BinaryTree> cola=new LinkedList<>();
           cola.offer(this.getArbol());
           cola.offer(null);
           int suma=0,n=0;
           while((!cola.isEmpty())&&(n<=p)){
               BinaryTree<Integer> ab=cola.poll();
               if(ab!=null){
                   if(n==p){
                       suma+=(Integer)ab.getData();
                   }
                   if(ab.hasLeftChild()){
                       cola.offer(ab.getLeftChild());
                   }
                   if(ab.hasRightChild()){
                       cola.offer(ab.getRightChild());
                   }
               }else if(!cola.isEmpty()){
                   n+=1;
                   cola.offer(null);
               }
           }
           return suma;
        }
        
    
}
