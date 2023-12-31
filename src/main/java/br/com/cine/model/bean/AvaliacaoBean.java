package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.service.AvaliacaoService;
import br.com.cine.model.service.UsuarioService;
import br.com.cine.util.UsuarioUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

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
            Usuario usuarioLogado = UsuarioUtil.obterUsuarioLogado(this.req);
            this.req.setAttribute("usuarioLogado", usuarioLogado);
            String titulo = this.req.getParameter("titulo");
            String avaliacao = this.req.getParameter("opinion");
            String classificacao = this.req.getParameter("rating");
            String conteudoIDParam = this.req.getParameter("conteudoID");

            Integer classificacaoInt = Integer.parseInt(classificacao);
            Long conteudoId = Long.parseLong(conteudoIDParam);

            UsuarioService service = new UsuarioService();

            Optional<Usuario> usuarioEncontrado = service.buscarUsuarioPorID(usuarioLogado.getId());


            avaliacaoService.cadastrarAvaliacao(titulo, avaliacao, classificacaoInt, usuarioEncontrado.get().getId(), conteudoId);
            this.resp.sendRedirect("cine?action=ListaHomeLogadoBean");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

