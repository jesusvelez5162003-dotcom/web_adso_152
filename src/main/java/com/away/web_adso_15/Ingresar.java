package com.away.web_adso_15;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ingresar")
public class Ingresar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String url = "jdbc:mysql://localhost:3307/jsp_adso_15";
        String user = "root";
        String pass = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM `usuario` "
                    + " WHERE usuario = '" + usuario + "' and clave='" + clave + "'");

            if (rs.next()) {

                // Crear sesión y guardar el usuario
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                // Redireccionar al panel
                response.sendRedirect("administracion.jsp");

            } else {

                // Redireccionar si las credenciales son incorrectas
                response.sendRedirect("index.jsp?error=Usuario o clave incorrectos");
            }

// Cerrar recursos de base de datos
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Ingresar.class.getName()).log(Level.SEVERE, "Error al ingresar usuario", ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Ingresar.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
