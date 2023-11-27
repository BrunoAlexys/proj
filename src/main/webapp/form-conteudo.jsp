
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Conteudo</title>
</head>
<body>
<form action="cine?action=CadastroConteudoBean" method="post">
    <label for="tipoConteudo">Tipo do Conteúdo:</label>
    <select name="tipoConteudo" id="tipoConteudo" onchange="exibirCamposEspecificos()">
        <option value="Filmes">Filmes</option>
        <option value="Series">Séries</option>
    </select>

    <br>
    <label for="titulo">Titulo:</label>
    <input type="text" name="titulo" id="titulo" required="required">

    <br>
    <label for="descricao">Descrição:</label>
    <textarea name="descricao" id="descricao" required="required"></textarea>

    <br>
    <label for="diretor">Diretor:</label>
    <input type="text" name="diretor" id="diretor">

    <br>
    <label for="genero">Genero:</label>
    <input type="text" name="genero" id="genero" required="required">

    <br>
    <label for="dataDeLancamento">Data de lançamento:</label>
    <input type="date" name="dataDeLancamento" id="dataDelancamento" required="required">

    <br>
    <div id="temporadasDiv" style="display: none;">
        <label for="temporadas">Temporadas:</label>
        <input type="number" name="temporadas" id="temporadas">
    </div>

    <br>
    <div id="duracaoDiv">
        <label for="duracaoDiv">Duração:</label>
        <input type="number" name="duracao">
    </div>

    <br/>
    <label for="urlImg">URL Imagem:</label>
    <input type="text" name="urlImg" id="urlImg" required>

    <br/>
    <label for="urlTrailer">URL Trailer:</label>
    <input type="text" name="urlTrailer" id="urlTrailer" required>

    <br/><br/>
    <input type="submit">
</form>
<script src="js/conteudo.js"></script>
</body>
</html>
