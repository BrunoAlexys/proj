<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/form-conteudo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    <title>Cadastro de Conteudo</title>
</head>
<body>
<header>
    <img id="logo" src="WhatsApp Image 2023-10-28 at 16.29.28.jpeg" />
    <nav>
        <ul>

            <h1 class="cadastrarh">Cadastrar</h1>


            </div>
        </ul>
    </nav>

    <button id="optionsButton"><i class="fas fa-user"></i></button>
    <div id="options-container">
        <div class="option" onclick="window.location.href='cine?action=ListarAdmPorIDBean'" onclick="Alterar()">Alterar</div>
        <div class="option" onclick="window.location.href='cine?action=LogoutBean'" onclick="sair()">Sair</div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
        <script src="js/menu.js"></script>
    </div>
</header>

<div class="arrow" onclick="goBack()">
    <i class="fas fa-arrow-left"></i>
</div>

<div class="container">
    <form id="cadastroForm" action="cine?action=CadastroConteudoBean" method="post">
        <label for="tipoConteudo">Tipo do Conteúdo:</label>
        <select name="tipoConteudo" id="tipoConteudo" onchange="exibirCamposEspecificos()">
            <option value="Filmes">Filmes</option>
            <option value="Series">Séries</option>
        </select>

        <label for="titulo">Titulo:</label>
        <input type="text" name="titulo" id="titulo" value="" required="required">

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
        <input type="text" id="urlImg" name="urlImg" required>

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

    function updateFileName() {
        const input = document.getElementById('imagem');
        const fileNameText = document.getElementById('file-name-text');

        if (input.files.length > 0) {
            fileNameText.textContent = input.files[0].name;
        } else {
            fileNameText.textContent = 'Escolha uma imagem';
        }
    }
</script>
</script>
</body>
</html>
