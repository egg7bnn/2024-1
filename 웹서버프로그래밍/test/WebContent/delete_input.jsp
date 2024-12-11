<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>삭제 처리</title>
</head>
<body>
<%
    // 파라미터 가져오기
    String num = request.getParameter("num");
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        if (num == null || num.isEmpty()) {
            throw new Exception("유효하지 않은 요청입니다.");
        }

        // 데이터베이스 연결
        String dbURL = "jdbc:mysql://localhost:3306/test";
        String dbUser = "root";
        String dbPassword = "dongyang";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // DELETE 쿼리 실행
        String sql = "DELETE FROM tblboard WHERE num = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(num)); // 파라미터 바인딩

        int result = pstmt.executeUpdate();

        if (result > 0) {
%>
<h3>삭제가 완료되었습니다.</h3>
<a href="listboard.jsp">목록으로 돌아가기</a>
<%
        } else {
%>
<h3>삭제할 데이터를 찾을 수 없습니다.</h3>
<a href="listboard.jsp">목록으로 돌아가기</a>
<%
        }
    } catch (Exception e) {
        e.printStackTrace(); // 디버깅 용도로 출력
%>
<h3>오류가 발생했습니다: <%= e.getMessage() %></h3>
<a href="listboard.jsp">목록으로 돌아가기</a>
<%
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
