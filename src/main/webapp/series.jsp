
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value="/cine?action=ListarSeriesBean" var="listarSeries"/>
<html>
<head>
    <link rel="stylesheet" href="css/series.css">
    <title>Series</title>
    <style>
        .main-containe {
            display: flex;
            flex-wrap: wrap; /* Permite que os itens se movam para a próxima linha */
            justify-content: space-around; /* Distribui o espaço ao redor dos itens */
        }
    </style>
</head>
<body>
<header>
    <img id="logo" src="./src/imagens/transparent-movie-5.png"/>
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
        <c:forEach items="${series}" var="serie">
        <a style="cursor: pointer" href="cine?action=SelecionadoBean&id=${serie.id}">
            <div class="cards"
                 style="background-image: url('${serie.urlImg}')">
                <div class="character-name-bg">
                    <span class="character-name">${serie.titulo}</span>
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
