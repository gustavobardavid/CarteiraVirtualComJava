<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <title>Programize Wallet </title>
</head>
<style>
	* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

main {
  margin: 10px 0;
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

.grid , .gridOptions{
	display:grid;
	gap:10px;
	grid-template-columns:repeat(2,1fr);
}
.descricao {
	background: url(img/vemsercliente.jpg);
	background-size: cover; 
    background-position: center;
    top: 20px;
  	width: 700px;
  	height: 500px;
  	overflow: hidden;
  	position: relative;
  	margin: 50px auto;
  	border-radius: 10px;
}
h1 {
  font-family: monospace;
  width: 50%;
  margin: 10px 200px;
  text-align: center;
  border-top: 5px solid #ffffff;
  background: linear-gradient(to left, #f18324, #f18324);
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  padding: 20px;
  color: #0d2226;
}

h2 {
  text-align: center;
  color: #d2d0e6;
  margin: 25px 25px;
  opacity: 0.7;
  font-size: 20px;
  font-weight: 600;
}

h3 {
  color: #f18324;
  text-align: end;
  margin: 10px 25px;
  font-size: 20px;
  font-weight: 900;
}


footer {
  color: white;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  width: 100%;
  margin-bottom: 0px;
  margin-top: 0px;
}

.footer-top-wrapper {
  font-size: 10px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  gap: 48px;
  margin: 0 auto;
  padding: 16px;
  min-height: 160px;
}
section {
	color:black;
}
.footer-top-wrapper > section {
  width: 100%;
}

footer h2 {
  text-align: center;
  color: #d2d0e6;
  margin-top: 0px;
  margin-bottom: 0px;
  opacity: 0.7;
  font-size: 10px;
  font-weight: 600;
}

menu {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

menu li {
  margin-bottom: 0px;
}

nav {
  font-family: monospace;
  font: bold;
  font-size: larger;
  display: flex;
  justify-content: center;
  padding: 0px;
  background-color: #ffffff;
  box-sizing: border-box;
}

nav ul {
  list-style-type: none;
  margin-left: 10px;
  padding: 1px;
}

nav li {
  display: inline-block;
  margin-right: 15px;
}

nav li a {
  color: #000000;
  text-decoration: none;
}

nav li span {
  font-size: small;
}

nav li a:hover {
  text-decoration: none;
  color: #f18324;
}

.banner {
  top: 20px;
  width: 700px;
  height: 500px;
  overflow: hidden;
  position: relative;
  margin: 50px auto;
  border-radius: 10px;
}

.slide {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  position: absolute;
  opacity: 0;
  transition: opacity 1s;
}

.slide1 {
  background-image: url(img/poupe.jpg);
  animation-delay: 0s;
  opacity: 1;
}

.slide2 {
  background-image: url(https://img.freepik.com/vetores-gratis/os-gerentes-financeiros-que-trabalham-com-clientes-isolaram-a-ilustracao-vetorial-plana-desenhos-animados-pessoas-sentadas-no-escritorio-do-banco-para-troca-de-dinheiro_74855-8370.jpg?w=1380&t=st=1698276137~exp=1698276737~hmac=65ae2c0b1f85fa587f04fc66f28b956d8073794a8f2df89dd923b573d8826184);
  animation-delay: 5s;
}

.slide3 {
  background-image: url(img/pig.jpg);
  animation-delay: 5s;
}


@keyframes slideAnimation {
  0%, 100% {
      opacity: 0;
  }
  10%, 90% {
      opacity: 1;
  }
}

/* Estilos para o banner do carrossel */
.banner2 {
  top: 20px;
  width: 100%; /* Preencher a largura da janela */
  height: 400px; /* Ajuste a altura conforme necessário */
  overflow: hidden;
  position: relative;
  margin: 50px auto;
  border-radius: 10px;
  background-color: #333; /* Cor de fundo */
  color: #fff; /* Cor do texto */
}

/* Estilos para as descrições dentro do carrossel */
.slideText {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  position: absolute;
  opacity: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px; /* Tamanho da fonte */
  font-weight: bold;
  text-align: center;
  transition: opacity 1s;
}

.slide6 {
  animation-delay: 0s;
  opacity: 1;
  background-color: #007BFF; /* Cor de fundo específica para este slide */
  color: #fff; /* Cor do texto específica para este slide */
}

.slide4 {
  animation-delay: 5s;
  background-color: #E74C3C; /* Cor de fundo específica para este slide */
  color: #fff; /* Cor do texto específica para este slide */
}
.slide5 {
  animation-delay: 5s;
  background-color: #020400; /* Cor de fundo específica para este slide */
  color: #fff; /* Cor do texto específica para este slide */
}

@keyframes slideAnimation {
  0%, 100% {
      opacity: 0;
  }
  10%, 90% {
      opacity: 1;
  }
}
.header {
    display: flex;
    padding:10px;
    background-color:#fff;
    justify-content: center;
    text-align: center;
    width: 100%;
}
h1 {
	font-family: sans-serif;
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
    max-width: 160px; 
    width: 100%; 
    font-family:monospace;
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
    color:#fff;
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
@media screen and (max-width: 768px) {
	#footer {
		display: flex
		flex-direction: collumn;
	}
	#footer .data {
		display: none;
	}
    body {
      font-size: 10px; /* Reduzir o tamanho da fonte para dispositivos móveis */
    }
  
    main {
      margin: 5px 0; /* Reduzir a margem superior e inferior */
    }
  
    .grid {
      grid-template-columns: repeat(1,1fr); /* Alterar para uma coluna única em dispositivos móveis */
    }
    
    .gridOptions {
    	grid-template-columns: repeat(2,1fr);
    }
  	.gridOptions h1 {
    	width:100%;
    }
    .descricao,
    .banner,
    .banner2 {
      width: 100%; /* Preencher a largura da tela */
      height: 40vh; /* Ajustar a altura automaticamente */
    }
    .slideText {
        width: 100%;
        font-size: 15px;
    }
    h1 {
      font-size: 20px; /* Reduzir o tamanho da fonte do título */
      margin: 10px 0; /* Ajustar a margem */
    }
  
    h2 {
      font-size: 16px; /* Reduzir o tamanho da fonte dos subtítulos */
      margin: 15px 0;
    }
  
    /* Adicionar mais estilos específicos para dispositivos móveis, se necessário */
  }
</style>

<body>
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
    <nav class="sobre">
        <div id="conteiner">
            <ul>
                <li class=""><a href="#">A CARTEIRA VIRTUAL DA PROGRAMIZE</a></li>
            </ul>
    </div>
</nav>
<div class="grid">
    <div class="banner">
        <div class="slide slide1"><h3 class="">Tenha uma conta corrente completa com abertura 100% digital</h3></div>
        <div class="slide slide2">
        <h1 class="">Livre-se das filas hoje mesmo</h1>
        </div>
        <div class="slide slide3">
        <h1>Guarde onde é mais seguro</h1></div>
    </div>
   
    <div class="descricao">
    <a href="<c:url value='cadastrarUsuario'/>" style="text-decoration:none;">
    	<h1>Vem ser cliente</h1>
    	</a>
    </div>
</div>
 <div class="gridOptions">
	<div>
    <a href="<c:url value='login'/>" style="text-decoration:none;">
        <h1>Acesse a sua conta <span class="material-symbols-outlined">
            arrow_outward
            </span></h1>
    </a>
	</div>
	<div>
    <a href="<c:url value='login'/>" style="text-decoration:none;">
        <h1>Temos ofertas de crédito para você<span class="material-symbols-outlined">
            arrow_outward
            </span></h1>
    </a>
	</div>	
	</div>
<div class="banner2">
    <div class="slideText slide6">
        <h2>Invista</h2>
        <p class="">Transforme suas metas em realidade</p>
    </div>
     <div class="slideText slide5">
        <h2>Cuidamos do seu dinheiro</h2>
        <p class="typewriter">Você cuida do seu futuro</p>
    </div>
    <div class="slideText slide4">
        <h2>Elevando suas finanças a novos patamares.</h2>
        <p>Sempre ao seu lado.</p>
    </div>
    <div class="slideText slide5">
        <h2>Planeje seu futuro</h2>
        <p>Um passo de cada vez</p>
    </div>
</div>
	<!-- Adicionando uma seção de recursos com ícones do FreePik -->
    <section class="bg-light py-5">
        <div class="container">
            <h3 class="text-center mb-4">Recursos Exclusivos</h3>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <i class="fas fa-wallet fa-3x mb-3"></i>
                            <h4 class="card-title">Gestão Financeira</h4>
                            <p class="card-text">Controle suas despesas e receitas de forma eficiente.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <i class="fas fa-chart-pie fa-3x mb-3"></i>
                            <h4 class="card-title">Análise de Dados</h4>
                            <p class="card-text">Visualize gráficos e relatórios para melhor entender suas finanças.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <i class="fas fa-lock fa-3x mb-3"></i>
                            <h4 class="card-title">Segurança</h4>
                            <p class="card-text">Proteja suas informações financeiras com a mais alta segurança.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <hr>
<!-- Adicionando uma seção de Empréstimos com ícones do FreePik -->
<section class="bg-light py-5">
    <div class="container">
        <h3 class="text-center mb-4">Empréstimos Personalizados</h3>
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
                        <h4 class="card-title">Pagamento Flexível</h4>
                        <p class="card-text">Tenha a flexibilidade de escolher os termos de pagamento que se adequam ao seu orçamento.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-percent fa-3x mb-3"></i>
                        <h4 class="card-title">Taxas Competitivas</h4>
                        <p class="card-text">Oferecemos taxas de juros competitivas para garantir que você tenha as melhores condições.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
	
</body>
<footer id="footer" class="footer text-center mt-3">
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
    PROGRAMIZE
</a>            
</span>
    <div class="data">
    <h3 style="font-size:13px;">Central de Relacionamento Programize</h3>
    <p class="text-muted">4002 8922</p>
    </div>
    <div class="data">
    <h3 style="font-size:13px;">Deficientes auditivos e de fala</h3>
    <p class="text-muted">0800 897 0900</p>
    </div>
    <div class="data">
    <h3 style="font-size:13px;">SAC</h3>
    <p class="text-muted">0800 545 6768</p>
    </div>
    <div class="data">
    <h3 style="font-size:13px;">Whatsapp</h3>
    <p class="text-muted">11 9034 0900</p>
    </div>
    <!-- <p class="text-muted">&copy; 2023 Programize Solutions</p> -->
</div>
</footer>
<footer>
    <div class="footer">
    <div class="footer-top-wrapper">
        <section>
            <menu>
                <h2>Copyright © 2022 - 2023. Programize Solutions</h2>
                <li>
                    <a></a>
                </li>
            </menu>
        </section>
        <section>
            <menu>
                <h2>Check out the <a href="#">Source code</a>. Current version 1.0</h2>
                <li>
                </li>
            </menu>
        </section>
        <section>
            <menu>
                <h2>Software Skill</h2>
                <li>
                    <a></a>
                </li>
            </menu>
        </section>
    </section>
    
    </div>
</div>
</footer>
<script src="js/carousel.js"></script>
</html>