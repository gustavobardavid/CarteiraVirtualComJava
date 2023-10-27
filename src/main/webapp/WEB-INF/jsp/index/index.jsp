 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    
    <title>Programize Wallet </title>
</head>
<style>
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
</div>
    <nav class="sobre">
        <div id="conteiner">
            <ul>
                <li><a href="#">A CARTEIRA VIRTUAL DA PROGRAMIZE</a></li>
            </ul>
    </div>
</nav>
<div class="grid">
    <div class="banner">
        <div class="slide slide1"></div>
        <div class="slide slide2">
        <h1>Livre-se das filas hoje mesmo</h1></div>
        <div class="slide slide3">
        <h1>Guarde onde é mais seguro</h1></div>
    </div>
    <div class="descricao">
    	<h1>Vem ser cliente</h1>
    	<h2>Tenha uma conta corrente completa com abertura 100% digital</h2>
    </div>
</div>

<div class="banner2">
    <div class="slideText slide6">
        <h2>Invista</h2>
        <p>Transforme suas metas em realidade</p>
    </div>
     <div class="slideText slide5">
        <h2>Cuidamos do seu dinheiro</h2>
        <p>Você cuida do seu futuro</p>
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
	<div class="grid">
	<div>
    <a href="<c:url value='login'/>" style="text-decoration:none;">
        <h1>Acesse a sua conta <span class="material-symbols-outlined">
            arrow_outward
            </span></h1>
    </a>
	</div>
	</div>
</body>
<footer>
    <div class="footer">
    <div class="footer-top-wrapper">
        <section>
            <menu>
                <h2>Copyright © 2022 - 2023. Programize</h2>
                <li>
                    <a></a>
                </li>
            </menu>
        </section>
        <section>
            <menu>
                <h2>Check out the <a href="http://">CEO profile</a>. Current version 1.0</h2>
                <li>
                </li>
            </menu>
        </section>
        <section>
            <menu>
                <h2>Software Company</h2>
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