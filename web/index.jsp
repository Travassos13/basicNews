<!DOCTYPE html>
<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BasicNews</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./css/styles.css" rel="stylesheet" />
    </head>
    <body class="geral">
        <img src="images/capa.jpg" style="width:100%;height:200px; object-fit:cover;">
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container materias">
                <a class="navbar-brand" href="#!">As principais notícias de Chapecó e região</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contato</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="./admin">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Page content-->
        <div class="geral">
        <div class="materias container mt-5">
            <div class="row">
                <div class="col-lg-9">
                    <!-- Post content-->
                    
                     <% 
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    String url = "jdbc:postgresql://localhost:5432/basic";
                                    String usuario = "postgres";
                                    String senhaBD = "admin";  
                                    try{
                                         Class.forName("org.postgresql.Driver");
                                         con = DriverManager.getConnection(url,usuario,senhaBD);
                                         st = con.createStatement();
                                         rs = st.executeQuery("SELECT *FROM publicacoes ORDER BY id DESC");
                                         while(rs.next()){ 
                                            String id = rs.getString("id");
                                            %>
                                             <article>
                                                <!-- Post header-->
                                                <header class="mb-4">
                                                    <!-- Post title-->
                                                    <h1 class="fw-bolder mb-1"><%= rs.getString("titulo") %></h1>

                                                </header>
                                                <!-- Preview image figure-->
                                                <figure class="mb-4"><img class="img-fluid rounded" src="arquivos/<%= rs.getString("foto") %>" alt="..." /></figure>
                                                <!-- Post content-->
                                                <section class="mb-5">
                                                    <p class="fs-5 mb-4"><%= rs.getString("texto") %></p>
                                                    <hr>

                                                </section>
                                            </article>

                                            
                                            <%
                                                 }
                                    }catch(Exception e){
                                    out.print(e);
                                    }
                                                        %>
    
                    
                </div>
                <div class="col-lg-3">
                <!-- Side widget-->
                    <br>
                    <div class="row row-cols-1 row-cols-md-1 g-1">
                    <button class="btn btn-dark" style="width:100%"><h2 class="fw-bolder mb-1"> Classificados</h2></button> 
                    <br>
                <% 
                                   
                                    try{
                                         Class.forName("org.postgresql.Driver");
                                         con = DriverManager.getConnection(url,usuario,senhaBD);
                                         st = con.createStatement();
                                         rs = st.executeQuery("SELECT *FROM classificados ORDER BY id DESC");
                                         while(rs.next()){ 
                                            String id = rs.getString("id");
                                            %>
                                               <div class="col">
                                                <div class="card">
                                                  <img style="width:100%;height:200px; object-fit:cover;" src="arquivos/<%= rs.getString("imagem") %>" class="card-img-top" alt="...">
                                                  <div class="card-body">
                                                    <h5 class="card-title"><%= rs.getString("nome") %></h5>
                                                    <p class="card-text"><%= rs.getString("descricao") %></p>
                                                    <hr>
                                                    <p style=" font-size:25px; text-align:center;">R$<%= rs.getString("valor") %></p>
                                                    <button class="btn btn-danger" style="width:100%">Comprar</button>
                                                  </div>
                                                </div>
                                              </div>
                                                    <br>
                                            
                                            <%
                                                  }
                                    }catch(Exception e){
                                    out.print(e);
                                    }
                                                        %>
                </div>
            </div>
        </div>
      </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; BasicNews 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
