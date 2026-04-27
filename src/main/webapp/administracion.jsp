<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp?error=No tienes permisos");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>AWAY - Administración</title>

        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background: #f7f7f7;
                color: #222;
            }

            .contenedor {
                width: 85%;
                margin: auto;
                padding: 40px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .header h1 {
                margin: 0;
                font-size: 32px;
            }

            .usuario {
                font-weight: bold;
                color: #4CAF50;
            }

            .card {
                background: white;
                padding: 25px;
                border-radius: 16px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th {
                background: #f1f1f1;
                padding: 14px;
                text-align: left;
            }

            td {
                padding: 14px;
                border-bottom: 1px solid #eee;
            }

            a.boton {
                padding: 8px 14px;
                border-radius: 8px;
                text-decoration: none;
                font-size: 14px;
                color: white;
                margin-right: 5px;
            }

            .gmail {
                background: #4CAF50;
            }

            .eliminar {
                background: #e74c3c;
            }

            .logout {
                margin-top: 25px;
                text-align: center;
            }

            .logout a {
                color: #e74c3c;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <div class="contenedor">

            <div class="header">
                <h1>Panel de administración</h1>
                <div class="usuario">
                    <%= session.getAttribute("usuario") %>
                </div>
            </div>

            <div class="card">
                <h2>Correos registrados</h2>

                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>

                    <%
                        String url = "jdbc:mysql://localhost:3307/jsp_adso_15";
                        String user = "root";
                        String pass = "";

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, user, pass);

                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM suscriptores");

                            while(rs.next()){
                                int id = rs.getInt("id");
                                String nombre = rs.getString("nombre");
                                String correo = rs.getString("correo");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= nombre %></td>
                        <td><%= correo %></td>
                        <td><%= rs.getTimestamp("fecha_registro") %></td>
                        <td>
                            <a class="boton gmail" href="https://mail.google.com/mail/?view=cm&fs=1&to=<%= correo %>" target="_blank">
                                Enviar
                            </a>

                            <a class="boton eliminar"
                               href="EliminarCorreoServlet?id=<%= id %>"
                               onclick="return confirm('¿Deseas eliminar este registro?');">
                                Eliminar
                            </a>
                        </td>
                    </tr>
                    <%
                            }

                            rs.close();
                            stmt.close();
                            conn.close();

                        } catch(Exception e){
                    %>
                    <tr>
                        <td colspan="5">Error al cargar registros</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

            <div class="logout">
                <a href="CerrarSesion">Cerrar sesión</a>
            </div>

        </div>

    </body>
</html>