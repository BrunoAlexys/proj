package br.com.cine.model.repository;

import java.sql.*;
import java.util.ArrayList;
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
    public Optional<Avaliacoes> buscarAvaliacaoPorID(Long id) throws SQLException {
        return TransacaoUtil.executarTransacaoComRetorno(manager -> {
            return Optional.ofNullable(
                    manager.createQuery("from Avaliacoes a where a.id = :id and a.ativo = true", Avaliacoes.class)
                            .setParameter("id", id).getSingleResult());
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
    public List<Avaliacoes> buscarTodasAvaliacoes() {
            List<Avaliacoes> todasAvaliacoes = new ArrayList<>();

            // Aqui, você deve implementar a lógica para buscar todas as avaliações no banco de dados
            // Utilize JDBC ou o framework de persistência que estiver usando (Hibernate, Spring Data, etc.)

            // Exemplo simplificado (assumindo uma conexão JDBC):
            try (Connection connection = DriverManager.getConnection("sua_url_de_conexao", "seu_usuario", "sua_senha");
                 PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM avaliacoes");
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    Avaliacoes avaliacao = new Avaliacoes();
                    // Configure os atributos da avaliação conforme a estrutura do seu banco de dados
                    avaliacao.setId(resultSet.getLong("id"));
                    avaliacao.setTitulo(resultSet.getString("titulo"));
                    avaliacao.setConteudo(resultSet.getString("Conteudo"));
                    todasAvaliacoes.add(avaliacao);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return todasAvaliacoes;
        }
    }


