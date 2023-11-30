<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:url value="/cine?action=ListaHomeBean" var="listarHome"/>
<html>
<head>
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/carrossel.css">
    <link rel="stylesheet" href="css/carrossel-serie.css">
    <title>Cine Sinergy</title>
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {

            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            margin: 0;
            padding: 0;
        }

        .swiper {
            width: 100%;
            height: 400px;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            color: #fff;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>
<header>
    <img id="logo" src="./img/WhatsApp Image 2023-11-22 at 16.13.48.jpeg"/>
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


<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        <c:forEach items="${series}" var="top">
        <div class="swiper-slide">
            <a href="./selecionado.html">
                <img src="${top.urlImg}" alt="imagem-1">
            </a>
        </div>
        </c:forEach>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>


<h1>Séries</h1>
<div class="wrapper">
    <section id="section1">
        <a href="#section3" class="arrow__btn">‹</a>
        <div class="item">
            <img src="https://occ-0-1567-1123.1.nflxso.net/dnm/api/v5/rendition/412e4119fb212e3ca9f1add558e2e7fed42f8fb4/AAAABRvngexxF8H1-OzRWFSj6ddD-aB93tTBP9kMNz3cIVfuIfLEP1E_0saiNAwOtrM6xSOXvoiSCMsihWSkW0dq808-R7_lBnr6WHbjkKBX6I3sD0uCcS8kSPbRjEDdG8CeeVXEAEV6spQ.webp">
        </div>
        <a href="#section3" class="arrow__btn">›</a>
    </section>
</div>

<footer>
    <img style="object-fit: contain;" id="logo" src="./src/imagens/WhatsApp Image 2023-10-28 at 16.29.28.jpeg"/>
    <span>Todos os direitos resevados</span>
</footer>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<script>
    var swiper = new Swiper(".mySwiper", {
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
</script>
</body>
</html>
