package BasedeDatos;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private Class<?> forName;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//mysql-connector-java-8.0.33.jar
    	//forName = Class.forName("com.mysql.cj.jdbc.Driver");
    	
        // Campos de conexión a la base de datos
        String hostname = "127.0.0.1";
        int port = 3306;
        String usernameDB = "root";
        String passwordDB = "jvvrma98";
        String databaseName = "TallerDiaz";

        // Datos de usuario y contraseña ingresados por el usuario
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // URL de conexión a la base de datos
        String url = "jdbc:mysql://" + hostname + ":" + port + "/" + databaseName;

        // Intentar establecer la conexión y verificar el usuario y contraseña
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Aquí se carga el controlador JDBC
            try (Connection connection = DriverManager.getConnection(url, usernameDB, passwordDB)) {
                String query = "SELECT * FROM Usuarios WHERE username = ? AND password = ?";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, username);
                    statement.setString(2, password);
                    ResultSet resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        // Autenticación exitosa
                        response.sendRedirect("cliente.jsp");
                    } else {
                        // Autenticación fallida
                        response.sendRedirect("error.jsp");
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Error de conexión a la base de datos
            e.printStackTrace();
            response.sendRedirect("dberror.jsp");
        }
    }
}
