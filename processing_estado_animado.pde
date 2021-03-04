Reloj reloj;
Consola consola;
ArrayList<EstadoDe4Pasos> estados = new ArrayList<EstadoDe4Pasos>();

int transicion = 500;

void setup(){
	size( 800, 600 );
  reloj = new Reloj();
  consola = new Consola();
}

void draw(){
  reloj.actualizar();
	background(0);

  for( int i = estados.size() - 1; i >= 0; i-- ){
    estados.get( i ).ejecutar();
    consola.println( "Estado: " + estados.get( i ).estado );
    if( estados.get( i ).getEstado().equals( EstadoDe4Pasos.ESTADO_DESACTIVO ) )
      estados.remove( i );
  }

  consola.ejecutar();
}

void keyPressed(){
  if( estados.size() > 0 ){
    for( EstadoDe4Pasos e : estados )
      e.eventoDeInteraccion( key, keyCode );
  }else{
    estados.add( new HolaEstado() );
  }
}
