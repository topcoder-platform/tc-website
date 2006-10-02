<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts-tag" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add Affidavit</title>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<link type="text/css" rel="stylesheet" href="/css/tcReg.css">    
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />
<c:set var="typeList" value="<%= request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST) %>" />
<c:set var="roundList" value="<%= request.getAttribute(PactsConstants.ROUND_LIST) %>" />

<div align="center">
<div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">
<h1>PACTS</h1>
<center>
<h2>Add Affidavit</h2>
</center>
<form action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="module" value="AddAffidavit"/>
<c:if test="${not empty payment and payment.header.algorithmRoundId > 0}">
	<input type="hidden" name="round_id" value="${payment.header.algorithmRoundId}">
</c:if>
		<table cellpadding="0" cellspacing="0" border="0" class="regFields">
		<tr>
	        <td colspan="2"><span class="bigRed">
    	    	<tc-webtag:errorIterator id="err" name="error"><%=err%><br></tc-webtag:errorIterator></span>
        	</td>
        </tr>
		<tr>
			<td class="name">User</td>
			<td class="value"><pacts-tag:handle coderId="${user.id}" handle="${user.handle}"/></td>
		</tr>
		<tr>
			<td class="name">Associated Payment:</td>
			<td class="value">
				<c:choose>
					<c:when test="${empty payment}">
						No payment associated.  If you want the affidavit to be associated to a payment, please create or search the payment first.
					</c:when>
					<c:otherwise>
						<c:out value="${payment.description}" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td class="name">Notarized:</td>
			<td class="status">
				<tc-webtag:radioButton name="<%=PactsConstants.IS_NOTARIZED%>" value="yes"/>Yes<br/>
				<tc-webtag:radioButton name="<%=PactsConstants.IS_NOTARIZED%>" value="no"/>No			
		</td></tr>
		<tr>
			<td class="name">Status:</td>
			<td class="value">
            	<tc-webtag:rscSelect name="affidavit_status_id" list='${statusList}' fieldText="status_desc" 
            		fieldValue="status_id" useTopValue="true" topValue="-1" topText="Select Status"/>
			</td>
		</tr>
		<tr>
		<td class="name">Description:</td>
		<td class="value">
			<tc-webtag:textInput name="affidavit_desc" size="40" editable="true" />
		</td></tr>
		<tr>		
			<td class="name">Type:</td>
			<td class="value">
            	<tc-webtag:rscSelect name="affidavit_type_id" list='${typeList}' fieldText="affidavit_type_desc" 
            		fieldValue="affidavit_type_id" useTopValue="true" topValue="-1" topText="Select Type"/>
            	
			</td>
		</tr>
<c:if test="${empty payment}">
		<tr>
			<td class="name">Round:</td>
			<td class="value">
	            <tc-webtag:rscSelect name="round_id" list='${roundList}' fieldText="name" 
	            	fieldValue="round_id" useTopValue="true" topValue="-1" topText="No Round"/>
	        </td>
		</tr>
</c:if>		
        <tr>
	        <td class="name">Text:
	        </td>
	        <td class="value">        
		        If empty, it will be figured out from the type chosen.
		        <br/>
				<tc-webtag:textArea name="text" rows="10" cols="70"/>
			</td>
		</tr>
		
</table>
<center>
<input type="submit" value="Save Affidavit">
</center>
</form>
<jsp:include page="InternalFooter.jsp" flush="true" />
</div>
</div>

</body>
</html>
