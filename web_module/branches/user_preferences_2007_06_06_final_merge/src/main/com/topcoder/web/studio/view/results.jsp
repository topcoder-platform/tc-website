<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.PrizeType" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<% ResultSetContainer results = (ResultSetContainer) request.getAttribute("results");%>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<div class="linkBox">
    <studio:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <a href="/?<%=Constants.MODULE_KEY%>=ViewPastContests">Past Contests</a> &gt;
    ${contest.name}
</div>

<h1>Winners</h1>

<table class="stat" cellpadding="0" cellspacing="0" style="width:740px">
<tbody>
<tr>
    <td class="NW">&nbsp;</td>
    <td class="title" colspan="7">Winners</td>
    <td class="NE">&nbsp;</td>
</tr>
<tr>
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
    <td class="headerR">
        Score
    </td>
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
            <studio:handle coderId="<%=resultRow.getLongItem("submitter_id")%>"/>
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
        <td class="valueC">
            <c:choose>
                <c:when test="<%=resultRow.getBooleanItem("is_image")%>">
                    <div align="center">
                        <strong>ID:</strong> <rsc:item name="submission_id" row="<%=resultRow%>"/>
                        <div style="overflow: hidden; width: 300px;">
                            <studio_tags:submissionDisplay submissionId="${resultRow.map['submission_id']}" width="${resultRow.map['width']}" height="${resultRow.map['height']}"/>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div align="center">
                        <strong>ID:</strong> <rsc:item name="submission_id" row="<%=resultRow%>"/>
                        <div id="pop<%=i%>" class="popUp">
                            <div>View submission</div>
                        </div>
                        <br />
                        <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                            <img src="/i/layout/magnify.gif" alt="" onmouseover="popUp(this,'pop<%=i%>')" onmouseout="popHide()"/>
                        </a>
                    </div>
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
    <td class="SW">&nbsp;</td>
    <td class="title" colspan="7">
        <a href="/?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="small">...view all submissions</a>
    </td>
    <td class="SE">&nbsp;</td>
</tr>
</tbody>
</table>


</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>