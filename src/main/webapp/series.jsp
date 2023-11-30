
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value="/cine?action=ListarSeriesBean" var="listarSeries"/>
<html>
<head>
    <link rel="stylesheet" href="css/series.css">
    <title>Series</title>
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

            <a href="cine?action=ListarSeriesBean">
                <li>Series</li>
            </a>

            <a href="cine?action=LoginFormBean">
                <li>Login</li>
            </a>
        </ul>
    </nav>
</header>
<c:forEach items="${series}" var="serie">
    <c:out value="${serie}" />
<div class="main-containe">
    <div class="main-content" id="main-content">
        <a style="cursor: pointer" href="cine?action=SelecionadoBean&id=${serie.id}">
            <div class="cards"
                 style="background-image: url('${serie.urlImg}')">
                <div class="character-name-bg">
                    <span class="character-name">${serie.titulo}</span>
                </div>
            </div>
        </a>
    </div>
</div>
</c:forEach>
<footer>
    <img style="object-fit: contain;" id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <span>Todos os direitos resevados</span>
</footer>

<script src="https://kit.fontawesome.com/b3347ddea2.js" crossorigin="anonymous"></script>
</body>
</html>
