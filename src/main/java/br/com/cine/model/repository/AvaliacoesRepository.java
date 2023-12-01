package br.com.cine.model.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import br.com.cine.model.entities.Avaliacoes;
import br.com.cine.model.interfaces.IAvaliacoesRepository;
import br.com.cine.util.TransacaoUtil;

public class AvaliacoesRepository implements IAvaliacoesRepository {

    @Override
    public void salvarAvaliacao(Avaliacoes avaliacoes) throws SQLException {
        TransacaoUtil.executarTransacao(maneger -> maneger.persist(avaliacoes));
    }

    @Override
    public List<Avaliacoes> buscarAvaliacaoPorID(Long id) throws SQLException {
        return TransacaoUtil.executarTransacaoComRetorno(manager -> {
            return manager.createQuery("from Avaliacoes a where a.conteudo.id = :id and a.ativo = true", Avaliacoes.class)
                    .setParameter("id", id)
                    .getResultList();
        });
    }



    public List<Avaliacoes> listarAvaliacoes() throws SQLException {
        return TransacaoUtil.executarTransacaoComRetorno(manager -> {
            return manager.createQuery("select a from Avaliacoes a where a.ativo = true", Avaliacoes.class).getResultList();
        });
    }

    @Override
    public void atualizarAvaliacao(Avaliacoes avaliacoes) throws SQLException {
        TransacaoUtil.executarTransacao(maneger -> maneger.merge(avaliacoes));
    }

    @Override
    public void removerAvaliacaoPeloID(Long id) throws SQLException {
        TransacaoUtil.executarTransacao(maneger -> {
            Avaliacoes avaliacoes = maneger.find(Avaliacoes.class, id);
            avaliacoes.setAtivo(false);
            maneger.merge(avaliacoes);
        });
    }
}
