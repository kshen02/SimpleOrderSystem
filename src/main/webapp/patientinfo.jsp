<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<style>
    .button {
    margin-left: 15%
    }
</style>
  <jsp:include page="/meta.jsp"/>
  <title>Patient Data App</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<div class="main">
  <h1>Patient information</h1>
  <form enctype="multipart/form-data" method="POST" action="/runUpload.html">
         <% HashMap<String, String> patient = (HashMap<String, String>) request.getAttribute("patient"); %>

         <p style="display:none"><input type="text" name="ID" value="<%=patient.get("ID")%>" readonly/></p>
         <input type="file" name="profile"/>
         <input type="submit" value="Upload Profile Picture"/>
  </form>
  <form method="POST" action="/patientinfo.html">
        <p style="display:none"><input type="text" name="id" value="<%=patient.get("ID")%>" readonly/></p>
        <input type="submit" value="Delete Profile Picture" class="button"/>
  </form>
  <form method="POST" action="/runUpdate.html">
      <ul>
        <%
            String profile = patient.get("PROFILE");
        %>
        <img src="<%="./images/"+profile%>" alt="profile picture">
        <p style="display:none"><input type="text" name="PROFILE" value="<%=patient.get("PROFILE")%>" readonly></p>

        <li><label>ID: </label><input type="text" name="ID" size="40" value="<%=patient.get("ID")%>" readonly></li>
        <li><label>Birth Date: </label><input type="text" name="BIRTHDATE" size="40" value="<%=patient.get("BIRTHDATE")%>"></li>
        <li><label>Death Date: </label><input type="text" name="DEATHDATE" size="40" value="<%=patient.get("DEATHDATE")%>"></li>
        <li><label>SSN: </label><input type="text" name="SSN" size="40" value="<%=patient.get("SSN")%>"></li>
        <li><label>Drivers: </label><input type="text" name="DRIVERS" size="40" value="<%=patient.get("DRIVERS")%>"></li>
        <li><label>Passport: </label><input type="text" name="PASSPORT" size="40" value="<%=patient.get("PASSPORT")%>"></li>
        <li><label>Prefix: </label><input type="text" name="PREFIX" size="40" value="<%=patient.get("PREFIX")%>"></li>
        <li><label>First Name: </label><input type="text" name="FIRST" size="40" value="<%=patient.get("FIRST")%>"></li>
        <li><label>Last Name: </label><input type="text" name="LAST" size="40" value="<%=patient.get("LAST")%>"></li>
        <li><label>Suffix: </label><input type="text" name="SUFFIX" size="40" value="<%=patient.get("SUFFIX")%>"></li>
        <li><label>Maiden: </label><input type="text" name="MAIDEN" size="40" value="<%=patient.get("MAIDEN")%>"></li>
        <li><label>Marital: </label><input type="text" name="MARITAL" size="40" value="<%=patient.get("MARITAL")%>"></li>
        <li><label>Race: </label><input type="text" name="RACE" size="40" value="<%=patient.get("RACE")%>"></li>
        <li><label>Ethnicity: </label><input type="text" name="ETHNICITY" size="40" value="<%=patient.get("ETHNICITY")%>"></li>
        <li><label>Gender: </label><input type="text" name="GENDER" size="50" value="<%=patient.get("GENDER")%>"></li>
        <li><label>Birth Place: </label><input type="text" name="BIRTHPLACE" size="40" value="<%=patient.get("BIRTHPLACE")%>"></li>
        <li><label>Address: </label><input type="text" name="ADDRESS" size="40" value="<%=patient.get("ADDRESS")%>"></li>
        <li><label>City: </label><input type="text" name="CITY" size="40" value="<%=patient.get("CITY")%>"></li>
        <li><label>State: </label><input type="text" name="STATE" size="40" value="<%=patient.get("STATE")%>"></li>
        <li><label>ZIP: </label><input type="text" name="ZIP" size="40" value="<%=patient.get("ZIP")%>"></li>
      </ul>
      <input type="submit" value="Save Changes" class="button" />
  </form>
  <form method="POST" action="/runDelete.html">
    <p style="display:none"><input type="text" name="ID" value="<%=patient.get("ID")%>" readonly/></p>
    <input type="submit" value="Delete Record" class="button" />
  </form>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>