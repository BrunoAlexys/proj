package br.com.cine.model.bean;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Conteudo;
import br.com.cine.model.service.ConteudoService;

public class CadastroConteudoBean implements TipoAcao {

    private HttpServletRequest req;
    private HttpServletResponse resp;

    public CadastroConteudoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
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

        try {
            if (tipo.equalsIgnoreCase("Filmes")) {
                var conteudo = new Conteudo(titulo, descricao, diretor, duracao, null, genero, data, urlImg,
                        urlTrailer, tipo);
                cadastrar(conteudo);
                this.resp.sendRedirect("cine?action=LoginFormBean");
            } else if (tipo.equalsIgnoreCase("Series")) {
                var conteudo = new Conteudo(titulo, descricao, diretor, null, temporadas, genero, data, urlImg,
                        urlTrailer, tipo);
                cadastrar(conteudo);
                this.resp.sendRedirect("cine?action=LoginFormBean");
            } else {
                this.resp.sendRedirect("cine?action=LoginFormBean");
                throw new IllegalArgumentException("Tipo de conteudo invalido");
            }
        } catch (IllegalArgumentException e) {
            System.out.println("Erro: " + e.getMessage());
        }

    }

    private void cadastrar(Conteudo conteudo) {

        try {
            var service = new ConteudoService();
            service.cadastrar(conteudo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}