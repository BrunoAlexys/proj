<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:url value="/cine?action=ListarConteudoBean" var="listarConteudos"/>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <title>Central do Administrador</title>
    <style>
        .buttons button {
            margin-right: 15px;
        }
    </style>
</head>
<body>

<%--body<%--%>
<%--    List<Conteudo> conteudos = (List<Conteudo>) request.getAttribute("conteudos");--%>
<%--    System.out.println(conteudos);--%>
<%--%>--%>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h1 class="display-5 mb-4">Listagem</h1>
            <table id="dataTable" class="table table-dark table-striped table-hover">
                <thead>
                <tr>
                    <th>Categoria</th>
                    <th>Título</th>
                    <th>Descrição</th>
                    <th>Duração</th>
                    <th>Diretor</th>
                    <th>Data de lançamento</th>
                    <th>Gênero</th>
                    <th>URL da imagem</th>
                    <th>URL do trailer</th>
                    <th>Ações</th>
                </tr>
                </thead>
                <c:forEach items="${conteudos}" var="conteudo">
                <tbody>
                    <tr>
                        <td>${conteudo.tipoConteudo}</td>
                        <td>${conteudo.titulo}</td>
                        <td>${conteudo.descricao}</td>
                        <td>${conteudo.duracao}</td>
                        <td>${conteudo.diretor}</td>
                        <td>${conteudo.urlImg}</td>
                        <td>${conteudo.urlTrailer}</td>
                        <td>
                            <button class="edit">Editar</button>
                            <button class="delete">Excluir</button>
                        </td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTable').DataTable({
            "theme": "dark",
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.11.3/i18n/pt_br.json"
            }
        });
    });
</script>
</body>
</html>
