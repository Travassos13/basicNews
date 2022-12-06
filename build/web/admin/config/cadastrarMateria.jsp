<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>
<%@ page import="util.Upload" %>


<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
        
    Upload up = new Upload();
   
    up.setFolderUpload("arquivos");
    
    if(up.formProcess(getServletContext(),request)){
        
        String foto = up.getFiles().get(0);
        String titulo = up.getForm().get("titulo").toString();
        String texto = up.getForm().get("texto").toString();
                
          String url = "jdbc:postgresql://localhost:5432/basic";
          String usuario = "postgres";
          String senhaBD = "admin";
          
          try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO publicacoes(texto,titulo,foto)VALUES('"+texto+"', '"+titulo+"', '"+foto+"')");
            response.sendRedirect("../materias.jsp?status=1");//Adicionado com sucesso
        }catch(Exception e){
        out.print(e);
    }
    }
   
   
%>
