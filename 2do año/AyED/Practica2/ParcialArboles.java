package Practica2;

public class ParcialArboles {
    
    public BinaryTree<Integer> arbol;

    public ParcialArboles(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }

    public BinaryTree<Integer> getArbol() {
        return arbol;
    }

    private void setArbol(BinaryTree<Integer> arbol) {
        this.arbol = arbol;
    }
    
    public BinaryTree<Integer> Busqueda (BinaryTree<Integer> hijo,int n){
        if (hijo==null){
            return hijo;
        }
        if(hijo.getData()==n){
            return hijo;
        } 
        if(Busqueda(hijo.getLeftChild(),n)!=null){
            return Busqueda(hijo.getLeftChild(),n);
        }else{
            return Busqueda(hijo.getRightChild(),n);
        }
    }
    public int contar (BinaryTree<Integer> ab){
        if(ab.hasLeftChild()&&ab.hasRightChild()){
            return contar(ab.getLeftChild())+contar(ab.getRightChild());
        }else if (ab.hasLeftChild()){
            return 1+contar(ab.getLeftChild());
        }else if (ab.hasRightChild()){
            return 1+contar(ab.getRightChild());
        }else
            return 0;
    }
    public boolean isLeftTree (int num){
        BinaryTree ab=Busqueda(this.getArbol(),num);
        if(ab==null){
            return false;
        } else{
            int izq,der;
            if(!ab.hasLeftChild()){
                izq=-1;
            }else{
                izq=contar(ab.getLeftChild());
            }
            if(!ab.hasRightChild()){
                der=-1;
            }else{
                der=contar(ab.getRightChild());
            }
            if(izq>der){
                return true;
            }else{
                return false;
            }
        }
    }
    
}