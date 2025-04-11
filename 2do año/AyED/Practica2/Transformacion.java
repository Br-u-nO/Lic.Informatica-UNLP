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
         Queue<BinaryTree> cola=new LinkedList<>();
           cola.offer(this.getArbol());
           cola.offer(null);
           int suma=0,n=0;
           while(!cola.isEmpty()){
               BinaryTree<Integer> ab=cola.poll();
               if(ab!=null){
                     if(!ab.hasLeftChild()&&!ab.hasRightChild()){
                         ab.setData(0);
                     }else{
                         ab.setData(busqueda(ab,0)-ab.getData());
                     }
                   if(ab.hasLeftChild()){
                       cola.offer(ab.getLeftChild());
                   }
                   if(ab.hasRightChild()){
                       cola.offer(ab.getRightChild());
                   }
               }else if(!cola.isEmpty()){
                   cola.offer(null);
               }
           }
           return this.getArbol();
        }
     
             
     private int busqueda (BinaryTree hijo,int suma){
        if(hijo!=null){
            suma+=(int) hijo.getData()+ busqueda(hijo.getLeftChild(),suma)+ busqueda(hijo.getRightChild(),suma);
            }
        return suma;
     }
     
    }
        

