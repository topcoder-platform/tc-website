<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.openaim.Constants" %>
<%@ page import="com.topcoder.web.openaim.model.PrizeType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="openaim_tags" tagdir="/WEB-INF/tags" %>
<% ResultSetContainer results = (ResultSetContainer) request.getAttribute("results");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
    </jsp:include>
    
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="tcTop.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<div class="linkBox">
    <openaim:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests">Past Contests</a> &gt;
    ${contest.name}
</div>

<h1>Winners</h1>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr><td class="title" colspan="8">Winners</td></tr><tr>
    <td class="headerW">
        <div>&nbsp;</div>
    </td>
    <td class="headerC" width="1%">
        Place
    </td>
    <td class="header">
        Handle
    </td>
    <td class="headerC">
        Registered
    </td>
    <td class="headerC">
        Submitted
    </td>
    <td class="headerR">
        Prize
    </td>
        <%--
    <td class="headerR">
        Score
    </td>
    --%>
    <td class="headerC">
        Submission
    </td>
    <td class="headerE">
        <div>&nbsp;</div>
    </td>
</tr>


<% boolean even = true;
    int i = 0; %>


<c:set var="bonusPrize" value="<%=PrizeType.BONUS%>"/>
<rsc:iterator list="<%=results%>" id="resultRow">
    <tr><td class="space" colspan="8">&nbsp;</td></tr>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW">
            <div>&nbsp;</div>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${bonusPrize==resultRow.map['prize_type_id']}">
                    Client <br /> Selection
                </c:when>
                <c:otherwise>
                    <rsc:item name="placed" row="<%=resultRow%>"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="value">
            <tc-webtag:handle coderId="<%=resultRow.getLongItem("submitter_id")%>"/>
        </td>
        <td class="valueC">
            <rsc:item name="reg_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
        <td class="valueC">
            <rsc:item name="submit_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
        <td class="valueR">
            <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00"/>
        </td>
        <%--
        <td class="valueR">

            <c:choose>
                <c:when test="${hasScores}">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissionResults&amp;<%=Constants.SUBMISSION_ID%>=${resultRow.map['submission_id']}">
                        <rsc:item name="final_score" row="<%=resultRow%>" format="0.00"/>
                    </a>
                </c:when>
                <c:otherwise>
                    n/a
                </c:otherwise>
            </c:choose>
        </td>
        --%>
        <td class="valueC">
            <c:choose>
                <c:when test="${resultRow.map['show_submissions']}">
                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("is_image")%>">
                            <div align="center">
                                <strong>ID:</strong> <rsc:item name="submission_id" row="<%=resultRow%>"/>
                                <div style="overflow: hidden; width: 300px;">
                                    <openaim_tags:submissionDisplay submissionId="${resultRow.map['submission_id']}" width="${resultRow.map['width']}" height="${resultRow.map['height']}"/>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div align="center">
                                <strong>ID:</strong> <rsc:item name="submission_id" row="<%=resultRow%>"/>
                                <br />
                                <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                                    <img src="/i/events/openaim/interface/magnify.png" alt="" onmouseover="popUp(this,'popView')" onmouseout="popHide()"/>
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <img src="/i/events/openaim/interface/magnifyFade.png" alt="" />
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueE">
            <div>&nbsp;</div>
        </td>
    </tr>
    <% even = !even;
        i++; %>
</rsc:iterator>
<tr>
    <td class="btnRight" colspan="9"><div><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="small">...view all submissions</a></div></td>
</tr>

</tbody>
</table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>
<div id="popView" class="popUp">
    <div>View submission</div>
</div>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="tcFoot.jsp"/>

    </div>
</body>
</html>