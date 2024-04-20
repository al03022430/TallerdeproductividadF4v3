<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado de la búsqueda</title>
</head>
<body>
    <h1>Resultado de la búsqueda</h1>
    <% 
        // Obtener las primeras tres letras capturadas
        String primerasTresLetras = request.getParameter("primeras_tres_letras");
        
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
            
            // Consulta SQL para obtener los clientes cuyo nombre coincide con las primeras tres letras
            String consulta = "SELECT * FROM Clientes WHERE nombre LIKE ?";
            PreparedStatement pstmt = conexion.prepareStatement(consulta);
            pstmt.setString(1, primerasTresLetras + "%");
            ResultSet rs = pstmt.executeQuery();
            
            // Mostrar resultados de la búsqueda
            while (rs.next()) {
                out.println("<h2>Cliente:</h2>");
                out.println("<p>Nombre: " + rs.getString("nombre") + "</p>");
                out.println("<p>Apellido: " + rs.getString("apellido") + "</p>");
                out.println("<p>Teléfono: " + rs.getString("telefono") + "</p>");
                
                // Botón para seleccionar el cliente
                out.println("<form action='MostrarVehiculos.jsp' method='post'>");
                out.println("<input type='hidden' name='cliente_id' value='" + rs.getInt("cliente_id") + "'>");
                out.println("<button type='submit'>Seleccionar Cliente</button>");
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
