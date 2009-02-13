<%@ taglib uri="/email-taglib.tld" prefix="email"%>
<%@ page errorPage="../error.jsp" %>
<jsp:useBean id="ScheduledJob" scope="session" class="com.topcoder.web.email.bean.ScheduledJobForm" />
<jsp:include page="../js/validate-js.jsp" />
<%@ page import="java.util.*" %>

<SCRIPT Language="javascript"> <!--

function validate()
{
	msg = checkEmpty('Sender name', document.forms.frmJob.fromPersonal.value);
	if (msg != "") {
		alert(msg);
		frmJob.fromPersonal.select();
		return false;
	}

	msg = checkEmailAddress('Sender e-mail', document.forms.frmJob.fromAddress.value);
	if (msg != "") {
		alert(msg);
		frmJob.fromAddress.select();
		return false;
	}

	startDate = new Date(document.forms.frmJob.startYear.value,
			document.forms.frmJob.startMonth.value,
			document.forms.frmJob.startDay.value,
			document.forms.frmJob.startHour.value,
			document.forms.frmJob.startMinutes.value,
			0);
	endDate = new Date(document.forms.frmJob.endYear.value,
			document.forms.frmJob.endMonth.value,
			document.forms.frmJob.endDay.value,
			document.forms.frmJob.endHour.value,
			document.forms.frmJob.endMinutes.value,
			0);

	if (endDate.getTime() < startDate.getTime()) {
		alert("The start time must be earlier than the end time");
		return false;
	}

	frmJob.submit();
}

//--> </SCRIPT>

	<jsp:useBean id="Error" scope="request" class="java.util.ArrayList" />
<p class="bodyText"
	<font color=#ff0000>
	<ul>
	<email:iterator id="errorMessage" collection="<%=Error%>">
		<li><%=errorMessage%>
	</email:iterator>
	</ul>
	</font>
</p>


<table cellpadding=2>

<tr>
<td class="bodyText">Sender name:
</td>

<td class="bodyText"><input type="text" size=40 maxlength=255 name="fromPersonal" value="<jsp:getProperty name="ScheduledJob" property="fromPersonal"/>"/>
</td>
</tr>

<tr>
<td class="bodyText">Sender e-mail:
</td>

<td class="bodyText"><input type="text" size=40 maxlength=200 name="fromAddress" value="<jsp:getProperty name="ScheduledJob" property="fromAddress"/>"/>
</td>
</tr>

<tr>
<td class="bodyText">Subject:
</td>
<td class="bodyText"><input type="text" size=80 maxLength=255 name="subject" value="<jsp:getProperty name="ScheduledJob" property="subject"/>"/>
</td>
</tr>

<tr>
<td class="bodyText">Start time:
</td>
<td class="bodyText">
<email:monthSelect
	name="startMonth"
	selectedValue="<%=ScheduledJob.getStartMonth()%>"
	onChange="reload();"/>
<email:daySelect
	name="startDay"
	month="<%=ScheduledJob.getStartMonth()%>"
	year="<%=ScheduledJob.getStartYear()%>"
	selectedValue="<%=ScheduledJob.getStartDay()%>"/>
<email:yearSelect
	name="startYear"
	startingYear="<%=String.valueOf((new GregorianCalendar()).get(Calendar.YEAR))%>"
	numYearsAhead="5"
	selectedValue="<%=ScheduledJob.getStartYear()%>"
	onChange="reload();"/>
@ <email:numericRangeSelect
	name="startHour"
	low="00" high="23"
	numDigitsToDisplay="2"
	selectedValue="<%=ScheduledJob.getStartHour()%>"/>:
<email:numericRangeSelect
	name="startMinutes"
	low="00"
	high="59"
	numDigitsToDisplay="2"
	selectedValue="<%=ScheduledJob.getStartMinutes()%>"/>
</td>
</tr>

<tr>
<td class="bodyText">End time:
</td>
<td class="bodyText">
<email:monthSelect
	name="endMonth"
	selectedValue="<%=ScheduledJob.getEndMonth()%>"
	onChange="reload();"/>
<email:daySelect
	name="endDay"
	month="<%=ScheduledJob.getEndMonth()%>"
	year="<%=ScheduledJob.getEndYear()%>"
	selectedValue="<%=ScheduledJob.getEndDay()%>"/>
<email:yearSelect
	name="endYear"
	startingYear="<%=String.valueOf((new GregorianCalendar()).get(Calendar.YEAR))%>"
	numYearsAhead="5"
	selectedValue="<%=ScheduledJob.getEndYear()%>"
	onChange="reload();"/>
@ <email:numericRangeSelect
	name="endHour"
	low="00"
	high="23"
	numDigitsToDisplay="2"
	selectedValue="<%=ScheduledJob.getEndHour()%>"/>:
<email:numericRangeSelect
	name="endMinutes"
	low="00"
	high="59"
	numDigitsToDisplay="2"
	selectedValue="<%=ScheduledJob.getEndMinutes()%>"/>
</td>
</tr>

<tr>
<td class="bodyText"></td>
<td class="bodyText"><input type="checkbox" name="sendTest" 
value="x" <jsp:getProperty name="ScheduledJob" property="sendTest"/>/>
Schedule Test Message</td>
</tr>

<tr>
<td class="bodyText"></td>
<td class="bodyText"><input type="checkbox" name="sendReminder" 
value="x" <jsp:getProperty name="ScheduledJob" property="sendReminder"/>/>
Schedule Reminder</td>
</tr>

<tr>
<td class="bodyText"></td>
<td class="bodyText"><input type="checkbox" name="sendReport" 
value="x" <jsp:getProperty name="ScheduledJob" property="sendReport"/>/>
Schedule Report</td>
</tr>

</table>
