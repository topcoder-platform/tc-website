<%--
  - Author: TCSASSEMBLER
  - Date: 28th Aug 2010
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page for showing copilot's project details.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.direct.services.copilot.dto.CopilotProjectDTO" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>TopCoder :: Copilot Project Details</title>
    <jsp:include page="/script.jsp"/>
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
     <!-- Google visualization charts -->
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="/js/copilot-project-details.js"></script>
    <script language="JavaScript" type="text/javascript">
        var barchart1 = ${barChart1};
        var barchart2 = ${barChart2};
        var barchart3 = ${barChart3};
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
        CopilotProjectDTO projectDTO = (CopilotProjectDTO) request.getAttribute("copilotProject"); 
    %>

   <td width="100%" align="left" class="bodyColumn">
               <!-- the copilot project detail content -->
                <div class="copilot-pool" id="copilot-project-details">
                    <div class="header-title">
                        <div class="left-title"><img src="/i/copilots/project-details.png" alt="" /></div>
                        <div class="right-title b">
                            <a href="/tc?module=ViewCopilotProfile&amp;pid=${copilotInfo.userId}">Copilot Profile</a>
                            &nbsp;|&nbsp;<a href="/tc?module=ViewCopilotProjectHistory&amp;pid=${copilotInfo.userId}">Project History</a>
                            &nbsp;|&nbsp;<a href="/tc?module=ViewCopilotPool">Copilot Pool</a>
                        </div>
                        <div class="clear-float"></div>
                    </div>
                    <div class="history-header">
                        <div class="handle">Handle : <tc-webtag:handle coderId='${copilotInfo.userId}'/></div>
                        <a href="/tc?module=ViewCopilotProjectHistory&amp;pid=${copilotInfo.userId}" class="button1 backto-profile">
                            <span class="left"><span class="right">BACK TO PROJECT HISTORY</span></span></a>
                         <div class="clear-float"></div>
                        <div class="handle">Project : ${copilotProject.copilotProject.name}</div>
                        <div class="clear-float"></div>
                    </div>

                    <div class="project-details">
                          <div class="panel">
                              Project Details
                          </div>
                    </div>
                    <div class="charts">
                        <table class="details-chart-container">
                            <tbody>
                                <tr>
                                    <td class="details">
                                       <table>
                                           <tbody>
                                             <%-- the left box to show project statistics --%>
                                               <tr>
                                                   <td>Planned Number of Contests:</td>
                                                   <td class="number b">${copilotProject.totalPlannedContests}</td>
                                               </tr>
                                               <tr>
                                                   <td>Real Number of Contests:</td>
                                                   <td class="number b">${copilotProject.totalRealContests}</td>
                                               </tr>
                                               <tr>
                                                   <td>Number of Reposts:</td>
                                                   <td class="number b">${copilotProject.totalRepostedContests}</td>
                                               </tr>
                                               <tr>
                                                   <td>Number of Failures:</td>
                                                   <td class="number b">${copilotProject.totalFailedContests}</td>
                                               </tr>
                                               <tr>
                                                   <td>Planned Duration:</td>
                                                   <td class="number b">${copilotProject.plannedDuration}</td>
                                               </tr>
                                               <tr>
                                                   <td>Real Duration:</td>
                                                   <td class="number b">${copilotProject.realDuration}</td>
                                               </tr>
                                               <tr>
                                                   <td>Planned Number of Bugraces:</td>
                                                   <td class="number b">${copilotProject.plannedBugRaces}</td>
                                               </tr>
                                               <tr>
                                                   <td>Real Number of Bugraces:</td>
                                                   <td class="number b">${copilotProject.totalRealBugRaces}</td>
                                               </tr>
                                           </tbody>
                                        </table>
                                    </td>
                                    <td class="space"></td>
                                    <td class="palisade">
                                       <div class="palisade-control">
                                            <div class="left-control">

                                                 <%-- iterate the stats map to populate the left control --%>
                                                 <c:forEach items="${copilotProject.contestTypeStats}" var="entry">

                                                    <div class="controller" id="ctype${entry.value.projectCategoryId}">
                                                        <span>${entry.value.projectCategoryName}</span>
                                                    </div>

                                                 </c:forEach>
                                            </div>
                                            <div class="right-area">

                                                <%-- iterate the stats map to populate the right content area --%>
                                                 <c:forEach items="${copilotProject.contestTypeStats}" var="entry">
                                                    <table class="ctype${entry.value.projectCategoryId}">
                                                        <tr>
                                                            <td>Planned No. of Contests:</td>
                                                            <td class="number b">${entry.value.plannedContests}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Real No. of Contests:</td>
                                                            <td class="number b">${entry.value.realContests}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>No. of Reposts:</td>
                                                            <td class="number b">${entry.value.repostedContests}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>No. of Failures:</td>
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
                    </div>

                    <div class="feedback">
                        <div>
                            <span class="title1 b">Customer Feedback : </span>

                            <%-- calculate the images used to show rating starts --%>
                            <%
                                int[] customerStarsIndex = null;
                                float cRating = projectDTO.getCopilotProject().getCustomerRating();
                                if (cRating >= 0) {
                                   customerStarsIndex = new int[5];
                                   for (int i = 0; i < 5; ++i) {
                                       customerStarsIndex[i] = 2;
                                   }
                                   // the full star numbers
                                   int fullCount = (int) cRating;
                                   for (int i = 0; i < fullCount; ++i) {
                                       customerStarsIndex[i] = 1;
                                   }
                                   if (fullCount < 5 && (cRating - fullCount) > 0) {
                                       customerStarsIndex[fullCount] = 3;
                                   }
                                }

                                request.setAttribute("cStars", customerStarsIndex);
                            %>

                            <%-- show the rating stars only when there is rating --%>
                            <c:if test="${cStars != null}">
                                <c:forEach items="${cStars}" var="starValue" >
                                 <img alt="" src="/i/copilots/star${starValue}.png" />

                                </c:forEach>
                                 &nbsp;&nbsp;<span class="b">${copilotProject.copilotProject.customerRating}</span> out of 5
                            </c:if>

                        </div>
                        <div class="contents">
                            ${copilotProject.copilotProject.customerFeedback}
                        </div>
                        <div>
                            <span class="title1 b">PM Feedback : </span>
                             <%
                                int[] pmStarsIndex = null;
                                float pRating = projectDTO.getCopilotProject().getPmRating();
                                if (pRating >= 0) {
                                   pmStarsIndex = new int[5];
                                   for (int i = 0; i < 5; ++i) {
                                       pmStarsIndex[i] = 2;
                                   }
                                   // the full star numbers
                                   int fullCount = (int) pRating;
                                   for (int i = 0; i < fullCount; ++i) {
                                       pmStarsIndex[i] = 1;
                                   }
                                   if (fullCount < 5 && (pRating - fullCount) > 0) {
                                       pmStarsIndex[fullCount] = 3;
                                   }
                                }

                                request.setAttribute("pStars", pmStarsIndex);
                            %>

                            <%-- show the rating stars only when there is rating --%>
                            <c:if test="${pStars != null}">
                                <c:forEach items="${pStars}" var="starValue" >
                                 <img alt="" src="/i/copilots/star${starValue}.png" />

                                </c:forEach>
                                 &nbsp;&nbsp;<span class="b">${copilotProject.copilotProject.pmRating}</span> out of 5
                            </c:if>
                        </div>
                        <div class="contents">
                            ${copilotProject.copilotProject.pmFeedback}
                        </div>
                    </div>

                     <div class="project-details">
                          <div class="panel">
                              Project Statistics
                          </div>
                      </div>

                      <div class="details-chart">
                          <div id="chart1">
                              <div class="chart"></div>
                              <div class="legend">
                                  <div class="planned-legend"><span class="icon"></span>Planned</div>
                                  <div class="real-legend"><span class="icon"></span>Real</div>
                              </div>
                          </div>
                          <div id="chart2">
                              <div class="chart"></div>
                              <div class="legend">
                                  <div class="planned-legend"><span class="icon"></span>Planned Contests</div>
                                  <div class="real-legend"><span class="icon"></span>Real Contests</div>
                              </div>
                          </div>
                          <div id="chart3">
                              <div class="chart"></div>
                              <div class="legend">
                                  <div class="planned-legend"><span class="icon"></span>Planned Contests</div>
                                  <div class="real-legend"><span class="icon"></span>Real Contests</div>
                                  <div class="reposts-legend"><span class="icon"></span>Reposts</div>
                                  <div class="failures-legend"><span class="icon"></span>Failures</div>
                              </div>
                          </div>
                      </div>

                </div>
               <!-- end of the copilot project detail content -->
            </td>



</tr>
</tbody>
</table>


<jsp:include page="/foot.jsp"/>

</body>

</html>
