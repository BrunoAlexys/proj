package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.service.UsuarioService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

public class ResetarSenhaBean implements TipoAcao {
    private final HttpServletRequest req;
    private final HttpServletResponse resp;
    private final UsuarioService service = new UsuarioService();

    public ResetarSenhaBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        try {
            String emailUsuario = req.getParameter("email");
            String codigoRecuperacao = req.getParameter("emailCode");
            String newPassword = req.getParameter("newPassword");
            String confirmPassword = req.getParameter("confirmPassword");

            Optional<Usuario> usuarioEncontrado = service.buscarUsuarioPorEmail(emailUsuario);

            if (usuarioEncontrado.isPresent() &&
                    usuarioEncontrado.get().getCodigoRecuperacao().equalsIgnoreCase(codigoRecuperacao) && Objects.equals(newPassword, confirmPassword)) {
                usuarioEncontrado.get().setSenha(newPassword);
                Usuario usuario = usuarioEncontrado.get();
                usuario.setSenha(newPassword);
                service.alterarUsuario(usuario);
                this.resp.sendRedirect("cine?action=LoginFormBean");
            }

        } catch (Exception e) {
            // Tratar exceções apropriadas aqui, como logar ou redirecionar para uma página de erro.
            e.printStackTrace();
        }
    }
}
