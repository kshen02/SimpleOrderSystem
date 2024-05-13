<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <jsp:include page="/meta.jsp"/>
  <title>Patient Data App</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<div class="main">
  <h2>Patients:</h2>
  <ul>
    <%
      List<String> patients = (List<String>) request.getAttribute("patientNames");
      List<String> ids = (List<String>) request.getAttribute("patientIDs");
      for (int i = 0; i < patients.size(); i++) {
        String href = "patientinfo.html" + "?id=" + ids.get(i);
    %>
    <li><a href="<%=href%>"><%=patients.get(i)%></a>
    </li>
    <% } %>
  </ul>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>
