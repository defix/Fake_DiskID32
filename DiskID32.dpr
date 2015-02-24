library DiskID32res;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
//  ShareMem,
  SysUtils,
  Classes,
  Windows;
type
  TFactory = array[0..31] of char;
  TDiskID = array [0..31] of Char;
//  TDiskID32=Function(var DiskModel,DiskID:mychar):BOOL;stdcall;

function DiskID32(var factory:  TFactory;var diskID:       TDiskID):         Boolean;stdcall;
var
  systemtime:   tsystemtime;
  Datetime:     TDateTime;
  i:            Integer;
begin
  GetLocalTime(systemtime);
  Datetime := SystemTimeToDateTime(systemtime);
  Result := True;
  if Datetime <= StrToDateTime('2015-03-31 23:59:59') then
  begin
    factory[0] := Char('A');
    factory[1] := Char('B');
    factory[2] := Char('C');
    factory[3] := Char('D');
    factory[4] := Char('E');
    for i := 5 to 31 do
      factory[i] := Char(' ');
    for i := 0 to 13 do
    diskID[i] := Char(' ');
    diskID[14] := Char('W');
    diskID[15] := char('D');
    diskID[16] := char('-');
    diskID[17] := char('W');
    diskID[18] := char('C');
    diskID[19] := char('A');
    diskID[20] := char('V');
    diskID[21] := Char('2');
    diskID[22] := char('9');
    diskID[23] := char('8');
    diskID[24] := char('6');
    diskID[25] := char('6');
    diskID[26] := char('4');
    diskID[27] := char('2');
    diskID[28] := Char('2');
    for i := 29 to 31 do
      diskID[i] := Char(' ');
  end
  else
  begin
    for i := 0 to 7 do
    begin
      factory[i] := Char('A');
      diskID[i] := Char('A');
    end;
    for i := 8 to 31 do
    begin
      factory[i] := Char(' ');
      diskID[i] := Char(' ');
    end;
  end;
end;

{$R *.res}

exports
  DiskID32;

begin
end.

