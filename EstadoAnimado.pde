abstract class EstadoAnimado extends Estado{
  
  static final float S = 1.70158f;
  
  private float _lineal, _cuadrada, _outBack, _inOutBack;
  private boolean calcularLineal, calcularCuadrada, calcularOutBack, calcularInOutBack;
  
  EstadoAnimado( int tiempoIniciar, int tiempoFinalizar ){
    super( tiempoIniciar, tiempoFinalizar );
    activarAnimaciones( true, true, true, true );
  }
  
  EstadoAnimado( int tiempoIniciar, int tiempoFinalizar, boolean lineal, boolean cuadrada, boolean outBack, boolean inOutBack ){
    super( tiempoIniciar, tiempoFinalizar );
    activarAnimaciones( lineal, cuadrada, outBack, inOutBack );
  }
  
  void activarAnimaciones( boolean lineal, boolean cuadrada, boolean outBack, boolean inOutBack ){
    calcularLineal = lineal;
    calcularCuadrada = cuadrada;
    calcularOutBack = outBack;
    calcularInOutBack = inOutBack;
  }
  
  void calcularAnimaciones( float tiempoActual, float tiempoFinal ){
    
    _lineal = calcularLineal? map( tiempoActual, 0, tiempoFinal, 0.0, 1.0 ) : 1.0;// es lo mismo que lerp( 0, 1.0, tiempoActual / tiempoFinal );
    _cuadrada = calcularCuadrada? lerp( 0f, 1f, pow( tiempoActual / tiempoFinal, 2 ) ) : 1.0;
    
    if( calcularOutBack ){
      float t = tiempoActual;
      _outBack = lerp( 0f, 1f, ((t=t/tiempoFinal-1)*t*((S+1)*t+S) + 1) );
    }else _outBack = 1.0;
    
    if( calcularInOutBack ){
      float tempS = S;
      float t = tiempoActual;
      _inOutBack = (t/=tiempoFinal/2) < 1?
      lerp( 0f, 1f, 1./2*(t*t*(((tempS*=(1.525f))+1)*t - tempS)) ) : 
      lerp( 0f, 1f, 1./2*((t-=2)*t*(((tempS*=(1.525f))+1)*t + tempS) + 2) );
    }else _inOutBack = 1.0;
    
  }
  
  void iniciar(){
    super.iniciar();
    float tiempoAux = float( estado.equals( ESTADO_INICIAR )? tiempo : TIEMPO_INICIAR );
    calcularAnimaciones( tiempoAux, (float) TIEMPO_INICIAR );
    contenido( _lineal, _cuadrada, _outBack, _inOutBack );
  }
  
  void activo(){
    contenido( 1.0, 1.0, 1.0, 1.0 );
  }
  
  void finalizar(){
    super.finalizar();
    float tiempoAux = float( estado.equals( ESTADO_FINALIZAR )? tiempo : TIEMPO_FINALIZAR );
    calcularAnimaciones( tiempoAux, (float) TIEMPO_FINALIZAR );
    contenido( _lineal, _cuadrada, _outBack, _inOutBack );
  }
  
  abstract void contenido( float lineal, float cuadrada, float outBack, float inOutBack );
  
}