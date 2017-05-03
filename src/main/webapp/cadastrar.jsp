<%-- 
    Document   : cadastrar
    Created on : 16/08/2015, 01:07:34
    Author     : testando
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

        <title>Cadastro - SleepTree</title>

        <!-- Bootstrap Core CSS -->
        <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="resources/bootstrap/css/metisMenu.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="resources/bootstrap/css/sb-admin-2.css" rel="stylesheet">

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

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="index.jsp">
                        <img src="resources/img/logo.png"  border="0" alt="imagem" />
                    </a>


                </div>
                <div id="navbar" class="navbar-collapse collapse">
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
                </div><!--/.navbar-collapse -->
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Cadastro</h3>
                        </div>
                        <div class="panel-body">
                            <form  name="usuario" method="post" onsubmit="return valida_form(this)" action="ControllerUsuario">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Nome" name="nome" id="nome" type="text" value=""  autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Profissão" id="profissao" name="profissao" type="text" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="E-mail" name="email" id="email" type="email" >
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Senha" id="txtSenha" name="senha" type="password" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Repita sua senha" id="repetir_senha" name="repetesenha" type="password" value="" oninput="validaSenha(this)">
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <input class="btn btn-lg btn-success btn-block" type="submit" name="set" value="Cadastrar" />

                                    <!--<a class="btn btn-lg btn-success btn-block">Cadastrar</a>-->
                                    <!--<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>-->
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="../bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>

    </body>

</html>
<script>
                            function validaSenha(input) {
                                if (input.value !== document.getElementById('txtSenha').value) {

                                    input.setCustomValidity('Repita a senha corretamente');
                                } else {
                                    input.setCustomValidity('');
                                }
                            }
</script>
<!--<script>
    
    function validaCampo(input){
        if(input.value !== "tt"){
            input.setCustomValidity('Insira seu nome.');
        }
        else{
            input.setCustomValidity('');
        }
        
    }
</script>-->
<script>
    function valida_form() {
        if (document.getElementById('nome').value == "") {
            alert('Por favor, preencha o campo nome.');
            document.getElementById('nome').focus();
            return false
        }
        if (document.getElementById('profissao').value == "") {
            alert('Por favor, preencha o campo profissao.');
            document.getElementById('profissao').focus();
            return false
        }
        if (document.getElementById('email').value == "") {
            alert('Por favor, preencha o campo email.');
            document.getElementById('email').focus();
            return false
        }
        if (document.getElementById('txtSenha').value == "") {
            alert('Por favor, preencha o campo senha.');
            document.getElementById('txtSenha').focus();
            return false
        }
        if (document.getElementById('repetir_senha').value == "") {
            alert('Por favor, preencha o campo repetir senha.');
            document.getElementById('repetir_senha').focus();
            return false
        }
    }
</script>
