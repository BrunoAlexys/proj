<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Avaliacoes" %>
<c:url value="/cine?action=ListarAvaliacaoBean" var="listarAvaliacao"/>
<html>
<head>
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/selecionado.css">
    <link rel="stylesheet" href="css/resposta.css">
    <link rel="stylesheet" href="css/comentarios.css">
    <title>Title</title>
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

    <script src="script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</header>

<div id="banner" style="background-image: url('${conteudo.get().urlImg}');"></div>
<div class="titulo"><H1>${conteudo.get().titulo}</H1>
</div>

<div id="trailer-conteiner">
    <div class="content">
        <video controls class="Trailer">
            <source src="${conteudo.get().urlTrailer}" type="video/mp4">
            Seu navegador não tem suporte para videos
        </video>
        <div id="sinopse">
            <p class="description">
                <strong>Data de Lançamento:</strong> ${conteudo.get().dataDeLancamento}
                <br>
                <strong>Diretor:</strong> ${conteudo.get().diretor}
                <br>
                <strong>Descrição:</strong> ${conteudo.get().descricao}
            </p>
        </div>
    </div>
</div>
<div class="container">
    <div class="card-wrapper">
        <c:forEach items="${listConteudo}" var="avaliacao">
            <div class="card">
                <div class="head">
                    <div class="profile">
                        <p style="color: #F5F5F5">${avaliacao.usuario.nome}</p>
                    </div>
                </div>
                <p class="review">
                    <br>
                    <strong>Autor: ${avaliacao.titulo}</strong>
                    <br>
                    <strong>${avaliacao.avaliacao}</strong>
                </p>
            </div>
        </c:forEach>
    </div>
    <div class="indicator"></div>
</div>
<footer>
    <span>Todos os direitos resevados</span>
</footer>
<script>
    const allStar = document.querySelectorAll('.rating .star')
    const ratingValue = document.querySelector('.rating input')

    allStar.forEach((item, idx) => {
        item.addEventListener('click', function () {
            let click = 0
            ratingValue.value = idx + 1

            allStar.forEach(i => {
                i.classList.replace('bxs-star', 'bx-star')
                i.classList.remove('active')
            })
            for (let i = 0; i < allStar.length; i++) {
                if (i <= idx) {
                    allStar[i].classList.replace('bx-star', 'bxs-star')
                    allStar[i].classList.add('active')
                } else {
                    allStar[i].style.setProperty('--i', click)
                    click++
                }
            }
        })
    })
</script>
<script src="js/selecionado.js"></script>
</body>
</html>
