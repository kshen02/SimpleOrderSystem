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
    boolean delete = (boolean) request.getAttribute("delete");
    if (delete) {
    %>
        <h1>Patient record successfully deleted</h1>
    <%
    } else {
    %>
        <h1>Failed to delete patient record</h1>
    <%
    }
    %>
</div>
<div>
    <a href = "index.html">Return to Home Page</a>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>