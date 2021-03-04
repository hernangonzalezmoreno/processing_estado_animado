# EstadoAnimado

Cualquier clase que herede de EstadoAnimado puede usar cuatro diferentes animaciones para entrar o salir de escena:

- Lineal
- Cuadrada
- OutBack
- InOutBack

Las animacioes están normalizadas, es decir van de 0.0f a 1.0f. Se puede aplicar a cualquier propiedad de la clase hijo. Por ejemplo a la posición, a la transparencia, al color, a la rotación, o a lo que se les ocurra.

## HolaEstado

Ejemplo, la clase HolaEstado hereda de EstadoAnimado y hace uso de las animaciones *outBack* y *inOutBack* para entrar y salir de escena, aplicandolo a su posición:

![Instancia de la clase HolaEstado](animacion_hola.gif)
