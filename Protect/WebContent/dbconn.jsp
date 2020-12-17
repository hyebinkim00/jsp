<%@ page import="java.sql.*"%>
<%
Connection conn= null;
String url="jdbc:mysql://localhost:3306/new_schema?serverTimezone=Asia/Seoul";
String user ="root";
String password="hb1234";

Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection(url, user, password);
%>