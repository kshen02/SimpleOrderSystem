<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <jsp:include page="/meta.jsp"/>
  <title>Patient Data App</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<div class="main">
    <%
    String id = (String) request.getAttribute("ID");
    String profile = (String) request.getAttribute("profile");
    %>
    <p><%="ID: "+id%></p>
    <p><%="Profile: "+profile%></p>
</div>
<div>
    <a href = "index.html">Return to Home Page</a>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>