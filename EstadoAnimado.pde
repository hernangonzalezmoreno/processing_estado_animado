abstract class EstadoAnimado extends Estado{
  
  static final float s = 1.70158f;
  
  private float _lineal, _cuadrada, _outBack, _inOutBack;
  
  EstadoAnimado( int tiempoIniciar, int tiempoFinalizar ){
    super( tiempoIniciar, tiempoFinalizar );
  }
  
  //recibo los parametros como float, porque... le desconfio cuando tengo que dividir enteros
  void calcularAnimaciones( float tiempoActual, float tiempoFinal ){
    
    _lineal = map( tiempoActual, 0, tiempoFinal, 0.0, 1.0 );// es lo mismo que lerp( 0, tiempoFinal, tiempoActual / tiempoFinal );
    _cuadrada = lerp( 0, tiempoFinal, pow( tiempoActual / tiempoFinal, 2 ) );
    
    float t = tiempoActual;
    _outBack = lerp( 0, tiempoFinal, ((t=t/tiempoFinal-1)*t*((s+1)*t+s) + 1) );
    
    float tempS = s;
    t = tiempoActual;
    _inOutBack = (t/=tiempoFinal/2) < 1?
    lerp( 0, tiempoFinal, 1./2*(t*t*(((tempS*=(1.525f))+1)*t - tempS)) ) : 
    lerp( 0, tiempoFinal, 1./2*((t-=2)*t*(((tempS*=(1.525f))+1)*t + tempS) + 2) );
    
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