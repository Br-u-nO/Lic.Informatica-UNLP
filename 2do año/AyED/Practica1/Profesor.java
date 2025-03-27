package Practica1;

public class Profesor extends Persona {

		private int catedra;
		private String facultad;
		
		
		public int getCatedra() {
			return catedra;
		}
		private void setCatedra(int catedra) {
			this.catedra = catedra;
		}
		public String getFacultad() {
			return facultad;
		}
		private void setFacultad(String facultad) {
			this.facultad = facultad;
		}
		@Override
		public String toString() {
			return "Profesor:"+super.toString()+ "catedra: " + this.getCatedra() + ", facultad: " + this.getFacultad() + "]";
		}
		public Profesor(String nombre, String apellido, String email, int catedra, String facu) {
			super(nombre, apellido, email);
			this.setCatedra(catedra);
			this.setFacultad(facu);
		}
		
		
}
