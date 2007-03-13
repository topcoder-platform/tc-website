<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
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
    <script type="text/javascript"><!--
    function resizeImage(myImage) {
        var myHeight = Math.round(myImage.offsetHeight * 300 / myImage.offsetWidth);
        myImage.style.width = 300 + 'px';
        myImage.style.height = myHeight + 'px';
    }
    //-->
    </script>
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
    <A href="/?<%=Constants.MODULE_KEY%>=ViewPastContests">Past Contests</A> &gt;
    ${contest.name}
</div>

<h1>Winners</h1>

<table class="stat" cellpadding="0" cellspacing="0" style="width:740px">
    <tbody>
        <tr>
            <td class="NW">&nbsp;</td>
            <td class="title" colspan="7">Results</td>
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
                Prize
            </td>
            <td class="headerC">
                Registered
            </td>
            <td class="headerC">
                Submitted
            </td>
            <td class="headerC">
                Submission ID
            </td>
            <td class="header">
                Submission
            </td>
            <td class="headerE">
                <div>&nbsp;</div>
            </td>
        </tr>


        <% boolean even = true;
            int i = 0; %>


        <rsc:iterator list="<%=results%>" id="resultRow">
            <tr class="<%=even?"light":"dark"%>">
                <td class="valueW">
                    <div>&nbsp;</div>
                </td>
                <td class="valueC">
                    <rsc:item name="place" row="<%=resultRow%>"/>
                </td>
                <td class="value">
                    <studio:handle coderId="<%=resultRow.getLongItem("submitter_id")%>"/>
                </td>
                <td class="valueC">
                    <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00"/>
                </td>
                <td class="valueC">
                    <rsc:item name="reg_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueC">
                    <rsc:item name="submit_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueC">
                    <rsc:item name="submission_id" row="<%=resultRow%>"/>
                </td>
                <td class="value">
                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("is_image")%>">
                            <%--THIS IS A CRAPPY WAY TO MAKE THE PAGE MANAGEABLE BEFORE RESIZING THE IMAGE--%>
                            <div align="center">
                                <div style="overflow: hidden; width: 300px;">
                                    <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>"><img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>" alt="<%=Constants.SUBMISSION_ID%>" style="display: block;" onload="resizeImage(this);"/></A>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div align="center">
                                <div id="pop<%=i%>" class="popUp">
                                    <div>View submission</div>
                                </div>
                                <A href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                                    <img src="/i/layout/magnify.gif" alt="" onmouseover="popUp(this,'pop<%=i%>')" onmouseout="popHide()"/>
                                </A>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="valueE">
                    <div>&nbsp;</div>
                </td>
            </tr>
        </rsc:iterator>

        <tr>
            <td class="SW">&nbsp;</td>
            <td class="title" colspan="7">
                <a href="/?module=ViewSubmissions&ct=${contest.id}" class="small">...view all submissions</a>
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