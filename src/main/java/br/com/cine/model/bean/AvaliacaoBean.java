package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.service.AvaliacaoService;
import br.com.cine.util.UsuarioUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    @Override
    public void execute() throws ServletException, IOException {
        try {
            String titulo = req.getParameter("titulo");
            String avaliacao = req.getParameter("opinion");
            Integer classificacao = Integer.parseInt(req.getParameter("rating"));
            Long serieId = Long.parseLong(req.getParameter("serieId"));

            Usuario usuarioLogado = UsuarioUtil.obterUsuarioLogado(this.req);
            this.req.setAttribute("usuarioLogado", usuarioLogado);


            avaliacaoService.cadastrarAvaliacao(titulo, avaliacao, classificacao, usuarioLogado.getId(), serieId);

            //resp.sendRedirect(req.getContextPath() + "/avaliacao.jsp");
        } catch (SQLException e) {

            e.printStackTrace();
            //resp.sendRedirect(req.getContextPath() + "/erro.jsp");
        }
    }
}

