package br.com.cine.model.service;

import br.com.cine.model.entities.Usuario;

import java.util.Optional;

public class Teste {
    public static void main(String[] args) {
        UsuarioService service = new UsuarioService();
        Optional<Usuario> usuarioEncontrado = null;
        try {
            usuarioEncontrado = service.buscarUsuarioPorEmailESenha("a@gmail.com","123");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        System.out.println(usuarioEncontrado.get().getNome());
    }
}
