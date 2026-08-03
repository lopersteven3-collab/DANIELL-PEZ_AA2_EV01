<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tienda Web - Registro de Usuarios</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, sans-serif; background-color: #f4f6f9; margin: 40px; }
        .card { background: white; padding: 30px; border-radius: 8px; max-width: 450px; margin: 0 auto; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; text-align: center; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        input { width: 100%; padding: 10px; margin-top: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        button { width: 100%; padding: 12px; background-color: #27ae60; color: white; border: none; border-radius: 4px; margin-top: 25px; font-weight: bold; cursor: pointer; }
        button:hover { background-color: #219150; }
        .btn-link { display: block; text-align: center; margin-top: 15px; color: #2980b9; text-decoration: none; }
    </style>
</head>
<body>

<div class="card">
    <h2>Registro de Cliente</h2>
    
    <form action="UsuarioServlet" method="POST">
        <label for="nombre">Nombre Completo:</label>
        <input type="text" id="nombre" name="nombre" required placeholder="Ej: Daniel López">

        <label for="email">Correo Electrónico:</label>
        <input type="email" id="email" name="email" required placeholder="Ej: lopersteven03@gmail.com">

        <label for="telefono">Teléfono:</label>
        <input type="tel" id="telefono" name="telefono" required placeholder="Ej: 3197221027">

        <button type="submit">Registrar Cliente</button>
    </form>

    <a href="UsuarioServlet" class="btn-link">Ver lista de usuarios registrados →</a>
</div>

</body>
</html>