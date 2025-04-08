package Practica2;

import java.util.*;

public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
        
	@Override
	public String toString() {
		return this.getData().toString();
	}

	public  int contarHojas() {
            return contar(this);
	}
        private int contar(BinaryTree<T> hijo){
            if (hijo==null){
                return 0;
            }else if(hijo.getLeftChild()==null && hijo.getRightChild()==null){
                return 1;
            }
            return contar(hijo.getLeftChild())+contar(hijo.getRightChild());
        }
		
		
    	 
        public BinaryTree<T> espejo(){
            BinaryTree<T> temp=new BinaryTree<>();
            temp.setData(this.getData());
            temp.addLeftChild(this.getRightChild());
            temp.addRightChild(this.getLeftChild());
            return temp;
        }

            // 0<=n<=m
        public void entreNiveles(int n, int m){
            if(n<0 || m<n){
                System.out.println("No cumple condiciones");
                return;
            }
            int nivel=0;
            Queue<BinaryTree<T>> cola=new LinkedList<>();
            cola.offer(this);
            cola.offer(null);
            while(!cola.isEmpty()){
                BinaryTree<T> ab=cola.poll();
                if(ab!=null){
                    if(n<=nivel && nivel<=m){
                        System.out.print(ab.getData() + " ");
                    }
                    if (ab.hasLeftChild()){
                        cola.offer(ab.getLeftChild());
                    }
                    if (ab.hasRightChild()){
                        cola.offer(ab.getRightChild());
                    }
                }
                else if(!cola.isEmpty()){
                    System.out.println();
                    cola.offer(null);
                    nivel+=1;
                }
                     
            }
        }

}

