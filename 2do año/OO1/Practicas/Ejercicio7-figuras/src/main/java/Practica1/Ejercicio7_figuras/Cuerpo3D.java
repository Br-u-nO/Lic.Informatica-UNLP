package Practica1.Ejercicio7_figuras;

public class Cuerpo3D {
	
	private Figura2D caraBasal;
	private double altura;
	
	
	public double getAltura() {
		return altura;
	}
	public void setCaraBasal(Figura2D caraBasal) {
		this.caraBasal = caraBasal;
	}
	public void setAltura(double altura) {
		this.altura = altura;
	}
	
	public double getVolumen () {
		return caraBasal.getArea() * altura;
	}
	
	public double getSuperficieExterior() {
		return caraBasal.getArea()*2 + caraBasal.getPerimetro() * altura;
	}
	
}
