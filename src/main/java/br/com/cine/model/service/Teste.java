package br.com.cine.model.service;

import br.com.cine.model.entities.Usuario;

import java.time.LocalDate;
import java.util.Optional;

public class Teste {
    public static void main(String[] args) {
        UsuarioService service = new UsuarioService();

        Usuario usuario = new Usuario("ADM","ADM","adm@gmail.com","123", LocalDate.of(2000,01,01),"Masculino");

        try {
            service.cadastrarUsuario(usuario);
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
}
