package br.com.cine.model.repository;

import java.sql.SQLException;
import java.util.Optional;
import javax.persistence.NoResultException;
import br.com.cine.util.TransacaoUtil;
import org.mindrot.jbcrypt.BCrypt;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.interfaces.IUsuarioRepository;

public class UsuarioRepository implements IUsuarioRepository {

    @Override
    public void cadastrarUsuario(Usuario usuario) throws SQLException {
        TransacaoUtil.executarTransacao(maneger -> maneger.persist(usuario));
    }

    @Override
    public Optional<Usuario> buscarUsuarioPorEmailESenha(String email, String senha) throws SQLException {
        return TransacaoUtil.executarTransacaoComRetorno(manager -> {
            try {
                Usuario usuario = manager
                        .createQuery("from Usuario u where u.email = :email and u.ativo = true", Usuario.class)
                        .setParameter("email", email).getSingleResult();

                if (BCrypt.checkpw(senha, usuario.getSenha())) {
                    return Optional.of(usuario);
                } else {
                    return Optional.empty();
                }
            } catch (NoResultException e) {
                return Optional.empty();
            }
        });
    }

    @Override
    public Optional<Usuario> buscarUsuarioPeloID(Long id) throws SQLException {
        return TransacaoUtil.executarTransacaoComRetorno(manager -> {
            try {
                return Optional.of(manager.find(Usuario.class, id));
            } catch (NoResultException e) {
                return Optional.empty();
            }
        });
    }

    @Override
    public Optional<Usuario> buscarEmail(String email) throws SQLException {
        return TransacaoUtil.executarTransacaoComRetorno(manager -> {
            try {
                return Optional.of(
                        manager.createQuery("from Usuario u where u.email = :email and u.ativo = true", Usuario.class)
                                .setParameter("email", email).getSingleResult());
            } catch (NoResultException e) {
                return Optional.empty();
            }
        });
    }

    @Override
    public void alterarUsuario(Usuario usuario) throws SQLException {
        TransacaoUtil.executarTransacao(maneger -> maneger.merge(usuario));
    }

    @Override
    public void excluirUsuarioPeloId(Long id) throws SQLException {
        TransacaoUtil.executarTransacao(maneger -> {
            Usuario usuario = maneger.find(Usuario.class, id);
            usuario.setAtivo(false);
            maneger.merge(usuario);
        });
    }
}
