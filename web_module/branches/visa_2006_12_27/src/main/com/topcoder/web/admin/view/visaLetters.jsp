<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td>
            <jsp:include page="left.jsp"/>
        </td>
        <td>
        <form action="/admin/?module=VisaLetters" >
        	View request letters with status:<br>
			<tc-webtag:chkBox name="pending" value="true"/>Pending<br>
			<tc-webtag:chkBox name="sent" value="true"/>Sent		<br>	
			<tc-webtag:chkBox name="denied" value="true"/>Denied<br>
			<br>
			
			<tc-webtag:listSelect name="event" list="${requestScope.eventList}"/>
			<input type="submit" value="Search">
		</form>
        </td>
    </tr>
</table>
</body>
</html>
