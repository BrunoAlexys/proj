
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<div class="main-containe">
    <div class="main-content" id="main-content">
        <a href="./selecionado.html"> <div class="cards" style="background-image: url('https://image.tmdb.org/t/p/w220_and_h330_face/gmU7P3FzGFsl2wiSDhx9znZCNub.jpg');">
            <div class="character-name-bg">
                <span class="character-name"> The batman </span>
            </div>
        </div></a>

        <div class="cards" style="background-image: url('https://media.fstatic.com/lcM9v4L1Re1uVx91qpzrKgxpSYI=/210x312/smart/filters:format(webp)/media/movies/covers/2023/07/cats_8Ki1W3h.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/3.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/4.jpg');">
            <div class="character-name-bg">
                <span class="character-name"> </span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/5.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/6.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/7.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/8.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/9.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards" style="background-image: url('https://starwars-visualguide.com/assets/img/characters/10.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

    </div>

</div>

<footer>
    <img style="object-fit: contain;" id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <span>Todos os direitos resevados</span>
</footer>


<script src="https://kit.fontawesome.com/b3347ddea2.js" crossorigin="anonymous"></script>


</body>
</html>
