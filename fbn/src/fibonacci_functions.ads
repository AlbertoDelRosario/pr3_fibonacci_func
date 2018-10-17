package fibonacci_functions 
with SPARK_Mode => On 
is
   
   type arrayOfInts is array(Positive range <>) of Integer;

   function fibo_get_value (value : Positive) return Natural
   --Devuelve el número correspondiente en la sucesión de fibonacci
   with
       Pre => 
         value > 0 
         and then value <= 46,
       Post => fibo_get_value'Result <= 1836311903;
 
   function fibo_closest_value (value : Natural) return Natural
   --Devuelve el valor más cercano dentro de la sucesión de fibonacci
   with
       Pre =>
	 value <= 1836311903,
       Post => True;
     
   function fibo_closest_position (value : Natural) return Positive;
   --Devuelve la posición del valor más cercano dentro de la 
   --sucesión de fibonacci
   
   function fibo_values_string (value : Positive) return arrayOfInts
   --Devuelve un vector con la sucesión de fibonacci extendida hasta "value"
   with 
       Pre =>
	 value <= 46,
       Post =>
         (for all J in fibo_values_string'Result'Range =>
	    fibo_values_string'Result(J) = fibo_get_value(J));

end fibonacci_functions;
