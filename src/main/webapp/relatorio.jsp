<%-- 
    Document   : relatorio
    Created on : 16/08/2015, 16:50:02
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
                            <li class="active">
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
                            <h1 class="page-header">Relatórios</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-leaf"></i>
                                    Relatório de Área
                                </div>
                                <!--AQUI COLOCA ELEMENTOS PARA A FORM.-->
                                <div class="panel-body">
                                    <form  name="relatorio" method="post" action="#">
                                        <fieldset>
                                            <div class="row">
                                                <!--PRIMEIRA COLUNA-->
                                                <div class="col-lg-3">
                                                    <div class="form-group">
                                                        <select class="form-control" autofocus="">
                                                            <option>Area1</option>
                                                            <option>Area2</option>
                                                            <option>Area3</option>
                                                        </select>
                                                    </div>
                                                    <!--FINAL SEGUNDA LINHA-->
                                                </div>

                                                <!--SEGUNDA COLUNA-->
                                                <div class="col-lg-2">
                                                    <div class="form-group">
                                                        <input class="btn btn-xl btn-success btn-block" type="submit" name="setTemp" value="Consultar" />
                                                    </div>
                                                    <!--FINAL SEGUNDA LINHA-->
                                                </div>

                                            </div>
                                        </fieldset>
                                    </form>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <i class="fa fa-folder-open"></i>
                                                    Temperaturas
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div class="panel-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>Data</th>
                                                                    <th>Mínima</th>
                                                                    <th>Máxima</th>
                                                                    <th>21 h</th>
                                                                    <th>Carolina</th>
                                                                    <th>UTAH</th>
                                                                    <th>Ponderada</th>

                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>10/05/2016</td>
                                                                    <td>5.6 ºC</td>
                                                                    <td>12.2 ºC</td>
                                                                    <td>6.6 ºC</td>
                                                                    <td>12</td>
                                                                    <td>9</td>
                                                                    <td>5</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>11/05/2016</td>
                                                                    <td>7.1 ºC</td>
                                                                    <td>15.1 ºC</td>
                                                                    <td>9.1 ºC</td>
                                                                    <td>8</td>
                                                                    <td>4</td>
                                                                    <td>2</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- /.table-responsive -->
                                                </div>
                                                <!-- /.panel-body -->
                                            </div>
                                            <!-- /.panel -->
                                        </div>

                                        <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Relatório Gráfico
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg height="347" version="1.1" width="441" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><text x="50.5" y="313" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text><path fill="none" stroke="#aaaaaa" d="M63,313H416" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="50.5" y="241" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">200</tspan></text><path fill="none" stroke="#aaaaaa" d="M63,241H416" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="50.5" y="169" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">400</tspan></text><path fill="none" stroke="#aaaaaa" d="M63,169H416" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="50.5" y="97.00000000000003" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4.000000000000028" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">600</tspan></text><path fill="none" stroke="#aaaaaa" d="M63,97.00000000000003H416" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="50.5" y="25" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">800</tspan></text><path fill="none" stroke="#aaaaaa" d="M63,25H416" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="350.7865026326448" y="325.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Setembro</tspan></text><text x="194.23121709194007" y="325.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Maio</tspan></text><path fill="#7cb47c" stroke="none" d="M63,261.9952C72.86512758201701,256.7152,92.59538274605103,245.758,102.46051032806804,240.8752C112.32563791008505,235.9924,132.05589307411907,229.61865014803007,141.92102065613608,222.93280000000001C151.67445068853786,216.32265014803008,171.18131075334142,189.6631364640884,180.9347407857432,187.6912C190.5898769744836,185.7391364640884,209.90014935196436,205.80160714122226,219.55528554070474,207.23680000000002C229.42041312272175,208.70320714122226,249.15066828675577,198.32080000000002,259.0157958687728,199.29760000000002C268.8809234507898,200.2744,288.6111786148238,232.39458492370758,298.4763061968408,215.0512C308.2297362292426,197.9041849237076,327.7365962940462,69.69856923076924,337.49002632644795,61.33600000000001C347.252392162819,52.96576923076924,366.77712383556093,135.84978010471204,376.53948967193196,148.12C386.40461725394897,160.51938010471204,406.134872417983,157.04080000000002,416,160.01440000000002L416,313L63,313Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#4da74d" d="M63,261.9952C72.86512758201701,256.7152,92.59538274605103,245.758,102.46051032806804,240.8752C112.32563791008505,235.9924,132.05589307411907,229.61865014803007,141.92102065613608,222.93280000000001C151.67445068853786,216.32265014803008,171.18131075334142,189.6631364640884,180.9347407857432,187.6912C190.5898769744836,185.7391364640884,209.90014935196436,205.80160714122226,219.55528554070474,207.23680000000002C229.42041312272175,208.70320714122226,249.15066828675577,198.32080000000002,259.0157958687728,199.29760000000002C268.8809234507898,200.2744,288.6111786148238,232.39458492370758,298.4763061968408,215.0512C308.2297362292426,197.9041849237076,327.7365962940462,69.69856923076924,337.49002632644795,61.33600000000001C347.252392162819,52.96576923076924,366.77712383556093,135.84978010471204,376.53948967193196,148.12C386.40461725394897,160.51938010471204,406.134872417983,157.04080000000002,416,160.01440000000002" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="63" cy="261.9952" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="102.46051032806804" cy="240.8752" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="141.92102065613608" cy="222.93280000000001" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="180.9347407857432" cy="187.6912" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="219.55528554070474" cy="207.23680000000002" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="259.0157958687728" cy="199.29760000000002" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="298.4763061968408" cy="215.0512" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="337.49002632644795" cy="61.33600000000001" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="376.53948967193196" cy="148.12" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="416" cy="160.01440000000002" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><path fill="#a7b3bc" stroke="none" d="M63,287.4064C72.86512758201701,281.632,92.59538274605103,269.3668,102.46051032806804,264.3088C112.32563791008505,259.2508,132.05589307411907,249.70845930312004,141.92102065613608,246.94240000000002C151.67445068853786,244.20765930312004,171.18131075334142,244.52840055248623,180.9347407857432,242.30560000000003C190.5898769744836,240.10520055248622,209.90014935196436,232.33484916456854,219.55528554070474,229.2496C229.42041312272175,226.09724916456855,249.15066828675577,217.22440000000003,259.0157958687728,217.35520000000002C268.8809234507898,217.48600000000002,288.6111786148238,243.66407979959007,298.4763061968408,230.296C308.2297362292426,217.07927979959007,327.7365962940462,118.85081098901101,337.49002632644795,111.01600000000002C347.252392162819,103.17401098901101,366.77712383556093,159.35811937172778,376.53948967193196,167.58880000000002C386.40461725394897,175.90611937172775,406.134872417983,174.8032,416,177.208L416,313L63,313Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#7a92a3" d="M63,287.4064C72.86512758201701,281.632,92.59538274605103,269.3668,102.46051032806804,264.3088C112.32563791008505,259.2508,132.05589307411907,249.70845930312004,141.92102065613608,246.94240000000002C151.67445068853786,244.20765930312004,171.18131075334142,244.52840055248623,180.9347407857432,242.30560000000003C190.5898769744836,240.10520055248622,209.90014935196436,232.33484916456854,219.55528554070474,229.2496C229.42041312272175,226.09724916456855,249.15066828675577,217.22440000000003,259.0157958687728,217.35520000000002C268.8809234507898,217.48600000000002,288.6111786148238,243.66407979959007,298.4763061968408,230.296C308.2297362292426,217.07927979959007,327.7365962940462,118.85081098901101,337.49002632644795,111.01600000000002C347.252392162819,103.17401098901101,366.77712383556093,159.35811937172778,376.53948967193196,167.58880000000002C386.40461725394897,175.90611937172775,406.134872417983,174.8032,416,177.208" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="63" cy="287.4064" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="102.46051032806804" cy="264.3088" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="141.92102065613608" cy="246.94240000000002" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="180.9347407857432" cy="242.30560000000003" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="219.55528554070474" cy="229.2496" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="259.0157958687728" cy="217.35520000000002" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="298.4763061968408" cy="230.296" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="337.49002632644795" cy="111.01600000000002" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="376.53948967193196" cy="167.58880000000002" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="416" cy="177.208" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><path fill="#2577b5" stroke="none" d="M63,287.4064C72.86512758201701,287.1376,92.59538274605103,289.0264,102.46051032806804,286.3312C112.32563791008505,283.636,132.05589307411907,267.03835700296065,141.92102065613608,265.8448C151.67445068853786,264.66475700296064,171.18131075334142,279.1259348066298,180.9347407857432,276.8368C190.5898769744836,274.57073480662984,209.90014935196436,249.8830339208057,219.55528554070474,247.62400000000002C229.42041312272175,245.3158339208057,249.15066828675577,256.18,259.0157958687728,258.568C268.8809234507898,260.95599999999996,288.6111786148238,278.07584276930083,298.4763061968408,266.728C308.2297362292426,255.50864276930085,327.7365962940462,175.3363763736264,337.49002632644795,168.2992C347.252392162819,161.25557637362638,366.77712383556093,202.47732356020944,376.53948967193196,210.40480000000002C386.40461725394897,218.41572356020944,406.134872417983,226.6408,416,232.0528L416,313L63,313Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#0b62a4" d="M63,287.4064C72.86512758201701,287.1376,92.59538274605103,289.0264,102.46051032806804,286.3312C112.32563791008505,283.636,132.05589307411907,267.03835700296065,141.92102065613608,265.8448C151.67445068853786,264.66475700296064,171.18131075334142,279.1259348066298,180.9347407857432,276.8368C190.5898769744836,274.57073480662984,209.90014935196436,249.8830339208057,219.55528554070474,247.62400000000002C229.42041312272175,245.3158339208057,249.15066828675577,256.18,259.0157958687728,258.568C268.8809234507898,260.95599999999996,288.6111786148238,278.07584276930083,298.4763061968408,266.728C308.2297362292426,255.50864276930085,327.7365962940462,175.3363763736264,337.49002632644795,168.2992C347.252392162819,161.25557637362638,366.77712383556093,202.47732356020944,376.53948967193196,210.40480000000002C386.40461725394897,218.41572356020944,406.134872417983,226.6408,416,232.0528" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="63" cy="287.4064" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="102.46051032806804" cy="286.3312" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="141.92102065613608" cy="265.8448" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="180.9347407857432" cy="276.8368" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="219.55528554070474" cy="247.62400000000002" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="259.0157958687728" cy="258.568" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="298.4763061968408" cy="266.728" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="337.49002632644795" cy="168.2992" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="376.53948967193196" cy="210.40480000000002" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="416" cy="232.0528" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle></svg><div class="morris-hover morris-default-style" style="left: 44.9605px; top: 182px; display: none;"><div class="morris-hover-row-label">2010 Q2</div><div class="morris-hover-point" style="color: #0b62a4">
  iPhone:
  2,778
</div><div class="morris-hover-point" style="color: #7A92A3">
  iPad:
  2,294
</div><div class="morris-hover-point" style="color: #4da74d">
  iPod Touch:
  2,441
</div></div></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                                        
                                    </div>

                                </div>
                            </div>
                        </div>
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

    </body>

</html>