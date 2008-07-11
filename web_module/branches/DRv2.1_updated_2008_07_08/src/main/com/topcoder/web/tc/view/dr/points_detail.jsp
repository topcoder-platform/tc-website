<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Digital Run Leaderboard - Points detail</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
    
<body>
<jsp:include page="/top.jsp"/>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody">

                <thead>
                    <tr>
                        <th>
                            <a href="/dr?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("dr_points_desc")%>"/>">Seed</a>
                        </th>
                        <th>
                            <a href="/dr?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("amount")%>"/>">Seed</a>
                        </th>
                        <th>
                            <a href="/dr?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("reference_id")%>"/>">Seed</a>
                        </th>
                    </tr>
                </thead>
                <tbody>
<%boolean even = false;%>
<rsc:iterator list="<%=rsc%>" id="resultRow">
<tr class="<%=(even ? "dark" : "light")%>">
<td class="valueC">${resultRow.map["dr_points_desc"]}</td>
<td class="valueC">${resultRow.map["amount"]}</td>
<td class="valueC">${resultRow.map["reference_id"]}</td>
</tr>
<%even = !even;%>
</rsc:iterator>
                </tbody>
                </table>

            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>