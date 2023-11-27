package br.com.cine.model.bean;

import br.com.cine.controller.TipoAcao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import br.com.cine.model.entities.Usuario;
import br.com.cine.model.service.UsuarioService;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EnviarRecuperacaoSenhaEmailBean implements TipoAcao {
    private final HttpServletRequest req;
    private final HttpServletResponse resp;
    private final UsuarioService usuarioService = new UsuarioService();

    private final String host = "sandbox.smtp.mailtrap.io";
    private final String emailFrom = "no-reply@projcine.com.br";
    private final String username = "ada50cd189bf4d";
    private final String password = "d659fb7334107d";

    private final Logger logger = Logger.getLogger(EnviarRecuperacaoSenhaEmailBean.class.getName());

    public EnviarRecuperacaoSenhaEmailBean(HttpServletRequest req, HttpServletResponse resp) {
        this.req = req;
        this.resp = resp;
    }

    @Override
    public void execute() throws IOException {
        String emailUsuario = req.getParameter("email");

        try {
            Optional<Usuario> usuarioEncontrado = usuarioService.buscarUsuarioPorEmail(emailUsuario);

            if (usuarioEncontrado.isPresent()) {
                Usuario usuario = usuarioEncontrado.get();
                String codigoRecuperacao = getSaltString();

                usuario.setCodigoRecuperacao(codigoRecuperacao);
                usuarioService.alterarUsuario(usuario);

                enviarEmail(emailUsuario, codigoRecuperacao);
                resp.sendRedirect("cine?action=RecuperarSenhaBean&email=" + emailUsuario);
            } else {
                resp.sendRedirect("cine?action=LoginFormBean");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Erro durante o processo de recuperação de senha", e);
        }
    }

    private void enviarEmail(String emailUsuario, String codigoRecuperacao) {
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        try {
            Session session = Session.getDefaultInstance(props, new jakarta.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(emailFrom));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailUsuario));
            message.setSubject("Recuperação de Senha - Proj Cine");
            message.setText("Olá!\n\nRecebemos uma solicitação para recuperar a senha da sua conta no Cine Sinergy.\n\n" +
                    "Seu código de recuperação é: " + codigoRecuperacao + "\n\n" +
                    "Use este código para redefinir sua senha. Por favor, não compartilhe este código com ninguém.\n\n" +
                    "Atenciosamente,\nEquipe de suporte do Cine Sinergy");

            Transport.send(message);
            logger.info("Email enviado com sucesso");
        } catch (MessagingException e) {
            logger.log(Level.SEVERE, "Erro ao enviar email de recuperação de senha", e);
        }
    }

    private String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        return salt.toString();
    }
}
