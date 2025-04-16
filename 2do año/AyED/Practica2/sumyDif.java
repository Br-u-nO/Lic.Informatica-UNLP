package Practica2;

public class sumyDif {
    
    private int suma;
    private int dif;

    public sumyDif(int suma, int dif) {
        this.setSuma(suma);
        this.setDif(dif);
    }
        
    
    public int getSuma() {
        return suma;
    }

    private void setSuma(int suma) {
        this.suma = suma;
    }

    public int getDif() {
        return dif;
    }

    private void setDif(int dif) {
        this.dif = dif;
    }

    @Override
    public String toString() {
        return "sumyDif{" + "suma=" + suma + ", dif=" + dif + '}';
    }
        
        
}
