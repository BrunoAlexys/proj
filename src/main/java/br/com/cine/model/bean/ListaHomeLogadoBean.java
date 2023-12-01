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

public class ListaHomeLogadoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public ListaHomeLogadoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        var service = new ConteudoService();

        List<Conteudo> listTop10 = null;
        List<Conteudo> listFilmes = null;
        List<Conteudo> listSeries = null;

        try {
            listFilmes = service.listarFilmes();
            listSeries = service.listarSeries();
            listTop10 = service.listarTop10();
        } catch (Exception e) {
            e.printStackTrace();
        }

        this.req.setAttribute("filmesLogado", listFilmes);
        this.req.setAttribute("seriesLogado", listSeries);
        this.req.setAttribute("top10Logado", listTop10);

        RequestDispatcher dispatcher = this.req.getRequestDispatcher("/home-logado.jsp");
        dispatcher.forward(this.req, this.resp);
    }
}

