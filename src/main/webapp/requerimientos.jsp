<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Requerimientos del Vehículo</title>
</head>
<body>
    <h1>Requerimientos del Vehículo</h1>
    <% 
        // Obtener el ID del vehículo enviado desde la página anterior
        int vehiculoId = Integer.parseInt(request.getParameter("vehiculo_id"));
        
        // Configurar la conexión a la base de datos
        String hostname = "127.0.0.1";
        int port = 3306;
        String usernameDB = "root";
        String passwordDB = "jvvrma98";
        String databaseName = "TallerDiaz";
        String url = "jdbc:mysql://" + hostname + ":" + port + "/" + databaseName;
        
        try {
            // Establecer la conexión con la base de datos
            Connection conexion = DriverManager.getConnection(url, usernameDB, passwordDB);
            
            // Consulta SQL para obtener los requerimientos del vehículo seleccionado
            String consulta = "SELECT * FROM Requerimientos WHERE vehiculo_id = ?";
            PreparedStatement pstmt = conexion.prepareStatement(consulta);
            pstmt.setInt(1, vehiculoId);
            ResultSet rs = pstmt.executeQuery();
            
            // Mostrar requerimientos del vehículo
            while (rs.next()) {
                out.println("<h2>Requerimiento:</h2>");
                out.println("<p>Descripción: " + rs.getString("descripcion") + "</p>");
                out.println("<p>Estado: " + rs.getString("estado") + "</p>");
                
                // Botón para actualizar el estado del requerimiento
                out.println("<form action='ActualizarEstado.jsp' method='post'>");
                out.println("<input type='hidden' name='requerimiento_id' value='" + rs.getInt("requerimiento_id") + "'>");
                out.println("<select name='estado'>");
                out.println("<option value='Realizado'>Realizado</option>");
                out.println("</select>");
                out.println("<button type='submit'>Actualizar Estado</button>");
                out.println("</form>");
            }
            
            // Botón para dar de alta un nuevo requerimiento
            out.println("<form action='Arequerimiento.jsp' method='post'>");
            out.println("<input type='hidden' name='vehiculo_id' value='" + vehiculoId + "'>");
            out.println("<button type='submit'>Alta de Requerimiento</button>");
            out.println("</form>");
            
            // Cerrar la conexión con la base de datos
            conexion.close();
        } catch (SQLException e) {
            out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    %>
</body>
</html>
