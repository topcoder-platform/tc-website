<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-webtags.tld" prefix="rsc" %>
<html>
<head>
<title>TopCoder Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
</head>
<body>

<% ResultSetContainer termsList = (ResultSetContainer)request.getAttribute("terms_list"); %>
<table>
    <rsc:iterator list="<%=termsList%>" id="terms">
        <tr>
            <td><%=terms.getStringItem("terms_text").substring(0, 50)%></td>
            <td><rsc:item row="<%=terms%>" name="terms_of_use_type_desc"/></td>
            <td><rsc:item row="<%=terms%>" name="create_date" format="MM.dd.yyyy H:m:s"/></td>
            <td><rsc:item row="<%=terms%>" name="modify_date" format="MM.dd.yyyy H:m:s"/></td>
        </tr>
    </rsc:iterator>
</table>


</body>
</html>
