program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDistanceUS;

type
  TExample = class
  private
    ipcon: TIPConnection;
    dr: TBrickletDistanceUS;
  public
    procedure ReachedCB(sender: TBrickletDistanceUS; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change to your UID }

var
  e: TExample;

{ Callback for distance value smaller than 200 }
procedure TExample.ReachedCB(sender: TBrickletDistanceUS; const distance: word);
begin
  WriteLn(Format('Distance Value is smaller than 200: %d', [distance]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  dr := TBrickletDistanceUS.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 second (10000ms) }
  dr.SetDebouncePeriod(10000);

  { Register threshold reached callback to procedure ReachedCB }
  dr.OnDistanceReached := {$ifdef FPC}@{$endif}ReachedCB;

  { Configure threshold for "smaller than 200" }
  dr.SetDistanceCallbackThreshold('<', 200, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
