<%-- 
    Document   : cadastrar-temperatura
    Created on : 16/08/2015, 16:52:21
    Author     : joao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.sprhib.model.Area"%>
<%@page import="java.util.List"%>
<%@page import="com.sprhib.dao.AreaDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! private String userName = "";%>
<%!AreaDAOImpl areaDAO = new AreaDAOImpl(); %>
<%--<%!ArrayList<Area> areasCombo = new ArrayList<>(); %>--%>
<!DOCTYPE html>
<html lang="en">
    <!--ARRUMAR ESTE CODIGO PARA ALGUM SERVLET OU JSP!-->
    <% // String userName = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    userName = cookie.getValue();
                }
            }
        }
        if (userName.equals("")) {
            response.sendRedirect("index.jsp");
        }
    %>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SleepTree - Admin</title>

        <!-- Bootstrap Core CSS -->
        <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Datepicker -->
        <link href="resources/bootstrap/css/datepicker.css" rel="stylesheet">

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
<!--                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Pesquisar...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                 /input-group 
                            </li>-->
                            <li class="label">
                                <jsp:include page = "cookie-user.jsp"/>
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
                                    <li>
                                        <a href="alterar-area.jsp">Alterar</a>
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
                                    <li class="active">
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
                            <h1 class="page-header">Cadastrar Temperatura</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-8">
                            <!--hsahusahauhsuhauhsauhsuahsuah-->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-bar-chart-o fa-fw"></i> Cadastro de temperaturas
                                </div>
                                <div class="panel-body">
                                    <form name="temperatura" method="post"   action="#"><fieldset>
                                            <div class="form-group col-lg-6">
                                                <label>Área: </label>
                                                <select class="form-control" autofocus="" name="area">
                                                    <%
