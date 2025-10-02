package Practica1.Ejercicio7_figuras;

public class Cuadrado extends Figura2D{

	double lado;

	public Cuadrado() {
		this.lado = 0;
	}
	
	public Cuadrado(double lado) {
		this.lado = lado;
	}

	public double getLado() {
		return lado;
	}

	public void setLado(double lado) {
		this.lado = lado;
	}
	
	@Override
	public double getPerimetro () {
		return lado * 4;
	}
	
	@Override
	public double getArea () {
		return lado * lado;
	}
	
}
