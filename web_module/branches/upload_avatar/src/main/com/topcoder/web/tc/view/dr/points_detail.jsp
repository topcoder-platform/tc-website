<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseProcessor" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="context" value='${isDevelopment ? "development" : isDesign ? "design" : "component"}' />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Digital Run Leaderboard</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
    
<body>
<jsp:include page="/top.jsp"/>

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

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="digital_run_20061031"/>
        <jsp:param name="title" value="${trackInfo.trackDesc} Leaderboard Details"/>
        </jsp:include>

    <div class="fixedWidthBody">
</div>

<br /><br />

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="6">
            <a href="<%=sessionInfo.getServletPath()%>?module=ViewLeaderBoard&amp;tid=${tid}">${trackInfo.trackDesc}</a> Leaderboard Details - <tc-webtag:handle coderId='${cr}' context='${context}'/>
        </td>
    </tr>
    <tr>
        <td class="header">Description</td>
        <td class="header">Awarded</td>
        <td class="header">Posted</td>
        <td class="headerC">Amount</td>
        <td class="headerC">Taxable</td>
        <td class="headerC">Reference</td>
    </tr>

    <rsc:iterator list="<%=rsc%>" id="resultRow">
    <tr class='${status.index % 2 == 1? "dark" : "light" }'>
        <td class="value">${resultRow.map["dr_points_desc"]}</td>
        <td class="value"><rsc:item name="award_date" row="<%=resultRow%>" format="MM.dd.yy"/></td>
        <td class="value"><rsc:item name="application_date" row="<%=resultRow%>" format="MM.dd.yy"/></td>
        <td class="valueC">${resultRow.map["amount"]}</td>
        <td class="valueC">
            <c:choose>
                <c:when test="${resultRow.map['taxable'] == 't'}">Yes</c:when>
                <c:otherwise>No</c:otherwise>
            </c:choose>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${resultRow.map['dr_points_reference_type_id'] == 1}">
                    <c:choose>
                        <c:when test="${not pf}">
                            <A HREF="/tc?module=CompContestDetails&pj=${resultRow.map['reference_id']}" CLASS="statLink">
                                Contest Details
                            </A>
                        </c:when>
                        <c:otherwise>
                            <A HREF="/tc?module=ViewRegistrants&pj=${resultRow.map['reference_id']}" CLASS="statLink">
                                Contest Details
                            </A>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    &nbsp;
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
    </rsc:iterator>
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