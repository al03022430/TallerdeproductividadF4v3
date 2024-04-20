<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alta de Requerimiento</title>
</head>
<body>
    <h1>Alta de Requerimiento</h1>
    <form action="GuardarRequerimientos.jsp" method="post">
        <label for="descripcion">Descripción del Requerimiento:</label><br>
        <input type="text" id="descripcion" name="descripcion" required><br><br>
        <label for="fecha">Fecha de Solicitud:</label><br>
        <input type="date" id="fecha" name="fecha_solicitud" required><br><br>
        <input type="hidden" name="vehiculo_id" value="<%= request.getParameter("vehiculo_id") %>">
        <button type="submit">Guardar Requerimiento</button>
    </form>
    <form action="cliente.jsp" method="post">
        <button type="submit">Regresar a Cliente</button>
    </form>
</body>
</html>
