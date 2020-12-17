<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
String url    = "jdbc:mysql://localhost:3306/new_schema?serverTimezone=Asia/Seoul"; //1521부분은 님께서 설정한 포트로 바꾸세요.
String user   = "root";
String passwd = "hb1234";


//디비연결 변수
Connection  conn  = null;
Statement   stmt  = null;
ResultSet   rs    = null;


//쿼리 생성
String query      = " SELECT * from user ";


try {
    // MySql Connection Start
    Class.forName("com.mysql.cj.jdbc.Driver");//org.gjt.mm.mysql.Driver
    conn = DriverManager.getConnection(url, user, passwd);


    //쿼리 적용
    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);


    // 쿼리 결과 보여주기
    while(rs.next()) {          
        out.println(rs.getString(1));
        out.println("<br/>");
    }
}catch(SQLException se){
    out.println("[CONTENT]쿼리 에러 : SQLException ");
}catch(NullPointerException ne){
    out.println("[CONTENT]널 에러 : NullPointerException ");
}catch(Exception e){
    out.println("[CONTENT]에러 : Exception ");
} finally { 
    if (rs != null) try {rs.close(); }catch(SQLException ex) {}
    if (stmt != null) try {stmt.close(); } catch(SQLException ex) {}
    if (conn != null) try {conn.close(); }catch(SQLException ex) {}
}
%>