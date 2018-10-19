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
       Post => fibo_get_value'Result <= 1836311903
         and then fibo_get_value'Result > 0;
 
--     function fibo_closest_value (value : Natural) return Natural
--     --Devuelve el valor más cercano dentro de la sucesión de fibonacci
--     with
--         Pre =>
--           value <= 1836311903
--           and then value > 0,
--         Post => 
--           fibo_closest_value'Result <= 1836311903
--           and then fibo_closest_value'Result > 0;  
--     
   function fibo_values_string (value : Positive) return arrayOfInts
   --Devuelve un vector con la sucesión de fibonacci extendida hasta "value"
   with 
       Pre =>
	 value <= 46,
       Post =>
         (for all J in fibo_values_string'Result'Range =>
	    fibo_values_string'Result(J) = fibo_get_value(J));

--     function fibo_is_fibo_value (value : Natural) return Boolean
--     --Devuelve True si el valor es un valor de la sucesion de fibonacci
--     with
--         Pre =>
--           value <= 1836311903
--           and then value > 0,
--         Post =>
--  	 (if fibo_is_fibo_value'Result = True then
--             (for some J in 1 .. 46 =>
--               fibo_get_value(J) = value)
--            else
--             (for all J in 1 .. 46 =>
--               fibo_get_value(J) /= value));
end fibonacci_functions;
