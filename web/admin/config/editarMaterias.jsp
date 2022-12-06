<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>
<%@ page import= "java.io.File" %>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String id = request.getParameter("id");
    String imagem = request.getParameter("foto");
    
    Upload up = new Upload();
    up.setFolderUpload("arquivos");

    if (up.formProcess(getServletContext(), request)) {
    
        String foto = up.getFiles().get(0);
        String titulo = up.getForm().get("titulo").toString();
        String texto = up.getForm().get("texto").toString();
        

        String url = "jdbc:postgresql://localhost:5432/basic";
        String usuario = "postgres";
        String senhaBD = "admin";

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.executeUpdate("UPDATE publicacoes set titulo = '"+titulo+"',texto = '"+texto+"',foto = '"+foto+"' where id = '"+id+"'  ");
            
            File file = new File("C:\\Users\\Vinícius\\Documents\\NetBeansProjects\\website\\build\\web\\arquivos\\"+imagem);
            file.delete();
            
            response.sendRedirect("../materias.jsp?status=2"); //Atualizado com sucesso.
        } catch (Exception e) {
            out.print(e);
        }

    }

%>