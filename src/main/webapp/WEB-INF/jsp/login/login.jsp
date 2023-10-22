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

  <title>Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

</head>
<style>
	 
@import url('https://fonts.googleapis.com/css2?family=Mulish&display=swap');
header {
  display: flex;
  justify-content: center;  
}
body {
  font-size: 13px;
  font-weight: 400;
  font-family: monospace;
  margin: 0;
  color: #ffffff;
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
<header>

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
</header>
<body class="">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
 
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Login!</h1>
                  </div>
                  	<c:if test="${not empty errors}">
				<div class="alert alert-danger" role="alert">
					<c:forEach var="error" items="${errors}">
						 ${error.message}<br/>
					</c:forEach>
				</div>
			</c:if>
                  <form class="user" method="post" action="<c:url value='home/validausuario'/>">
                  
                    <div class="form-group">
                      <input name="usuario.cpf" type="text" class="form-control form-control-user" placeholder="Cpf">
                    </div>
                    <div class="form-group">
                      <input name="usuario.senha" type="password" class="form-control form-control-user" placeholder="Senha">
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                      Entrar
                    </button>
                    <hr>
                  </form>
                    <a href="<c:url value='cadastrarUsuario'/>">
                      <button class="btn btn-google btn-user btn-block">
                      	Cadastrar
                      </button>
                    </a>
                  <hr>
                  
                </div>
              </div>
            </div>
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

</body>

</html>
