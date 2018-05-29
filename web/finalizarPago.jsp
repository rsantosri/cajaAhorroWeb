<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : obtenerCliente
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


        <title>Finalizar Pago</title>

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
                        <h1 class="h2">Finalizar pago</h1>
                    </div>
                    <div id = "alert_placeholder"></div>
                    <%--
<form action="finalizarPago" method="post" name="finalizarPago">--%>
                    <div class="card border-success">
                        <div class="card-body">
                            <h5 class="card-title">
                                Opciones
                            </h5>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Recibo</span>
                                </div>
                                <select class="form-control" aria-label="Accion a realizar con el recibo">
                                    <option value="imprimir">Imprimir</option>
                                    <option value="enviar">Enviar</option>
                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Forma de Pago</span>
                                </div>
                                <select class="form-control" id="forma" onchange="checarForma()" aria-label="forma de pago">
                                    <option value="efectivo">Efectivo</option>
                                    <option value="deposito">Depósito</option>
                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Importe: $</span>
                                </div>
                                <input type="number" disabled class="form-control" id="importe" value="100.00">
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Recibido: $</span>
                                </div>
                                <input type="number" required onkeyup="myFunction()" onchange="myFunction()"  class="form-control" id="recibido" value="100.00">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Cambio: $</span>
                                </div>
                                <input type="number" disabled  class="form-control" id="cambio" value="0.00" >
                            </div>

                            <button href="#" type="submit" onclick="checarValores()" class="btn btn-outline-success btn-block">Finalizar pago</button>

                            <script>
                                bootstrap_alert = function () {}
                                bootstrap_alert.warning = function (message) {
                                    $('#alert_placeholder').html('<div role="alert" class="alert alert-warning alert-dismissable fade show"><span>' + message + '</span><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></div>')
                                }




                                function myFunction() {
                                    var input, importe, c;
                                    input = parseInt(document.getElementById("recibido").value);
                                    importe = parseInt(document.getElementById("importe").value);
                                    c = input - importe;
                                    document.getElementById("cambio").value = c;

                                }
                                function checarForma() {

                                    if (document.getElementById("forma").value === "deposito") {
                                        document.getElementById("recibido").disabled = true;
                                    } else {
                                        document.getElementById("recibido").disabled = false;

                                    }
                                }
                                function checarValores() {
                                    if (parseInt(document.getElementById("cambio").value) < 0) {
                                        bootstrap_alert.warning('Ha introducido un valor menor al del importe');
                                    }
                                }
                            </script>

                            <%--</form>--%>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
