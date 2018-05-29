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


        <title>Obtener Persona</title>

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
                                    Administrar ahorro
                                </a>
                            </li>

                        </ul>


                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 ">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Elija una persona para administrar sus ahorros</h1>
                    </div>
                    <div class="card border-primary">
                        <div class="card-body">
                            <h5 class="card-title">Lista de nombres</h5>

                            <input type="text" onkeyup="myFunction()" class="form-control" id="search" placeholder="Buscar">
                            <br>
                            <form action="obtenPersona" method="post" name="obtenPersona">

                                <div class="table-responsive">
                                    <table id="tabla" class="table table-striped table-sm">

                                        <tbody>
                                            <tr name>
                                                <td  class="nombre">Nombre Persona</td>
                                                <td><button type="submit" class="btn btn-sm btn-outline-primary btn-block">Elegir</button></td>
                                            </tr>

                                            <c:forEach items="${listaPersonas.lista}" var="persona">
                                                <tr>
                                                    <td class="nombre">${persona.Nombre} ${persona.Apellidos}</td>
                                                    <td><button type="submit" class="btn btn-outline-primary">Elegir</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <script>
                                        function myFunction() {
                                            var input, filter, table, tr, td, i;
                                            input = document.getElementById("search");
                                            filter = input.value.toUpperCase();
                                            table = document.getElementById("tabla");
                                            tr = table.getElementsByTagName("tr");
                                            for (i = 0; i < tr.length; i++) {

                                                td = tr[i].getElementsByClassName("nombre")[0];
                                                if (td) {
                                                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                                        tr[i].style.display = "";
                                                    } else {
                                                        tr[i].style.display = "none";
                                                    }
                                                }

                                            }
                                        }
                                    </script>
                                </div>
                            </form>
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
