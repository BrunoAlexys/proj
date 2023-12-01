document.addEventListener('DOMContentLoaded', function () {
    // Adiciona um ouvinte de evento ao botão de adicionar filme
    document.getElementById('addMovieBtn').addEventListener('click', addMovie);
});

// Função para adicionar um novo filme
function addMovie() {
    // Obtém a referência à tabela e à sua tbody
    var table = document.getElementById('table').getElementsByTagName('tbody')[0];

    // Cria uma nova linha na tabela
    var newRow = table.insertRow(table.rows.length);

    // Adiciona células à nova linha
    for (var i = 0; i < 8; i++) {
        var cell = newRow.insertCell(i);
        // Aqui você pode adicionar inputs ou placeholders para os novos filmes
        cell.innerHTML = 'Novo Dado';
    }

    // Adiciona célula de ações com botões de editar e excluir
    var actionsCell = newRow.insertCell(8);
    actionsCell.innerHTML = '<button class="edit" onclick="editMovie(' + (table.rows.length - 1) + ')">Editar</button>' +
        '<button class="delete" onclick="deleteMovie(' + (table.rows.length - 1) + ')">Excluir</button>';
}
