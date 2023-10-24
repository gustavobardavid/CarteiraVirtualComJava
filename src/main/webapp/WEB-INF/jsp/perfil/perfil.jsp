 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	
    <!-- Custom styles for this template-->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>
<style>
	 
@import url('https://fonts.googleapis.com/css2?family=Mulish&display=swap');
.header {
    display: flex;
    justify-content: center;
    text-align: center;
    width: 100%;
}
body {
  font-size: 13px;
  font-weight: 400;
  font-family: monospace;
  margin: 0;
  background: linear-gradient(to right, #010e1f, #010e1f);
  background-size: cover;
  background-size: cover;
}
.button {
    color: #f18324;
    cursor: pointer;
    font-size: 1rem;
    line-height: 2.5rem;
    max-width: 160px; 
    width: 100%; 
    letter-spacing: 0.3rem;
    font-weight: 600;
    position: relative;
    text-decoration: none;
    text-transform: uppercase;
    display: flex;
    justify-content: center;
    transition: all 1s ease-in;
    padding: 2px;
}

.button:hover {
    color: #FF9950;
    text-decoration: none;
}

.button svg {
    height: 40px;
    left: 0;
    top: 0; 
    position: absolute;
    width: 100%; 
}

.button rect {      
    fill: none;
    stroke: #f18324;
    stroke-width: 2;
    stroke-dasharray: 450, 0;
    transition: all 0.5s linear;
}

.button:hover rect {
    stroke-width: 5;
    stroke-dasharray: 20, 300;
    stroke-dashoffset: 48;
    stroke: #FF9950;
    transition: all 2s cubic-bezier(0.22, 1, 0.25, 1);
}
</style>
<body class="">
<div class="header navbar navbar-expand-lg navbar-light bg-light">
<span class="btn">
    <a
    href="#"
    class='button'
    >
    <svg>
        <rect
        x="0" y="0" 
        fill="none"
        width="100%"
        height="100%"
        />
    </svg>
    PROGRAMIZE Wallet
</a>            
</span>
</div>
<hr>
<div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title"><c:out value="${usuario.nome}"></c:out></h5>
                        <ul class="list-group list-group-flush text-center">
                            <li class="list-group-item">
                                <strong>Agência:</strong> <c:out value="${usuario.getContaCorrente().agencia}"></c:out>
                            </li>
                            <li class="list-group-item">
                                <strong>Número da Conta:</strong> <c:out value="${usuario.getContaCorrente().numConta}"></c:out>
                            </li>
                            <li class="list-group-item">
                                <strong>Instituição:</strong> 500 Programize Serviços S.A
                            </li>
                        </ul>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">Conta</h5>
                        <ul class="list-group list-group-flush text-center">
                            <li class="list-group-item">
                                <strong>Data de Abertura:</strong><c:out value="${usuario.getContaCorrente().getCreatedFormated()}"></c:out>
                            </li>
                           <li class="list-group-item">
                                <strong>Nome:</strong> <c:out value="${usuario.nome}"></c:out>
                            </li><li class="list-group-item">
                                <strong>CPF:</strong> <c:out value="${usuario.cpf}"></c:out>
                            </li>
                            <li class="list-group-item">
                                <strong>Email:</strong> <c:out value="${usuario.email}"></c:out>
                            </li>
                            <li class="list-group-item">
                                <strong>Telefone:</strong><c:out value="${usuario.telefone}"></c:out>
                            </li>
                            <li class="list-group-item">
                                <strong>Cidade:</strong><c:out value="${usuario.cidade}"></c:out>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">Sensível</h5>
                        <ul class="list-group list-group-flush text-center">
                            <li class="list-group-item">
                                <strong><a href="<c:url value='alterarSenha'><c:param name="id" value="${usuario.id}" /></c:url>">Alterar Senha</a></strong>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


<footer class="footer text-center mt-3">
    <p class="text-muted">&copy; 2023 Programize Solutions</p>
    <p class="text-muted">Contato: <a href="mailto:contato@programize.com">contato@programize.com</a></p>
    <p class="text-muted">
        <a href="/termos" class="text-primary">Termos de Uso</a> |
        <a href="/privacidade" class="text-primary">Política de Privacidade</a>
    </p>
</footer>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    
    <script src="js/carousel.js"></script>
    <script>
    document.getElementById("closeButton").addEventListener("click", function () {
        document.getElementById("notification").style.display = "none";
    });
</script>
</body>
</html>
