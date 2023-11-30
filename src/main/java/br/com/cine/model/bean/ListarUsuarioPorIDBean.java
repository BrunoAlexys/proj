package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.service.UsuarioService;
import br.com.cine.util.UsuarioUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

public class ListarUsuarioPorIDBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public ListarUsuarioPorIDBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        Usuario usuarioLogado = UsuarioUtil.obterUsuarioLogado(this.req);
        this.req.setAttribute("usuarioLogado", usuarioLogado);

        var service = new UsuarioService();
        Optional<Usuario> usuarioEncontrado = null;

        try {
            usuarioEncontrado = service.buscarUsuarioPorID(usuarioLogado.getId());
            if (usuarioEncontrado.isPresent()) {
                this.req.setAttribute("usuario", usuarioEncontrado);
                this.req.getRequestDispatcher("/form-alterar-usuario.jsp").forward(this.req, this.resp);
            } else {
                this.resp.sendRedirect("cine?action=ListarHomeBean");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
