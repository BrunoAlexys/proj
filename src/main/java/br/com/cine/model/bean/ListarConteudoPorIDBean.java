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

public class ListarConteudoPorIDBean implements TipoAcao {

    private HttpServletRequest req;
    private HttpServletResponse resp;

    public ListarConteudoPorIDBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        String idParam = this.req.getParameter("id");
        Long id = Long.parseLong(idParam);

        System.out.println("ID: " + id);

        var service = new ConteudoService();

        Optional<Conteudo> conteudoID = null;
        try {
            conteudoID = service.buscarPeloID(id);

            if (conteudoID.isPresent()) {
                this.req.setAttribute("cont", conteudoID);
                RequestDispatcher dispatcher = this.req.getRequestDispatcher("/form-alterar-conteudo.jsp");
                dispatcher.forward(this.req, this.resp);
            } else {
                this.resp.sendRedirect("cine?action=ListarConteudoBean");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
