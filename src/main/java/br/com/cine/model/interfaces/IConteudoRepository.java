package br.com.cine.model.interfaces;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import br.com.cine.model.entities.Conteudo;

public interface IConteudoRepository {
    void cadastrar(Conteudo conteudo) throws SQLException;
    Optional<Conteudo> buscarPeloID(long id) throws SQLException;
    List<Conteudo> listarConteudos() throws SQLException;
    List<Conteudo> listarFilmes() throws SQLException;
    List<Conteudo> listarTop10() throws SQLException;
    List<Conteudo> listarSeries() throws SQLException;
    void alterar(Conteudo conteudo) throws SQLException;
    void excluirPeloID(Long id) throws SQLException;
}
