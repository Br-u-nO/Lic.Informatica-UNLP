package Practica1.Ejercicio7_figuras;

public class Circulo extends Figura2D{

	private double diametro;
	private double radio;
	
	public Circulo() {
		this.diametro = 0;
		this.radio = 0;
	}
	
	public Circulo(double diametro, double radio) {
		this.diametro = diametro;
		this.radio = radio;
	}
	
	public double getDiametro() {
		return diametro;
	}
	
	public double getRadio() {
		return radio;
	}
	
	private void setDiametro(double diametro) {
		this.diametro = diametro;
	}
	
	public void setRadio(double radio) {
		this.radio = radio;
	}
	
	@Override 
	public double getPerimetro () {
		return Math.PI * diametro;
	}
	
	@Override
	public double getArea () {
		return Math.PI * radio*radio;
	}
	
}
