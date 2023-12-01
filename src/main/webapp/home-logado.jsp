
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List, br.com.cine.model.entities.Conteudo" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:url value="/cine?action=ListaHomeBean" var="listarHome"/>
<html>
<head>
  <link rel="stylesheet" href="css/home-logado.css">
  <link rel="stylesheet" href="css/carrossel.css">
  <link rel="stylesheet" href="css/carrossel-serie.css">
    <title>Title</title>
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
      <a href="cine?action=ListaHomeLogadoBean">
        <li>Home</li>
      </a>

      <a href="cine?action=ListarFilmesLogadoBean">
        <li>Filmes</li>
      </a>

      <a href="cine?action=ListarSeriesLogadoBean">
        <li>Series</li>
      </a>

      <button id="optionsButton"><i class="fas fa-user"></i></button>
      <div id="options-container">
        <div class="option" onclick="window.location.href='cine?action=ListarUsuarioPorIDBean'" onclick="Alterar()">Alterar</div>
        <div class="option" onclick="window.location.href='cine?action=RecuperarSenhaEmailBean'" onclick="Alterar()">Alterar Senha</div>
        <div class="option" onclick="window.location.href='cine?action=LogoutBean'" onclick="sair()">Sair</div>

        <script src="js/home-logado.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
      </div>
    </ul>
  </nav>
</header>


<div class="swiper mySwiper">
  <div class="swiper-wrapper">
    <c:forEach items="${top10Logado}" var="top">
      <div class="swiper-slide">
        <a href="cine?action=ListarSelecionadoLogadoBean&id=${top.id}">
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
    <c:forEach items="${seriesLogado}" var="serie">
      <div class="swiper-slide">
        <a href="cine?action=ListarSelecionadoLogadoBean&id=${serie.id}">
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
    <c:forEach items="${filmesLogado}" var="filme">
      <div class="swiper-slide">
        <a href="cine?action=ListarSelecionadoLogadoBean&id=${filme.id}">
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
</body>
</html>
