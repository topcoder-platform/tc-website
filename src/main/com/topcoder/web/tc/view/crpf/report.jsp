<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="donationInfo" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<html>
<head>
<title>TopCoder Donation Info</title>
</head>
<body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <rsc:iterator list="<%=donationInfo%>" id="info">
            <tr>
                <td>
                    <rsc:item row="<%=info%>" name="rank"/>
                </td>
                <td>
                    <rsc:item row="<%=info%>" name="handle"/>
                </td>
                <td>
                    $<rsc:item row="<%=info%>" name="amount" format="#.##"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
</body>
</html>
