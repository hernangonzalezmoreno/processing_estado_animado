class HolaEstado extends EstadoAnimado{
  
  HolaEstado(){
    super( transicion, transicion );
    activarAnimaciones( false , false, true, true );
  }
  
  void contenido( float lineal, float cuadrada, float outBack, float inOutBack ){
    
    textSize( height * 0.1 );
    textAlign( CENTER );
    
    /*//simple
    if( estado.equals( Estado.ESTADO_INICIAR ) || estado.equals( Estado.ESTADO_ACTIVO ) ){
      text( "Hola!", outBack * width * 0.5, height * 0.5 );
    }else if( estado.equals( Estado.ESTADO_FINALIZAR ) ){
      text( "Hola!", width * 0.5 + inOutBack * width * 0.5, height * 0.5 );
    }*/
    
    //Un poquito mas pulido ;)
    String texto = "Hola!";
    float mitadAnchoTexto = textWidth( texto ) * 0.5;
    
    if( estado.equals( EstadoDe4Pasos.ESTADO_INICIAR ) || estado.equals( EstadoDe4Pasos.ESTADO_ACTIVO ) ){
      text( texto, -mitadAnchoTexto + outBack * (width * 0.5 + mitadAnchoTexto ), height * 0.5 );
    }else if( estado.equals( EstadoDe4Pasos.ESTADO_FINALIZAR ) ){
      text( texto, width * 0.5 + inOutBack * (width * 0.5 + mitadAnchoTexto ), height * 0.5 );
    }
    
  }
  
  void eventoDeInteraccion( char llave ){
    if( !estado.equals( ESTADO_ACTIVO ) ) return;
    estado = EstadoDe4Pasos.ESTADO_FINALIZAR;
  }
  
}
