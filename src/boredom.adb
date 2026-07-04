with Ada.Text_IO;
with Brain;
with Display;

procedure Boredom is
   Cells : Brain.Cell_Array;
   Pulse : Integer;
   X : Integer;
   Y : Integer;
begin
   Brain.Initialize;
   for I in 1 .. 80 loop
      Brain.Step;
      Brain.Snapshot (Cells, Pulse, X, Y);
      Display.Render (Cells, Pulse, X, Y);
      exit when I = 80;
   end loop;
   Ada.Text_IO.Put_Line ("the search is over for now");
end Boredom;
