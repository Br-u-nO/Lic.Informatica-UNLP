package Practica1;

public class Valores {
		
		private int min;
		private int max;
		private double promedio;
		
		public Valores (int min, int max,double prom) {
			this.setMax(max);
			this.setMin(min);
			this.setPromedio(prom);
		}

		public int getMin() {
			return min;
		}

		private void setMin(int min) {
			this.min = min;
		}

		public int getMax() {
			return max;
		}

		private void setMax(int max) {
			this.max = max;
		}

		public double getPromedio() {
			return promedio;
		}

		private void setPromedio(double promedio) {
			this.promedio = promedio;
		}
		
}
