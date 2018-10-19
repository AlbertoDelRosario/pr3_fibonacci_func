with Ada.Text_IO; use Ada.Text_IO;
--with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with test_Assertions; use test_Assertions;
with fibonacci_functions; use fibonacci_functions;
procedure test_fibonacci_functions is
   procedure Test_get_value is
   begin
      Assert_True (fibo_get_value(4) = 3,"fibo_get_value: value 3");
      Assert_True (fibo_get_value(46) = 1836311903, "fibo_get_value: value 46");
      Assert_True (fibo_get_value(47) = 1836311903, "fibo_get_value: value 47, out of range");
   exception
      when others =>
         null;
   end Test_get_value;

   procedure Test_get_closest_value is
   begin
      Assert_True (fibo_closest_value(4) = 3,"fibo_closest_value: value 4");
      Assert_True (fibo_closest_value(0) = 1,"fibo_closest_value: value 0");
      Assert_True (fibo_closest_value(1836311907) = 1836311903,"fibo_closest_value: value 1836311907, out of range");
   exception
      when others =>
         null;
   end Test_get_closest_value;

   procedure Test_values_vector is
   vect : arrayOfInts(1..5);
   begin
      vect := fibo_values_vector(5);
      Assert_True (vect(1) = 1,"fibo_values_vector: pos 1");
      Assert_True (vect(2) = 1,"fibo_values_vector: pos 2");
      Assert_True (vect(3) = 2,"fibo_values_vector: pos 3");
      Assert_True (vect(5) = 5,"fibo_values_vector: pos 5");
   exception
      when others =>
         null;
   end Test_values_vector;

   procedure Test_values_vector_O_O_R is
   vect : arrayOfInts(1..47);
   begin
      vect := fibo_values_vector(47);
      Assert_True (vect(46) = 1836311903,"fibo_values_vector: pos 46");
      Assert_True (vect(47) = 1836311903,"fibo_values_vector: pos 47");
   exception
      when others =>
         null;
   end Test_values_vector_O_O_R;

   procedure Test_is_fibo_value is
   begin
      Assert_True (fibo_is_fibo_value(6) = False,"fibo_is_fibo_value: false value 6");
      Assert_False (fibo_is_fibo_value(7) = True,"fibo_is_fibo_value: false value 7");
      Assert_True (fibo_is_fibo_value(8) = True,"fibo_is_fibo_value: true value 8");
   exception
      when others =>
         null;
   end Test_is_fibo_value;
begin
   Put_Line ("********************* Test_fibonacci_functions");
   Test_get_value;
   Test_get_closest_value;
   Test_values_vector;
   Test_values_vector_O_O_R;
   Test_is_fibo_value;
end test_fibonacci_functions;
