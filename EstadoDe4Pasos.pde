enum ESTADO_DE_4_PASOS{
  Iniciar,
  Activo,
  Finalizar,
  Desactivo
}

abstract class EstadoDe4Pasos{
  
  ESTADO_DE_4_PASOS estado;
  
  int tiempo;
  final int TIEMPO_INICIAR, TIEMPO_FINALIZAR;
    
  EstadoDe4Pasos( int tiempoIniciar, int tiempoFinalizar ){
    TIEMPO_INICIAR = tiempoIniciar;
    TIEMPO_FINALIZAR = tiempoFinalizar;
    estado = ESTADO_DE_4_PASOS.Iniciar;
  }
  
  ESTADO_DE_4_PASOS getEstado(){
    return estado;
  }
  
  void ejecutar(){consola.println( getClass().getSimpleName() );
    pushStyle();
    switch( estado ){
      case Iniciar:
        iniciar();
        break;
      case Activo:
        activo();
        break;
      case Finalizar:
        finalizar();
        break;
      case Desactivo:
        desactivo();
        break;
    }
    popStyle();
  }
  
  void iniciar(){
    tiempo += reloj.getDeltaMillis();
    if( tiempo >= TIEMPO_INICIAR ){
      estado = ESTADO_DE_4_PASOS.Activo;
      tiempo = 0;
    }
  }
  
  abstract void activo();
  
  void finalizar(){
    tiempo += reloj.getDeltaMillis();
    if( tiempo >= TIEMPO_FINALIZAR ){
      estado = ESTADO_DE_4_PASOS.Desactivo;
      tiempo = 0;
    }
  }
  
  void desactivo(){}
  
  void eventoDeInteraccion( char llave, int keyCode ){
    if( !estado.equals( ESTADO_DE_4_PASOS.Activo ) ) return;
    eventoDeInteraccion( llave );
  }
  
  void eventoDeInteraccion( char llave ){
    if( !estado.equals( ESTADO_DE_4_PASOS.Activo ) ) return;
  }
  
}
