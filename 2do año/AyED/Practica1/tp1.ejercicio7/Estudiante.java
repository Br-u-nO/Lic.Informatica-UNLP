package Practica1.tp1.ejercicio7;

public class Estudiante extends Persona {
		
	private int comision;
	private int direccion;
	
	
	public Estudiante(String nombre, String apellido, String email, int comision, int direccion) {
		super(nombre, apellido, email);
		this.setComision(comision);
		this.setDireccion(direccion);
	}

	public int getComision() {
		return comision;
	}
	public int getDireccion() {
		return direccion;
	}
	private void setComision(int comision) {
		this.comision = comision;
	}
	private void setDireccion(int direccion) {
		this.direccion = direccion;
	}
	@Override
	public String toString() {
		return "Estudiante:"+super.toString()+ "comision: " + this.getComision()+ ", direccion: " + this.getDireccion() + "]";
	}
	
	
}
