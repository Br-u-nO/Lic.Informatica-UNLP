package Practica1;

public class Vector {

	private int [] vec;
	int diml;
    
	public Vector (int n) {
		int [] v=new int[n];
		this.setVec(v);
	}
	public void VecMultiplos(int n) {
		int [] v= new int [n];
		this.setVec(v);
		this.diml=n;
		for (int i=0;i<n;i++) {
			this.vec[i]=(i+1)*n;
		}
	}
	
	public int[] getVec() {
		return vec;
	}
	private void setVec(int[] vec) {
		this.vec = vec;
	}
	private int getDiml() {
		return diml;
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
	
	public Valores getValores () {
		Valores v;
		int min=9999,max=-9999;
		double p=0;
		for (int i=0;i<this.getDiml();i++) {
			if (this.getNum(i)<min) {
				min=this.getNum(i);
			}
			if (this.getNum(i)>max) {
				max=this.getNum(i);
			}
			p+=this.getNum(i);
		}
		v=new Valores(min,max,p/this.getDiml());
		return v;
	}
	
	


	private void setVec(int n,int v) {
		this.vec[n] = v;
	}
	


	public Vector Valores2() {
		Vector v;
		int min=9999,max=-9999;
		double p=0;
		for (int i=0;i<this.getDiml();i++) {
			if (this.getNum(i)<min) {
				min=this.getNum(i);
			}
			if (this.getNum(i)>max) {
				max=this.getNum(i);
			}
			p+=this.getNum(i);
		}
		int i=(int) (p/this.getDiml());
		v=new Vector(3);
		v.setVec(0, min);
		v.setVec(1, max);
		v.setVec(2, i);
		return v;
	}
	
}
