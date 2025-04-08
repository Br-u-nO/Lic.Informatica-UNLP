package Practica2;

import java.util.*;

public class ContadorArbol {
        private BinaryTree<Integer> arbol;
        
        public ContadorArbol(){
            
        }

    public BinaryTree<Integer> getArbol() {
        return arbol;
    }

    private void setArbol(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }

    public ContadorArbol(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }

    
        public List<Integer> numerosparesInOrder(){
            return inOrder(this.getArbol());
        }
        
        public List<Integer> numerosparesPostOrder(){         
            return PostOrder(this.getArbol());
        }
        private List<Integer> inOrder (BinaryTree<Integer> hijo){
            List<Integer> pares=new LinkedList<>();
            if(hijo!=null){
                if(hijo.hasLeftChild()){
                    pares.addAll(inOrder(hijo.getLeftChild()));
                }
                if(hijo.getData()%2==0){
                    pares.add(hijo.getData());
                }
                
                if(hijo.hasRightChild()){
                    pares.addAll(inOrder(hijo.getRightChild()));
                }
            }
            return pares;
        }
        
        private List<Integer> PostOrder (BinaryTree<Integer> hijo){
            List<Integer> pares=new LinkedList<>();
            if(hijo!=null){
                if(hijo.hasLeftChild()){
                    pares.addAll(PostOrder(hijo.getLeftChild()));
                }
                if(hijo.hasRightChild()){
                    pares.addAll(PostOrder(hijo.getRightChild()));
                }
                if(hijo.getData()%2==0){
                    pares.add(hijo.getData());
                }       
            }
            return pares;
        }
}
