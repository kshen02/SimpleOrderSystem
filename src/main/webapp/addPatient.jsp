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
    <h1>Patient information</h1>
    <ul>
      <%
        HashMap<String, String> patient = (HashMap<String, String>) request.getAttribute("patient");
      %>
      <li><%="ID : " + patient.get("ID")%></li>
      <li><%="Birth Date : " + patient.get("BIRTHDATE")%></li>
      <li><%="Death Date : " + patient.get("DEATHDATE")%></li>
      <li><%="SSN : " + patient.get("SSN")%></li>
      <li><%="Drivers : " + patient.get("DRIVERS")%></li>
      <li><%="Passport : " + patient.get("PASSPORT")%></li>
      <li><%="Prefix : " + patient.get("PREFIX")%></li>
      <li><%="First Name : " + patient.get("FIRST")%></li>
      <li><%="Last Name : " + patient.get("LAST")%></li>
      <li><%="Suffix : " + patient.get("SUFFIX")%></li>
      <li><%="Maiden : " + patient.get("MAIDEN")%></li>
      <li><%="Marital : " + patient.get("MARITAL")%></li>
      <li><%="Race : " + patient.get("RACE")%></li>
      <li><%="Ethnicity : " + patient.get("ETHNICITY")%></li>
      <li><%="Gender : " + patient.get("GENDER")%></li>
      <li><%="Birth Place : " + patient.get("BIRTHPLACE")%></li>
      <li><%="Address : " + patient.get("ADDRESS")%></li>
      <li><%="City : " + patient.get("CITY")%></li>
      <li><%="State : " + patient.get("STATE")%></li>
      <li><%="ZIP : " + patient.get("ZIP")%></li>
    </ul>
</div>
<div>
    <a href = "index.html">Return to Home Page</a>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>