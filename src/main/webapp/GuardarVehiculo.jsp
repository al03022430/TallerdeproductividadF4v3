<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    // Obtener los datos del formulario
    String modelo = request.getParameter("modelo");
    String marca = request.getParameter("marca");
    int ano = Integer.parseInt(request.getParameter("ano"));
    String color = request.getParameter("color");
    
    // Obtener el cliente_id de la pantalla anterior
    int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
    
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
        
        // Consulta SQL para insertar un nuevo vehículo
        String query = "INSERT INTO Vehiculos (modelo, marca, ano, color, cliente_id) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, modelo);
        statement.setString(2, marca);
        statement.setInt(3, ano);
        statement.setString(4, color);
        statement.setInt(5, cliente_id); // Asignar el cliente_id
        statement.executeUpdate();
        
        // Redirigir al menú anterior
        response.sendRedirect("MostrarVehiculos.jsp?cliente_id=" + cliente_id);
        
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

