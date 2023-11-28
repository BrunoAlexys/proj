
function mudarTipoConteudo() {
    const tipoConteudo = document.getElementById('tipoConteudo').value;
    const temporadaContainer = document.getElementById('temporadaContainer');
    const duracaoContainer = document.getElementById('duracaoContainer');

    if (tipoConteudo === 'filme') {
        temporadaContainer.style.display = 'none';
        duracaoContainer.style.display = 'block';
    } else {
        temporadaContainer.style.display = 'block';
        duracaoContainer.style.display = 'none';
    }
}
function salvarCadastro() {
    alert("Cadastro foi feito com sucesso");
    // Aqui você pode adicionar a lógica para enviar os dados para o servidor, se necessário.
}

function limparFormulario() {
    document.getElementById('cadastroForm').reset();
    mudarTipoConteudo(); // Garante que o estado inicial seja consistente
}
function exibirMensagemSucesso() {
    alert('Cadastro realizado com sucesso!');
}
