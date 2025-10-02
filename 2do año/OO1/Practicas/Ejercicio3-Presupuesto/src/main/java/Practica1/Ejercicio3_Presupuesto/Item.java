package Practica1.Ejercicio3_Presupuesto;

public class Item {
	
	private String detalle;
	private Integer cantidad;
	private double costoUnitario;
	
	public Item(String detalle, Integer cantidad, double costoUnitario) {
		this.detalle = detalle;
		this.cantidad = cantidad;
		this.costoUnitario = costoUnitario;
	}
	
	public String getDetalle() {
		return detalle;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public Double getCostoUnitario() {
		return costoUnitario;
	}
	private void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	private void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	private void setCostoUnitario(Double costoUnitario) {
		this.costoUnitario = costoUnitario;
	}
	
	
	public double costo () {
		return cantidad * costoUnitario;
	}
	
	
}
