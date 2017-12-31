Reloj reloj;
Consola consola;
ArrayList<Estado> estados = new ArrayList<Estado>();

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
    if( estados.get( i ).getEstado().equals( Estado.ESTADO_DESACTIVO ) )
      estados.remove( i );
  }

  consola.ejecutar();
}

void keyPressed(){
  if( estados.size() > 0 ){
    for( Estado e : estados )
      e.eventoDeInteraccion( key, keyCode );
  }else{
    estados.add( new HolaEstado() );
  }
}