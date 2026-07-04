package body Brain is
   procedure Initialize is
   begin
      Random_Generator.Reset (Gen, 17);
      for I in Grid'Range (1) loop
         for J in Grid'Range (2) loop
            Grid (I, J) := Integer (Random_Generator.Random (Gen));
         end loop;
      end loop;
      Desire := 7;
      Row := 12;
      Col := 12;
      Engine := 4;
      Pulse_Value := Integer (Random_Generator.Random (Gen)) * 10 + Integer (Random_Generator.Random (Gen));
   end Initialize;

   function Clamp (Value : Integer; Low : Integer; High : Integer) return Integer is
   begin
      if Value < Low then
         return Low;
      elsif Value > High then
         return High;
      else
         return Value;
      end if;
   end Clamp;

   procedure Step is
      Drift : Integer;
      Bias : Integer;
      New_Pulse : Integer;
   begin
      Engine := (Engine + 1) mod 10;
      for I in Grid'Range (1) loop
         for J in Grid'Range (2) loop
            Drift := (I - Row) + (J - Col) + Engine - Desire;
            Bias := Integer (Random_Generator.Random (Gen)) - 3;
            Grid (I, J) := Clamp (Grid (I, J) + Drift + Bias, 0, 9);
         end loop;
      end loop;
      Row := Clamp (Row + (Integer (Random_Generator.Random (Gen)) - 1), 1, Grid'Last (1));
      Col := Clamp (Col + (Integer (Random_Generator.Random (Gen)) - 1), 1, Grid'Last (2));
      Desire := Clamp (Desire + (Integer (Random_Generator.Random (Gen)) - 2), 0, 9);
      for I in Grid'Range (1) loop
         for J in Grid'Range (2) loop
            if (I - Row) * (I - Row) + (J - Col) * (J - Col) < 30 then
               Grid (I, J) := Clamp (Grid (I, J) + Desire, 0, 9);
            end if;
         end loop;
      end loop;
      New_Pulse := Integer (Random_Generator.Random (Gen)) * 10 + Integer (Random_Generator.Random (Gen));
      if New_Pulse = Pulse_Value then
         New_Pulse := (New_Pulse + 1) mod 100;
      end if;
      Pulse_Value := New_Pulse;
   end Step;

   procedure Snapshot (Cells : out Cell_Array; Pulse : out Integer; X : out Integer; Y : out Integer) is
   begin
      Cells := Grid;
      Pulse := Pulse_Value;
      X := Row;
      Y := Col;
   end Snapshot;
end Brain;
