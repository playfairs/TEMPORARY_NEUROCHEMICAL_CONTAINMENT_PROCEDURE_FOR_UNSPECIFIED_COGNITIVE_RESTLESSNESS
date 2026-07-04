with Ada.Text_IO;

package body Display is
   procedure Render (Cells : Brain.Cell_Array; Pulse : Integer; X : Integer; Y : Integer) is
      use Ada.Text_IO;
      Symbol : Character;
   begin
      Put (Character'Val (27)); Put ("[H");
      Put_Line ("TEMPORARY_NEUROCHEMICAL_CONTAINMENT_PROCEDURE_FOR_UNSPECIFIED_COGNITIVE_RESTLESSNESS");
      Put_Line (" ");
      for I in Cells'Range (1) loop
         for J in Cells'Range (2) loop
            case Cells (I, J) is
               when 0 => Symbol := '.';
               when 1 => Symbol := ':';
               when 2 => Symbol := ';';
               when 3 => Symbol := '~';
               when 4 => Symbol := '*';
               when 5 => Symbol := 'o';
               when 6 => Symbol := 'O';
               when 7 => Symbol := '0';
               when 8 => Symbol := '#';
               when others => Symbol := '@';
            end case;
            Put (Symbol);
         end loop;
         Put (Character'Val (27)); Put ("[0K");
         New_Line;
      end loop;
      Put_Line (" ");
      Put_Line ("pulse " & Integer'Image (Pulse) & " focus " & Integer'Image (X) & "," & Integer'Image (Y));
      Put_Line ("rushing toward a new sensation");
      Flush;
      delay 0.04;
   end Render;
end Display;
