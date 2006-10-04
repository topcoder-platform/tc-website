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
    
    
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">

function toggleDiv(divId, state) 
{
    if(document.layers)	  
    {
       document.layers[divId].visibility = state ? "show" : "hide";
    }
    else if(document.getElementById)
    {
        document.getElementById(divId).style.visibility = state ? "visible" : "hidden";
    }
    else if(document.all)
    {
        document.all[divId].style.visibility = state ? "visible" : "hidden";
    }
}

function statusChanged(value) {
/*  
  var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=SelectPaymentTypeReference');
    ajaxRequest.addNamedFormElements("affidavit_status_id");
    ajaxRequest.addNamedFormElements("reference_type_id");    
    ajaxRequest.sendRequest();*/
	toggleDiv(affirmRows, value == <%= PactsConstants.AFFIDAVIT_AFFIRMED_STATUS%>);
}

</script>    
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="affidavitId" value="${requestScope.affidavitId}"/>
<c:set var="isAffirmed" value="${requestScope.isAffirmed}"/>
<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />
<c:set var="typeList" value="<%= request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST) %>" />
<c:set var="roundList" value="<%= request.getAttribute(PactsConstants.ROUND_LIST) %>" />


<h1>PACTS</h1>
<h2>Update Affidavit</h2>

<form name="ajaxFields">
   <input type="hidden" name="reference_type_id">
   <input type="hidden" name="country" value="India">
   
   <input type="hidden" name="cr" value="${user.id}" >
</form>

<form name="f" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
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
			<td><b>User</b></td>
			<td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></a></td>			
		</tr>
		<tr>
			<td><b>Associated Payment:</b></td>
			<td>
				<c:choose>
					<c:when test="${empty payment}">
						No payment associated. 
					</c:when>
					<c:otherwise>
						<a href="${pacts:viewPayment(payment.id)}"><c:out value="${payment.description}" /></a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td><b>Notarized:</b></td>
			<td class="status">
				<tc-webtag:radioButton name="is_notarized" value="yes"/>Yes<br/>
				<tc-webtag:radioButton name="is_notarized" value="no"/>No			
		</td></tr>
		<tr>
			<td><b>Status:</b></td>
			<td>
				<c:choose> 
					<c:when test="${isAffirmed}">
	    	        	Affirmed
	    	        </c:when>
	    	        <c:otherwise>
		            	<tc-webtag:rscSelect name="affidavit_status_id" list='${statusList}' fieldText="status_desc" 
	    	        		fieldValue="status_id" useTopValue="false" onChange="statusChanged(this.value)"/>
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
			<td><b>Type:<b></td>
			<td>
            	<tc-webtag:rscSelect name="affidavit_type_id" list='${typeList}' fieldText="affidavit_type_desc" 
            		fieldValue="affidavit_type_id" useTopValue="true" topValue="-1" topText="Select Type"/>
            	
			</td>
		</tr>
		<tr>
			<td><b>Round:</b></td>
			<td>
	            <tc-webtag:rscSelect name="round_id" list='${roundList}' fieldText="name" 
	            	fieldValue="round_id" useTopValue="true" topValue="-1" topText="No Round"/>
	        </td>
		</tr>
		<tr id="affirmRows">
			<td><b>Birthday:<b></td>
			<td></td>
		</tr>
</table>

<input type="submit" value="Save Affidavit">
</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
