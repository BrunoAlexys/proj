package br.com.cine.model.interfaces;

import java.sql.SQLException;
import java.util.List;

import br.com.cine.model.entities.Avaliacoes;

public interface IAvaliacoesRepository {
    void salvarAvaliacao(Avaliacoes avaliacoes) throws SQLException;
    List<Avaliacoes> buscarAvaliacaoPorID(Long id) throws SQLException;
    List<Avaliacoes> listarAvaliacoes() throws SQLException;
    void atualizarAvaliacao(Avaliacoes avaliacoes) throws SQLException;
    void removerAvaliacaoPeloID(Long id) throws SQLException;
}
