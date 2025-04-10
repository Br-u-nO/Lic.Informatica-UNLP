/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;

import java.util.Stack;

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

    public void setArbol(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }
        
        public int sumaElementosProfundidad (int p){
           Stack<BinaryTree> pila=new Stack<>();
           pila.push(this.getArbol());
           pila.push(null);
           int suma=0,n=0;
           while((!pila.isEmpty())&&(n<=p)){
               BinaryTree ab=pila.pop();
               if(ab!=null){
                   if(n==p){
                       suma+=(Integer)ab.getData();
                   }
               }else {
                   n+=1;
                   pila.push(null);
               }
           }
           return suma;
        }
        
    
}
