package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Conteudo;
import br.com.cine.model.service.ConteudoService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListarSeriesLogadoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public ListarSeriesLogadoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        var service = new ConteudoService();

        List<Conteudo> listSeries = null;

        try {
            listSeries = service.listarSeries();
        } catch (Exception e) {
            e.printStackTrace();
        }

        this.req.setAttribute("series", listSeries);

        RequestDispatcher dispatcher = this.req.getRequestDispatcher("/series-logado.jsp");
        dispatcher.forward(this.req, this.resp);
    }
}
