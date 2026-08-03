package com.proyecto.controlador;

import com.proyecto.dao.UsuarioDAO;
import com.proyect.modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    private final UsuarioDAO UsuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Si se envía una solicitud para eliminar
        String accion = request.getParameter("accion");
        if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            UsuarioDAO.eliminar(id);
        }

        // Consultar la lista desde la base de datos
        List<Usuario> listaUsuarios = UsuarioDAO.consultarTodos();

        // Mandar los datos a la vista JSP
        request.setAttribute("listaUsuarios", listaUsuarios);
        request.getRequestDispatcher("listaUsuarios.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Capturar los datos enviados por el formulario HTML/JSP
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");

        // Guardar nuevo cliente vía DAO
        Usuario nuevoUsuario = new Usuario(nombre, email, telefono);
        UsuarioDAO.insertar(nuevoUsuario);

        // Redirigir para listar de nuevo
        doGet(request, response);
    }
}