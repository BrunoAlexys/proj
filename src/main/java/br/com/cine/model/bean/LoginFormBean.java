package br.com.cine.model.bean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.cine.controller.TipoAcao;

public class LoginFormBean implements TipoAcao{
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public LoginFormBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        this.resp.sendRedirect("login.jsp");
    }
}
