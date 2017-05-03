<%-- 
    Document   : modificar-area
    Created on : 15/08/2015, 23:49:02
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

    <title>SleepTree - Admin</title>

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

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="admin.jsp">SleepTree Admin v2.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Dados do Usuário</a>
                        </li>
                        <li class="divider"></li>
                        <li style="padding-left: 10px; padding-right: 10px"><form name="logout" method="post" action="LogoutServlet"><button class="btn btn-sm btn-outline btn-success btn-block" type="submit"> <i class="fa fa-sign-out fa-fw"></i>Logout</button></form>
                            </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="label">
                                <jsp:include page = "cookie-user.jsp"/>
                                <!-- /input-group -->
                            </li>
                        <li>
                            <a href="admin.jsp"><i class="fa fa-dashboard fa-fw"></i> Painel</a>
                        </li>
                        <li>
                            <a href="relatorio.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> Relatório</a>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> Tabelas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="importar.jsp">Importar</a>
                                </li>
                                <li>
                                    <a href="exportar.jsp">Exportar</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Área<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="adicionar-area.jsp">Adicionar</a>
                                </li>
                                <li>
                                    <a href="remover-area.jsp">Remover</a>
                                </li>
                                <li class="active">
                                    <a href="modificar-area.jsp">Alterar</a>
                                    <!-- /.nav-third-level -->
                                </li>
                                    <!--<li>
                                        <a href="consultar-area.jsp">Consultar</a>
                                        
                                    </li>-->
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Temperaturas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="active" href="cadastrar-temperatura.jsp">Cadastrar</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Modificar Área</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="resources/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/bootstrap/js/bootstrap.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="resources/bootstrap/js/metisMenu.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="resources/bootstrap/js/sb-admin-2.js"></script>

</body>

</html>