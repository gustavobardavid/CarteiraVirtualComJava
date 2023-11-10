 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
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
@keyframes fadeInOut {
    0% {
        opacity: 0;
        height: 0;
    }
    100% {
        opacity: 1;
        height: auto;
    }
}

#criarNovo {
    display: none;
    opacity: 0;
    height: 0;
    overflow: hidden;
}

#criarNovo.exibir {
    animation: fadeInOut 0.5s ease-in-out; /* Aplica a animação fadeInOut com duração de 0.5 segundos e efeito ease-in-out */
    display: inline;
    opacity: 1;
    height: auto;
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
<div class="container">
 <div class="col-md-12">
            
        </div>
     <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-body">
                    <h4 class="card-title">Meus Bacurins <i class="fas fa-piggy-bank"></i></h4>
                     <c:if test="${not empty bacurins}">
    					<c:forEach items="${bacurins}" var="bacurin" begin="0" end="${bacurins.size() - 1}">
        					<ul>
        					<li class="btn btn-primary mt-3">
            					<c:out value="${bacurin.getNome()}" />
        					</li>
        					<li class="btn btn-primary mt-3">
            				    <c:out value="${bacurin.getMeta()}"/>
        					</li>
            				<li class="btn btn-primary mt-3"> 
            					<c:out value="${bacurin.getCreatedFormated()}"></c:out>
            				</li>
        					</ul>
        					
    					</c:forEach>
					   </c:if> 
                </div>
                
            </div>
            <button class="btn btn-primary mt-3" id="toggleBalance">Criar</button>
            
            <div id="criarNovo" >
            <div class="card mt-5">
                <div class="card-body">
                    <h4 class="card-title">Planeje seu novo Bacurin</h4>
                    <form action="<c:url value='bacurin/salvarBacurin'/>" method="post">
    					<div class="form-group">
       					 	<label for="nomeBacurin">Qual será o nome do seu Bacurin?</label>
        					<input type="text" class="form-control" id="valorDeposito" name="bacurin.nome">
    					</div>
    					<div class="form-group">
       					 	<label for="valorBacurin">Qual valor você quer juntar?</label>
        					<input type="text" class="form-control" id="valorDeposito" name="bacurin.meta">
    					</div>
    					<div class="form-group">
       					 	<label for="valorBacurin">Qual valor você quer guardar inicialmente?</label>
        					<input type="text" class="form-control" id="valorDeposito" name="valorDeposito">
    					</div>
    					<div class="form-group">
        					<label for="conta">Deseja debitar o valor de qual conta?</label>
        					<select class="custom-select" id="conta" name="variacaoConta">
            					<option value="26">Conta Corrente</option>
            					<option value="51">Conta Poupança</option>
        					</select>
    					</div>
    					<input type="hidden" name="id" value="<c:out value="${id}" />">
    					<button type="submit" class="btn btn-primary">Criar Bacurin</button>
					</form>
                </div>                
            </div>
            </div>
        </div>
 
</div>
</div>


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
    var balanceSpan = document.getElementById("criarNovo");

    toggleButton.addEventListener("click", function() {
        // Adiciona ou remove a classe 'exibir' para controlar a transição suave
        if (balanceSpan.classList.contains("exibir")) {
            // Se a classe 'exibir' estiver presente, remova-a para esconder suavemente
            balanceSpan.classList.remove("exibir");
        } else {
            // Se a classe 'exibir' não estiver presente, adicione-a para exibir suavemente
            balanceSpan.classList.add("exibir");
        }
    });
});
    </script>
</body>
</html>
