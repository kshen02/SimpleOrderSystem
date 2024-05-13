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
  <h1>Search Result</h1>
  <%
    List<String> patients = (List<String>) request.getAttribute("result");
    List<String> ids = (List<String>) request.getAttribute("ids");
    if (patients.size() !=0)
    {
    %>
    <ul>
      <%
        String href = "patientinfo.html" + "?id=" + ids.get(0);
      %>
      <li><%=patients.get(0)%></li>
      <%
        for (int i = 1; i < patients.size(); i++) {
          href = "patientinfo.html" + "?id=" + ids.get(i);
      %>
      <li>
        <a href="<%=href%>"><%=patients.get(i)%></a>
      </li>
     <% }
    } else
    {%>
      <p>Nothing found</p>
  <%}%>
  </ul>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>