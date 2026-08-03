<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.proyecto.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tienda Web - Listado de Clientes</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, sans-serif; background-color: #f4f6f9; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #e2e8f0; padding: 12px; text-align: left; }
        th { background-color: #2c3e50; color: white; }
        tr:nth-child(even) { background-color: #f8fafc; }
        .btn-accion { color: #e74c3c; text-decoration: none; font-weight: bold; }
        .btn-volver { display: inline-block; margin-top: 20px; padding: 10px 18px; background: #2980b9; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>

<div class="container">
    <h2>Listado de Clientes Registrados</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Teléfono</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaUsuarios");
                if (usuarios != null && !usuarios.isEmpty()) {
                    for (Usuario u : usuarios) {
            %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getNombre() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getTelefono() %></td>
                <td>
                    <a href="UsuarioServlet?accion=eliminar&id=<%= u.getId() %>" 
                       class="btn-accion" 
                       onclick="return confirm('¿Está seguro de eliminar este usuario?');">Eliminar</a>
                </td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="5" style="text-align: center;">No hay usuarios registrados en la base de datos.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a href="index.jsp" class="btn-volver">← Registrar Nuevo Usuario</a>
</div>

</body>
</html>