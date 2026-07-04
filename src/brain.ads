with Ada.Numerics.Discrete_Random;

package Brain is
   type Cell_Array is array (1 .. 24, 1 .. 24) of Integer;
   procedure Initialize;
   procedure Step;
   procedure Snapshot (Cells : out Cell_Array; Pulse : out Integer; X : out Integer; Y : out Integer);
private
   subtype Random_Range is Integer range 0 .. 9;
   package Random_Generator is new Ada.Numerics.Discrete_Random (Random_Range);
   Gen : Random_Generator.Generator;
   Grid : Cell_Array := (others => (others => 0));
   Desire : Integer := 0;
   Row : Integer := 12;
   Col : Integer := 12;
   Engine : Integer := 3;
   Pulse_Value : Integer := 0;
   function Clamp (Value : Integer; Low : Integer; High : Integer) return Integer;
end Brain;
