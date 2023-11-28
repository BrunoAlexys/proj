function exibirCamposEspecificos() {
    var tipoConteudo = document.getElementById("tipoConteudo").value;

    var duracaoDiv = document.getElementById("duracaoDiv");
    var temporadasDiv = document.getElementById("temporadasDiv");
    var duracaoInput = document.getElementById("duracao");

    if (tipoConteudo === "Filmes") {
        duracaoDiv.style.display = "block";
        temporadasDiv.style.display = "none";
        duracaoInput.required = true; // Adiciona o atributo required quando o campo é mostrado
    } else if (tipoConteudo === "Series") {
        duracaoDiv.style.display = "none";
        temporadasDiv.style.display = "block";
        duracaoInput.required = false; // Remove o atributo required quando o campo é oculto
    }
}

function salvarCadastro() {
    alert("Cadastro foi feito com sucesso");
    // Aqui você pode adicionar a lógica para enviar os dados para o servidor, se necessário.
}

function limparFormulario() {
    document.getElementById('cadastroForm').reset();
    exibirCamposEspecificos(); // Garante que o estado inicial seja consistente
}
function exibirMensagemSucesso() {
    alert('Cadastro realizado com sucesso!');
}