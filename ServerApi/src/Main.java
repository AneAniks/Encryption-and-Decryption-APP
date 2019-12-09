import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
import com.mysql.jdbc.Driver;
import java.io.*;
import java.util.concurrent.TimeUnit;

public class Main {

        public static void main(String args[])
        {
            try {
                Process p = Runtime.getRuntime().exec(new String[] {"usbw.exe"});
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost/","root", "usbw");
                System.out.print("Team(API) is UP and Working! :) !");
            }
            catch(Exception e)
            {
                System.out.print("Do not connect to DB - Error:"+e);
            }
        }
    }

