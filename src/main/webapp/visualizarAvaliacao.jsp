<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Avaliações</title>
    <link rel="stylesheet" href="css/comentarios.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<table border="1">
    <tr>
        <th>Título da Avaliação</th>
        <th>Nome do Autor da Avaliação</th>
        <th>Data da Avaliação</th>
        <th>Texto da Avaliação</th>
    </tr>
    <c:forEach var="avaliacao" items="${avaliacoes}">
        <tr>
            <td>${avaliacao.titulo}</td>
            <td>${avaliacao.autor.nome}</td>
            <td>${avaliacao.dataAvaliacao}</td>
            <td>${avaliacao.texto}</td>
        </tr>
    </c:forEach>
</table>

<div id="avaliacoesContainer">>
</div>

<button id="optionsButton">Toggle Options</button>
<div id="options-container" style="display: none;">
    <!-- Your options content goes here -->
</div>

<script>
    document.getElementById('optionsButton').addEventListener('click', function() {
        var optionsContainer = document.getElementById('options-container');
        optionsContainer.style.display = (optionsContainer.style.display === 'block') ? 'none' : 'block';
    });
</script>

</body>
</html>
