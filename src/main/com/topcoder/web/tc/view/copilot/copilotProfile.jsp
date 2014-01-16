<%--
  - Author: TCSASSEMBLER 
  - Version: 1.2
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page for show the profile of a copilot in the copilot pool.
  - Version 1.1 (Release Assembly - TopCoder Copilot Profile Update v1.0) changes: Update to match new prototype.
  -
  - Version 1.2 (Release Assembly - TopCoder Copilot Feedback Updates)
  - - Adds ratings to each copilot feedback. Old existing feedback will not have ratings displayed
--%>
<%@ page import="com.topcoder.direct.services.copilot.dto.CopilotProfileDTO" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html> 
<head>
    <title>TopCoder :: Copilot Profile</title>
    <jsp:include page="/script.jsp"/>
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="/js/tools.tooltip.js"></script>
    <!-- Google visualization charts -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <!-- should be put after Google visualization API -->
    <c:if test="${hasContestData}">
        <script type="text/javascript" src="/js/copilot-profile.js"></script>
    </c:if>
    
    <script type="text/javascript" src="/js/copilot-profile-tooltip.js"></script>
    <script type="text/javascript" src="/js/badge-tooltips.js"></script> 
    <script type="text/javascript" src="/js/badgeBase.js"></script>
    <link type="text/css" rel="stylesheet" href="/css/profileBadges.css" />
    
    <!-- put the generated chart json data in the header -->
    <script language="JavaScript" type="text/javascript">

        var piechart = <%= request.getAttribute("pieChartData")%>;
        var barchart = <%= request.getAttribute("barChartData")%>;

        $(document).ready(function(){
            var categoryName = 'merit groups';
            var groupBadgeDiv = $('.groupBadgeDiv');
            var singleBadgeDiv = null;
            var badges = $('.hidenBadgesDiv');
            
            renderGroupBadges(categoryName, groupBadgeDiv, singleBadgeDiv, badges);
        });        
    </script>
    
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_copilot"/>
    </jsp:include>
    <jsp:include page="/script_sharethis.jsp"/>
</head>

