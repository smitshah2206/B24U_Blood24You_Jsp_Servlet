<%@page import="java.sql.*;"  %>
<%@page import="java.io.*;"  %>
<%@page import="javax.servlet.*;"  %>
<%@page import="javax.servlet.http.*;"  %>
<%@page import="B24U.*;"  %>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<script type="text/javascript">
		alert('Sign Out Successfully.');
		window.location='../login_event.jsp';
	</script>
</body>
</html>