package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Usuario;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BuscarUsuarioLogadoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public BuscarUsuarioLogadoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        HttpSession sessao = req.getSession();
        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
        req.setAttribute("usuarioLogado", usuarioLogado);

        System.out.println("Usuario logado: " + usuarioLogado.getNome() + " " + usuarioLogado.getSobrenome()
                + " - " + usuarioLogado.getId());
    }
}
