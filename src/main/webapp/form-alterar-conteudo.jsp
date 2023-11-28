<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Optional, br.com.cine.model.entities.Conteudo" %>
<c:url value="/cine?action=AtualizarConteudoBean" var="atualizar"/>
<html>
<head>
    <link rel="stylesheet" href="css/conteudo.css">
    <title>Alterar Conteudo</title>
</head>
<body>
<header>
    <img id="logo" src="WhatsApp Image 2023-10-28 at 16.29.28.jpeg" />
    <nav>
        <ul>
            <a href="">
                <li></li>
            </a>

            <a href="">
                <li></li>
            </a>

            <a href="">
                <li></li>
            </a>

            <a href="./login.html">
                <li>Login</li>
            </a>
        </ul>
    </nav>
</header>
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
        <input type="text" name="urlImg" id="urlImg" value="${cont.get().urlImg}" required>

        <label for="urlTrailer">URL Trailer:</label>
        <input type="text" name="urlTrailer" id="urlTrailer" value="${cont.get().urlTrailer}" required>
        <input type="hidden" name="id" value="${cont.get().id}">

        <div class="buttons">
            <button type="submit" onclick="salvarFormulario()">Alterar</button>
            <button type="button" onclick="limparFormulario()">Limpar</button>
        </div>
    </form>
</div>
<script src="js/conteudo.js"></script>
<script src="script.js"></script>

<script>
    function salvarCadastro() {
        alert("Alterado com sucesso!");
    }

    function limparFormulario() {
        document.getElementById('cadastroForm').reset();
        exibirCamposEspecificos();
    }

    function salvarFormulario() {
        salvarCadastro();
    }
</script>
</body>
</html>
