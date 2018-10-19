package body fibonacci_functions 
with SPARK_Mode => On is

   function fibo_get_value (value : Positive) return Natural is
      aux0 : Natural := 0;
      aux1 : Natural := 1;
      aux2 : Natural;
   begin
      if value >= 2 then 
         for j in 2..value loop
            if aux1 <= 1836311903 - aux0 then
	       aux2 := aux1;
               aux1 := aux0 + aux1;
	       aux0 := aux2;
	    else
	       return 1836311903;
            end if;
            Pragma Loop_Invariant (aux1 <= 1836311903);
            Pragma Loop_Invariant (aux1 > 0);
         end loop;
      end if;
      return aux1;
   end fibo_get_value;
--------------------------------------------------------------------------------  
   function fibo_closest_value(value : Natural) return Natural is
      aux : Natural := fibo_get_value(1);
      pastAux : Natural;
   begin
      for J in 2 .. 46 loop
         pastAux := aux;
	 aux := fibo_get_value(J);
	 if aux /= value then
	    if aux > value then
	       if abs(pastAux - value) > abs(aux - value) then
		  return aux;
	       else 
		  return pastAux;
	       end if;
	    end if;
	 else
	    return aux;
	 end if;
	 
         pragma Loop_Invariant(value /= aux);
         pragma Loop_Invariant(aux > 0);
      end loop;
      return 1836311903;
   end fibo_closest_value;
--------------------------------------------------------------------------------   
   function fibo_values_string(value : Positive) return arrayOfInts is
      result_array : arrayOfInts(1..value) := (others => 0);
   begin
      for j in result_array'Range loop
         result_array(j) := fibo_get_value(j);
	 pragma Loop_Invariant(for all k in 1..j => 
			          result_array(k) = fibo_get_value(k));
      end loop;      
      return result_array;
   end fibo_values_string;  
--------------------------------------------------------------------------------
   function fibo_is_fibo_value (value : Natural) return Boolean is
      index : Positive := 1;
      aux : Natural;
   begin
      while index <= 45 and then fibo_get_value(index) <= value loop
         index := index + 1;
         aux := fibo_get_value(index);
	 if aux = value then
            return True;
	 end if;
         pragma Loop_Variant (Increases => index);
         pragma Loop_Invariant (for all K in 2..index =>
                               value /= fibo_get_value(K));
         pragma Loop_Invariant (index < 47);
	 
      end loop;
      return False;
   end fibo_is_fibo_value;   
end fibonacci_functions;
