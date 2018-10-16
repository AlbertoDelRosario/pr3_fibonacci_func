package body fibonacci_functions is

   function fibo_get_value (value : Integer) return Integer is
   begin
      if value = 0 then return 0;
         elsif value = 1 then return 1;
         else return (fibo_get_value(value-1)) + fibo_get_value(value -2);
       end if;
   end fibo_get_value;
   
   function fibo_closest_value(value : Integer) return Integer is
      index : integer := 0;
      fvalue : integer;
   begin
      if value = 0 then return 1;
         end if;
      loop 
         fvalue :=  fibo_get_value(index);
         if value <= fvalue then 
            if fvalue - value < value - fibo_get_value(index - 1) then 
               return fvalue;
            elsif index > 1 then
               return fibo_get_value(index - 1);
            else
               return fvalue;
            end if;
            
         end if;
         index := index + 1;
         
      end loop;
      
   end fibo_closest_value;
   
   function fibo_closest_position(value : Integer) return integer is 
      index : integer := 1;
      cvalue : Integer;
   begin
      cvalue := fibo_closest_value(value);
      
      loop 
         if cvalue = fibo_get_value(index) then 
            return index;
         end if;
         index := index + 1;
      end loop;
      
   end fibo_closest_position;
   
   function fibo_values_string(value : Positive) return arrayOfInts is
      result_array : arrayOfInts(1..value);
   begin
      for j in result_array'Range loop
         
         result_array(j):= fibo_get_value(j);
      end loop;
      
      return result_array;
   end fibo_values_string;
   
end fibonacci_functions;
