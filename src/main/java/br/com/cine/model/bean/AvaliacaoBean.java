package br.com.cine.model.bean;
import br.com.cine.controller.TipoAcao;
import br.com.cine.model.service.AvaliacaoService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AvaliacaoBean implements TipoAcao {

    private HttpServletRequest req;
    private HttpServletResponse resp;
    private AvaliacaoService avaliacaoService = new AvaliacaoService();

    public AvaliacaoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    public void cadastrarAvaliacao() throws ServletException, IOException {
        try {
            String titulo = req.getParameter("titulo");
            String avaliacao = req.getParameter("avaliacao");
            Integer classificacao = Integer.parseInt(req.getParameter("classificacao"));
            Long usuarioID = Long.parseLong(req.getParameter("usuarioID"));
            Long conteudoID = Long.parseLong(req.getParameter("conteudoID"));

            avaliacaoService.cadastrarAvaliacao(titulo, avaliacao, classificacao, usuarioID, conteudoID);

            resp.sendRedirect(req.getContextPath() + "/avaliacao.jsp");
        } catch (SQLException e) {

            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/erro.jsp");
        }
    }

    @Override
    public void execute() throws ServletException, IOException {

    }
}

