<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    // Obtener los datos del formulario
    String descripcion = request.getParameter("descripcion");
    String fechaSolicitud = request.getParameter("fecha_solicitud");
    String estado = "Pendiente"; // Valor fijo para el estado
    int vehiculoId = Integer.parseInt(request.getParameter("vehiculo_id"));
    
    // Configurar la conexión a la base de datos
    String hostname = "127.0.0.1";
    int port = 3306;
    String usernameDB = "root";
    String passwordDB = "jvvrma98";
    String databaseName = "TallerDiaz";
    String url = "jdbc:mysql://" + hostname + ":" + port + "/" + databaseName;
%>

<%
    try {
        // Cargar el driver de MySQL
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establecer la conexión con la base de datos
        Connection connection = DriverManager.getConnection(url, usernameDB, passwordDB);
        
        // Consulta SQL para insertar un nuevo requerimiento
        String query = "INSERT INTO Requerimientos (descripcion, fecha_solicitud, estado, vehiculo_id) VALUES (?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, descripcion);
        statement.setString(2, fechaSolicitud);
        statement.setString(3, estado);
        statement.setInt(4, vehiculoId);
        statement.executeUpdate();
        
        // Redirigir a la página de éxito con el vehiculo_id como parámetro en la URL
        response.sendRedirect("Arequerimiento.jsp?vehiculo_id=" + vehiculoId);
        
        // Cerrar la conexión con la base de datos
        statement.close();
        connection.close();
    } catch (ClassNotFoundException e) {
        // Manejar errores de carga de clase
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    } catch (SQLException e) {
        // Manejar errores de base de datos
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
%>
