package fibonacci_functions is
   
   type arrayOfInts is array(Positive range <>) of Integer;

   function fibo_get_value (value : Integer) return Integer;
   --Devuelve el número correspondiente en la sucesión de fibonacci
   
   function fibo_closest_value(value : Integer) return Integer;
   --Devuelve el valor más cercano dentro de la sucesión de fibonacci
     
   function fibo_closest_position(value : Integer) return integer;
   --Devuelve la posición del valor más cercano dentro de la 
   --sucesión de fibonacci
   
   function fibo_values_string(value : Positive) return arrayOfInts;
   --Devuelve un vector con la sucesión de fibonacci extendida hasta "value"

end fibonacci_functions;