<body>

    <jsp:include page="/top.jsp"/>

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

    <div class="wrapperDiv">
        <div  class="contentDiv">
            <!-- the copilot profile content -->
            <div class="copilot-pool" id="copilot-profile">
                <div class="header-title">
                    <div class="left-title"><img src="/i/copilots/copilot-statistics.png" alt=""/></div>
                    <div class="right-title b">
                        Copilot Profile
                        &nbsp;|&nbsp;<a href="/tc?module=ViewCopilotPool">Copilot Pool</a>
                    </div>
                    <div class="clear-float"></div>
                </div>
                <div class="wrapperDiv">
                    <div class="leftDiv">
                        <div class="profile-info">
                            <div class="info">
                                <table class="table-details" cellpadding="0" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="border-l"># of Projects&nbsp;
                                                <img src="/i/copilots/help.png" class="help" alt=""
                                                     title="The total number of projects the copilot manages"/>
                                            </th>
                                            <th class="border-l"># of Challenges&nbsp;
                                                <img src="/i/copilots/help.png" class="help" alt=""
                                                     title="The total number of challenges the copilot manages"/>
                                            </th>
                                            <th class="border-l"># of Reposts&nbsp;
                                                <img src="/i/copilots/help.png" class="help" alt=""
                                                     title="The number of challenges managed by the copilot which were reposted"/>
                                            </th>
                                            <th class="border-l"># of Failures&nbsp;
                                                <img src="/i/copilots/help.png" class="help" alt=""
                                                     title="The number of challenges managed by the copilot which were failed"/>
                                            </th>
                                            <th class="border-l border-r"># of Races&nbsp;
                                                <img src="/i/copilots/help.png" class="help" alt=""
                                                     title="The number of races the copilot manages"/>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="border-l border-b">
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
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number of Challenges: <span
                                                        class="font-color01 b">${copilotProfile.currentContests}</span></span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${hasContestData}">
                                <div class="charts">
                                    <div class="chart-container">
                                        <div class="piechart">
                                            <div>
                                                <div class="pie-chart"></div>
                                            </div>
                                        </div>
                                        <div class="palisade">
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
                                                                <td>Planned Number of Challenges:</td>
                                                                <td class="number b">${entry.value.plannedContests == -1 ? 'n/a' : entry.value.plannedContests}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Actual Number of Challenges:</td>
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
                                        </div>
                                        <div class="clear-float"></div>
                                    </div>
                             </c:when>
                            <c:otherwise>
                                <div class="noChartData">
                                    The copilot does not have any challenge data available
                            </c:otherwise>
                          </c:choose>
                        </div>
                                    <%--<div class="feedback" style="position: relative">
                                        <c:forEach items="${requestScope.feedback}" var="entry">
                                            <div style="position: relative;">
                                                <div style="float: left; position: relative">
                                                    <span class="title1 b">Feedback submitted on </span>
                                                </div>
                                                <div style="float: right; position: relative">
                                                    <c:if test="${entry['feedbackAnswer'] == 'yes'}">
                                                        <img src="images/positive-status-icon.png" alt="" width="12px" height="12px">
                                                        <span class="title1 b" style="text-align: right">I would work with this copilot again.</span>
                                                    </c:if>
                                                    <c:if test="${entry['feedbackAnswer'] == 'no'}">
                                                        <img src="images/negative-status-icon.png" alt="" width="12px" height="12px">
                                                        <span class="title1 b" style="text-align: right">I would not work with this copilot again.</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div style="float: left; position: relative" class="contents">
                                               ${entry['feedbackText']}
                                            </div>
                                        </c:forEach>
                                    </div>--%>

                                    <div class="bottomfeedback">
                                        <table width="100%" cellspacing="0" cellpadding="0" class="table-details">
                                            <thead>
                                            <tr>
                                                <th class="border-l border-r border-b feedback-title">
                                                    What people say about this copilot

                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.feedback}" var="entry">
                                                <tr>
                                                    <td class="border-b">
                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                            <tbody><tr>
                                                                <td class="lefticon">
                                                                    <c:if test="${entry['feedbackAnswer'] == 'yes'}">
                                                                        <img src="/i/feedbackgood.png">
                                                                    </c:if>
                                                                    <c:if test="${entry['feedbackAnswer'] == 'no'}">
                                                                        <img src="/i/feedbackbad.png">
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${entry['feedbackAnswer'] == 'yes'}">
                                                                        <div class="goodfeedback-first">I would work with this copilot again</div>
                                                                    </c:if>
                                                                    <c:if test="${entry['feedbackAnswer'] == 'no'}">
                                                                        <div class="badfeedback-first">I would not work with this copilot again</div>
                                                                    </c:if>

                                                                    <dl class="pRatings">
                                                                        <c:if test="${entry['timeRating'] != null}">
                                                                            <dd>
                                                                                <label title="Timelines, gameplans">Project timelines</label>
                                                                                <div class="ratingView">
                                                                                    <input type="hidden" name="rating" value="${entry['timeRating']}"/>

                                                                                </div>
                                                                            </dd>
                                                                        </c:if>
                                                                        <c:if test="${entry['qualityRating'] != null}">
                                                                            <dd>
                                                                                <label title="Quality of deliverables and final &quot;product&quot;">Quality</label>
                                                                                <div class="ratingView">
                                                                                    <input type="hidden" name="rating" value="${entry['qualityRating']}"/>

                                                                                </div>
                                                                            </dd>
                                                                        </c:if>
                                                                        <c:if test="${entry['communicationRating'] != null}">
                                                                            <dd>
                                                                                <label title="Setting expectations correctly, proactively raising issues">Communication</label>
                                                                                <div class="ratingView">
                                                                                    <input type="hidden" name="rating" value="${entry['communicationRating']}"/>

                                                                                </div>
                                                                            </dd>
                                                                        </c:if>
                                                                        <c:if test="${entry['managementRating'] != null}">
                                                                            <dd>
                                                                                <label title="Manages other copilots, manages challenges, manages inter-contest work">Challenge management</label>
                                                                                <div class="ratingView">
                                                                                    <input type="hidden" name="rating" value="${entry['managementRating']}"/>

                                                                                </div>
                                                                            </dd>
                                                                        </c:if>
                                                                    </dl>

                                                                    <div class="feedback-middle">${entry['feedbackText']}</div>

                                                                    <div class="feedback-bottom">Feedback submitted on ${entry['submitDate']}</div>
                                                                </td>
                                                            </tr>
                                                            </tbody></table>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr><td style="height:50px;">&nbsp;</td></tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="clear-float"></div>

                                </div>                            

                </div>
                <div class="rightDiv">
                    <div class="profile-info">
                        <div class="profile">
                            <div class="profile-header">
                                ${copilotInfo['handle']}
                            </div>
                            <div class="profile-pic"><img src="${copilotInfo['imagePath'] eq null ? "/i/copilots/person-03.png" : copilotInfo['imagePath']}" alt=""/></div>

                            <a href="/tc?module=MemberContact&amp;th=${copilotInfo['handle']}" class="button1 contact-copilot">
                                <span class="left"><span class="right">CONTACT COPILOT</span></span></a>

                            <div class="clear-float"></div>
                            <div class="handle b">
                            </div>
                            <div class="handle-desc">
                                <div class="data">
                                    <p>Status: <span class="b font-color01">
                                        ${(fn:toUpperCase(copilotProfile.copilotProfile.status.name) eq 'ACTIVE') ? "Active" : "Suspended"}
                                    </span> &nbsp;&nbsp;</p>
                                         
                                    <%-- only show the copilot earnings if the showCopilotEarnings flag is true --%>
                                    <c:if test="${copilotProfile.copilotProfile.showCopilotEarnings}">
                                        <%--
                                        <p>Earnings: <span class="b"><%=earnings%></span>&nbsp;&nbsp;</p>     
                                        --%>
                                    </c:if>                                         
                                    
                                    <p>Suspension: <span class="b font-color04">${copilotProfile.copilotProfile.suspensionCount}</span>&nbsp;&nbsp;</p>
                                    <p>Reliability: <span class="b"><%=reliability%></span>&nbsp;&nbsp;
                                    <p>Fulfillment: <span class="b"><%=fulfillment%></span></p>
                                </div>
                                <div class="icon">
                                    <c:if test="${copilotInfo['is_software_copilot']}">
                                        <p><img src="i/cimages/SoftwareCertified.png" alt="Software Certified" title="Certified TopCoder Software Copilot" /></p>
                                    </c:if>
                                    
                                    <c:if test="${copilotInfo['is_studio_copilot']}">
                                        <p><img src="i/cimages/StudioCertified.png" alt="Studio Certified" title="Certified TopCoder Studio Copilot" /></p>
                                    </c:if>  
                                </div>
                            </div>
                        </div>
                    </div><div class="clear-float"></div>
                    <jsp:include page="/buttons_sharethis.jsp"/>
                    
                    <%  
                        ResultSetContainer achievementsData = (ResultSetContainer) (request.getAttribute("achievements"));
                    %>                    
                    
                    <div class="hidenBadgesDiv hide">
                        <rsc:iterator list="<%=achievementsData%>" id="resultRow">
                            <div class="quoteBadgesItem">
                                <input type="hidden" class="achievementId" value='<rsc:item name="id" row="<%=resultRow%>"/>'></input>
                                <input type="hidden" class="achievementName" value='<rsc:item name="name" row="<%=resultRow%>"/>'></input>
                                <input type="hidden" class="achievementDesc" value='<rsc:item name="desc" row="<%=resultRow%>"/>'></input>
                                <input type="hidden" class="achievementDate" value='<rsc:item name="creation_date" row="<%=resultRow%>"/>'></input>
                            </div>
                        </rsc:iterator>                    
                    </div>
                    <div class="achiv groupBadgeDiv">
                        <span class="titl">Copilot Specialization</span>
                    </div>
                </div>
            </div>
            <!-- end of the copilot profile content -->
        </div>
    </div>

    <div class='navigation'>
        <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="copilots_pool"/>
        </jsp:include>
    </div>

    <div class="clear-float"></div>

<jsp:include page="/foot.jsp"/>

</body>

</html>
