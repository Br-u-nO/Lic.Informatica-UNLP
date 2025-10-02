package Practica1.BalanzaElectrica;

public class Producto {
	
	private double	peso;
	private double	precioPorKilo;
	private String	descripcion;

	public Producto(String descripcion, double peso, double precioPorKilo) {
		this.peso = peso;
		this.precioPorKilo = precioPorKilo;
		this.descripcion = descripcion;
	}

	public double getPrecio() {
		return peso * precioPorKilo;
	}
	
	public double getPrecioPorKilo() {
		return precioPorKilo;
	}
	
	public double getPeso() {
		return peso;
	}
	
	public String getDescripcion() {
		return descripcion;
	}

	private void setPeso(double peso) {
		this.peso = peso;
	}

	public void setPrecioPorKilo(double precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}

	private void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
