<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>
<jsp:useBean id="ScheduledJob" scope="session" class="com.topcoder.web.email.bean.ScheduledJobForm" />

<html>
<head>
	<title>Predefined Query Inputs</title>
</head>
<body>

<jsp:include page="../header.jsp" />
<p class="bodyTextBig"><b>Enter query inputs</b></p>
<p class="bodyText">
<form action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_SET_COMMAND_INPUTS_ADD%>">

	<table cellpadding=2>
	<email:commandInputIterator id="commandInput" commandId="<%=ScheduledJob.getCommandId()%>">
		<tr>
		<td class="bodyText"><jsp:getProperty name="commandInput" property="description"/>:
		</td>
		<td class="bodyText"><input type="text" size="30" name="<%=EmailConstants.FIELD_PREFIX%><%=commandInput.getId()%>">
		</td>
		</tr>
	</email:commandInputIterator>
	</table>
	<p>
	<input type="submit" value="next &gt;&gt;">

</form>
</p>
<jsp:include page="../footer.jsp" />


</body>
</html>
