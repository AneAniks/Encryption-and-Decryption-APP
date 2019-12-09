unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TendeForm }

  TendeForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
  private

  public
var
      Key : Integer ;
      message : String;
  end;

var
      endeForm: TendeForm;

implementation

procedure encrypt(var message: string; key: integer);
var
      i: integer;
begin
      for i := 1 to length(message) do
          case message[i] of
               'A'..'Z': message[i] := chr(ord('A') + (ord(message[i]) - ord('A') + key) mod 26);
               'a'..'z': message[i] := chr(ord('a') + (ord(message[i]) - ord('a') + key) mod 26);
          end;
end;

procedure decrypt(var message: string; key: integer);
var
      i: integer;
begin
      for i := 1 to length(message) do
          case message[i] of
               'A'..'Z': message[i] := chr(ord('A') + (ord(message[i]) - ord('A') - key + 26) mod 26);
               'a'..'z': message[i] := chr(ord('a') + (ord(message[i]) - ord('a') - key + 26) mod 26);
          end;
end;


Function Factorial(n : Integer) : LongInt;
var
	Result1 : LongInt;
	i : Integer;
begin
	Result1 := n;
	if (n <= 1) Then
	      Result1 := 1
	else
              for i := n-1 DownTo 1 do
		  Result1 := Result1 * i;
	          Factorial := Result1;
end;


{$R *.lfm}

  { TendeForm }

procedure TendeForm.Button1Click(Sender: TObject);
begin
       key := StrToInt(Edit1.Text);

       if ( key >= 26 )
          then
             key:= Key mod 26;

             message := Memo1.Text;

             encrypt(message, key);

             Memo2.Text := message;
end;

procedure TendeForm.Button2Click(Sender: TObject);
begin

       key := StrToInt(Edit1.Text);

       if ( key >= 26 )
          then
             key:=Key mod 26;

             message := Memo2.Text;

             decrypt(message, key);

             Memo3.Text := message;
end;

procedure TendeForm.Edit1Change(Sender: TObject);
begin

end;

procedure TendeForm.FormCreate(Sender: TObject);
begin

end;

procedure TendeForm.Image1Click(Sender: TObject);
begin

end;

procedure TendeForm.Label1Click(Sender: TObject);
begin

end;

procedure TendeForm.Memo1Change(Sender: TObject);
begin

end;

procedure TendeForm.Memo2Change(Sender: TObject);
begin

end;

end.

