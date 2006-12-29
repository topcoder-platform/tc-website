<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.topcoder.web.tc.controller.request.util.VisaLetterRequest"   %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="req" value="${requestScope.req}"/>
<c:set var="event" value="${requestScope.event}"/>
<html>
<head>
<title>Visa Letter Request</title>
         
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

<script language="javascript" type="text/javascript">
function copyAddr() {
	 document.f.<%= VisaLetterRequest.SHIPPING_ADDRESS %>.value = document.f.<%= VisaLetterRequest.ADDRESS %>.value;
	 return false;
}

 </script>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">


<h2>Visa Letter Request for <c:out value="${event.name}"/></h2>

<form name="f" action="/tc?module=VisaLetterRequest" method="post">
<input type="hidden" name="eid" value="${event.id}">
<table>
 <tr>
     <td colspan="2"><span class="bigRed">
                 <tc-webtag:errorIterator id="err" name="error">${err}
                     <br></tc-webtag:errorIterator></span>
     </td>
 </tr>
<tr>
	<td>Full Name (as stated on passport)</td>
	<td><tc-webtag:textInput name="<%= VisaLetterRequest.FULL_NAME %>" size="30" maxlength="50" editable="true"/></td>	
</tr>
<tr>
	<td>Address (as stated on passport)</td>
	<td><tc-webtag:textInput name="<%= VisaLetterRequest.ADDRESS %>" size="50" maxlength="100" editable="true"/></td>	
</tr>
<tr>
	<td>Address (for shipping visa letter)</td>
	<td><tc-webtag:textInput name="<%= VisaLetterRequest.SHIPPING_ADDRESS %>" size="50" maxlength="100" editable="true"/>
	<input type="button" value="same as address" onClick="copyAddr()">
	</td>	
</tr>
<tr>
	<td>Phone Number:</td>
	<td><tc-webtag:textInput name="<%= VisaLetterRequest.PHONE_NUMBER %>" size="15" maxlength="30" editable="true"/></td>	
</tr>
</table>

<input type="submit" value="Request Letter">
</form>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
