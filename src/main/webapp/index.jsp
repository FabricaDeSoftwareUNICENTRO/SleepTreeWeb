<%-- 
    Document   : index2
    Created on : 13/09/2015, 20:49:20
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SleepTree</title>

        <!-- Bootstrap Core CSS -->
        <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="resources/bootstrap/css/modern-business.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="resources/bootstrap/css/font-awesome.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <img src="resources/img/logo.png" border="0" alt="imagem" />
                    <!--<a class="navbar-brand" href="index.html">Sleep Tree</a>-->
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-right" name="login" method="post" action="LoginServlet">
                        <div class="form-group">
                            <input type="text" placeholder="Email" name="email" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="Password" name="senha" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success" name="logar" >Entrar</button>
                        <button type="button" class="btn btn-success" onclick="window.open('cadastrar.jsp', '_parent')" >Cadastro</button>
                    </form>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Header Carousel -->
        <header id="myCarousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="fill" style="background-image:url('resources/img/1.jpg');"></div>
                    <div class="carousel-caption">
                        <!--<h2>Caption 1</h2>-->
                    </div>
                </div>
                <div class="item">
                    <div class="fill" style="background-image:url('resources/img/2.jpg');"></div>
                    <div class="carousel-caption">
                        <!--<h2>Caption 2</h2>-->
                    </div>
                </div>
                <div class="item">
                    <div class="fill" style="background-image:url('resources/img/3.jpg');"></div>
                    <div class="carousel-caption">
                        <!--<h2>Caption 3</h2>-->
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="icon-next"></span>
            </a>
        </header>

        <!-- Page Content -->
        <div class="container">

            <!-- Features Section -->
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Conheça o SleepTree</h2>
                </div>
                <div class="col-md-6">
                    <p><strong>Funcionalidades SleepTree:</strong></p>
                    <ul>
                        <li>Cálculo de unidades de frio nos seguintes modelos:
                            <ul>
                                <li>Carolina do Norte Modificado</li>
                                <li>UTAH Modificado</li>
                                <li>Ponderada</li>
                            </ul>
                        </li>
                        <li>Gerenciamento de Temperaturas</li>
                        <li>Permite criação de várias áreas</li>
                        <li>Exibe relatórios em gráficos e tabelas</li>
                        <li>Permite importação e exportação de tabelas do Excel.</li>
                    </ul>
                    <p>É um software desenvolvido para auxiliar nos cálculos de unidades de frio da sua cultura de árvores frutíferas. Utiliza três modelos de cálculos (UTAH, Carolina do Norte, Ponderada), todos modificados para melhor funcionamento nas regiões brasileiras.</p>
                </div>
                <div class="col-md-6">
                    <img class="img-responsive img-rounded img-thumbnail" src="resources/img/117.jpg" alt="">
                </div>
                <form>
                </form>
            </div>
            <!-- /.row -->

            
        <!-- jQuery -->
        <script src="resources/bootstrap/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="resources/bootstrap/js/bootstrap.js"></script>

        <!-- Script to Activate the Carousel -->
        <script>
                            $('.carousel').carousel({
                                interval: 5000 //changes the speed
                            })
        </script>

    </body>

</html>
