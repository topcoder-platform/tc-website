<%@ page errorPage="../error.jsp" %>
<jsp:include page="../header.jsp" />
<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*, java.util.*" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>
<jsp:useBean id="startDate" scope="request" class="java.util.GregorianCalendar"/>
<jsp:useBean id="endDate" scope="request" class="java.util.GregorianCalendar"/>
<html>
<head>
	<title>Job Search</title>
</head>
<body>

<SCRIPT Language="javascript"> <!--

function reload()
{
	frmDate.<%=EmailConstants.STEP%>.value = "<%=EmailConstants.SCHEDULEDJOB_SHOW_SEARCH%>";
	frmDate.submit();
}

//--> </SCRIPT>


<p class="bodyTextBig">Search by start date:</p>
<form name="frmDate" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">

	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_SHOW_SEARCH_RESULTS%>">
	<input type="hidden" name="<%=EmailConstants.SEARCH_TYPE%>" value="<%=EmailConstants.SEARCH_BY_DATE%>">

	<table border=0 cellpadding=2 cellspacing=0>
		<tr>
		<td class="bodyText">After:
		</td>
		<td class="bodyText">

		<email:monthSelect
			name="startMonth"
			selectedValue="<%=String.valueOf(startDate.get(Calendar.MONTH))%>"
			onChange="reload();"/>
		<email:daySelect
			name="startDay"
			month="<%=String.valueOf(startDate.get(Calendar.MONTH))%>"
			year="<%=String.valueOf(startDate.get(Calendar.YEAR))%>"
			selectedValue="<%=String.valueOf(startDate.get(Calendar.DAY_OF_MONTH))%>"/>
		<email:yearSelect
			name="startYear"
			startingYear="<%=String.valueOf((new GregorianCalendar()).get(Calendar.YEAR)-5)%>"
			numYearsAhead="10"
			selectedValue="<%=String.valueOf(startDate.get(Calendar.YEAR))%>"
			onChange="reload();"/>

		</td>
		</tr>

		<tr>
		<td class="bodyText">Before:
		</td>


		<td class="bodyText">

		<email:monthSelect
			name="endMonth"
			selectedValue="<%=String.valueOf(endDate.get(Calendar.MONTH))%>"
			onChange="reload();"/>
		<email:daySelect
			name="endDay"
			month="<%=String.valueOf(endDate.get(Calendar.MONTH))%>"
			year="<%=String.valueOf(endDate.get(Calendar.YEAR))%>"
			selectedValue="<%=String.valueOf(endDate.get(Calendar.DAY_OF_MONTH))%>"/>
		<email:yearSelect
			name="endYear"
			startingYear="<%=String.valueOf((new GregorianCalendar()).get(Calendar.YEAR)-5)%>"
			numYearsAhead="10"
			selectedValue="<%=String.valueOf(endDate.get(Calendar.YEAR))%>"
			onChange="reload();"/>
		</td>
		</tr>
	</table>
	<p>
	<input type=submit>
</form>
<p>
<!--
<hr>
<p class="bodyTextBig">
<b>Search by sender e-mail address:</b>
</p>
<form action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_SHOW_SEARCH_RESULTS%>">
	<input type="hidden" name="<%=EmailConstants.SEARCH_TYPE%>" value="<%=EmailConstants.SEARCH_BY_SENDER_EMAIL%>">

	<table border=0 cellpadding=2 cellspacing=0>
		<tr>
		<td class="bodyText">Exact e-mail address:
		</td>
		<td class="bodyText">
		<input type=text name="EmailAddress">
		</td>
		<td class="bodyText">
		<input type=submit>
		</td>
		</tr>
	</table>
</form>
<p>
-->
<hr>
<p class="bodyTextBig">
<b>Search by subject:</b>
</p>
<form action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_SHOW_SEARCH_RESULTS%>">
	<input type="hidden" name="<%=EmailConstants.SEARCH_TYPE%>" value="<%=EmailConstants.SEARCH_BY_SUBJECT%>">

	<table border=0 cellpadding=2 cellspacing=0>
		<tr>
		<td class="bodyText">Subject contains:
		</td>
		<td class="bodyText">
		<input type=text name="Subject">
		</td>
		<td class="bodyText">
		<input type=submit>
		</td>
		</tr>
	</table>
</form>

<jsp:include page="../footer.jsp" />


</body>
</html>
