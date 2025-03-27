package Practica1;

public class Vector {

	private int [] vec;
	int diml;

	public Vector(int n) {
		this.vec = new int [n];
		this.diml=n;
		for (int i=0;i<n;i++) {
			this.vec[i]=(i+1)*n;
		}
	}
	
	public int getNum (int n) {
		return this.vec[n];
	}
	public String toString(){
		String aux="";
		for (int i=0;i<diml;i++) {
			aux+=(this.getNum(i)+" ");
		}
		return aux;
	}
	
}
