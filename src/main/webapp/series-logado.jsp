<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value="/cine?action=ListarSeriesBean" var="listarSeries"/>
<html>
<head>
    <link rel="stylesheet" href="css/filmes-series.css">
    <title>Title</title>
</head>
<body>
<header>
    <img id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <nav>
        <ul>
            <a href="cine?action=HomeLogadoBean">
                <li>Home</li>
            </a>

            <a href="cine?action=FilmesLogadoBean">
                <li>Filmes</li>
            </a>

            <a href="cine?action=SeriesLogadoBean">
                <li>Series</li>
            </a>

            <button id="optionsButton"><i class="fas fa-user"></i></button>
            <div id="options-container">
                <div class="option" onclick="Alterar()">Alterar</div>
                <div class="option" onclick="window.location.href='cine?action=LogoutBean'" onclick="sair()">Sair</div>

                <script src="js/home-logado.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
            </div>
        </ul>
    </nav>
</header>
<c:forEach items="${series}" var="serie">
<div class="main-containe">
    <div class="main-content" id="main-content">
        <a href="./selecionado.html"> <div class="cards" style="background-image: url('${serie.urlImg}');">
            <div class="character-name-bg">
                <span class="character-name">${serie.titulo}</span>
            </div>
        </div></a>
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
