
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/conteudo.css">
    <title>Cadastro de Conteudo</title>
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
    <form id="cadastroForm" action="cine?action=CadastroConteudoBean" method="post">
        <label for="tipoConteudo">Tipo do Conteúdo:</label>
        <select name="tipoConteudo" id="tipoConteudo" onchange="exibirCamposEspecificos()">
            <option value="Filmes">Filmes</option>
            <option value="Series">Séries</option>
        </select>

        <label for="titulo">Titulo:</label>
        <input type="text" name="titulo" id="titulo" required="required">

        <label for="descricao">Descrição:</label>
        <textarea name="descricao" id="descricao" rows="4" required="required"></textarea>

        <label for="diretor">Diretor:</label>
        <input type="text" name="diretor" id="diretor" required="required">

        <label for="genero">Genero:</label>
        <input type="text" name="genero" id="genero" required="required">

        <label for="dataDeLancamento">Data de lançamento:</label>
        <input type="date" name="dataDeLancamento" id="dataDelancamento" required="required">

        <div id="temporadasDiv" style="display: none;">
            <label for="temporadas">Temporadas:</label>
            <input type="number" name="temporadas" id="temporadas">
        </div>

        <div id="duracaoDiv">
            <label for="duracaoDiv">Duração:</label>
            <input type="number" name="duracao">
        </div>

        <label for="urlImg">URL Imagem:</label>
        <input type="text" name="urlImg" id="urlImg" required>

        <label for="urlTrailer">URL Trailer:</label>
        <input type="text" name="urlTrailer" id="urlTrailer" required>

        <div class="buttons">
            <button type="submit" onclick="salvarFormulario()">Cadastrar</button>
            <button type="button" onclick="limparFormulario()">Limpar</button>
        </div>
    </form>
</div>
<script src="js/conteudo.js"></script>
<script src="script.js"></script>

<script>
    function salvarCadastro() {
        alert("Cadastro foi feito com sucesso");
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
