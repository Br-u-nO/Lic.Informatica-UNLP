/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;


public class RedBinariaLlena {
    
        private BinaryTree<Integer> arbol;

    public RedBinariaLlena(BinaryTree<Integer> arbol) {
         this.arbol = arbol;
     }
        
        public BinaryTree<Integer> getArbol() {
        return arbol;
    }

    

    private void setArbol(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }
    
    public int retardoRenvio (){
        return busqueda(this.getArbol(),0);
    }
    public int busqueda (BinaryTree hijo,int suma){
        int izq,der;
        if(hijo==null){
            return suma;
        }
        
            suma+=(int) hijo.getData();
            izq=busqueda(hijo.getLeftChild(),suma);
            der=busqueda(hijo.getRightChild(),suma);
            if(izq>der){
                return izq;
            }
            else{
                return der;
            }
        
    }
        
}
