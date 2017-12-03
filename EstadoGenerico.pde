Reloj reloj;
Consola consola;

void setup(){
	size( 800, 600 );
  reloj = new Reloj();
  consola = new Consola();
}

void draw(){
  reloj.actualizar();
	background(0);
  consola.ejecutar();
}