<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%
            String nomeUsuario = (String) session.getAttribute("NomeUsuario");
            if (nomeUsuario == null) {
                response.sendRedirect("index.jsp?erro=3");
            }
        %>
        <jsp:include page="includes/nav.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="includes/sidenav.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Mat�rias</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Gerenciar Mat�rias</li>
                        </ol>
                    </div>
                    <%
                        String id = request.getParameter("id");
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        String url = "jdbc:postgresql://localhost:5432/basic";
                        String usuario = "postgres";
                        String senhaBD = "admin";
                        try {
                            Class.forName("org.postgresql.Driver");
                            con = DriverManager.getConnection(url, usuario, senhaBD);
                            st = con.createStatement();
                            rs = st.executeQuery("SELECT *FROM publicacoes WHERE id = '"+id+"' ");
                            while(rs.next()){ %>
                                <div class="container-fluid px-4">
                                    <small>Formul�rio de atualiza��o de mat�rias</small>
                                    <form action="config/editarMaterias.jsp?id=<%=rs.getString("id")%>&foto=<%=rs.getString("foto")%>" method="POST" enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <label class="form-label">T�tulo</label>
                                            <input type="text" class="form-control" value="<%=rs.getString("titulo")%>" name="titulo" placeholder="Informe o t�tulo" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mat�ria</label>
                                            <input type="text" class="form-control" value="<%=rs.getString("texto")%>" name="texto" placeholder="Informe a publica��o" />
                                        </div>
                                        <div class="mb-3">
                                           <label class="form-label">Imagem</label>
                                           <input type="file" class="form-control" name="file[]" multiple /> 
                                       </div>
                                        <button type="submit" class="btn btn-primary">Atualizar</button>
                                    </form>
                                </div>
                            
                            
                        <%    }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
                    

                </main>
                <jsp:include page="includes/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>