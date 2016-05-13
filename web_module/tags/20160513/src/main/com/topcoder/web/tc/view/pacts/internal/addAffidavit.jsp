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
    <title>Add Affidavit</title>
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="typeList" value="<%= request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST) %>" />
<c:set var="roundList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />


<h1>PACTS</h1>
<h2>Add Affidavit</h2>

<form action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="module" value="AddAffidavit"/>
<c:if test="${not empty payment}">
	<input type="hidden" name="payment_id" value="${payment.header.id}">
	<c:if test="${payment.header.algorithmRoundId > 0}">
		<input type="hidden" name="round_id" value="${payment.header.algorithmRoundId}">
	</c:if>
	
</c:if>
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
			<td><b>Associated Payment:</b></td>
			<td>
				<c:choose>
					<c:when test="${empty payment}">
						No payment associated.  If you want the affidavit to be associated to a payment, please create or search the payment first.
					</c:when>
					<c:otherwise>
						<c:out value="${payment.header.description}" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
		<td><b>Description:</b></td>
		<td>
			<tc-webtag:textInput name="affidavit_desc" size="60" editable="true" />
		</td></tr>
		<tr>		
			<td><b>Type:</b></td>
			<td>
            	<tc-webtag:rscSelect name="affidavit_type_id" list='${typeList}' fieldText="affidavit_type_desc" 
            		fieldValue="affidavit_type_id" useTopValue="true" topValue="-1" topText="Select Type"/>
            	
			</td>
		</tr>
<c:if test="${empty payment}">
		<tr>
			<td><b>Round:</b></td>
			<td>
	            <tc-webtag:rscSelect name="round_id" list='${roundList}' fieldText="name" 
	            	fieldValue="round_id" useTopValue="true" topValue="-1" topText="No Round"/>
	        </td>
		</tr>
</c:if>		
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

<input type="submit" value="Save Affidavit">
</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
