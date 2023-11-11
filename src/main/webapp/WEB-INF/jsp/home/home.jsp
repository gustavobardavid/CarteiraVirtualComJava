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
    flex-direction: row;
    justify-content: end;
    text-align: center;
    width: 100%;
}
body {
  font-size: 13px;
  font-weight: 400;
  font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
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
    font-family: monospace;
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
#balanceValue.hidden {
  filter: blur(4px); 
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
.user-dropdown {
    display: inline-block;
    position: relative;
}

.user-info {
    display: flex;
    align-items: center;
    cursor: pointer;
}

.user-name {
    margin-right: 10px;
    color:#f18324;
}

.user-dropdown-menu {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background-color: #fff;
    border: 1px solid #ccc;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.user-dropdown:hover .user-dropdown-menu {
    display: block;
}

</style>
<body class="">
<div class="text-right">
<div class="nav-item dropdown user-dropdown text-right">
    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="user-name text-gray-800"><c:out value="${usuario.nome}"></c:out></span>
            <i class="fas fa-user fa-2x user-name"></i>
    </a>
    <!-- Dropdown - User Information -->
    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in user-dropdown-menu" aria-labelledby="userDropdown">
        <a class="dropdown-item" href="<c:url value='perfil'> <c:param name="id" value="${usuario.id}" /></c:url>">
            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
            Visão Geral
        </a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="<c:url value='sair'/>" data-toggle="modal" data-target="#logoutModal">
            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
            Sair
        </a>
    </div>
</div>
</div>
<div class="row mt-0">   
</div>
<div class="alert alert-info mt-4" id="notification">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" id="closeButton">
        <span aria-hidden="true">&times;</span>
    </button>
    <strong>Atenção:</strong> Sua fatura de cartão de crédito vence em 5 dias.
</div>
<div class="container">
 <%-- <div class="col-md-12">
            <div class="card">
                
					<h5 class="text-center mt-2">Seja Bem-vindo, <c:out value="${usuario.nome}" />. Sentimos sua falta!</h5>
                
            </div>
  </div> --%>
    <div class="row">
    <div class="col-md-6">     
   
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="card-title">Saldo</h4>
				<button class="btn btn-link" id="toggleBalance"><i class="fas fa-eye"></i></button>
                </div>
                <p class="card-text">
                    <span id="balanceValue">R$ <c:out value="${usuario.getContaCorrente().getSaldo() + usuario.getContaPoupanca().getSaldo()}" /></span>
                </p>
            </div>
        </div>
    
      <div class="card-body">
        <a href="<c:url value='pix'><c:param name="id" value="${usuario.id}" /></c:url>" class="btn btn-danger mr-2">
            <img style="width: 25px;" src="https://devtools.com.br/img/pix/logo-pix-png-icone-520x520.png" alt="Pix">
        </a>
        <a href="<c:url value='transferencia'> <c:param name="id" value="${usuario.id}" /></c:url>" class="btn btn-success mr-3"><i class="fas fa-exchange-alt"></i>
        </a>
        <a href="<c:url value='depositar'> <c:param name="id" value="${usuario.id}" /></c:url>" class="btn btn-primary mr-3"><i class="fas fa-money-bill-wave"></i></a>
        <a href="<c:url value='bacurin'><c:param name="id" value="${usuario.id}" /></c:url>" class="btn btn-success mr-3"	>
            <i class="fas fa-piggy-bank"></i>
        </a>
     </div>
        </div>
         <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Atividade Recente <a href="<c:url value='extrato'><c:param name="id" value="${usuario.id}" /></c:url>"><i class="fas fa-history fa-sm"></i></a>
                    </h4>
                    <ul class="list-group">
                       <c:if test="${not empty extratos}">
    <c:set var="contador" value="0" scope="page" />
    <c:forEach items="${extratos}" var="extrato" begin="0" end="${extratos.size() - 1}">
        <c:if test="${contador < 3}">
            <li class="list-group-item">
                <c:out value="${extrato.getTipo()} - ${extrato.getValor()}" />
            </li>
            <c:set var="contador" value="${contador + 1}" scope="page" />
        </c:if>
    </c:forEach>
</c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-6">
     <div class="card mt-2">
                <div class="card-body">
                <h4 class="card-title"> Bacurins<i class="fas fa-piggy-bank"></i> </h4>
                <c:set var="contador" value="0" scope="page" />
                 <c:forEach items="${usuario.getBacurins()}" var="bacurin" begin="0" end="${usuario.getBacurins().size() - 1}">
        			<c:if test="${contador < 1}">
                    <p class="card-text"> Para <c:out value="${bacurin.nome}" /> - Minha Meta: R$ <c:out value="${bacurin.meta}" />
                    </p>
                  
            			<c:set var="contador" value="${contador + 1}" scope="page" />
        			</c:if>
    			</c:forEach>
                </div>
            <a href="#" class="btn btn-success">Adicionar</a>
    </div>
        </div>
         <div class="col-md-6">
     <div class="card mt-2">
                <div class="card-body">
                <h4 class="card-title">Cartão de Crédito <i class="fas fa-credit-card"></i></h4>
                    <p class="card-text">R$ 2,500.00</p>
                </div>
            <a href="#" class="btn btn-danger">Pagar</a>
    </div>
        </div>
       
    </div>
    
    <div class="row mt-4">
        <div class="col-md-4  mb-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Conta Corrente</h4>
                    <p class="card-text">Saldo: R$ <c:out value="${usuario.getContaCorrente().getSaldo()}" /></p>
                </div>
            </div>
        </div>
        <div class="col-md-4  mb-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Conta Poupança</h4>
                    <p class="card-text">Saldo: R$  <c:out value="${usuario.getContaPoupanca().getSaldo()}" /></p>
                </div>
            </div>
        </div>
       
    </div>
</div>
<hr>
<section class="bg-light py-5">
    <div class="container">
        <h3 class="text-center mb-4"></h3>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-money-bill-wave fa-3x mb-3"></i>
                        <h4 class="card-title">Opções de Empréstimo</h4>
                        <p class="card-text">Escolha entre uma variedade de opções de empréstimo adaptadas às suas necessidades.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-credit-card fa-3x mb-3"></i>
                        <h4 class="card-title">Peça um novo cartão</h4>
                        <p class="card-text">Tenha a flexibilidade de escolher entre cada um dos benefícios que os cartões Programize têm.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-chart-bar fa-3x mb-3"></i>
                        <h4 class="card-title">Investimentos </h4>
                        <p class="card-text">Invista no Tesouro Selic, CDB's e em bitcoins com apenas um clique.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

 
<footer class="footer text-center mt-3">
    <div class="navbar navbar-expand-lg navbar-light bg-light">
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
    <p class="text-muted">&copy; 2023 Programize Solutions</p>
</div>
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
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            var toggleButton = document.getElementById("toggleBalance");
            var balanceSpan = document.getElementById("balanceValue");

            toggleButton.addEventListener("click", function() {
                // Verificar se o span está visível
                if (balanceSpan.style.display !== "none") {
                    // Ocultar o span
                	 balanceSpan.classList.toggle("hidden");
                } else {
                    // Tornar o span visível
                    balanceSpan.style.display = "inline"; // Ou use "block" dependendo do estilo desejado
                }
            });
        });
    </script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
