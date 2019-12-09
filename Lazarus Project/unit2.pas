unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, unit1, unit3, mysql56conn, mysql40conn, sqldb,
  pqconnection, odbcconn, mssqlconn, sqlite3conn, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, IBConnection;

type

  { TloginForm }

  TloginForm = class(TForm)
    Image1: TImage;
    lUsername1: TLabel;
    signup: TButton;
    lUsername: TLabel;
    lPassword: TLabel;
    MySQL56Connection1: TMySQL56Connection;
    loginBut: TButton;
    loginUsername: TEdit;
    logingPassword: TEdit;
    SQLConnector: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLQuery: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure lPasswordClick(Sender: TObject);
    procedure loginButClick(Sender: TObject);
    procedure logingPasswordChange(Sender: TObject);
    procedure signupClick(Sender: TObject);

  private

  public

  end;

var
  loginForm: TloginForm;

implementation

{$R *.lfm}

{ TloginForm }

procedure TloginForm.FormCreate(Sender: TObject);
begin

end;

procedure TloginForm.Image1Click(Sender: TObject);
begin

end;

procedure TloginForm.lPasswordClick(Sender: TObject);
begin

end;

procedure TloginForm.loginButClick(Sender: TObject);
var
     emaill , passwd : string[50];

     rRand: integer ;
     rSalt: integer ;
     rDate: String ;
begin
      emaill:=loginUsername.text;
      passwd:=logingPassword.text;

      if SQLQuery1.Active then SQLQuery1.Close ;

         SQLQuery1.SQL.Clear;

         SQLQuery1.SQL.Text := ('SELECT email, password from users where email = '''+emaill +''' and password = ''' +passwd+''' ');

         SQLquery1.Open;

      if SQlQuery1.RecordCount>0 then
         begin
                Showmessage('Login Sucessfull :)');
                endeForm.showmodal();
         end
      else
         begin
                ShowMessage('Incorrect email/password');
         end;

      SQLQuery1.Open;

      rRand := Random(999999);
      rSalt := Random(999);
      rDate := FormatDateTime('dd.mm.yyyy, hh:nn:ss', now);


      if SQLQuery1.Active then SQLQuery1.Close ;

         SQLQuery1.SQL.Clear;

         SQLQuery1.SQL.Add('INSERT into loginhistory (username,password,client,unique_id,salt,created_at)');

         SQLQuery1.SQL.Add('Values (:a, :b, :c, :d, :e, :f)');

         SQLQuery1.params.ParamByName('a').AsString:=loginUsername.Text;
         SQLQuery1.params.ParamByName('b').AsString:=logingPassword.Text;
         SQLQuery1.params.ParamByName('c').AsString:='Lazarus';
         SQLQuery1.params.ParamByName('d').AsInteger:=rRand;
         SQLQuery1.params.ParamByName('e').AsInteger:=rSalt;
         SQLQuery1.params.ParamByName('f').AsString:=rDate;

         SQLQuery1.execsql;

      if SQLQuery1.Active then SQLQuery1.Close;

         SQLTransaction1.CommitRetaining;
end;

procedure TloginForm.logingPasswordChange(Sender: TObject);
begin
       logingPassword.PasswordChar := Chr(149);
       logingPassword.Font.Style := logingPassword.Font.Style + [fsBold];
end;

procedure TloginForm.signupClick(Sender: TObject);
begin
       SingInForm.showmodal();
end;

end.

procedure TloginForm.logingPasswordChange(Sender: TObject);
begin
       logingPassword.PasswordChar := Chr(149);
       logingPassword.Font.Style := logingPassword.Font.Style + [fsBold];
end;

procedure TloginForm.signInAClick(Sender: TObject);
begin
       SingInForm.showmodal();
end;

end.

