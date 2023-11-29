package br.com.cine.model.service;

public class Teste {
    public static void main(String[] args) {
        AvaliacaoService service = new AvaliacaoService();

        try {
            service.cadastrarAvaliacao("Teste", "Teste", 4, 3L, 3L);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
