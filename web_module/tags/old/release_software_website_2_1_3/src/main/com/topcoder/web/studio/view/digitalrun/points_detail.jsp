<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.studio.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseProcessor" %>
<%@ page contentType="text/html;charset=utf-8" %>
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
    <title>TopCoder Studio :: Studio Cup</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="studio_digitalrun"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../top.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="digitalrun"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<jsp:include page="2008v2/nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="leaderboard"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>
<br/><br/>
<table class="drStat" cellpadding="0" cellspacing="0" width="100%">
<thead>
    <tr>
        <th class="title" colspan="5">
            <a href="<%=sessionInfo.getServletPath()%>?module=ViewLeaderBoard&amp;tid=${tid}">${trackInfo.trackDesc}</a> Leaderboard Details - <tc-webtag:handle coderId='${cr}' context='${context}'/>
        </th>
    </tr>
    <tr>
        <th>Description</th>
        <th class="c">Awarded</th>
        <th class="c">Posted</th>
        <th class="c">Amount</th>
        <th class="c">Reference</th>
    </tr>
</thead>    
<tbody>
    <rsc:iterator list="<%=rsc%>" id="resultRow">
        <tr class='${status.index % 2 == 1? "odd" : "even" }'>
            <td>${resultRow.map["dr_points_desc"]}</td>
            <td class="c"><rsc:item name="award_date" row="<%=resultRow%>" format="MM.dd.yy"/></td>
            <td class="c"><rsc:item name="application_date" row="<%=resultRow%>" format="MM.dd.yy"/></td>
            <td class="c">${resultRow.map["amount"]}</td>
            <td class="c">
                <c:choose>
                    <c:when test="${resultRow.map['dr_points_reference_type_id'] == 3}">
                        <c:choose>
                            <c:when test="${not pf}">
                                <a href="/?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['reference_id']}">
                                    Contest Details
                            </c:when>
                            <c:otherwise>
                                <a href="/?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['reference_id']}">
                                    Contest Details
                                </a>
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
</tbody></table>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>

    </div>
</body>
</html>