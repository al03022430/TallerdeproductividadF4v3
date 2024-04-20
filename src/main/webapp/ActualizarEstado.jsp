<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Estado del Requerimiento</title>
</head>
<body>
    <h1>Actualizar Estado del Requerimiento</h1>
    <% 
        // Obtener el ID del requerimiento y el nuevo estado enviado desde el formulario
        int requerimientoId = Integer.parseInt(request.getParameter("requerimiento_id"));
        String nuevoEstado = request.getParameter("estado");
        
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
            
            // Consulta SQL para actualizar el estado del requerimiento
            String consulta = "UPDATE Requerimientos SET estado = ? WHERE requerimiento_id = ?";
            PreparedStatement pstmt = conexion.prepareStatement(consulta);
            pstmt.setString(1, nuevoEstado);
            pstmt.setInt(2, requerimientoId);
            pstmt.executeUpdate();
            
            // Redirigir a la página anterior (Requerimientos del Vehículo)
            response.sendRedirect("Requerimientos.jsp?vehiculo_id=" + request.getParameter("vehiculo_id"));
            
            // Cerrar la conexión con la base de datos
            conexion.close();
        } catch (SQLException e) {
            out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    %>
</body>
</html>
