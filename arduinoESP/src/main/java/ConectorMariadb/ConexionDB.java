/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ConectorMariadb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author marisak
 */
public class ConexionDB {
     public static Connection con;
    // Declaramos los datos de conexion a la bd
    private static final String driver="org.mariadb.jdbc.Driver";
    private static final String user="marisak";
    private static final String pass="marisaxalices";
    private static final String url="jdbc:mariadb://localhost:3306/esp8266?characterEncoding=utf8";
    // Funcion que va conectarse a mi bd de mysql
    public Connection conectar(){
      con = null;
      try{
          con = (Connection) DriverManager.getConnection(url, user, pass);
          if(con!=null){
          }
      }
      catch(SQLException e)
      {
          JOptionPane.showMessageDialog(null,"Error" + e.toString());
      }
      return con;
    }
    
}
