
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
    <link href="css/style.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>

<body class="">
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
</div>
<div class="alert alert-info mt-4" id="notification">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" id="closeButton">
        <span aria-hidden="true">&times;</span>
    </button>
    <strong>Atenção:</strong> Sua fatura de cartão de crédito vence em 5 dias.
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-body">
                    <h4 class="card-title">Saldo em Conta</h4>
                    <p class="card-text">R$ 5,000.00</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-body">
                    <h4 class="card-title">Extrato Recente</h4>
                    <ul class="list-group">
                        <li class="list-group-item">Transação 1 - R$ 100.00</li>
                        <li class="list-group-item">Transação 2 - R$ 50.00</li>
                        <li class="list-group-item">Transação 3 - R$ 200.00</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Conta Corrente</h4>
                    <p class="card-text">Saldo: R$ 5,000.00</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Conta Poupança</h4>
                    <p class="card-text">Saldo: R$ 10,000.00</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Investimentos</h4>
                    <p class="card-text">Saldo: R$ 20,000.00</p>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="#" class="btn btn-success mr-3">Transferência</a>
        <a href="#" class="btn btn-primary mr-3">Extrato</a>
        <a href="#" class="btn btn-danger">Pagamento</a>
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
