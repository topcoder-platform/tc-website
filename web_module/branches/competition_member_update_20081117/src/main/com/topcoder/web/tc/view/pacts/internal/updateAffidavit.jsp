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
    
<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="affidavitId" value="${requestScope.affidavitId}"/>
<c:set var="isAffirmed" value="${requestScope.isAffirmed}"/>
<c:set var="isFromIndia" value="${requestScope.isFromIndia}"/>
<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />
<c:set var="typeList" value="<%= request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST) %>" />
<c:set var="roundList" value="<%= request.getAttribute(PactsConstants.ROUND_LIST) %>" />

    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
        
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

function statusChanged() {
    <c:if test="${not isAffirmed}">
    var affirming = document.f.affidavit_status_id.value == <%= PactsConstants.AFFIDAVIT_AFFIRMED_STATUS%>;
    </c:if>
    <c:if test="${isAffirmed}">
    var affirming = false;
    </c:if>
    var fromIndia = false;
    <c:if test="${isFromIndia}">
    fromIndia = true;
    </c:if>
	toggleDiv('BirthdayRow', affirming);
	toggleDiv('FamilyNameRow', affirming && fromIndia);
	toggleDiv('AgedRow', affirming && fromIndia);
}

</script>    
</head>
<body onLoad="statusChanged()" >



<h1>PACTS</h1>
<h2>Update Affidavit</h2>


<form name="f" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="module" value="UpdateAffidavit"/>
  <input type="hidden" name="affidavit_id" value="${affidavitId }"/>
		<table cellpadding=2" cellspacing="2" border="0">
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
	    	        	<input type="hidden" name="affidavit_status_id" value="<%= PactsConstants.AFFIDAVIT_AFFIRMED_STATUS %>">
	    	        </c:when>
	    	        <c:otherwise>
		            	<tc-webtag:rscSelect name="affidavit_status_id" list='${statusList}' fieldText="status_desc" 
	    	        		fieldValue="status_id" useTopValue="false" onChange="statusChanged()"/>
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
		<tr id="BirthdayRow">
			<td><b>Birthday:<b></td>
			<td><tc-webtag:textInput name="date_of_birth" id="date_of_birth" size="10" editable="true" />
			<button id="trigger_date_of_birth">Set</button></td>
		</tr>
		<tr id="FamilyNameRow">
			<td><b>Family Name:<b></td>
			<td><tc-webtag:textInput name="family_name" size="30" editable="true" /></td>
		</tr>
		<tr id="AgedRow">
			<td><b>Aged:<b></td>
			<td><tc-webtag:textInput name="aged" size="4" editable="true" />(If left empty, today's age of coder will be used)</td>
		</tr>
</table>
<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "date_of_birth",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                    button      : "trigger_date_of_birth",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);
                -->
</script>

<input type="submit" value="Save Affidavit">
</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
