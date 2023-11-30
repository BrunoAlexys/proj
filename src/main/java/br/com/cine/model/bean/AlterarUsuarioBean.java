package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Conteudo;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.service.UsuarioService;
import br.com.cine.util.UsuarioUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Optional;

public class AlterarUsuarioBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public AlterarUsuarioBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        String paramNome = this.req.getParameter("firstname");
        String paramSobrenome = this.req.getParameter("lastname");
        String paramSenha = this.req.getParameter("password");
        String paraData = this.req.getParameter("date");
        String genero = this.req.getParameter("genero");

        Usuario usuarioLogado = UsuarioUtil.obterUsuarioLogado(this.req);
        this.req.setAttribute("usuarioLogado", usuarioLogado);

        LocalDate date = LocalDate.parse(paraData);

        var service = new UsuarioService();
        Optional<Usuario> usuarioEncontrado = null;

        try {
            usuarioEncontrado = service.buscarUsuarioPorID(usuarioLogado.getId());
            usuarioEncontrado.get().setNome(paramNome);
            usuarioEncontrado.get().setSobrenome(paramSobrenome);
            usuarioEncontrado.get().setSenha(paramSenha);
            usuarioEncontrado.get().setDataDeNascimento(date);
            usuarioEncontrado.get().setGenero(genero);

            Usuario usuario = usuarioEncontrado.get();
            usuario.setNome(paramNome);
            usuario.setSobrenome(paramSobrenome);
            usuario.setSenha(paramSenha);
            usuario.setDataDeNascimento(date);
            usuario.setGenero(genero);

            try {
                atualizarUsuario(usuario);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.resp.sendRedirect("cine?action=ListaHomeLogadoBean");
        }
    }

    private void atualizarUsuario(Usuario usuario) throws Exception {
        var service = new UsuarioService();
        service.alterarUsuario(usuario);
    }
}
