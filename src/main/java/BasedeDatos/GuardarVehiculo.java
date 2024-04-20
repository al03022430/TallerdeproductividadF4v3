package BasedeDatos;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GuardarVehiculo")
public class GuardarVehiculoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los datos del formulario
        String modelo = request.getParameter("modelo");
        String marca = request.getParameter("marca");
        int ano = Integer.parseInt(request.getParameter("ano"));
        String color = request.getParameter("color");
        
        // Configurar la conexión a la base de datos
        String hostname = "127.0.0.1";
        int port = 3306;
        String usernameDB = "root";
        String passwordDB = "jvvrma98";
        String databaseName = "TallerDiaz";
        String url = "jdbc:mysql://" + hostname + ":" + port + "/" + databaseName;
        
        // Intentar establecer la conexión y guardar los datos en la base de datos
        try (Connection connection = DriverManager.getConnection(url, usernameDB, passwordDB)) {
            // Consulta SQL para insertar un nuevo vehículo
            String query = "INSERT INTO Vehiculos (modelo, marca, ano, color) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, modelo);
                statement.setString(2, marca);
                statement.setInt(3, ano);
                statement.setString(4, color);
                statement.executeUpdate();
            }
            
            // Redirigir a la página de éxito
            response.sendRedirect("exito.jsp");
        } catch (SQLException e) {
            // Manejar errores de base de datos
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
