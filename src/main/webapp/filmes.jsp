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
    <img id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <nav>
        <ul>
            <a href="cine?action=HomeBean">
                <li>Home</li>
            </a>

            <a href="cine?action=FilmesBean">
                <li>Filmes</li>
            </a>

            <a href="cine?action=SeriesBean">
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
        <c:forEach var="filme" items="${filmes}">
        <a href="./selecionado.html">
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
    <img style="object-fit: contain;" id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <span>Todos os direitos resevados</span>
</footer>

<script src="https://kit.fontawesome.com/b3347ddea2.js" crossorigin="anonymous"></script>
</body>
</html>
