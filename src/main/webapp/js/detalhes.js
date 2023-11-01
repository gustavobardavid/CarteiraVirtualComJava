window.addEventListener('load', getBookDetails);

        function getBookDetails() {
          
            // Obter o nome do livro a partir dos parâmetros da URL
            const urlParams = new URLSearchParams(window.location.search);
            const bookName = urlParams.get('nomeLivro');

            // Criar a URL da API do Google Books com o nome do livro
            const apiUrl = `https://www.googleapis.com/books/v1/volumes?q=${bookName}`;

            // Fazer a requisição à API do Google Books
            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Erro na solicitação à API');
                    }
                    return response.json();
                })
                .then(data => {
                    // Exibir informações do livro na página
                    if (data.totalItems > 0) {
                        const bookInfo = data.items[0].volumeInfo;
                        const bookTitleElement = document.querySelector('#bookTitle');
                        const bookAuthorElement = document.querySelector('#bookAuthor');
                        const bookDescriptionElement = document.querySelector('#bookDescription');
                        const bookCoverElement = document.querySelector('#bookCover');
                        
                        bookTitleElement.textContent = bookInfo.title;
                        bookAuthorElement.textContent = bookInfo.authors[0];
                        bookDescriptionElement.textContent = bookInfo.description;

                        // Exibir a imagem da capa do livro
                        if (bookInfo.imageLinks && bookInfo.imageLinks.thumbnail) {
                            bookCoverElement.src = bookInfo.imageLinks.thumbnail;
                        } else {
                            bookCoverElement.src = 'placeholder.jpg'; // Defina uma imagem padrão para o caso de a capa não estar disponível
                        }
                        
                    } else {
                        console.error('Livro não encontrado');
                    }
                })
                .catch(error => {
                    console.error('Erro ao obter informações do livro:', error);
                    
                });
        }