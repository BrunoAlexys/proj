<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Optional, br.com.cine.model.entities.Conteudo" %>
<c:url value="/cine?action=AtualizarConteudoBean" var="atualizar"/>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    <link rel="stylesheet" href="css/form-conteudo.css">
    <title>Alterar Conteudo</title>
</head>
<body>
<header>
    <img id="logo" src="WhatsApp Image 2023-10-28 at 16.29.28.jpeg" />
    <nav>
        <ul>

            <h1 class="editarh">Editar</h1>


            </div>
        </ul>
    </nav>

    <button id="optionsButton"><i class="fas fa-user"></i></button>
    <div id="options-container">
        <div class="option" onclick="Alterar()">Alterar</div>
        <div class="option" onclick="sair()">Sair</div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
        <script src="js/menu.js"></script>
    </div>
</header>


<div class="arrow" onclick="goBack()">
    <i class="fas fa-arrow-left"></i>
</div>


<div class="container">
    <form id="cadastroForm" action="cine?action=AtualizarConteudoBean" method="post">
        <label for="tipoConteudo">Tipo do Conteúdo:</label>
        <select name="tipoConteudo" id="tipoConteudo" onchange="exibirCamposEspecificos()">
            <option value="${cont.get().tipoConteudo}">Filmes</option>
            <option value="${cont.get().tipoConteudo}">Séries</option>
        </select>

        <label for="titulo">Titulo:</label>
        <input type="text" name="titulo" id="titulo" value="${cont.get().titulo}" required="required">

        <label for="descricao">Descrição:</label>
        <input name="descricao" id="descricao" rows="4" value="${cont.get().descricao}" required="required">

        <label for="diretor">Diretor:</label>
        <input type="text" name="diretor" id="diretor" value="${cont.get().diretor}" required="required">

        <label for="genero">Genero:</label>
        <input type="text" name="genero" id="genero" value="${cont.get().genero}" required="required">

        <label for="dataDeLancamento">Data de lançamento:</label>
        <input type="date" name="dataDeLancamento" id="dataDelancamento" value="${cont.get().dataDeLancamento}" required="required">

        <div id="temporadasDiv" style="display: none;">
            <label for="temporadas">Temporadas:</label>
            <input type="number" name="temporadas" value="${cont.get().temporadas}" id="temporadas">
        </div>

        <div id="duracaoDiv">
            <label for="duracaoDiv">Duração:</label>
            <input type="number" value="${cont.get().duracao}" name="duracao">
        </div>

        <label for="urlImg">URL Imagem:</label>
        <input type="text" id="urlImg" value="${cont.get().urlImg}" name="urlImg" required>

        <label for="urlTrailer">URL Trailer:</label>
        <input type="text" name="urlTrailer" id="urlTrailer" value="${cont.get().urlTrailer}" required>
        <input type="hidden" name="id" value="${cont.get().id}">

        <div class="buttons">
            <button type="submit" onclick="salvarFormulario()">Editar</button>
            <button type="button" onclick="limparFormulario()">Limpar</button>
        </div>


    </form>
</div>
<script src="js/form-conteudo.js"></script>
</body>
</html>
