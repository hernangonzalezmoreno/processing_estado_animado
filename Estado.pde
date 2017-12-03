abstract class Estado{
  
  String estado;
  static final String
  ESTADO_INICIAR = "iniciar",
  ESTADO_ACTIVO = "activo",
  ESTADO_FINALIZAR = "finalizar",
  ESTADO_DESACTIVO = "desactivo";
  
  int tiempo;
  final int TIEMPO_INICIAR, TIEMPO_FINALIZAR;
    
  Estado( int tiempoIniciar, int tiempoFinalizar ){
    TIEMPO_INICIAR = tiempoIniciar;
    TIEMPO_FINALIZAR = tiempoFinalizar;
    estado = ESTADO_INICIAR;
  }
  
  String getEstado(){
    return estado;
  }
  
  void ejecutar(){consola.println( getClass().getSimpleName() );
    pushStyle();
    switch( estado ){
      case ESTADO_INICIAR:
        iniciar();
        break;
      case ESTADO_ACTIVO:
        activo();
        break;
      case ESTADO_FINALIZAR:
        finalizar();
        break;
      case ESTADO_DESACTIVO:
        desactivo();
        break;
    }
    popStyle();
  }
  
  void iniciar(){
    tiempo += reloj.getDeltaMillis();
    if( tiempo >= TIEMPO_INICIAR ){
      estado = ESTADO_ACTIVO;
      tiempo = 0;
    }
  }
  
  abstract void activo();
  
  void finalizar(){
    tiempo += reloj.getDeltaMillis();
    if( tiempo >= TIEMPO_FINALIZAR ){
      estado = ESTADO_DESACTIVO;
      tiempo = 0;
    }
  }
  
  void desactivo(){}
  
  void eventoDeInteraccion( char llave, int keyCode ){
    if( !estado.equals( ESTADO_ACTIVO ) ) return;
    eventoDeInteraccion( llave );
  }
  
  void eventoDeInteraccion( char llave ){
    if( !estado.equals( ESTADO_ACTIVO ) ) return;
  }
  
}

abstract class EstadoTransparencia extends Estado{
  
  EstadoTransparencia( int tiempoIniciar, int tiempoFinalizar ){
    super( tiempoIniciar, tiempoFinalizar );
  }
  
  void iniciar(){
    super.iniciar();
    int tiempoAux = estado.equals( ESTADO_INICIAR )? tiempo : TIEMPO_INICIAR ;
    float alfa = map( tiempoAux, 0, TIEMPO_INICIAR, 0, 255 );
    contenido( alfa );
  }
  
  void activo(){
    contenido( 255 );
  }
  
  void finalizar(){
    super.finalizar();
    int tiempoAux = estado.equals( ESTADO_FINALIZAR )? tiempo : TIEMPO_FINALIZAR ;
    float alfa = map( tiempoAux, 0, TIEMPO_FINALIZAR, 255, 0 );
    contenido( alfa );
  }
  
  abstract void contenido( float alfa );
}