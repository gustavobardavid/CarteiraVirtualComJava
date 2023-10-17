window.addEventListener('load', searchBooks('john green'));

const searchInput = document.querySelector('#searchInput');
const searchButton = document.querySelector('#searchButton');
const resultsDiv = document.querySelector('#results');

searchButton.addEventListener('click', function () {
    searchBooks(searchInput.value);
});
function searchBooks(nome) {
    const bookName = nome;

    const apiUrl = `https://www.googleapis.com/books/v1/volumes?q=${bookName}`;

    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro na solicitação à API');
            }
            return response.json();
        })
        .then(data => {
            displayBooks(data.items);
        })
        .catch(error => {
            console.error('Erro ao obter informações dos livros:', error);
        });
}

function displayBooks(books) {
    resultsDiv.innerHTML = '';

    if (books.length === 0) {
        resultsDiv.innerHTML = '<p>Nenhum livro encontrado.</p>';
        return;
    }

    books.forEach(book => {
        const bookInfo = book.volumeInfo;
        const bookElement = document.createElement('div');
        bookElement.className = 'book';

        const bookTitleElement = document.createElement('h2');
        bookTitleElement.textContent = bookInfo.title;

        const bookAuthorElement = document.createElement('p');
        bookAuthorElement.textContent = `Autor: ${bookInfo.authors ? bookInfo.authors.join(', ') : 'Desconhecido'}`;

        const bookDescriptionElement = document.createElement('p');
        bookDescriptionElement.textContent = bookInfo.description || 'Descrição não disponível';

        const bookCoverElement = document.createElement('img');
        bookCoverElement.src = bookInfo.imageLinks ? bookInfo.imageLinks.thumbnail : 'placeholder.jpg';

        bookElement.appendChild(bookTitleElement);
        bookElement.appendChild(bookAuthorElement);
        bookElement.appendChild(bookDescriptionElement);
        bookElement.appendChild(bookCoverElement);

        resultsDiv.appendChild(bookElement);
    });
}


