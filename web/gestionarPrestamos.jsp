<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : gestionarPrestamos
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

        <title>Administrar préstamos</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="jspf/nav.jspf" %>


        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item ">
                                <a class="nav-link active" href="#">
                                    <span></span>
                                    Administrar Préstamos
                                </a>
                            </li>
                        </ul>


                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Administrar préstamos</h1>


                    </div>
                    <h4 class="h4 text-center">Nombre Persona</h4>
                    <h4 class="h4 text-center"><a href="obtenerPersonaPrestamo.jsp" class="btn btn-outline-secondary btn-sm">Cambiar Persona</a></h4>

                    <br>

                    <div>
                        <div id = "alert_placeholder"></div>

                        <div id="ahorro" >
                            <div class="row" >
                                <div class="col-sm-6">
                                    <form action="registraAhorro" method="post" name="registraAhorro">

                                        <div class="card border border-primary">
                                            <div class="card-body">
                                                <h5 class="card-title">Agregar préstamos</h5>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Clave de prestamo:</span>
                                                    </div>
                                                    <input type="text" id="clavePrestamo" value="P00002" disabled class="form-control"  aria-label="Código">

                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Fecha</span>
                                                    </div>
                                                    <input type="date" id="fecha" required class="form-control"  aria-label="Fecha de pago">

                                                </div>



                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Importe de ahorro: $</span>
                                                    </div>
                                                    <input type="number" class="form-control" min="01"  required aria-label="Cantidad a pagar">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">.00</span>
                                                    </div>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Tasa de interés:</span>
                                                    </div>
                                                    <input type="text" id="clavePrestamo" value="0.0%"disabled class="form-control"  aria-label="Código">

                                                </div>
                                                <button type="submit" class="btn btn-outline-primary btn-block">Agregar prestamo</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-sm-6">
                                    <div class="card border-info">
                                        <div class="card-body ">
                                            <h5>Préstamos actuales</h5>
                                            <div class="table-responsive">
                                                <table id="tabla" class="table table-striped table-sm">
                                                    <thead>
                                                        <tr>
                                                            <th>Clave</th>
                                                            <th>Fecha</th>
                                                            <th>Importe</th>
                                                            <th>Restante</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>P00001</td>
                                                            <td>29-05-2018</td>
                                                            <td>100.00</td>
                                                            <td>50.00</td>
                                                        </tr>

                                                        <c:forEach items="${listaPrestamos.lista}" var="prestamo">
                                                            <tr>
                                                                <td>${prestamo.ClavePrestamo}</td>
                                                                <td>${prestamo.Fecha}</td>
                                                                <td>${prestamo.Importe}</td>
                                                                <td>${prestamo.Restante}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <br>

                                        </div>
                                    </div>
                                    <br>


                                </div>
                            </div>
                            <br>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script>
            var hoy = new Date();
            document.getElementById("fecha").value = parseDate(hoy.toLocaleDateString());
            hoy.setDate(hoy.getDate() - 2);
            var fechaInicio = hoy.toLocaleDateString();
            fechaInicio = parseDate(fechaInicio);
            document.getElementById("fecha").min = fechaInicio;
            hoy = new Date();
            var today = parseDate(hoy.toLocaleDateString());
            document.getElementById("fecha").max = today;
            bootstrap_alert = function () {}
            bootstrap_alert.warning = function (message) {
                $('#alert_placeholder').html('<div role="alert" class="alert alert-warning alert-dismissable fade show"><span>' + message + '</span><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></div>')
            }

            function parseDate(input) {
                var parts = input.split(/\//);
                // new Date(year, month [, date [, hours[, minutes[, seconds[, ms]]]]])
                var string = parts[2] + "-" + parts[1] + "-" + parts[0];

                if (parts[1] < 10) {
                    if (parts[0] < 10) {
                        string = parts[2] + "-0" + parts[1] + "-0" + parts[0];

                    } else {
                        string = parts[2] + "-0" + parts[1] + "-" + parts[0];

                    }
                }
                return string;// months are 0-based
            }




        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
