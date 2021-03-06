<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : registrarPago
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

        <title>Registrar Pago</title>

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
                                    Registrar Pago 
                                </a>
                            </li>



                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Registrar Pago</h1>

                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group mr-2 nav nav-tabs">
                                <button class="btn btn-sm btn-outline-dark active" data-toggle="tab" href="#ahorro">Ahorro</button>
                                <button class="btn btn-sm btn-outline-dark" data-toggle="tab" href="#prestamo">Préstamo</button>

                            </div>
                        </div>
                    </div>
                    <h4 class="h4 text-center">Nombre Persona</h4>
                    <h4 class="h4 text-center"><a href="obtenerPersonaPago.jsp" class="btn btn-outline-secondary btn-sm">Cambiar Persona</a></h4>

                    <br>

                    <div class="tab-content">
                        <div id = "alert_placeholder"></div>

                        <div id="ahorro" class="tab-pane fade show active">
                            <form action="registraPagoAhorro" method="post" name="registraPagoAhorro">

                                <div class="row" >

                                    <div class="col-sm-6">
                                        <div class="card border border-primary">
                                            <div class="card-body">
                                                <h5 class="card-title">Generar pago de ahorro</h5>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Código de Pago</span>
                                                    </div>
                                                    <input type="text" disabled class="form-control"  aria-label="Código">

                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Fecha</span>
                                                    </div>
                                                    <input type="date" id="fechaAhorro" required class="form-control"  aria-label="Fecha de pago">

                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Ahorro: </span>
                                                    </div>
                                                    <select class="form-control" required aria-label="Ahorro a pagar">
                                                        <option value="A00001">Nombre Persona: A00001</option>
                                                    </select>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Importe: $</span>
                                                    </div>
                                                    <input type="number" class="form-control" min="100" max="500" required aria-label="Cantidad a pagar">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">.00</span>
                                                    </div>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Quincena</span>
                                                    </div>
                                                    <select class="form-control" required aria-label="Quincena a pagar">
                                                        <option value="1">1</option>
                                                    </select>
                                                </div>

                                                <button type="submit" class="btn btn-outline-primary btn-block">Generar pago</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="card border border-info">
                                            <div class="card-body">
                                                <h5 class="card-title">Estado Actual</h5>
                                                <p class="card-text">Ahorrado Actual:</p>
                                                <p class="card-text">$0.00</p>
                                                <p class="card-text">Monto Obligado:</p>
                                                <p class="card-text">$0.00</p>
                                                <p class="card-text">Multa:</p>
                                                <p class="card-text">$0.00</p>
                                                <p class="card-text">Ahorros Retrasados</p>
                                                <p class="card-text">0</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <br>
                                <div class="card border-info">
                                    <div class="card-body ">
                                        <h5>Pagos previos</h5>
                                        <div class="table-responsive">
                                            <table id="tabla" class="table table-striped table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>Clave</th>
                                                        <th>Fecha</th>
                                                        <th>Ahorro</th>
                                                        <th>Importe</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>PA0001</td>
                                                        <td>2018-05-23</td>
                                                        <td>Nombre Persona</td>
                                                        <td>100.00</td>
                                                    </tr>

                                                    <c:forEach items="${listaAhorros.lista}" var="pagos">
                                                        <tr>
                                                            <td>${pagos.ClavePago}</td>
                                                            <td>${pagos.Fecha}</td>
                                                            <td>${pagos.PersonaAhorro}</td>
                                                            <td>${pagos.Cantidad}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div id="prestamo" class="tab-pane fade">
                            <%--
                            <form action="registraPagoPrestamo" method="post" name="registraPagoPrestamo">
                            --%>                                
                            <div class="row" >
                                <div class="col-sm-6">
                                    <div class="card border-primary">
                                        <div class="card-body">
                                            <h5 class="card-title">Generar pago de préstamo</h5>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Código de Pago</span>
                                                </div>
                                                <input type="text" disabled class="form-control"  aria-label="Código">

                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Fecha</span>
                                                </div>
                                                <input type="date" id="fechaPrestamo" required class="form-control"  aria-label="Fecha de pago">

                                            </div>

                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Préstamo: </span>
                                                </div>
                                                <select class="form-control" required aria-label="Prestamo a pagar">
                                                    <option value="P00001">Préstamo P00001</option>
                                                </select>
                                            </div>

                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Importe: $</span>
                                                </div>
                                                <input type="number" min="1" required class="form-control" aria-label="Cantidad a pagar">
                                                <div class="input-group-append">
                                                    <span class="input-group-text">.00</span>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-outline-primary btn-block">Generar pago</button>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-sm-6">
                                    <div class="card border-info">
                                        <div class="card-body">
                                            <h5 class="card-title">Estado Actual</h5>
                                            <p class="card-text">Capital:</p>
                                            <p class="card-text">$0.00</p>
                                            <p class="card-text">Intereses del préstamo</p>
                                            <p class="card-text">$0.00</p>
                                            <p class="card-text">Restante del préstamo</p>
                                            <p class="card-text">$0.00</p>
                                            <p class="card-text">Restante de todos los préstamos</p>
                                            <p class="card-text">$0.00</p>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <br>

                            <div class="card border-info">
                                <div class="card-body">
                                    <h5 class="card-title">Pagos previos</h5>
                                    <div class="table-responsive">
                                        <table id="tabla" class="table table-striped table-sm">
                                            <thead>
                                                <tr>
                                                    <th>Clave</th>
                                                    <th>Fecha</th>
                                                    <th>Prestamo</th>
                                                    <th>Importe</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>PP0001</td>
                                                    <td>2018-05-23</td>
                                                    <td>Nombre Persona</td>
                                                    <td>100.00</td>
                                                </tr>

                                                <c:forEach items="${listaAhorros.lista}" var="pagos">
                                                    <tr>
                                                        <td>${pagos.ClavePago}</td>
                                                        <td>${pagos.Fecha}</td>
                                                        <td>${pagos.PersonaAhorro}</td>
                                                        <td>${pagos.Cantidad}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <%--
                        </form>
                            --%>
                        </div>

                    </div>
                        <br>
                </main>
            </div>

        </div>
        <script>
            var hoy = new Date();
            document.getElementById("fechaAhorro").value = parseDate(hoy.toLocaleDateString());
            document.getElementById("fechaPrestamo").value = parseDate(hoy.toLocaleDateString());
            hoy.setDate(hoy.getDate() - 2);
            var fechaInicio = hoy.toLocaleDateString();
            fechaInicio = parseDate(fechaInicio);
            document.getElementById("fechaAhorro").min = fechaInicio;
            document.getElementById("fechaPrestamo").min = fechaInicio;
            hoy = new Date();
            var today = parseDate(hoy.toLocaleDateString());
            document.getElementById("fechaAhorro").max = today;
            document.getElementById("fechaPrestamo").max = today;
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

            function checharMonto() {

            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
