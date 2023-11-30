package br.com.cine.util;

import br.com.cine.model.entities.Usuario;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UsuarioUtil {

    public static Usuario obterUsuarioLogado(HttpServletRequest request) {
        HttpSession sessao = request.getSession();
        return (Usuario) sessao.getAttribute("usuarioLogado");
    }
}

