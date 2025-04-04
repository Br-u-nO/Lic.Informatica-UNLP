package tp1.ejercicio7;

public abstract class Persona {

	private String nombre;
	private String apellido;
	private String email;
	
	
	public Persona(String nombre, String apellido, String email) {
		super();
		this.setNombre(nombre);
		this.setApellido(apellido);
		this.setEmail(email);
	}
	public String getNombre() {
		return nombre;
	}
	private void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	private void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	private void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return " nombre: " + this.getNombre() + ", apellido: " + this.getApellido() + ", email: " + this.getEmail() ;
	}
	
	
}
