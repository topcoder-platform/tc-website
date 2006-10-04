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
    <title>Update Affidavit</title>
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="affidavitId" value="${requestScope.affidavitId}"/>
<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />
<c:set var="typeList" value="<%= request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST) %>" />
<c:set var="roundList" value="<%= request.getAttribute(PactsConstants.ROUND_LIST) %>" />


<h1>PACTS</h1>
<h2>Update Affidavit</h2>

<form action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="module" value="UpdateAffidavit"/>
  <input type="hidden" name="affidavit_id" value="${affidavitId }"/>
		<table cellpadding=2" cellspacing="2" border="0">
		<tr>
	        <td colspan="2"><span class="bigRed">
    	    	<tc-webtag:errorIterator id="err" name="error"><%=err%><br></tc-webtag:errorIterator></span>
        	</td>
        </tr>
		<tr>
			<td>User</td>
			<td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></a></td>			
		</tr>
		<tr>
			<td>Associated Payment:</td>
			<td>
				<c:choose>
					<c:when test="${empty payment}">
						No payment associated. 
					</c:when>
					<c:otherwise>
						<c:out value="${payment.description}" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>Notarized:</td>
			<td class="status">
				<tc-webtag:radioButton name="is_notarized" value="yes"/>Yes<br/>
				<tc-webtag:radioButton name="is_notarized" value="no"/>No			
		</td></tr>
		<tr>
			<td>Status:</td>
			<td>
            	<tc-webtag:rscSelect name="affidavit_status_id" list='${statusList}' fieldText="status_desc" 
            		fieldValue="status_id" useTopValue="false"/>
			</td>
		</tr>
		<tr>
		<td>Description:</td>
		<td>
			<tc-webtag:textInput name="affidavit_desc" size="60" editable="true" />
		</td></tr>
		<tr>		
			<td>Type:</td>
			<td>
            	<tc-webtag:rscSelect name="affidavit_type_id" list='${typeList}' fieldText="affidavit_type_desc" 
            		fieldValue="affidavit_type_id" useTopValue="true" topValue="-1" topText="Select Type"/>
            	
			</td>
		</tr>
		<tr>
			<td>Round:</td>
			<td>
	            <tc-webtag:rscSelect name="round_id" list='${roundList}' fieldText="name" 
	            	fieldValue="round_id" useTopValue="true" topValue="-1" topText="No Round"/>
	        </td>
		</tr>
</table>

<input type="submit" value="Save Affidavit">
</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
