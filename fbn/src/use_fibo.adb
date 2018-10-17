with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with fibonacci_functions;
procedure use_fibo is
   use fibonacci_functions;
   fiboValue : Integer := 55;
   noFiboValue : Integer := 56;
   value : Integer;
   sample : Integer := 73;
   sample_length : Positive := 12;
   vect : fibonacci_functions.arrayOfInts(1..sample_length);
begin
   Put_Line("******\Pruebas de fibo/******");
   Put_Line("-----get value-----");
   for j in 1..sample_length loop
      value := fibo_get_value(j);
      Put(value'Image);
      --New_Line;
      if j /= sample_length then Put(", ");end if;
   end loop;
   
   New_Line;
   Put_Line("-----closest value-----");
   --sample := 10;
   put("Closest value to ");
   put(sample'Image);
   put(" =");
   value := fibo_closest_value(sample);
   Put(value'Image);
   
   --for j in 1..10 loop
   --   value := fibo_closest_value(j);
   --   Put(value'Image);
   --   if j /= 10 then Put(", ");end if;
   --end loop;
   
   New_Line;
   Put_Line("-----closest position-----");
   --sample := 10;
   put("Closest position to ");
   put(sample'Image);
   put(" =");
   value := fibo_closest_position(sample);
   Put(value'Image);
   
   New_Line;
   Put_Line("-----vector of integers-----");
   vect := fibo_values_string(sample_length);
   for j in vect'Range loop
      Put(Trim(Integer'Image(vect(j)), Ada.Strings.Left) & (if j /= sample_length then ", " else " "));
   end loop;

   New_Line;
   Put_Line("-----is fibo value-----");
   if fibo_is_fibo_value(fiboValue) = True then
      Put_Line("55 pertenece a la sucesion");
   else
      Put_Line("El metodo no funciona");
   end if;
   if fibo_is_fibo_value(noFiboValue) = False then
      Put_Line("56 no pertenece a la sucesion");
   else
      Put_Line("El metodo no funciona");
   end if;
   
end use_fibo;