package br.com.cine.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

@WebServlet(urlPatterns = "/cine")
public class CineController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        HttpSession session = req.getSession();
        boolean isLogado = session.getAttribute("usuarioLogado") == null;
        boolean isProtected = !(action.equalsIgnoreCase("LoginBean") || action.equalsIgnoreCase("LoginFormBean")
                || action.equalsIgnoreCase("HomeBean") || action.equalsIgnoreCase("CadastroUsuarioBean")
                || action.equalsIgnoreCase("FilmesBean") || action.equalsIgnoreCase("SeriesBean")
                || action.equalsIgnoreCase("ListarSeriesBean") || action.equalsIgnoreCase("ListarAvaliacaoBean")
                || action.equalsIgnoreCase("SelecionadoBean"));

        if (isLogado && isProtected) {
            resp.sendRedirect("cine?action=LoginFormBean");
            return;
        }

        String fqn = null;
        System.out.println(action);

        if (action != null) {
            fqn = "br.com.cine.model.bean." + Character.toUpperCase(action.charAt(0)) + action.substring(1);
            System.out.println(fqn);
        } else {
            throw new IllegalArgumentException("Nenhuma ação foi informada!");
        }

        try {
            Class<?> classe = Class.forName(fqn);
            Constructor<?> constructor = classe.getDeclaredConstructor(HttpServletRequest.class, HttpServletResponse.class);
            TipoAcao tipoAcao = (TipoAcao) constructor.newInstance(req, resp);
            tipoAcao.execute();
        } catch (ClassNotFoundException | NoSuchMethodException | SecurityException | InstantiationException
                 | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
            throw new ServletException(e);
        }
    }
}
