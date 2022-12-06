<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>
<%@ page import= "java.io.File" %>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String id = request.getParameter("id");
    String img = request.getParameter("imagem");
    
    Upload up = new Upload();
    up.setFolderUpload("arquivos");

    if (up.formProcess(getServletContext(), request)) {
    
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("nome").toString();
        String descricao = up.getForm().get("descricao").toString();
        Float valor = Float.parseFloat(up.getForm().get("valor").toString());

        String url = "jdbc:postgresql://localhost:5432/basic";
        String usuario = "postgres";
        String senhaBD = "admin";

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.executeUpdate("UPDATE classificados set nome = '"+nome+"',descricao = '"+descricao+"',valor = '"+valor+"',imagem = '"+imagem+"' where id = '"+id+"'  ");
            
            File file = new File("C:\\Users\\Vinícius\\Documents\\NetBeansProjects\\website\\build\\web\\arquivos\\"+img);
            file.delete();
            
            response.sendRedirect("../produtos.jsp?status=2"); //Atualizado com sucesso.
        } catch (Exception e) {
            out.print(e);
        }

    }

%>