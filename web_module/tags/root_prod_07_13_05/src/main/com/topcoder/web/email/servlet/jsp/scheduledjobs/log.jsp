<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Job Log</title>
</head>
<body>

<jsp:include page="../header.jsp" />

<jsp:include page="../js/task-js.jsp" />

<p class="bodyTextBig"><b>Job log</b></p>

<SCRIPT Language="javascript"> <!--

function scroll(sr, er)
{
	document.forms.frmLog.<%=EmailConstants.SR%>.value=""+sr;
	document.forms.frmLog.<%=EmailConstants.ER%>.value=""+er;
	document.forms.frmLog.submit();
}

function detail(detailId) {
	document.forms.frmDetail.<%=EmailConstants.JOB_DETAIL_ID%>.value=""+detailId;
	document.forms.frmDetail.submit();
}

//--> </SCRIPT>

<form name="frmDetail" method="post" action="<%=response.encodeURL(EmailConstants.ALIAS)%>">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_SHOW_LOG_DATA%>">
	<input type="hidden" name="<%=EmailConstants.JOB_DETAIL_ID%>">
	<input type="hidden" name="<%=EmailConstants.ID%>" value="<%=request.getParameter(EmailConstants.ID)%>">
</form>


<%
  int sr = Integer.parseInt((String)request.getAttribute(EmailConstants.SR));
  int er = Integer.parseInt((String)request.getAttribute(EmailConstants.ER));
%>

<form name="frmLog" method="post" action="<%=response.encodeURL(EmailConstants.ALIAS)%>">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_SHOW_LOG%>">
	<input type="hidden" name="<%=EmailConstants.SR%>">
	<input type="hidden" name="<%=EmailConstants.ER%>">
	<input type="hidden" name="<%=EmailConstants.ID%>" value="<%=request.getParameter(EmailConstants.ID)%>">

	<table border=1 cellpadding=2 cellspacing=0>
		<tr>
		<th align="left" class="bodyText">Status</th>
		<th align="left" class="bodyText">Reason</th>
		</tr>

	<email:scheduledJobLogIterator id="logEntry" logList="<%=(List) request.getAttribute(EmailConstants.LOG)%>">
		<tr>
		<td class="bodyText">
		<a href="javascript:detail('<%=logEntry.getDetailId()%>');">
			<%=logEntry.getDetailStatus()%>
		</a>
		</td>
		<td class="bodyText"><%=logEntry.getDetailReason()%>
		</td>
		</tr>
	</email:scheduledJobLogIterator>
	</table>
<p>
<% if (String.valueOf(request.getAttribute(EmailConstants.PREV)).equals("1")) { %>
	<a href="javascript:scroll('<%=(sr-(er-sr))%>', '<%=sr%>');">
	[&lt;&lt; Prev]


	</a>
<% } %>
&nbsp;
<% if (String.valueOf(request.getAttribute(EmailConstants.NEXT)).equals("1")) { %>
	<a href="javascript:scroll('<%=er%>', '<%=(er+(er-sr))%>');">
	[Next &gt;&gt;]
	</a>
<% } %>
</form>
<jsp:include page="../footer.jsp" />

</body>
</html>
