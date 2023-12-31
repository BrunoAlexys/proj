<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:url value="/cine?action=ListarFilmesBean" var="listarFilmes"/>
<html>
<head>
    <link rel="stylesheet" href="css/filmes.css">
    <title>Filmes</title>
</head>
<body>
<header>
    <h1 style="color: #F5F5F5">Cine Sinnergy</h1>
    <nav>
        <ul>
            <a href="cine?action=ListaHomeBean">
                <li>Home</li>
            </a>

            <a href="cine?action=ListarFilmesBean">
                <li>Filmes</li>
            </a>

            <a href="cine?action=ListarSeriesBean">
                <li>Series</li>
            </a>

            <a href="cine?action=LoginFormBean">
                <li>Login</li>
            </a>
        </ul>
    </nav>
</header>

<div class="main-containe">
    <div class="main-content" id="main-content">
        <c:forEach items="${filmes}" var="filme">
        <a href="cine?action=ListarSelecionadoBean&id=${filme.id}">
            <div class="cards"
                 style="background-image: url('${filme.urlImg}');">
                <div class="character-name-bg">
                    <span class="character-name">${filme.titulo}</span>
                </div>
            </div>
        </a>
        </c:forEach>
    </div>
</div>

<footer>
    <span>Todos os direitos resevados</span>
</footer>

<script src="https://kit.fontawesome.com/b3347ddea2.js" crossorigin="anonymous"></script>
</body>
</html>
