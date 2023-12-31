package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public LogoutBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        HttpSession session = this.req.getSession();
        session.invalidate();

        this.resp.sendRedirect("cine?action=ListaHomeBean");
    }
}
