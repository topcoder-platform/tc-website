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

<p align="center">
<strong>You have already submitted a ballot for this vote.</strong>
</p>
<p align="center">
Here is your ballot:
</p>
            <table id="ranked" class="list" style="width: 100%; margin-bottom: 0px;" cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                        <td class="title" colspan="2"><span class="title">My Vote</span></td>
                    </tr>


                    <tr>
                        <td class="headerC" style="padding-left: 0px;">
                            <div style="width: 45px;">Rank</div>
                        </td>
                        <td class="header" width="100%">
                            Candidate
                        </td>
                    </tr>
                </thead>
                <tbody id="rankedBody">
                    <% boolean even = true;%>
                    <c:forEach items="${votes}" var="vote">

                        <tr class="<%=even?"light":"dark"%>">
                            <td class="valueC" style="padding-left: 0px;">
                                    ${vote.rank}
                            </td>
                            <td class="value" nowrap="nowrap">
                                    ${vote.id.candidate.name}
                                <a href="#" target="_blank">
                                    <img src="/i/layout/disk.gif" alt="" align="absmiddle" onMouseOver="popUp(this,'magglassPopup')" onMouseOut="popHide()"/>
                                </a>
                            </td>
                        </tr>
                        <% even = !even;%>
                    </c:forEach>
                </tbody>
            </table>

            <%-- MAGNIFYING GLASS POPUP --%>
            <div id="magglassPopup" class="popUp">
                <div>Download submission</div>
            </div>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>