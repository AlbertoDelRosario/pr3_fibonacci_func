package fibonacci_functions is
   
   type arrayOfInts is array(Positive range <>) of Integer;

   function fibo_get_value (value : Integer) return Integer;
   --Devuelve el n�mero correspondiente en la sucesi�n de fibonacci
   
   function fibo_closest_value(value : Integer) return Integer;
   --Devuelve el valor m�s cercano dentro de la sucesi�n de fibonacci
     
   function fibo_closest_position(value : Integer) return integer;
   --Devuelve la posici�n del valor m�s cercano dentro de la 
   --sucesi�n de fibonacci
   
   function fibo_values_string(value : Positive) return arrayOfInts;
   --Devuelve un vector con la sucesi�n de fibonacci extendida hasta "value"

end fibonacci_functions;
