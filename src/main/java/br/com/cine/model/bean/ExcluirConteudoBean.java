package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import br.com.cine.model.entities.Conteudo;
import br.com.cine.model.service.ConteudoService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

public class ExcluirConteudoBean implements TipoAcao {
    private HttpServletRequest req;
    private HttpServletResponse resp;

    public ExcluirConteudoBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws ServletException, IOException {
        String idParam = req.getParameter("id");
        Long id = Long.parseLong(idParam);

        var service = new ConteudoService();

        Optional<Conteudo> conteudo = null;
        try {
            conteudo = service.buscarPeloID(id);
            if (conteudo.isPresent()) {
                service.excluir(conteudo.get().getId());
                this.resp.sendRedirect("cine?action=ListarConteudoBean");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
