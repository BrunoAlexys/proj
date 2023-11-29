<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<link rel="stylesheet" href="css/comentarios.css">
<head>
    <!-- Incluindo SweetAlert2 library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <title>comentario</title>
</head>
<body>

<h2>Comentários</h2>

<% if (session.getAttribute("usuarioLogado") != null) { %>
<form id="form" action="cine?action=AvaliacaoBean" method="post">
    Título: <input type="text" name="titulo" required><br>
    Avaliação: <textarea name="avaliacao" rows="4" cols="50" required></textarea><br>
    Classificação: <input type="number" name="classificacao" required><br>
    ID do Usuário: <input type="text" name="usuarioID" value="<%= session.getAttribute("usuarioLogado") %>" readonly><br>
    ID do Conteúdo: <input type="text" name="conteudoID" required><br>
    <input type="submit" value="Cadastrar Avaliação">
</form>

<script>
    function showSuccessAlert() {
        setTimeout(function() {
            Swal.fire("Salvo com sucesso!");
        }, 500);
        window.location.href = "cine?action=VisualizarAvaliacaoBean";

    }
</script>
<% } else { %>

</script>
<%-- SweetAlert2 redirecionando login--%>
<script>
    setTimeout(function() {
        Swal.fire({
            icon: 'info',
            title: 'Redirecionando para a tela de login',
            timer: 2000,
            showConfirmButton: false})
        window.location.href = "cine?action=loginBean";

    }, 1000);
</script>

<% } %>

<%-- SweetAlert2 for error message --%>
<% if (request.getAttribute("errorMessage") != null) { %>
<script>
    Swal.fire({
        icon: 'error',
        title: '<%= request.getAttribute("errorMessage") %>',
        timer: 3000,
        showConfirmButton: false
    });
</script>
<% } %>

</body>
</html>
