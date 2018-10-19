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
--     function fibo_closest_value(value : Natural) return Natural is
--        index : Positive := 2;
--     begin
--        if fibo_is_fibo_value(value) = True then
--  	 return value;
--        end if;
--        while index <= 46 and index > 1 loop
--  	 if value > fibo_get_value(index-1) and value < fibo_get_value(index) then
--     	    if abs (value - fibo_get_value(index-1)) < abs (fibo_get_value(index) - value) then
--  	       return fibo_get_value(index-1);
--  	    else 
--  	       return fibo_get_value(index);
--  	    end if;
--           end if;
--           pragma Loop_Variant(Increases => index);
--           pragma Loop_Invariant(for all J in 2 .. index => value /= fibo_get_value(J)
--                                 and index < 47);
--           
--  	 index := index + 1;
--        end loop;
--        return 1836311903;
--     end fibo_closest_value;
--  --------------------------------------------------------------------------------   
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
--  --------------------------------------------------------------------------------
--     function fibo_is_fibo_value (value : Natural) return Boolean is
--        index : Positive := 1;
--     begin
--        while index <= 46 and then fibo_get_value(index) <= value loop
--  	 if fibo_get_value(index) = value then
--              return True;
--  	 end if;
--           pragma Loop_Variant (Increases => index);
--           pragma Loop_Invariant (for all j in 1 .. index =>
--                                    fibo_get_value(j) <= value);
--           pragma Loop_Invariant (index < 47);
--  	 index := index + 1;
--        end loop;
--        return False;
--     end fibo_is_fibo_value;   
end fibonacci_functions;
