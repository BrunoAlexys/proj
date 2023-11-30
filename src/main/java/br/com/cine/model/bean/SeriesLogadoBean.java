package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SeriesLogadoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public SeriesLogadoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        this.resp.sendRedirect("series-logado.jsp");
    }
}
