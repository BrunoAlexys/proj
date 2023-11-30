package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Conteudo;
import br.com.cine.model.service.ConteudoService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

public class ListarSelecionadoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public ListarSelecionadoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        String idParam = req.getParameter("id");
        Long id = Long.parseLong(idParam);

        Optional<Conteudo> conteudo = null;

        var service = new ConteudoService();

        try {
            conteudo = service.buscarPeloID(id);

            if (conteudo.isPresent()) {
                this.req.setAttribute("conteudo", conteudo);
                RequestDispatcher dispatcher = this.req.getRequestDispatcher("/selecionado.jsp");
                dispatcher.forward(this.req, this.resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
