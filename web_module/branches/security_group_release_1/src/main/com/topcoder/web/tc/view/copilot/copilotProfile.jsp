<%--
  - Author: TCSASSEMBLER
  - Date: 28th Aug 2010
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page for show the profile of a copilot in the copilot pool.
--%>
<%@ page import="com.topcoder.direct.services.copilot.dto.CopilotProfileDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>TopCoder :: Copilot Profile</title>
    <jsp:include page="/script.jsp"/>
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="/js/tools.tooltip.js"></script>
    <!-- Google visualization charts -->
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <!-- should be put after Google visualization API -->
    <c:if test="${hasContestData}">
        <script type="text/javascript" src="/js/copilot-profile.js"></script>
    </c:if>
    <!-- put the generated chart json data in the header -->
    <script language="JavaScript" type="text/javascript">

        var piechart = <%= request.getAttribute("pieChartData")%>;
        var barchart = <%= request.getAttribute("barChartData")%>;

    </script>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_copilot"/>
    </jsp:include>
</head>

<body>


<jsp:include page="/top.jsp"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tbody>
    <tr valign="top">

        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="copilots_pool"/>
            </jsp:include>
        </td>

        <%
            CopilotProfileDTO profile = (CopilotProfileDTO) request.getAttribute("copilotProfile");

            // Prepare copilot earnings
            String earnings = "n/a";

            if (profile.getCopilotProfile().isShowCopilotEarnings() && profile.getEarnings() >= 0) {
                earnings = NumberFormat.getCurrencyInstance(Locale.US).format(profile.getEarnings());
            }

            // Prepare copilot reliability
            String reliability = "n/a";

            if (profile.getCopilotProfile().getReliability() >= 0) {
                // reliability = new DecimalFormat("##.##").format(profile.getCopilotProfile().getReliability()) + "%";
            }

            // Prepare copilot fulfillment
            String fulfillment = "n/a";

            if (profile.getTotalContests() != 0) {
                float value = (profile.getTotalContests() - profile.getTotalFailedContests()) * 1.0f / profile.getTotalContests();
                fulfillment =  new DecimalFormat("##.##").format(value * 100) + "%";
            }

        %>

        <td width="100%" align="left" class="bodyColumn">
            <!-- the copilot profile content -->
            <div class="copilot-pool" id="copilot-profile">
                <div class="header-title">
                    <div class="left-title"><img src="/i/copilots/copilot-statistics.png" alt=""/></div>
                    <div class="right-title b">
                        Copilot Profile
                        
                        <!--
                        &nbsp;|&nbsp;
                
                        <a href="/tc?module=ViewCopilotProjectHistory&amp;pid=${copilotProfile.copilotProfile.userId}">Project
                        History</a>
                        -->
                        
                        <%-- link to copilot pool page --%>
                        &nbsp;|&nbsp;<a href="/tc?module=ViewCopilotPool">Copilot Pool</a>
                    </div>
                    <div class="clear-float"></div>
                </div>

                <div class="profile-info">
                    <div class="profile">
                        <div><img src="${copilotInfo['imagePath'] eq null ? "/i/copilots/person-03.png" : copilotInfo['imagePath']}" alt=""/></div>
                        <%-- reuse the topcoder member contact here --%>
                        <a href="/tc?module=MemberContact&amp;th=${copilotInfo['handle']}" class="button1 contact-copilot"><span
                                class="left"><span class="right">CONTACT COPILOT</span></span></a>
                    </div>
                    <div class="info">
                        <div class="handle b">Handle :
                            <a class="handle-name" href="#">
                                <%-- use tc handle tag to show copilot's handle --%>
                <span class="font-color04"><tc-webtag:handle
                        coderId='${copilotProfile.copilotProfile.userId}'/></span>
                            </a>
                        </div>
                        <div>
                            Status: <span class="b font-color01">${(fn:toUpperCase(copilotProfile.copilotProfile.status.name) eq 'ACTIVE') ? "Active" : "Suspended"}</span> &nbsp;&nbsp;|&nbsp;&nbsp;

                            <%-- only show the copilot earnings if the showCopilotEarnings flag is true --%>
                            <c:if test="${copilotProfile.copilotProfile.showCopilotEarnings}">
                                <%--
                                Earnings: <span class="b"><%=earnings%></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                                --%>
                            </c:if>

                            Suspension: <span class="b font-color04">${copilotProfile.copilotProfile.suspensionCount}</span>&nbsp;&nbsp;|&nbsp;&nbsp;
                            Reliability: <span class="b"><%=reliability%></span>&nbsp;&nbsp;|&nbsp;&nbsp;
                            Fulfillment: <span class="b"><%=fulfillment%></span>
                        </div>
                        <table class="table-details" cellpadding="0" cellspacing="0">
                            <thead>
                            <tr>
                                <%-- The tip contents are specified in the title tag --%>
                                <th class="border-l"># of Projects&nbsp;
                                    <img src="/i/copilots/help.png" class="help" alt=""
                                         title="The total number of projects the copilot manages"/>
                                </th>
                                <th class="border-l"># of Contests&nbsp;
                                    <img src="/i/copilots/help.png" class="help" alt=""
                                         title="The total number of contests the copilot manages"/>
                                </th>
                                <th class="border-l"># of Reposts&nbsp;
                                    <img src="/i/copilots/help.png" class="help" alt=""
                                         title="The number of contests managed by the copilot which were reposted"/>
                                </th>
                                <th class="border-l"># of Failures&nbsp;
                                    <img src="/i/copilots/help.png" class="help" alt=""
                                         title="The number of contests managed by the copilot which were failed"/>
                                </th>
                                <th class="border-l border-r"># of Bug Races&nbsp;
                                    <img src="/i/copilots/help.png" class="help" alt=""
                                         title="The number of bug races the copilot manages"/>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="border-l border-b">
                                    <%-- total proejcts links to the view copilot project history page 
                                    <a href="/tc?module=ViewCopilotProjectHistory&amp;pid=${copilotProfile.copilotProfile.userId}">
                                        ${copilotProfile.totalProjects}
                                    </a>
                                    --%>
                                    
                                    ${copilotProfile.totalProjects}
                                    
                                </td>
                                <td class="border-l border-b">
                                    ${copilotProfile.totalContests}
                                </td>
                                <td class="border-l border-b">
                                    ${copilotProfile.totalRepostedContests}
                                </td>
                                <td class="border-l border-b">
                                    ${copilotProfile.totalFailedContests}
                                </td>
                                <td class="border-l border-b border-r">
                                    ${copilotProfile.totalBugRaces == -1 ? 'n/a' : copilotProfile.totalBugRaces}
                                </td>
                            </tr>
                            <tr>
                                <td class="summarize border-l border-b border-r" colspan="5">
                                    <span class="label b">Currently Working on</span>
                    <span class="numberof">Number of Projects:
                        <span class="font-color01 b">${copilotProfile.currentProjects}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number of Contests: <span
                                class="font-color01 b">${copilotProfile.currentContests}</span></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="statistics">
                    <div class="panel">
                        Contest Statistics <img src="/i/copilots/help.png" class="help" alt=""
                                                title="The statistics on different TopCoder contest types"/>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${hasContestData}">

                        <div class="charts">
                    <table class="chart-container">
                        <tbody>
                        <tr>
                            <td class="piechart">
                                <div>
                                    <div class="pie-chart"></div>

                                </div>
                            </td>
                            <td class="palisade">
                                <div class="palisade-control">
                                    <div class="left-control">
										<div class="leftControlMask">
	                                        <%-- iterate the map to populate the left panel control --%>
	                                        <c:forEach items="${copilotProfile.contestTypeStats}" var="entry">
	
	                                            <div class="controller" id="ctype${entry.value.projectCategoryId}">
	                                                <div class="controllerWrapper"><span>${entry.value.projectCategoryName}</span><span class="arrow"></span></div>
	                                            </div>
	
	                                        </c:forEach>
										</div>
                                    </div>
                                    <div class="right-area">

                                        <%-- iterate the map to populate the right content area --%>
                                        <c:forEach items="${requestScope.copilotProfile.contestTypeStats}" var="entry">
                                            <table class="ctype${entry.value.projectCategoryId}">
                                                <tr>
                                                    <td>Planned Number of Contests:</td>
                                                    <td class="number b">${entry.value.plannedContests == -1 ? 'n/a' : entry.value.plannedContests}</td>
                                                </tr>
                                                <tr>
                                                    <td>Actual Number of Contests:</td>
                                                    <td class="number b">${entry.value.realContests}</td>
                                                </tr>
                                                <tr>
                                                    <td>Number of Reposts:</td>
                                                    <td class="number b">${entry.value.repostedContests}</td>
                                                </tr>
                                                <tr>
                                                    <td>Number of Failures:</td>
                                                    <td class="number b">${entry.value.failedContests}</td>
                                                </tr>
                                            </table>
                                        </c:forEach>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="column-chart"></div>
                    <div class="column-chart-legend">
                        <div class="planned-legend"><span class="icon"></span>Planned Contests</div>
                        <div class="real-legend"><span class="icon"></span>Actual Contests</div>
                        <div class="reposts-legend"><span class="icon"></span>Reposts</div>
                        <div class="failures-legend"><span class="icon"></span>Failures</div>
                    </div>
                </div>

                    </c:when>
                    <c:otherwise>
                        <div class="noChartData">
                            The copilot does not have any contest data available
                        </div>
                    </c:otherwise>
                </c:choose>

                

            </div>
            <!-- end of the copilot profile content -->
        </td>

    </tr>
    </tbody>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>