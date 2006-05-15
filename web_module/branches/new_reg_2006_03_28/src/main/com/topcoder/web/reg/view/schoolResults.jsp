<html>
<title>hello world</title>
<head>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>
<body>
<div align="center">
   <div style="width:250px;padding:15px;text-align:left;">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="registration_w"/>
<jsp:param name="title" value="School Selection"/>
</jsp:include>

      <span class="subtitle">Results</span>
      <br><br>

      <div align="center">
         <A href="">Search</A>
      </div>


   </div>
</div>
</body>
</html>
