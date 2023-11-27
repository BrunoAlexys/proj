package br.com.cine.controller;
import javax.servlet.ServletException;
import java.io.IOException;

public interface TipoAcao {
    void execute() throws ServletException, IOException;
}
