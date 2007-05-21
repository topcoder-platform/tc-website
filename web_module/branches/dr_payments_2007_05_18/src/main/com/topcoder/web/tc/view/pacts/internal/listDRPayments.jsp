<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>


<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        
<script type="text/javascript">
<!--
  function checkAll(check) {
    var elements = document.paymentForm.elements;
    for (i=0; i<document.paymentForm.elements.length; i++) {
      if (document.paymentForm.elements[i].type=="checkbox") {
        document.paymentForm.elements[i].checked = (check==true);
      }
    }
  }
-->
</script>

        
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Digital Run Payments</h2>

<br>
<c:if test="${desActiveCount >0 }">
	<h3>Design phase not yet completed: ${desActiveCount } projects still active.</h3>
</c:if>
<c:if test="${devsActiveCount >0 }">
	<h3>Development phase not yet completed: ${devActiveCount } projects still active.</h3>
</c:if>

        <center>

<br>


<c:forEach  items="${contests}" var="c">
contest: ${c.id }, ${c.typeId }, ${c.name }<br>
</c:forEach>

<form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
    <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GenerateIntroEventCompPayments"/>

<a href="Javascript:checkAll(true)">check all</a> -
 <a href="Javascript:checkAll(false)">uncheck all</a> <br>
<br><br>


<br>
<input type="submit" value="Generate Payments">
<br>
</form>   




        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
