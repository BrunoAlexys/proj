package br.com.cine.model.entities;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "conteudos")
public class Conteudo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "conteudo_id")
    private Long id;

    @Column(name = "titulo")
    @NotBlank(message = "O campo titulo não pode ser vazio")
    private String titulo;

    @Column(name = "descricao")
    @NotBlank(message = "O campo descrição não pode ser vazio")
    private String descricao;

    @Column(name = "diretor")
    @NotBlank(message = "O campo diretor não pode ser vazio")
    private String diretor;

    @Column(name = "duracao")
    private String duracao;

    @Column(name = "temporadas")
    private String temporadas;

    @Column(name = "genero")
    private String genero;

    @Column(name = "data_de_lancamento")
    private LocalDate dataDeLancamento;

    @Column(name = "url_img")
    @NotBlank(message = "O campo de url de imagem não pode ser vazio")
    private String urlImg;

    @Column(name = "url_trailer")
    @NotBlank(message = "O campo de url do trailer não pode ser vazio")
    private String urlTrailer;

    @Column(name = "ativo")
    @NotNull(message = "O campo ativo não pode ser nulo")
    private Boolean ativo;

    @Column(name = "tipo_conteudo")
    private String tipoConteudo;

    @Column(name = "avaliacao_id")
    @OneToMany(mappedBy = "conteudo", fetch = FetchType.EAGER)
    private List<Avaliacoes> listAvaliacoes;

    public Conteudo(String titulo, String descricao, String diretor, String duracao, String temporadas, String genero,
                    LocalDate dataDeLancamento, String urlImg, String urlTrailer, String tipoConteudo) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.diretor = diretor;
        this.duracao = duracao;
        this.temporadas = temporadas;
        this.genero = genero;
        this.dataDeLancamento = dataDeLancamento;
        this.urlImg = urlImg;
        this.urlTrailer = urlTrailer;
        this.ativo = true;
        this.tipoConteudo = tipoConteudo;
    }

    public Conteudo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTipoConteudo() {
        return tipoConteudo;
    }

    public void setTipoConteudo(String tipoConteudo) {
        this.tipoConteudo = tipoConteudo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getDuracao() {
        return duracao;
    }

    public void setDuracao(String duracao) {
        this.duracao = duracao;
    }

    public String getTemporadas() {
        return temporadas;
    }

    public void setTemporadas(String temporadas) {
        this.temporadas = temporadas;
    }

    public List<Avaliacoes> getListAvaliacoes() {
        return listAvaliacoes;
    }

    public void setListAvaliacoes(List<Avaliacoes> listAvaliacoes) {
        this.listAvaliacoes = listAvaliacoes;
    }

    public String getDiretor() {
        return diretor;
    }

    public void setDiretor(String diretor) {
        this.diretor = diretor;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public LocalDate getDataDeLancamento() {
        return dataDeLancamento;
    }

    public void setDataDeLancamento(LocalDate dataDeLancamento) {
        this.dataDeLancamento = dataDeLancamento;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public String getUrlTrailer() {
        return urlTrailer;
    }

    public void setUrlTrailer(String urlTrailer) {
        this.urlTrailer = urlTrailer;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    @Override
    public String toString() {
        return "Conteudo{" +
                "id=" + id +
                ", titulo='" + titulo + '\'' +
                ", descricao='" + descricao + '\'' +
                ", diretor='" + diretor + '\'' +
                ", duracao='" + duracao + '\'' +
                ", temporadas='" + temporadas + '\'' +
                ", genero='" + genero + '\'' +
                ", dataDeLancamento=" + dataDeLancamento +
                ", urlImg='" + urlImg + '\'' +
                ", urlTrailer='" + urlTrailer + '\'' +
                ", ativo=" + ativo +
                ", tipoConteudo='" + tipoConteudo + '\'' +
                ", listAvaliacoes=" + listAvaliacoes +
                '}';
    }
}
