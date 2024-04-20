<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar Clientes</title>
</head>
<body>
    <h1>Buscar Clientes</h1>
    <form action="ResultadoClientes.jsp" method="post">
        <label for="primeras_tres_letras">Primeras tres letras del nombre del cliente:</label>
        <input type="text" id="primeras_tres_letras" name="primeras_tres_letras" required><br><br>
        <button type="submit">Buscar</button>
    </form>
</body>
</html>
