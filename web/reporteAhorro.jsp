<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : reporteAhorro
    Created on : 18/05/2018, 03:10:33 PM
    Author     : Ramiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html, 
              width=device-width, initial-scale=1, shrink-to-fit=no" 
              charset=UTF-8">
        <meta name="viewport">
        <link href="css/dashboard.css" rel="stylesheet">

        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <title>Generar reportes de ahorro</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="jspf/nav.jspf" %>


        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <span></span>
                                    Reportes de ahorro
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">
                            Generar reportes de ahorro
                        </h1>
                    </div>
                    <div class="btn-toolbar mb-2 mb-md-0 ">
                        <div class="btn-group mr-2 nav nav-tabs mx-auto ">
                            <button class="btn btn-sm btn-outline-dark active" data-toggle="tab" href="#individual">Reporte individual</button>
                            <button class="btn btn-sm btn-outline-dark" data-toggle="tab" href="#general">Reporte general</button>
                        </div>
                    </div>
                    <br>
                    <div class="tab-content">
                        <div id = "alert_placeholder"></div>
                        <div id="individual" class="tab-pane fade show active">
                            <form action="generaReporteIndividual" method="post" name="generaReporteIndividual">
                                <div class="card border border-primary">
                                    <div class="card-body">
                                        <h5 class="card-title">Generar reporte individual</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Elija una persona</h6>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Persona:</span>
                                            </div>
                                            <select class="form-control" required aria-label="Quincena a pagar">
                                                <option value="P0001">Nombre persona</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-outline-primary btn-block">Generar reporte</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="general" class="tab-pane fade">
                            <form action="generaReporteGeneral" method="post" name="generaReporteGeneral">
                                <div class="card border border-primary">
                                    <div class="card-body">
                                        <h5 class="card-title">Generar reporte general</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Haga click en generar reporte</h6>
                                        <br>
                                        <button type="submit" class="btn btn-outline-primary btn-block">Generar reporte</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </main>

            </div>
            <br>
        </div>

        <script>

            bootstrap_alert = function () {}
            bootstrap_alert.warning = function (message) {
                $('#alert_placeholder').html('<div role="alert" class="alert alert-warning alert-dismissable fade show"><span>' + message + '</span><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></div>')
            }

        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
