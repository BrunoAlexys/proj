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
<%
    // Recuperar o ID da série da URL
    String serieId = request.getParameter("id");
    // Convertendo o ID para Long (se necessário)
    Long id = (serieId != null && !serieId.isEmpty()) ? Long.parseLong(serieId) : null;
%>
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

            <button id="optionsButton"><i class="fas fa-user"></i></button>
            <div id="options-container">
                <div class="option" onclick="Alterar()">Alterar</div>
                <div class="option" onclick="sair()">Sair</div>
            </div>
        </ul>
    </nav>

    <script src="script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</header>

<div id="banner"></div>
<div class="titulo"><H1>The BATMAN</H1>
    <h3>2022 · 2h 56m</h3>
</div>

<div id="trailer-conteiner">
    <div class="content">
        <video controls class="Trailer">
            <source src="https://www.youtube.com/watch?v=rsQEor4y2hg" type="video/mp4">
            Seu navegador não tem suporte para videos
        </video>
        <div id="sinopse">
            <p class="description">
                <br> Data de lançamento: 3 de março de 2022 (Brasil)
                <br> Diretor: Matt Reeves
                <br> Bilheteria: 771 milhões USD
                <br> Roteiro: Matt Reeves, Peter Craig
                <br> Em Portugal: The Batman
            </p>

        </div>
    </div>
</div>


<div class="wrapper">
    <h3>Avaliações</h3>
    <form action="cine?action=AvaliacaoBean" method="post">
        <div class="rating">
            <input type="number" name="rating" hidden>
            <i class='bx bx-star star' style="--i: 0;"></i>
            <i class='bx bx-star star' style="--i: 1;"></i>
            <i class='bx bx-star star' style="--i: 2;"></i>
            <i class='bx bx-star star' style="--i: 3;"></i>
            <i class='bx bx-star star' style="--i: 4;"></i>
        </div>
        <input class="input" type="text" placeholder="Titulo da avaliação" name="titulo">
        <textarea name="opinion" cols="30" rows="5" placeholder="Sua opinião..."></textarea>
        <input type="hidden" name="serieId" value="<%= id %>">
        <div class="btn-group">
            <button type="submit" class="btn submit">Enviar</button>
            <button class="btn cancel">Cancel</button>
        </div>
    </form>
</div>
<div class="container">
    <div class="card-wrapper">
        <c:forEach items="${avaliacoes}" var="avaliacao">
            <div class="card">
                <div class="head">

                    <div class="profile">
                        <p>${avaliacao.usuario.nome}</p>
                    </div>
                </div>
                <p class="review">
                        ${avaliacao.avaliacao}
                </p>
                <div class="ratings">
                    <c:forEach begin="1" end="5" var="i">
                        <c:choose>
                            <c:when test="${i <= avaliacao.avaliacao}">
                                <i class='bx bxs-star'></i>
                            </c:when>
                            <c:otherwise>
                                <i class='bx bx-star'></i>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="indicator"></div>
</div>
<footer>
    <img style="object-fit: contain;" id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <span>Todos os direitos resevados</span>

    <nav class="footer-navgation">
        <ul class="footer-list">
            <a href="./index.html">
                <li>Home</li>
            </a>

            <a href="./Contato.html">
                <li>Con tato</li>
            </a>

            <a href="./Fotos.html">
                <li>Foto</li>
            </a>

            <a href="./Comentario.html">
                <li>Comentário</li>
            </a>
        </ul>
    </nav>
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
