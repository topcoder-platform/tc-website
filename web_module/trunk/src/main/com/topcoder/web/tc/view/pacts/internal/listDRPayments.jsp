<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<%@ page import="com.topcoder.web.tc.Constants" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        
<script type="text/javascript">
<!--
  function checkAll(check) {
    var elements = document.f.elements;
    for (i=0; i<document.f.elements.length; i++) {
      if (document.f.elements[i].type=="checkbox") {
        document.f.elements[i].checked = (check==true);
      }
    }
  }
-->
</script>

        
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Digital Run Payments</h2>

        <center>

<br>
<c:if test="${desActiveCount >0 }">
	<h3>Design phase not yet completed: ${desActiveCount } projects still active.</h3>
</c:if>
<c:if test="${devsActiveCount >0 }">
    <h3>Development phase not yet completed: ${devActiveCount } projects still active.</h3>
</c:if>
<c:if test="${asmActiveCount >0 }">
    <h3>Assembly phase not yet completed: ${asmActiveCount } projects still active.</h3>
</c:if>


<br>

<form name="f" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
    <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GenerateDRPayments"/>
    <input type="hidden" name="<%=Constants.STAGE_ID%>" value="<%= request.getAttribute(Constants.STAGE_ID) %>"/>
    <input type="hidden" name="<%=Constants.SEASON_ID%>" value="<%= request.getAttribute(Constants.SEASON_ID) %>"/>

<c:forEach  items="${contests}" var="c">
<h3>${c.name }</h3>
<table cellpadding="3">
	<tr>
		<td><b>Place</b></td>
		<td><b>Coder</b></td>
		<td><b>Amount</b></td>
		<td><b>Status</b></td>
	</tr>
	<c:forEach items="${c.results }" var="r">
		<tr>
			<td align="right">${r.place }</td>
			<td><tc-webtag:handle coderId="${r.coderId}" context='component'/> </td>
			<td align="right"><fmt:formatNumber value="${r.prize}" type="currency" currencySymbol="$"/> </td>
			<td>
			   		<c:choose>
			   			<c:when test="${not empty r.paymentId}"><font color="#00A000">Paid </font><a href="${pacts:viewPayment(r.paymentId)}">(view)</a></c:when>
			   			<c:otherwise><input type="checkbox" name="pay" value="${c.typeId}:${r.place}:${r.coderId}:${r.prize}"> Pay</c:otherwise>
			   		</c:choose>			
			</td>
		</tr>			
	</c:forEach>
	<tr>
		<td colspan="2" align="right">Total:</td>
		<td align="right"><b><fmt:formatNumber value="${c.totalPrizes}" type="currency" currencySymbol="$"/></b></td>
		<td></td>
	</tr>
</table>


</c:forEach>


<br><br>
<a href="Javascript:checkAll(true)">check all</a> -
 <a href="Javascript:checkAll(false)">uncheck all</a> <br>


<br>
<input type="submit" value="Generate Payments">
<br>
</form>   




        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
