package com.away.web_adso_15;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegistroCorreoServlet")
public class RegistroCorreoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");

        String url = "jdbc:mysql://localhost:3307/jsp_adso_15";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(url, user, pass)) {
                String sql = "INSERT INTO suscriptores (nombre, correo) VALUES (?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                
                ps.setString(1, nombre);
                ps.setString(2, correo);
                
                ps.executeUpdate();
                
                ps.close();
            }

            response.sendRedirect("index.jsp?mensaje=Registro exitoso#registro");

        } catch (ClassNotFoundException | SQLException e) {
            response.sendRedirect("index.jsp?error=No se pudo registrar");
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
}