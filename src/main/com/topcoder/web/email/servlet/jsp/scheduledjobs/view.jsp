<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<jsp:useBean id="ScheduledJob" scope="request" class="com.topcoder.web.email.bean.ScheduledJobForm" />

<html>
<head>
	<title>View job</title>
</head>
<body>

<jsp:include page="../header.jsp" />

<p class="bodyTextBig">Viewing job</p>

<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<%@ page import="java.util.*" %>

<table cellpadding=2>

<tr>
<td class="bodyText">Sender name:
</td>
<td class="bodyText">
<jsp:getProperty name="ScheduledJob" property="fromPersonal"/>
</td>
</tr>

<tr>
<td class="bodyText">Sender e-mail:
</td>
<td class="bodyText">
<jsp:getProperty name="ScheduledJob" property="fromAddress"/>
</td>
</tr>

<tr>
<td class="bodyText">Subject:
</td>
<td class="bodyText"><jsp:getProperty name="ScheduledJob" property="subject"/>
</td>
</tr>

<tr>
<td class="bodyText">Start time:
</td>
<td class="bodyText">
<%=Integer.parseInt(ScheduledJob.getStartMonth())+1%>
/
<%=ScheduledJob.getStartDay()%>
/
<%=ScheduledJob.getStartYear()%>
@
<%=ScheduledJob.getStartHour()%>
:
<%=ScheduledJob.getStartMinutes()%>
</td>
</tr>

<tr>
<td class="bodyText">End time:
</td>
<td class="bodyText">
<%=Integer.parseInt(ScheduledJob.getEndMonth())+1%>
/
<%=ScheduledJob.getEndDay()%>
/
<%=ScheduledJob.getEndYear()%>
@
<%=ScheduledJob.getEndHour()%>
:
<%=ScheduledJob.getEndMinutes()%>
</td>
</tr>

<tr>
<td class="bodyText">Template:
</td>
<td class="bodyText">
<email:templateName id="name" templateId="<%=ScheduledJob.getTemplateId()%>">
	<%=name%>
</email:templateName>
</td>
<tr>

<% if (!String.valueOf(EmailConstants.NO_LIST_ID).equals(ScheduledJob.getListId())) { %>
		<td class="bodyText">Address list:
		</td>
		<td class="bodyText">
		<email:addressListName id="name" listId="<%=ScheduledJob.getListId()%>">
			<%=name%>
		</email:addressListName>
		</td>
<% } else { %>
		<td valign="top" class="bodyText">Predefined query:
		</td>
		<td valign="top" class="bodyText">
		<email:commandName id="commandName" commandId="<%=ScheduledJob.getCommandId()%>">
			<%=commandName%>
		</email:commandName>
		<email:commandInputIterator id="commandInput" commandId="<%=ScheduledJob.getCommandId()%>"
			commandInputMap="<%=ScheduledJob.getCommandInputMap()%>">
			<br>[<%=commandInput.getDescription()%>: <%=commandInput.getValue()%>]
		</email:commandInputIterator>
		</td>
<% } %>
		</tr>


</table>

<jsp:include page="../footer.jsp" />

</body>
</html>
