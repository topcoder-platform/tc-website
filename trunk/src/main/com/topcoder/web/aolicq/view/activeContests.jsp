<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge :: Powered by TopCoder</title>


    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>

    

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/aolicq/tabs/registerOn.png';
            img.src = '/i/events/aolicq/tabs/submitOn.png';
            img.src = '/i/events/aolicq/tabs/apisOn.png';
            img.src = '/i/events/aolicq/tabs/discussOn.png';
        }
    </script>

</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">
                 
                <div class="contentWithLeft" align="right">
                    <div class="contentTexture">
                        <jsp:include page="leftBox.jsp"/>
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxHalf">

<h1>Active Contests</h1>

<%--
<div class="tableTabOn" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a></div>
<div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a></div>
--%>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="headerW">
                    <div>&nbsp;</div>
                </td>
                <td class="header" colspan="2" width="100%">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
                </td>
                <td class="headerC">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start
                        Date</a></td>
                <td class="headerC">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End
                        Date</a></td>
                <td class="headerR" nowrap="nowrap">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("amount")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">First Prize</a>
                </td>
                <td class="headerC">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("registrants")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Registrants</a>
                </td>
                <td class="headerC">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a>
                </td>
                <td class="header">&nbsp;</td>
                <td class="headerE">
                    <div>&nbsp;</div>
                </td>
            </tr>
            <c:choose>
                <c:when test="${fn:length(contests)==0}">
                    <tr class="light">
                        <td class="valueW">
                            <div>&nbsp;</div>
                        </td>
                        <td class="valueC" colspan="8">
                            <div align="center" style="margin: 40px 0px 40px 0px;">
                                There are currently no active contests, but check back soon.
                            </div>
                        </td>
                        <td class="valueE">
                            <div>&nbsp;</div>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
        
                    <% boolean even = true;%>
                    <rsc:iterator list="<%=contests%>" id="resultRow">
                        <tr class="<%=even?"light":"dark"%>">
                            <td class="valueW">
                                <div>&nbsp;</div>
                            </td>
                            <td class="value">
                                <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                    <rsc:item name="name" row="<%=resultRow%>"/>
                                </a>
                            </td>
                            <td class="value">
                                <% if ("3008".equals(resultRow.getStringItem("event_id"))) { %>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=aolicq&amp;d4=description"><img src="/i/tournament/tco08/emblem.png" alt="" onmouseover="popUp(this,'popTCO08')" onmouseout="popHide()" style="display: block; margin: 4px;"/></a>
                                <% } else { %>
                                &nbsp;
                                <% } %>
                            </td>
                            <td class="valueC">
                                <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                            </td>
                            <td class="valueC">
                                <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                            </td>
                            <td class="valueR">
                                <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                            </td>
                            <td class="valueC">
                                <rsc:item name="registrants" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC">
<%--
                                <c:choose>
                                    <c:when test="<%=resultRow.getBooleanItem("show_submissions")%>">
                                        <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                            <rsc:item name="submission_count" row="<%=resultRow%>"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
--%>
                                        <rsc:item name="submission_count" row="<%=resultRow%>"/>
<%--
                                    </c:otherwise>
                                </c:choose>
--%>
                            </td>
        
                            <td class="valueC" nowrap="nowrap">
                                <% if (resultRow.getIntItem("is_user_registered") == 1) { %>
                                <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" onfocus="this.blur();"><img src="/i/events/aolicq/interface/btnSubmitOrganize.png" alt="Submit &amp; Organize" style="margin: 6px 0px 6px 0px;"/></a>
                                <% } else { %>
                                <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" onfocus="this.blur();"><img src="/i/events/aolicq/interface/btnRegister.png" alt="Register" style="margin: 6px 0px 6px 0px;"/></a>
                                <% } %>
        
                            </td>
        
                            <td class="valueE">
                                <div>&nbsp;</div>
                            </td>
                        </tr>
                        <% even = !even;%>
                    </rsc:iterator>
                </c:otherwise>
            </c:choose>
        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>

        </div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>