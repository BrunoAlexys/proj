package br.com.cine.model.service;

public class Teste {
    public static void main(String[] args) {
        ConteudoService service = new ConteudoService();
        try {
            System.out.println(service.listarFilmes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
