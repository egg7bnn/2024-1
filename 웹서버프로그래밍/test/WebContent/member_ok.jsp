<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����</title>
</head>
<body>

<center><font size='3'><b> ȸ�� ���� </b></font>   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade></TD>
    </TR>
</TABLE>

<TABLE cellSpacing='0' cellPadding='30' align='center' border='0' >
<%@ page import = "java.sql.*, java.util.*" %>    
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

try {
    if (id == null || id.isEmpty() || pass == null || pass.isEmpty()) {
%>
<TR>
    <TD align='center'>
    <font size=2>ID�� ��й�ȣ�� �Է��ϼ���.</font>
    </TD>
</TR>
<TR>
    <TD align='center'>
    <a href="member.jsp">[�α���]</a>
    </TD>
</TR>
<%
    } else {
        String driverName = "com.mysql.cj.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/test";

        Class.forName(driverName);
        Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");

        String strSQL = "SELECT id, pass FROM tbllogin2 WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(strSQL);
        pstmt.setString(1, id);

        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            String logid = rs.getString("id");
            String logpass = rs.getString("pass");

            if (!pass.equals(logpass)) {
%>
<TR>
    <TD align='center'>
    <font size=2>��й�ȣ�� ��ġ���� �ʽ��ϴ�.</font>
    </TD>
</TR>
<TR>
    <TD align='center'>
    <a href="member.jsp">[�α���]</a>
    </TD>
</TR>
<%
            } else {
                session.setAttribute("user", id);
                response.sendRedirect("listboard.jsp");
            }
        } else {
%>
<TR>
    <TD align='center'>
    <font size=2>ȸ�� ID�� �������� �ʽ��ϴ�.</font>
    </TD>
</TR>
<TR>
    <TD align='center'>
    <a href="member.jsp">[�α���]</a>
    </TD>
</TR>
<%
        }
        rs.close();
        pstmt.close();
        conn.close();
    }
} catch (Exception e) {
    e.printStackTrace();
%>
<TR>
    <TD align="center">
    <font size='2'>���� ������ �߻��߽��ϴ�. �ٽ� �õ��ϼ���.</font>
    </TD>
</TR>
<TR>
    <TD align="center">
    <a href="member.jsp">[�α���]</a>
    </TD>
</TR>
<%
}
%>
</TABLE>

</body>
</html>
