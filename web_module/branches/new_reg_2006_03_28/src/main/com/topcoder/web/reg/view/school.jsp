<html>
<title>hello world</title>
<head>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<jsp:include page="/script.jsp" />
</head>
<body>
<div align="center">
   <div style="width:250px;padding:15px;text-align:left;">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="registration_w"/>
<jsp:param name="title" value="School Selection"/>
</jsp:include>

      <span class="subtitle">Search Criteria</span>
      <br><br>
      <strong>School Name:</strong><br>
      <input type="text" name="" value="" maxlength="50" size="36">
      <br><br>
      <strong>Country:</strong><br>
      <input type="text" name="" value="" maxlength="50" size="36">
      <br><br>
      <strong>State / Province:</strong><br>
      <input type="text" name="" value="" maxlength="50" size="36">
      <br><br>
      <strong>City:</strong><br>
      <input type="text" name="" value="" maxlength="50" size="36">
      <br><br>

      <div align="center">
         <input type="radio" name="schooltype" value="highschool" >High School
         <input type="radio" name="schooltype" value="college" >College
      </div>

      <br><br>
      <A href="">Search</A>

   </div>
</div>
</body>
</html>
