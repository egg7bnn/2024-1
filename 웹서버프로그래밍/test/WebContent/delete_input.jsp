<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ó��</title>
</head>
<body>
<%
    // �Ķ���� ��������
    String num = request.getParameter("num");
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        if (num == null || num.isEmpty()) {
            throw new Exception("��ȿ���� ���� ��û�Դϴ�.");
        }

        // �����ͺ��̽� ����
        String dbURL = "jdbc:mysql://localhost:3306/test";
        String dbUser = "root";
        String dbPassword = "dongyang";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // DELETE ���� ����
        String sql = "DELETE FROM tblboard WHERE num = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(num)); // �Ķ���� ���ε�

        int result = pstmt.executeUpdate();

        if (result > 0) {
%>
<h3>������ �Ϸ�Ǿ����ϴ�.</h3>
<a href="listboard.jsp">������� ���ư���</a>
<%
        } else {
%>
<h3>������ �����͸� ã�� �� �����ϴ�.</h3>
<a href="listboard.jsp">������� ���ư���</a>
<%
        }
    } catch (Exception e) {
        e.printStackTrace(); // ����� �뵵�� ���
%>
<h3>������ �߻��߽��ϴ�: <%= e.getMessage() %></h3>
<a href="listboard.jsp">������� ���ư���</a>
<%
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
