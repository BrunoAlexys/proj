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


<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        <c:forEach items="${top10}" var="top">
        <div class="swiper-slide">
            <a href="cine?action=ListarSelecionadoBean&id=${top.id}">
                <img src="${top.urlImg}" alt="imagem-1">
            </a>
        </div>
        </c:forEach>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>


<h1>Series</h1>
<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        <c:forEach items="${series}" var="serie">
            <div class="swiper-slide">
                <a href="cine?action=ListarSelecionadoBean&id=${serie.id}">
                    <img src="${serie.urlImg}" alt="imagem-1">
                </a>
            </div>
        </c:forEach>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>

<h1>Filmes</h1>
<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        <c:forEach items="${filmes}" var="filme">
            <div class="swiper-slide">
                <a href="cine?action=ListarSelecionadoBean&id=${filme.id}">
                    <img src="${filme.urlImg}" alt="imagem-1">
                </a>
            </div>
        </c:forEach>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>

<footer>
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
