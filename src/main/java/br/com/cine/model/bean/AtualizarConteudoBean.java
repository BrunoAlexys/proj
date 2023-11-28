package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Conteudo;
import br.com.cine.model.service.ConteudoService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Optional;

public class AtualizarConteudoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public AtualizarConteudoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        String paramId = this.req.getParameter("id");
        String tipo = this.req.getParameter("tipoConteudo");
        String titulo = this.req.getParameter("titulo");
        String descricao = this.req.getParameter("descricao");
        String diretor = this.req.getParameter("diretor");
        String genero = this.req.getParameter("genero");
        String dataDeLancamento = this.req.getParameter("dataDeLancamento");
        String duracao = this.req.getParameter("duracao");
        String temporadas = this.req.getParameter("temporadas");
        String urlImg = this.req.getParameter("urlImg");
        String urlTrailer = this.req.getParameter("urlTrailer");

        LocalDate data = LocalDate.parse(dataDeLancamento);
        Long id = Long.parseLong(paramId);

        Optional<Conteudo> conteudoEncontrado = null;

        System.out.println("ID: " + id);
        System.out.println("Tipo: " + tipo);

        var service = new ConteudoService();

        try {
            conteudoEncontrado = service.buscarPeloID(id);
            conteudoEncontrado.get().setTipoConteudo(tipo);
            conteudoEncontrado.get().setTitulo(titulo);
            conteudoEncontrado.get().setDescricao(descricao);
            conteudoEncontrado.get().setDiretor(diretor);
            conteudoEncontrado.get().setGenero(genero);
            conteudoEncontrado.get().setDataDeLancamento(data);
            conteudoEncontrado.get().setDuracao(duracao);
            conteudoEncontrado.get().setTemporadas(temporadas);
            conteudoEncontrado.get().setUrlImg(urlImg);
            conteudoEncontrado.get().setUrlTrailer(urlTrailer);

            Conteudo conteudo = conteudoEncontrado.get();
            conteudo.setTitulo(titulo);
            conteudo.setDescricao(descricao);
            conteudo.setDiretor(diretor);
            conteudo.setGenero(genero);
            conteudo.setDataDeLancamento(data);
            conteudo.setUrlImg(urlImg);
            conteudo.setUrlTrailer(urlTrailer);


            atualizar(conteudo);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.resp.sendRedirect("cine?action=ListarConteudoBean");
        }
    }

    private void atualizar(Conteudo conteudo) {

        try {
            var service = new ConteudoService();
            service.alterar(conteudo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
