<%--
  - Author: TCSASSEMBLER
  - Date: 28th Aug 2010
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page for showing copilot's project history.
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
    <title>TopCoder :: Copilot Project History</title>
    <jsp:include page="/script.jsp"/>
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="/js/copilot-project-history.js"></script>
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
    // Get data from the request attributes
    List<CopilotProjectDTO> list = (List<CopilotProjectDTO>) request.getAttribute("copilotProjects");
    int currentPage = (Integer) request.getAttribute("currentPage");
    int allowedPages = (Integer) request.getAttribute("allowedPages");
    Integer totalNumber = (Integer) request.getAttribute("totalNumber");
    Integer pageSize = (Integer) request.getAttribute("pageSize");
    Integer sorting = (Integer) request.getAttribute("sorting");

    // Sort drop down values is not selected by default
    boolean dropDownSelected = false;
    if (sorting == null) {
        // no sorting, set to default one
        sorting = new Integer(0);
    } else {
        int sortIndex = sorting % 10;
        dropDownSelected = (sortIndex == 1 || sortIndex == 8);
    }

    // the value to display if statistic is not available
    String na = "n/a";
    String privateProject = "private project";
%>


<td width="100%" align="left" class="bodyColumn">
    <!-- the copilot project history content -->
    <div class="copilot-pool" id="copilot-project-history">
        <div class="header-title">
            <div class="left-title"><img src="/i/copilots/project-details.png" alt=""/></div>
            <div class="right-title b">
                <a href="/tc?module=ViewCopilotProfile&amp;pid=${profileId}">Copilot Profile</a>
                &nbsp;|&nbsp;Project History
                &nbsp;|&nbsp;<a href="/tc?module=ViewCopilotPool">Copilot Pool</a>
            </div>
            <div class="clear-float"></div>
        </div>
        <div class="history-header">
            <div class="handle">Handle : <tc-webtag:handle coderId='${copilotInfo.userId}'/>
            </div>
            <a href="/tc?module=ViewCopilotProfile&amp;pid=${profileId}" class="button1 backto-profile"><span
                    class="left"><span class="right">BACK TO COPILOT PROFILE</span></span></a>

            <div class="clear-float"></div>
        </div>
        <div class="table-header">
            <div class="view">
                Copiloted <span class="font-color04"><%=totalNumber%></span> Projects
            </div>
            <div class="sort">
                <%-- the form to control sorting and paging --%>
                <form action="/tc" method="GET" id="controlForm">
                    <input type="hidden" name="module" value="ViewCopilotProjectHistory"/>
                    <input type="hidden" name="pid" value="${profileId}"/>
                    Displaying/Page :
                    <select name="size" id="pageSizeID">
                        <option value="10" <% if (pageSize == 10) {%> selected="selected" <% } %>>10</option>
                        <option value="20" <% if (pageSize == 20) {%> selected="selected" <% } %>>20</option>
                        <option value="30" <% if (pageSize == 30) {%> selected="selected" <% } %>>30</option>
                    </select>

                    <input type="hidden" name="sort" value="<%=sorting%>" id="sortingID"/>

                    &nbsp;Sort by :
                    <select id="sortingDropDownID">
                        <option value="0" <% if (!dropDownSelected) {%> selected="selected" <% } %> >Default Order
                        </option>
                        <option value="1" <% if (sorting == 1) {%> selected="selected" <% } %> >Project Name &uarr;
                        </option>
                        <option value="8" <% if (sorting == 8) {%> selected="selected" <% } %>>Project Status &uarr;
                        </option>
                        <option value="11" <% if (sorting == 11) {%> selected="selected" <% } %> >Project Name &darr;
                        </option>
                        <option value="18" <% if (sorting == 18) {%> selected="selected" <% } %>>Porject Status &darr;
                        </option>
                    </select>
                </form>
            </div>
        </div>
        <table class="history-view" cellpadding="0" cellspacing="0">
            <thead>
            <tr>
                <%-- table header, header sorting is triggered by javascript --%>
                <th id="projectNameHeaderID">Project Name</th>
                <th class="display-none"></th>
                <th class="border-l" colspan="2">
                    <div class="numberof border-b" id="numberOfContestHeaderID"><span>Number of contests</span></div>
                    <div class="plan-real">
                        <div class="plan border-r" id="plannedContestHeaderID"><span>Planned</span></div>
                        <div class="real" id="realContestHeaderID"><span>Actual</span></div>
                    </div>
                </th>
                <th class="display-none"></th>
                <th class="border-l" colspan="2">
                    <div class="numberof border-b" id="durationHeaderID"><span>Duration</span></div>
                    <div class="plan-real">
                        <div class="plan border-r" id="plannedDurationHeaderID"><span>Planned</span></div>
                        <div class="real" id="realDurationHeaderID"><span>Actual</span></div>
                    </div>
                </th>

                <th class="border-l" id="repostHeaderID">Number of Reposts</th>
                <th class="border-l" id="failureHeaderID">Number of Failures</th>
                <th class="border-l" id="statusHeaderID">Status</th>
            </tr>
            </thead>
            <tbody>

            <%-- iterate the projects to render the data in table --%>
            <c:forEach items="${copilotProjects}" var="entry" varStatus="status">

                <tr ${status.index mod 2 == 1 ? 'class="even"' : ''}>
                    <td class="b">
                        <c:choose>
                            <c:when test="${entry.copilotProject.privateProject}">
                                <%=privateProject%>
                            </c:when>
                            <c:otherwise>
                                <a href="/tc?module=ViewCopilotProject&amp;cp=${entry.copilotProject.id}">
                                        ${entry.copilotProject.name}</a>
                            </c:otherwise>

                        </c:choose>
                    </td>
                    <td class="b">${entry.totalPlannedContests}</td>
                    <td class="b">${entry.totalRealContests}</td>
                    <td class="">${entry.plannedDuration} Days</td>
                    <td class="">${entry.realDuration} Days</td>
                    <td class="b">${entry.totalRepostedContests}</td>
                    <td class="b">${entry.totalFailedContests}</td>
                    <td class="">${entry.copilotProject.status.name}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="pagination">
            <div>
                <!-- prev -->
                <c:choose>
                    <c:when test="${currentPage == 1}">
                        <span class="prev">Prev</span>
                    </c:when>
                    <c:otherwise>
                       <a href="/tc?module=ViewCopilotProjectHistory&amp;pid=${profileId}&amp;size=${pageSize}&amp;page=<%=currentPage-1%>&amp;sort=<%=sorting%>">
                             Prev
                        </a>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${allowedPages}" varStatus="status">
                    <c:choose>
                        <c:when test="${status.index eq currentPage}">
                            <span class="curpage b">${status.index}</span>
                        </c:when>
                        <c:otherwise>
                           <a href="/tc?module=ViewCopilotProjectHistory&amp;pid=${profileId}&amp;size=${pageSize}&amp;page=${status.index}&amp;sort=<%=sorting%>">${status.index}</a>  
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${currentPage eq allowedPages}">
                       <span class="next">Next</span>
                    </c:when>
                    <c:otherwise>
                       <a href="/tc?module=ViewCopilotProjectHistory&amp;pid=${profileId}&amp;size=${pageSize}&amp;page=${currentPage + 1}&amp;sort=<%=sorting%>">Next 
                    </c:otherwise>
                </c:choose>

            </div>
        </div>

    </div>
    <!-- end of the copilot project history content -->
</td>


</tr>
</tbody>
</table>


<jsp:include page="/foot.jsp"/>

</body>

</html>
