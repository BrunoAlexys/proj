
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

            <a href="cine?action=SerieBean">
                <li>Serie</li>
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
        <a href="cine?action=SelecionadoBean">
            <div class="cards"
                 style="background-image: url('https://image.tmdb.org/t/p/w220_and_h330_face/gmU7P3FzGFsl2wiSDhx9znZCNub.jpg');">
                <div class="character-name-bg">
                    <span class="character-name"> The batman </span>
                </div>
            </div>
        </a>

        <div class="cards"
             style="background-image: url('https://media.fstatic.com/lcM9v4L1Re1uVx91qpzrKgxpSYI=/210x312/smart/filters:format(webp)/media/movies/covers/2023/07/cats_8Ki1W3h.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/3.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/4.jpg');">
            <div class="character-name-bg">
                <span class="character-name"> </span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/5.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/6.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/7.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/8.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/9.jpg');">
            <div class="character-name-bg">
                <span class="character-name"></span>
            </div>
        </div>

        <div class="cards"
             style="background-image: url('https://starwars-visualguide.com/assets/img/characters/10.jpg');">
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
