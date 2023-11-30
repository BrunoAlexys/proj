package br.com.cine.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import br.com.cine.model.entities.Conteudo;
import br.com.cine.model.repository.ConteudoRepository;

public class ConteudoService {
    private ConteudoRepository conteudoRepository;

    public ConteudoService() {
        this.conteudoRepository = new ConteudoRepository();
    }

    public void cadastrar(Conteudo conteudo) throws SQLException {
        conteudoRepository.cadastrar(conteudo);
    }

    public Optional<Conteudo> buscarPeloID(Long id) throws SQLException {
        return conteudoRepository.buscarPeloID(id);
    }

    public List<Conteudo> listarConteudo() throws SQLException {
        return conteudoRepository.listarConteudos();
    }

    public List<Conteudo> listarTop10() throws SQLException {
        return conteudoRepository.listarTop10();
    }

    public List<Conteudo> listarFilmes() throws SQLException {
        return conteudoRepository.listarFilmes();
    }

    public List<Conteudo> listarSeries()throws SQLException {
        return conteudoRepository.listarSeries();
    }

    public void alterar(Conteudo conteudo) throws SQLException {
        conteudoRepository.alterar(conteudo);
    }

    public void excluir(Long id) throws SQLException {
        conteudoRepository.excluirPeloID(id);
    }
}
