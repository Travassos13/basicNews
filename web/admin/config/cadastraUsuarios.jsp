<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<%

    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String senha = request.getParameter("senha");
    
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
        st.execute("Insert into usuarios(nome,email,username,senha)VALUES('"+nome+"', '"+email+"', '"+senha+"', '"+username+"') ");
        response.sendRedirect("../usuarios.jsp?status=1");
    }catch(Exception e){
        out.print(e);
    }

%>
