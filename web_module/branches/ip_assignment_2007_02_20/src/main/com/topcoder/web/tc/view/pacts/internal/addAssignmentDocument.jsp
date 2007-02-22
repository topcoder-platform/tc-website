<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add Assignment Document</title>
</head>
<body>


<c:set var="user" value="${requestScope.user}"/>
<c:set var="typeList" value="<%= request.getAttribute(PactsConstants.ASSIGNMENT_DOCUMENT_TYPE_LIST) %>" />


<h1>PACTS</h1>
<h2>Add Assignment Document</h2>

<form action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="module" value="AddAssignmentDocument"/>

		<table cellpadding="5" cellspacing="5" border="0">
		<tr>
	        <td colspan="2">
    	    	<tc-webtag:errorIterator id="err" name="error">
    	    		<font color="#FF0000"><%=err%></font><br/>
    	    	</tc-webtag:errorIterator>
        	</td>
        </tr>
		<tr>
			<td><b>User</b></td>
			<td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></a></td>			
		</tr>
		<tr>		
			<td><b>Type:</b></td>
			<td>
            	<tc-webtag:rscSelect name="assignment_document_type_id" list='${typeList}' fieldText="description" 
            		fieldValue="id" useTopValue="true" topValue="-1" topText="Select Type"/>
            	
			</td>
		</tr>
        <tr>
	        <td><b>Text:</b>
	        </td>
	        <td>        
		        If empty, it will be figured out from the type chosen.
		        <br/>
				<tc-webtag:textArea name="text" rows="10" cols="70"/>
			</td>
		</tr>
		
</table>

<input type="submit" value="Save Assignment Document">
</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