//                                                        List<Area> areas = areaDAO.getAreas();
//                                                        List<Area> areasCombo = areaDAO.getAreasCombo();
//                                                        
//                                                        for (Area area : areas) {
//                                                            if (area.getUsuario().getNome().equals(userName)) {
//                                                                areasCombo.add(area);
//                                                            }
//                                                        }
//                                                        for(Area area : areasCombo){
//                                                            out.println("<option>"+area.getNomeArea()+"</option>");
//                                                        }
                                                    %>

                                                    <option>Area1</option>
                                                    <option>Area2</option>
                                                    <option>Area3</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <!--Input ao qual foi designado a função para exibir o calendário, que vai ser selecionado com jquery na função abaixo.--> 
                                                <label>Data: </label>
                                                <input type="text" id="exemplo" class="form-control" name="data">
                                            </div>
                                            <label class="col-lg-12">Temperaturas: </label>
                                            <div class="form-group col-lg-3">
                                                <input class="form-control" placeholder="21h Ant."  name="hora21ant" id="hora21ant" type="text" value="" >
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <input class="form-control"  placeholder="Temp. Mín." name="minima" id="minima" type="text" value="" >
                                            </div>
                                            <div class="form-group col-lg-3" >
                                                <input class="form-control"  placeholder="Temp. Máx." name="maxima" id="maxima" type="text" value="" >
                                            </div>
                                            <div class="form-group col-lg-3"  >
                                                <input class="form-control"  placeholder="21h" name="hora21" id="hora21" type="text" value="" oninput="validaCampo(this)">
                                            </div>
                                            <div class="form-group col-lg-12">
                                                <input class="btn btn-xl btn-success btn-block" type="submit" onclick="return validar()" name="setTemp" value="Cadastrar" />
                                            </div>
                                        </fieldset></form>


                                </div></div>
                            <!--SJAHSUAHSUAHUSHAHSAUHSAUHUSA-->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-lightbulb-o"></i>
                                    Ajuda
                                </div>
                                <!-- .panel-heading -->
                                <div class="panel-body">
                                    <div class="panel-body">
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Campos</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <ul>
                                                            <li>Área: Área desejada para inserir as temperaturas.</li>
                                                            <li>Data: Data em que as temperaturas vão ser inseridas.</li>
                                                            <li>21h Ant: Caso o dia anterior ao dia escolhido não possuir dados, é necessário o preenchimento. </li>
                                                            <li>Mínima: Temperatura das 6h(mínima do dia)</li>
                                                            <li>Máxima: Temperatura das 15h(máxima do dia)</li>
                                                            <li>21h: Temperatura das 21h</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Temperatura</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        Inserindo as temperaturas o SleepTree ira automaticamente: Interpolar todas as temperaturas do dia, e calcular as unidades de frio de acordo com as temperaturas.
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /#page-wrapper -->
                                        </div>
                                    </div>
                                    <!-- /.container-fluid -->
                                </div>
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

                    <!-- Datepicker -->
                    <script src="resources/bootstrap/js/bootstrap-datepicker.js"></script>
                    <script src="resources/bootstrap/js/bootstrap-datepicker.pt-BR.js"></script>

                    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->

                    <!-- Script pro datepicker -->

                    </body>
                    <!-- Script pro datepicker -->
                    <script>
                                                    $(document).ready(function () {
                                                        $('#exemplo').datepicker({
                                                            format: "dd/mm/yyyy",
                                                            language: "pt-BR",
                                                            autoclose: true,
                                                            todayHighlight: true
                                                        });
                                                    });
                    </script>
                    <script language="javascript" type="text/javascript">
                        function validar() {
                            var hora21ant = temperatura.hora21ant.value;
                            var minima = temperatura.minima.value;
                            var maxima = temperatura.maxima.value;
                            var hora21 = temperatura.hora21.value;

                            if (hora21ant == "") {
                                alert('Preencha o campo temperatura 21h anterior.');
                                form1.nome.focus();
                                return false;
                            }
                        }

                    </script>

                    </html>

                    <!--                    <script>
                                            function valida_form() {
                                                if (document.getElementById('hora21ant').value == "") {
                                                    alert('Por favor, preencha o campo 21 horas anterior.');
                                                    document.getElementById('hora21ant').focus();
                                                    return false
                                                }
                                                if (document.getElementById('minima').value == "") {
                                                    alert('Por favor, preencha o campo temperatura mínima.');
                                                    document.getElementById('minima').focus();
                                                    return false
                                                }
                                                if (document.getElementById('maxima').value == "") {
                                                    alert('Por favor, preencha o campo temperatura máxima.');
                                                    document.getElementById('maxima').focus();
                                                    return false
                                                }
                                                if (document.getElementById('hora21').value == "") {
                                                    alert('Por favor, preencha o campo senha.');
                                                    document.getElementById('hora21').focus();
                                                    return false
                                                }
                                            }
                                        </script>-->

                    <!--                    <script>
                                            function validaCampo(input) {
                    
                                                if (document.getElementById('hora21').value < -20 || document.getElementById('hora21').value > 60) {
                                                    document.getElementById('hora21').setCustomValidity('Insira um valor entre -20 Cº a 60 ºC');
                                                }
                                                else if (document.getElementById('minima').value < -20 || document.getElementById('minnima').value > 60) {
                                                    document.getElementById('minima').setCustomValidity('Insira um valor entre -20 Cº a 60 ºC');
                                                }
                                                else if (document.getElementById('maxima').value < -20 || document.getElementById('maxima').value > 60) {
                                                    document.getElementById('maxima').setCustomValidity('Insira um valor entre -20 Cº a 60 ºC');
                                                }
                                                else if (document.getElementById('hora21ant').value < -20 || document.getElementById('hora21ant').value > 60) {
                                                    document.getElementById('hora21ant').setCustomValidity('Insira um valor entre -20 Cº a 60 ºC');
                                                }
                                                else {
                                                    input.setCustomValidity('');
                                                }
                                            }
                                        </script>-->

