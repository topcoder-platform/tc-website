<%@ page import="com.topcoder.web.creative.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_creative"/>
    </jsp:include>
    <style type="text/css">
        .bodySE {
            margin: 0px;
            padding: 0px;
            background: transparent url( /i/creative/layout/bodyNW.png ) bottom right no-repeat;
        }
    </style>
</head>

<body>
<jsp:include page="creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="creativeLeft.jsp">
    <jsp:param name="node" value="active_contests"/>
</jsp:include>

<div class="contentOuter">
<div class="contentInner">

<div class="linkBox"><A href="">discuss this</A></div>

<div class="breadcrumb">
    <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A>
    &gt; ${contest.name}
</div>

<h1>Project Details</h1>

<div align="center">
<div style="width:510px;" align="left">

    <div class="header">Overview</div>
    ${contest.overview.value}
    <br><br>
    <strong>Documentation</strong><br>
    <c:forEach items="${contest.documents}" var="document">
        ${document.type.description}:
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                ${document.originalFileName}</a> <br/>
    </c:forEach>
    <br><br>

    <div class="header">Payment</div>
    ${contest.prizeDescription.value}
    <br><br>

    <c:choose>
        <c:when test="${fn:length(contest.prizes)==1}">
            <c:forEach items="${contest.prizes}" var="prize">
                <strong>Winning Designer: <fmt:formatNumber value="${prize.amount}" type="currency"/></strong>
            </c:forEach>
            <br><br>
        </c:when>
        <c:otherwise>
            <% int i = 1;%>
            <c:forEach items="${contest.prizes}" var="prize">
                <strong>Prize <%=i++%>: <fmt:formatNumber value="${prize.amount}" type="currency"/></strong>
            </c:forEach>
            <br><br>
        </c:otherwise>
    </c:choose>


    <div class="header">Eligibility</div>

    <p>You must be a TopCoder Studio member, at least 18 years of age, meeting all of the membership requirements.
        In addition, you must fit into one of the following categories.
    </p>

    <p>If you reside in the United States, you must be either:</p>
    <ul>
        <li>A US Citizen</li>
        <li>A Lawful Permanent Resident of the US</li>
        <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
            permitting unrestricted employment in the U.S.</li>
    </ul>

    <p>If you do not reside in the United States:</p>
    <ul>
        <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will
            not need to do anything to become authorized)</li>
    </ul>


    <br><br>

    <div class="header">Timeline</div>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et
    dolore
    magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd
    gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur
    sadipscing
    elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
    vero eos et
    accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
    dolor sit
    amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
    et
    dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet
    clita kasd
    gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
    <br><br>


    <div align="center">
        <table cellpadding="0" cellspacing="0" class="stat" width="250">
            <tbody>
                <tr class="light">
                    <td class="value"><strong>Start Date:</strong></td>
                    <td class="valueR">
                        <tc-webtag:format object="${contest.startTime}" format="EEEE, MMMM d, yyyy 'at' hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                </tr>
                <tr class="light">
                    <td class="value"><strong>End Date:</strong></td>
                    <td class="valueR">
                        <tc-webtag:format object="${contest.endTime}" format="EEEE, MMMM d, yyyy 'at' hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                </tr>
            </tbody>
        </table>
    </div>

    <br><br>


    <div class="header">Upload Your Submission</div>
    <br><br>
    <A href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Submit</A>

</div>
</div>

<jsp:include page="creativeFoot.jsp"/>
</div>
</div>
</body>
</html>
