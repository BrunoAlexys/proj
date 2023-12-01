
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/form-alterar-usuario.css">
    <title>Title</title>
</head>
<body>
<div class="arrow" onclick="goBack()">
    <a href="cine?action=ListarConteudoBean"><i class="fas fa-arrow-left"></i></a>
</div>
<div class="container" id="container">

    <div class="form-container sign-up-container">
        <form action="cine?action=AlterarAdmBean" method="post">
            <h1>Alterar usuário</h1>

            <span>aqui você pode alterar suas informações</span>
            <input type="text" name="firstname" value="${usuario.get().nome}" placeholder="Name"/>
            <input type="text" name="lastname" value="${usuario.get().sobrenome}" placeholder="surname"/>
            <input type="date" value="${usuario.get().dataDeNascimento}" name="date" placeholder="date"/>
            <select id="sexo" name="genero">
                <option disabled>Selecione uma opção</option>
                <option value="Masculino" ${usuario.get().genero == 'Masculino' ? 'selected' : ''}>Masculino</option>
                <option value="Feminino" ${usuario.get().genero == 'Feminino' ? 'selected' : ''}>Feminino</option>
                <option value="Outros" ${usuario.get().genero == 'Outros' ? 'selected' : ''}>Outros</option>
            </select>
            <a href="cine?action=ListarConteudoBean">Cancelar</a>
            <button type="submit">Alterar</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">

            <div class="overlay-panel overlay-right">
                <h1>Alterar usuário</h1>
                <p>
                    Bem-vindo à página de alteração! Aqui, você pode personalizar seu perfil de acordo com suas
                    preferências. Adicione uma breve descrição ou ajuste suas configurações de privacidade. Este é o seu
                    espaço digital, torne-o único!</p>

            </div>
        </div>
    </div>
</div>

<script src="script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
