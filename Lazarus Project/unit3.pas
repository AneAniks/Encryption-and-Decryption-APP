unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, sqlite3conn, mysql40conn, mysql56conn, odbcconn,
  Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls, ExtCtrls, DateUtils;

type

  { TSingInForm }

  TSingInForm = class(TForm)
    Image1: TImage;
    MySQL56Connection1: TMySQL56Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    sName: TEdit;
    singInB: TButton;
    sPassword: TEdit;
    sSurname: TEdit;
    sEmail: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure MySQL56Connection1AfterConnect(Sender: TObject);
    procedure sEmailChange(Sender: TObject);
    procedure singInBClick(Sender: TObject);
    procedure sPasswordChange(Sender: TObject);
    procedure sSurnameChange(Sender: TObject);
    procedure SQLConnector1AfterConnect(Sender: TObject);
    procedure sUserNameLabelClick(Sender: TObject);
  private

  public


  end;

var
  SingInForm: TSingInForm;

implementation

{$R *.lfm}

{ TSingInForm }


procedure TSingInForm.Label2Click(Sender: TObject);
begin

end;

procedure TSingInForm.MySQL56Connection1AfterConnect(Sender: TObject);
begin

end;

procedure TSingInForm.sEmailChange(Sender: TObject);
begin

end;

procedure TSingInForm.FormCreate(Sender: TObject);
begin

end;

procedure TSingInForm.Image1Click(Sender: TObject);
begin

end;

procedure TSingInForm.singInBClick(Sender: TObject);

var
     rRand: integer ;
     rSalt: integer ;
     rDate: String ;
begin
      rRand := Random(999999);
      rSalt := Random(999);
      rDate := FormatDateTime('dd.mm.yyyy, hh:nn:ss', now);

      if SQLQuery1.Active then SQLQuery1.Close;

         SQLQuery1.SQL.Clear;

         SQLQuery1.sql.Add('INSERT into users (name,email,password,unique_id,salt,created_at)');

         SQLQuery1.SQL.Add('Values (:a, :b, :c, :d, :e, :f)');

         SQLQuery1.params.ParamByName('a').AsString:=sName.Text;
         SQLQuery1.params.ParamByName('b').AsString:=sEmail.Text;
         SQLQuery1.params.ParamByName('c').AsString:=sPassword.Text;
         SQLQuery1.params.ParamByName('d').AsInteger:=rRand;
         SQLQuery1.params.ParamByName('e').AsInteger:=rSalt;
         SQLQuery1.params.ParamByName('f').AsString:=rDate;

         SQLQuery1.execsql;

         showmessage('New Items Successfully added');

      if SQLQuery1.Active then SQLQuery1.Close;

         SQLQuery1.SQL.Text:='SELECT * from users';
         SQLTransaction1.CommitRetaining;

end;


procedure TSingInForm.sPasswordChange(Sender: TObject);
begin
       sPassword.PasswordChar := Chr(149);
       sPassword.Font.Style := sPassword.Font.Style + [fsBold];
end;

procedure TSingInForm.sSurnameChange(Sender: TObject);
begin

end;

procedure TSingInForm.SQLConnector1AfterConnect(Sender: TObject);
begin

end;

procedure TSingInForm.sUserNameLabelClick(Sender: TObject);
begin

end;

end.

