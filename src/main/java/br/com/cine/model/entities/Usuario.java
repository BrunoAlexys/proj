package br.com.cine.model.entities;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "usuario_id", nullable = false)
    private Long id;

    @Column(name = "nome", nullable = false)
    @NotBlank(message = "O nome não pode ser vazio")
    private String nome;

    @Column(name = "sobrenome", nullable = false)
    @NotBlank(message = "O sobrenonome não pode ser vazio")
    private String sobrenome;

    @Column(name = "email", nullable = false, unique = true)
    @NotBlank(message = "O email não pode ser vazio")
    private String email;

    @Column(name = "senha", nullable = false)
    @NotNull(message = "A senha não pode ser nula")
    private String senha;

    @Column(name = "data_nascimento", nullable = false)
    @Past(message = "Digite uma data de nascimento valida")
    private LocalDate dataDeNascimento;

    @Column(name = "genero")
    private String genero;

    @Column(name = "ativo", nullable = false)
    private Boolean ativo;

    @Column(name = "codigo_recuperacao")
    private String codigoRecuperacao;

    @OneToMany(mappedBy = "usuario", fetch = FetchType.EAGER)
    private List<Avaliacoes> listAvaliacoes;

    public Usuario(String nome, String sobrenome, String email, String senha, LocalDate dataDeNascimento,
                   String genero) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.email = email;
        this.senha = senha;
        this.dataDeNascimento = dataDeNascimento;
        this.genero = genero;
        this.ativo = true;
    }

    public Usuario() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public LocalDate getDataDeNascimento() {
        return dataDeNascimento;
    }

    public void setDataDeNascimento(LocalDate dataDeNascimento) {
        this.dataDeNascimento = dataDeNascimento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    public String getCodigoRecuperacao() {
        return codigoRecuperacao;
    }

    public void setCodigoRecuperacao(String codigoRecuperacao) {
        this.codigoRecuperacao = codigoRecuperacao;
    }

    public List<Avaliacoes> getListAvaliacoes() {
        return listAvaliacoes;
    }

    public void setListAvaliacoes(List<Avaliacoes> listAvaliacoes) {
        this.listAvaliacoes = listAvaliacoes;
    }

    @Override
    public String toString() {
        return "Usuario [id=" + id + ", nome=" + nome + ", sobrenome=" + sobrenome + ", email=" + email + ", senha="
                + senha + ", dataDeNascimento=" + dataDeNascimento + ", genero=" + genero + ", ativo=" + ativo
                + ", listAvaliacoes=" + listAvaliacoes + "]";
    }

}
