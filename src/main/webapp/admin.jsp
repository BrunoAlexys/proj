<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value="/cine?action=ListarConteudoBean" var="listarConteudos"/>
<c:url value="/cine?action=ListarConteudoPorIDBean" var="mostrarConteudo"/>
<c:url value="/cine?action=ExcluirConteudoBean" var="excluirConteudo"/>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <title>Central do Administrador</title>

</head>
<body>
<header>

    <div id="brand">
        <img id="logo" src="WhatsApp Image 2023-11-22 at 4.13.48 PM.jpeg" alt="Logo">
    </div>

    <h1 class="logoh1">Central de Administrador</h1>

    <button id="optionsButton"><i class="fas fa-user"></i></button>
    <div id="options-container">
        <div class="option" onclick="window.location.href='cine?action=ListarAdmPorIDBean'" onclick="Alterar()">Alterar</div>
        <div class="option" onclick="window.location.href='cine?action=RecuperarSenhaEmailBean'" onclick="Alterar()">Alterar Senha</div>
        <div class="option" onclick="window.location.href='cine?action=LogoutBean'" onclick="sair()">Sair</div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
        <script src="js/menu.js"></script>
    </div>
</header>

<button class="btn-cadastrar" style="margin-top: 10px; margin-left: 15px" onclick="window.location.href='cine?action=FormConteudoBean'">Cadastrar</button>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h1 class="display-5 mb-4">Listagem</h1>
            <table id="dataTable" class="table table-dark table-striped table-hover">
                <thead>
                <tr>
                    <th>Categoria</th>
                    <th>Título</th>
                    <th>Duração</th>
                    <th>Temporadas</th>
                    <th>Diretor</th>
                    <th>Data de lançamento</th>
                    <th>Gênero</th>
                    <th>Ações</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${conteudos}" var="conteudo">
                    <tr>
                        <td>${conteudo.tipoConteudo}</td>
                        <td>${conteudo.titulo}</td>
                        <td>${conteudo.duracao}</td>
                        <td>${conteudo.temporadas}</td>
                        <td>${conteudo.diretor}</td>
                        <td>${conteudo.dataDeLancamento}</td>
                        <td>${conteudo.genero}</td>
                        <td>
                            <button class="edit" onclick="window.location.href='${mostrarConteudo}&id=${conteudo.id}'">
                                Editar
                            </button>
                            <button class="delete"
                                    onclick="window.location.href='${excluirConteudo}&id=${conteudo.id}'">Excluir
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
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
