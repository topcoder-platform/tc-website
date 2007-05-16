<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.tc.Constants,
                 java.util.HashMap" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<table>
	<rsc:iterator list="${param.results}" id="row"> 
		<tr>
			<td><rsc:item name="current_place" row="<%=row %>"> </td>
			<td><tc-webtag:handle coderId='<%= row.getLongItem("coder_id") %>' context='design'/></td>
			
		</tr>
	</rsc:iterator>
</table>

</BODY>
</HTML>