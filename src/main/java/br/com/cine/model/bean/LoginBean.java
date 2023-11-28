package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.service.UsuarioService;
import org.mindrot.jbcrypt.BCrypt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

public class LoginBean implements TipoAcao {
    private static final String USUARIO_LOGADO_ATTRIBUTE = "usuarioLogado";
    private static final String ADMIN_EMAIL = "admin@gmail.com";

    private final HttpServletRequest req;
    private final HttpServletResponse resp;
    private final UsuarioService service = new UsuarioService();

    public LoginBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        String email = req.getParameter("email");
        String senha = req.getParameter("password");

        try {
            Optional<Usuario> usuarioEncontrado = service.buscarUsuarioPorEmailESenha(email, senha);

            if (usuarioEncontrado.isPresent()) {
                Usuario usuario = usuarioEncontrado.get();

                adicionarUsuarioNaSessao(usuario);

                if (isAdmin(usuario)) {
                    resp.sendRedirect("cine?action=ListarConteudoBean");
                } else {
                    resp.sendRedirect("cine?action=HomeBean");
                }
            } else {
                resp.sendRedirect("cine?action=HomeBean");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private boolean isAdmin(Usuario usuario) {
        return usuario.getEmail().equals(ADMIN_EMAIL);
    }

    private void adicionarUsuarioNaSessao(Usuario usuario) throws IOException {
        HttpSession sessao = req.getSession();

        if (usuario != null) {
            sessao.setAttribute(USUARIO_LOGADO_ATTRIBUTE, usuario);
        } else {
            resp.sendRedirect("cine?action=LoginFormBean");
        }
    }
}
