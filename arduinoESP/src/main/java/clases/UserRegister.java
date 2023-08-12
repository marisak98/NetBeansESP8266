/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import ConectorMariadb.*;
import Formulario.LoginPanel;
import Formulario.MainMenu;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author marisak
 */
public class UserRegister {
    
    public void createUser(String usuario, String password){
     ConexionDB db = new ConexionDB();
        String sql = "insert into Usuario(User, Password) values ('" + usuario +"', '" + password +"');";
        Statement st;
        Connection conexion = db.conectar();
        try
        {
            st = conexion.createStatement();
            int rs = st.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "Guardado correctamente");
        }catch(SQLException e)
        {
            System.out.println(e);
        }
    }
    
    public void accesoUsuario(String user, String pass){
         // TODO add your handling code here:
        ConexionDB db = new ConexionDB();
        // Se inicializa a null
        String usuarioCorrecto = null;
        String passCorrecto = null;
    try {

        Connection cn = db.conectar();
        PreparedStatement pst = cn.prepareStatement("SELECT User, Password FROM Usuario");
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            usuarioCorrecto = rs.getString(1);
            passCorrecto = rs.getString(2);
        }

        if (user.equals(usuarioCorrecto) && pass.equals(passCorrecto)) {
            JOptionPane.showMessageDialog(null, "Login correcto Bienvenido " + user);
            MainMenu mainMenu = new MainMenu();
            LoginPanel loginPanel = new LoginPanel();
           
            
        } else if (!user.equals(usuarioCorrecto) || pass.equals(passCorrecto)) {

            JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrectos");
        }

    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, "Error " + e);
    }
    }
    
    public void sendDatas(boolean estado, String fecha){
        ConexionDB db = new ConexionDB();
        
        try{
        Connection cn = db.conectar();
        int estadoDB = estado ? 1:0;
        PreparedStatement query = cn.prepareStatement("INSERT INTO EstadoObj (fecha, Estado) VALUES (STR_TO_DATE(?, '%d/%m/%Y %H:%i:%s'),?)", Statement.RETURN_GENERATED_KEYS);
        query.setString(1, fecha);
        query.setInt(2, estadoDB);
        query.executeUpdate();
        
        int lastId = -1;
        ResultSet generatedKeys = query.getGeneratedKeys();
        if(generatedKeys.next()){
            lastId = generatedKeys.getInt(1);
        }
        
        if(lastId != -1){
            PreparedStatement queryObj = cn.prepareStatement("INSERT INTO Objeto (Nombre, fkEstadoObj) VALUES (?,?)");
           
        queryObj.setString(1,estado ?"Close":"Open");
        queryObj.setInt(2, lastId);
        queryObj.executeUpdate();
        queryObj.close();
        }
        
        query.close();
        cn.close();
         JOptionPane.showMessageDialog(null, "Guardado correctamente");     
        }catch(Exception e){
         JOptionPane.showMessageDialog(null, "Error " + e);
        }
    
    }
    
}
