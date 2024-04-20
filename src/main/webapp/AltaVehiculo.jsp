<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alta de Vehículo</title>
</head>
<body>
    <h1>Alta de Vehículo</h1>
    <form action="GuardarVehiculo.jsp" method="post">
        <label for="modelo">Modelo:</label>
        <input type="text" id="modelo" name="modelo" required><br><br>
        
        <label for="marca">Marca:</label>
        <input type="text" id="marca" name="marca" required><br><br>
        
        <label for="ano">Año:</label>
        <input type="number" id="ano" name="ano" required><br><br>
        
        <label for="color">Color:</label>
        <input type="text" id="color" name="color" required><br><br>
        
        <!-- Input oculto para almacenar el cliente_id -->
        <input type="hidden" id="cliente_id" name="cliente_id" value="<%= request.getParameter("cliente_id") %>">
        
        <button type="submit">Guardar Vehículo</button>
    </form>
</body>
</html>
