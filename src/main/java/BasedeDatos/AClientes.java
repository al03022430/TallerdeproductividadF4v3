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

@WebServlet("/AClientes")
public class AClientes extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String hostname = "127.0.0.1";
    private static final int port = 3306;
    private static final String usernameDB = "root";
    private static final String passwordDB = "jvvrma98";
    private static final String databaseName = "TallerDiaz";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");

        String url = "jdbc:mysql://" + hostname + ":" + port + "/" + databaseName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, usernameDB, passwordDB)) {
                String query = "INSERT INTO clientes (nombre, apellido, telefono) VALUES (?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, nombre);
                    statement.setString(2, apellido);
                    statement.setString(3, telefono);

                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        response.sendRedirect("ExitoAC.jsp");
                    } else {
                        response.sendRedirect("ErrorAC.jsp");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("dberror.jsp");
        }
    }
}
