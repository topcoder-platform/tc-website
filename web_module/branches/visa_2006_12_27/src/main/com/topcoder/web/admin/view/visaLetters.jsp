<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.admin.Constants" %>
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
        <form action="/admin/VisaLetters" >
			<tc-webtag:chkBox name="pending"/>View Pending
			<tc-webtag:chkBox name="sent"/>View Sent			
			<tc-webtag:chkBox name="denied"/>View Denied
			
			<input type="submit" value="Search">
		</form>
        </td>
    </tr>
</table>
</body>
</html>
