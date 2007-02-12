<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>CSF</title>
<jsp:include page="../style.jsp">
    <jsp:param name="key" value="csf"/>
</jsp:include>
<script type="text/javascript" src="/js/popup.js"></script>

</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="../top.jsp"/>

<jsp:include page="../primaryNav.jsp">
    <jsp:param name="selectedTab" value="competitions"/>
</jsp:include>

<div id="main">
<div class="pageHeader">
    <span class="pageName">Vote</span>
</div>

<%----------------------------------------------------------------------------------------%>

<table id="ranked" class="stat" style="width: 100%; margin-bottom: 0px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="title" colspan="2"><span class="title">My Vote</span></td>
        </tr>


        <tr>
            <td class="headerC">
                <div style="width: 45px;">Rank</div>
            </td>
            <td class="header" width="100%">
                Candidate
            </td>
        </tr>
    </thead>
    <tbody id="rankedBody">
</table>
<%-- table for the disabled candidates --%>
<table id="unranked" class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
    <tbody id="unRankedBody">
        <c:forEach items="${votes}" var="vote">

            <tr class="disabled">
                <td class="valueC">
                    ${vote.rank}
                </td>
                <td class="value" nowrap="nowrap">
                        ${vote.candidate.name}
                    <a href="#" target="_blank">
                        <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
                    </a>
                </td>
            </tr>

        </c:forEach>
    </tbody>
</table>

<%-- MAGNIFYING GLASS POPUP --%>
<div id="magglassPopup" class="popUp">
    <div>View full submission</div>
</div>

</div>

<jsp:include page="../foot.jsp"/>
</div>
</div>

</body>
</html>