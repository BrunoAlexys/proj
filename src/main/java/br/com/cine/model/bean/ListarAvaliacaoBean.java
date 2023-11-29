package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Avaliacoes;
import br.com.cine.model.service.AvaliacaoService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListarAvaliacaoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public ListarAvaliacaoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        var service = new AvaliacaoService();

        List<Avaliacoes> listAvaliacao = null;

        try {
            listAvaliacao = service.listarAvaliacao();
        } catch (Exception e) {
            e.printStackTrace();
        }

        this.req.setAttribute("avaliacoes", listAvaliacao);

        RequestDispatcher dispatcher = this.req.getRequestDispatcher("/selecionado.jsp");
        dispatcher.forward(this.req, this.resp);
    }
}
