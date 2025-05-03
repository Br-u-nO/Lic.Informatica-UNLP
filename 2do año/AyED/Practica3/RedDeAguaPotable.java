package Practica3;

import java.util.List;
import java.util.LinkedList;
import java.util.Queue;

public class RedDeAguaPotable {
    
        private GeneralTree<Character> redAgua;

    public RedDeAguaPotable(GeneralTree<Character> redAgua) {
        this.redAgua = redAgua;
    }
    
    public RedDeAguaPotable(Character c){
        GeneralTree<Character> dato =new GeneralTree<>(c);
        this.setRedAgua(dato);
    }

    public GeneralTree<Character> getRedAgua() {
        return redAgua;
    }

    private void setRedAgua(GeneralTree<Character> redAgua) {
        this.redAgua = redAgua;
    }
        
    
        public double minimoCaudal(double caudal){
            if(this.redAgua==null)
                return -1;
            return calcularAgua(this.getRedAgua(),caudal);
                
        }
           
        
        private double calcularAgua (GeneralTree<Character> ab, double caudal){
          double min = caudal;
          double act = 0;
          if(ab.hasChildren()){
            for(GeneralTree<Character> hijo : ab.getChildren()){
                act = calcularAgua(hijo,(caudal/ab.getChildren().size()));
                if (act<min)
                       min=act;
            }
          }
          
          return min;
        }
           
        
        
}
