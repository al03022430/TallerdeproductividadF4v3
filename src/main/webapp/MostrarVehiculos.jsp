<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehículos del Cliente</title>
</head>
<body>
    <h1>Vehículos del Cliente</h1>
    <% 
        // Obtener el ID del cliente enviado desde el formulario
        int clienteId = Integer.parseInt(request.getParameter("cliente_id"));
        
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
            
            // Consulta SQL para obtener los vehículos del cliente seleccionado
            String consulta = "SELECT * FROM Vehiculos WHERE cliente_id = ?";
            PreparedStatement pstmt = conexion.prepareStatement(consulta);
            pstmt.setInt(1, clienteId);
            ResultSet rs = pstmt.executeQuery();
            
            // Mostrar vehículos del cliente
            while (rs.next()) {
                out.println("<h2>Vehículo:</h2>");
                out.println("<p>Modelo: " + rs.getString("modelo") + "</p>");
                out.println("<p>Marca: " + rs.getString("marca") + "</p>");
                out.println("<p>Año: " + rs.getInt("ano") + "</p>");
                out.println("<p>Color: " + rs.getString("color") + "</p>");
                
                // Botón para seleccionar el vehículo
                out.println("<form action='requerimientos.jsp' method='post'>");
                out.println("<input type='hidden' name='vehiculo_id' value='" + rs.getInt("vehiculo_id") + "'>");
                out.println("<button type='submit'>Seleccionar</button>");
                out.println("</form>");
            }
            
            // Cerrar la conexión con la base de datos
            conexion.close();
        } catch (SQLException e) {
            out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    %>
</body>
</html>
