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
Please select your school from list below and click Submit:
<select name="schoolSelection" size="4" multiple="multiple">
<option value="001">University of Connecticut</option>
<option value="002">University of Rhode Island</option>
<option value="003">Massachusetts Institute of Technology</option>
<option value="004">Electronic Engineering Polytechnic Insitute of Surabaya - Institute Technology of Sepuluh Nopember</option>
</select>

      <div align="center">
         <A href="">Submit</A>
      </div>


   </div>
</div>
</body>
</html>
