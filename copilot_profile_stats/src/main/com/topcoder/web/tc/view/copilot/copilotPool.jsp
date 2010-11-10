<%--
  - Author: TCSASSEMBLER
  - Date: 20th Aug 2010
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page for listing the members of copilot pool, the page can be viewed in grid mode
  - or list mode, the grid mode is by default.
--%>
<%@ page import="com.topcoder.direct.services.copilot.dto.CopilotPoolMember" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>TopCoder :: Copilot Pool</title>
    <jsp:include page="/script.jsp"/>
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="/js/copilot-pool.js"></script>
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


<td width="100%" align="left" class="bodyColumn">
<!-- the copilot pool grid content -->
<div class="copilot-pool" id="copilot-pool-grid">
<div class="header-title">
    <div class="left-title"><img src="/i/copilots/copilot_pool.png" alt=""/></div>
    <div class="right-title">Meet the Copilots</div>
    <div class="clear-float"></div>
</div>
<p class="detail">A copilot is someone who has one thing on their mind: helping you. This person can take what you're thinking and make it real. They're the leading edge to a world of resource. They'll tell you what's possible, how long it will take, how much it will cost and, best of all, what they think. They'll be with you for the rest of the process.

The road you take will be defined by you and your copilot. Want to learn more? Find out how we break it down <a href="http://topcoder.com/home/index.php?p=23">here</a>.</p>


<%
    // Get data from the request attributes
    List<CopilotPoolMember> list = (List<CopilotPoolMember>) request.getAttribute("poolMembersData");
    int currentPage = (Integer) request.getAttribute("currentPage");
    int allowedPages = (Integer) request.getAttribute("allowedPages");
    Integer totalNumber = (Integer) request.getAttribute("totalNumber");
    Integer pageSize = (Integer) request.getAttribute("pageSize");
    Integer viewType = (Integer) request.getAttribute("viewType");
    Integer sorting = (Integer) request.getAttribute("sorting");

    // Sort drop down values is not selected by default
    boolean dropDownSelected = false;
    if (sorting == null) {
        // no sorting, set to default one
        sorting = new Integer(0);
    } else {
        int sortIndex = sorting % 10;
        dropDownSelected = (sortIndex == 1 || sortIndex == 2 || sortIndex == 6 || sortIndex == 7);
    }

    Map<Long, String> ims =  (Map<Long, String>)  request.getAttribute("images");

    // the value to display if statistic is not available
    String na = "n/a";
%>


<div class="subtitle">
    <!-- display the total number of the copilots -->
    There are <span class="font-color04"><%=totalNumber%></span> active Copilots in the Community
</div>
<div class="table-header">
    <div class="view">

        <% if (viewType != 1) { %>
        <!-- view type is not list, use grid view by default -->
        View : &nbsp;&nbsp;&nbsp;<img src="/i/copilots/grid_active.png" alt=""/> <span class="grid">Grid</span>
        &nbsp;&nbsp;&nbsp;<img src="/i/copilots/list.png" alt=""/> <a class="list"
                                                                 href="javascript:void(0);" id="listViewID">List</a>
        <% } else { %>
        <!-- view type is list, use list view -->
        View : &nbsp;&nbsp;&nbsp;<img src="/i/copilots/grid.png" alt=""/>
        <a class="list" href="javascript:void(0);" id="gridViewID">Grid</a> &nbsp;&nbsp;&nbsp;<img
            src="/i/copilots/list_active.png" alt=""/> <span class="grid">List</span>

        <% } %>
    </div>


    <div class="sort">
        <!-- the form to submit the page size, sorting approach, view type -->
        <form action="/tc" method="GET" id="controlForm">
            <input type="hidden" name="module" value="ViewCopilotPool"/>
            Displaying/Page :

            <select name="size" id="pageSizeID">
                <option value="10" <% if (pageSize == 10) {%> selected="selected" <% } %>>10</option>
                <option value="20" <% if (pageSize == 20) {%> selected="selected" <% } %>>20</option>
                <option value="30" <% if (pageSize == 30) {%> selected="selected" <% } %>>30</option>
            </select>

            <input type="hidden" name="view" value="<%=viewType%>" id="viewTypeID"/>
            <input type="hidden" name="sort" value="<%=sorting%>" id="sortingID"/>


            &nbsp;Sort by :
            <select id="sortingDropDownID">
                <option value="0" <% if (!dropDownSelected) {%> selected="selected" <% } %> >Sort by default order
                </option>
                <option value="1" <% if (sorting == 1) {%> selected="selected" <% } %> >No. of Completed Projects &uarr;
                </option>
                <option value="2" <% if (sorting == 2) {%> selected="selected" <% } %>>No. of Completed Contests &uarr;
                </option>
                <option value="6" <% if (sorting == 6) {%> selected="selected" <% } %>>No. of Current Projects &uarr;
                </option>
                <option value="7" <% if (sorting == 7) {%> selected="selected" <% } %>>No. of Current Contests &uarr;
                </option>
                <option value="11" <% if (sorting == 11) {%> selected="selected" <% } %> >No. of Completed Projects &darr;
                </option>
                <option value="12" <% if (sorting == 12) {%> selected="selected" <% } %>>No. of Completed Contests &darr;
                </option>
                <option value="16" <% if (sorting == 16) {%> selected="selected" <% } %>>No. of Current Projects &darr;
                </option>
                <option value="17" <% if (sorting == 17) {%> selected="selected" <% } %>>No. of Current Contests &darr;
                </option>
            </select>
        </form>
    </div>

</div>


<%
    // grid view
    if (viewType != 1) {
%>

<div class="grid-copilots">

    <%
        // display the copilots in grid view
        for (int i = 0; i < list.size();) {
    %>
    <div class="copilot-row">
        <%
            for (int j = 0; j < 2; j++) {

                if (i >= list.size()) break;

                CopilotPoolMember m = list.get(i++);
                String mPath = ims.get(Long.valueOf(m.getCopilotProfile().getUserId()));
                mPath = (mPath == null ? "/i/copilots/person-01.png" : mPath);
        %>

        <div class="copilot">

            <img src="<%=mPath%>" class="person" alt=""/>

            <div class="info">
                <div class="handle b">Handle: <a class="handle-name" href="/tc?module=MemberProfile&amp;cr=<%=m.getCopilotProfile().getUserId()%>"><span
                        class="name"><tc-webtag:handle coderId='<%=m.getCopilotProfile().getUserId()%>'/></span></a></div>
                <table cellpadding="0" cellspacing="0" class="details">
                    <thead>
                    <tr>
                        <th colspan="2">Copilot Quick Stats</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="label">Project :</td>
                        <td class="number b">
                            <%=m.getTotalProjects() == CopilotPoolMember.UNDEFINED_STAT ? na :m.getTotalProjects()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Contest :</td>
                        <td class="number b">
                            <%=m.getTotalContests() == CopilotPoolMember.UNDEFINED_STAT ? na :m.getTotalContests()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Repost :</td>
                        <td class="number b">
                            <%=m.getTotalRepostedContests() == CopilotPoolMember.UNDEFINED_STAT ? na : m.getTotalRepostedContests()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Failure :</td>
                        <td class="number b">
                            <%=m.getTotalFailedContests() == CopilotPoolMember.UNDEFINED_STAT ? na : m.getTotalFailedContests()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">BugRace :</td>
                        <td class="number b">
                            <%=m.getTotalBugRaces()  == CopilotPoolMember.UNDEFINED_STAT ? na : m.getTotalBugRaces() %>
                        </td>
                    </tr>
                    <tr>
                        <td class="label current-top">Current Projects :</td>
                        <td class="number b current-top font-color01">
                            <%=m.getCurrentProjects()  == CopilotPoolMember.UNDEFINED_STAT ? na : m.getCurrentProjects()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="label current-bot">Current Contests :</td>
                        <td class="number b current-bot font-color01">
                            <%=m.getCurrentContests()  == CopilotPoolMember.UNDEFINED_STAT ? na : m.getCurrentContests()%>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="profile-link">
                    <img src="/i/copilots/view.png" alt=""/> <a href="/tc?module=ViewCopilotProfile&amp;pid=<%=m.getCopilotProfile().getUserId()%>">View Copilot Profile</a>
                </div>
            </div>
        </div>

        <%
            }
        %>

    </div>

    <%
        }
    %>


    <div class="clear-float"></div>
</div>

<% } else { %>
<script type="text/javascript" src="/js/copilot-pool-list.js"></script>
<table class="list-view" cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <!-- render the table header of the list view -->
        <th>Member</th>
        <th class="border-l listHeader <% if(sorting % 10 == 1) {%> headerSortDown <% } %>" id="projectHeaderID"># of Projects
        </th>
        <th class="border-l listHeader <% if(sorting % 10 == 2) {%> headerSortDown <% } %>" id="contestHeaderID"># of Contests
        </th>
        <th class="border-l listHeader <% if(sorting % 10 == 3) {%> headerSortDown <% } %>" id="repostHeaderID"># of Reposts</th>
        <th class="border-l listHeader <% if(sorting % 10 == 4) {%> headerSortDown <% } %>" id="failureHeaderID"># of Failures
        </th>
        <th class="border-l listHeader <% if(sorting % 10 == 5) {%> headerSortDown <% } %>" id="bugRaceHeaderID"># of Bug Races
        </th>
        <th class="border-l listHeader <% if(sorting % 10 == 6) {%> headerSortDown <% } %>" id="cProjectHeaderID">Number of
            Current Projects
        </th>
        <th class="border-l listHeader <% if(sorting % 10 == 7) {%> headerSortDown <% } %>" id="cContestHeaderID">Number of
            Current Contests
        </th>
        <th class="border-l">Copilot Profile</th>
    </tr>
    </thead>
    <tbody>

    <%
        // list all the copilots to display in list view
        for (int i = 0; i < list.size();) {

            CopilotPoolMember m = list.get(i++);
            String mPath = ims.get(m.getCopilotProfile().getUserId());
            mPath = (mPath == null ? "/i/copilots/person-02.png" : mPath);
            
    %>


    <tr <% if (i % 2 == 0) { %> class="even" <% } %>>
        <td class="border-b first">
            <img src="<%=mPath%>" alt="" class="personSmall"/>
            <a class="handle-name display-block" href="#">
                <span class="b"><tc-webtag:handle coderId='<%=m.getCopilotProfile().getUserId()%>'/></span>
            </a>
        </td>
        <!-- if the statistic number is not defined, we display 'n/a' -->
        <td class="border-b"><%=m.getTotalProjects() == CopilotPoolMember.UNDEFINED_STAT ? na :m.getTotalProjects()%>
        </td>
        <td class="border-b"><%=m.getTotalContests() == CopilotPoolMember.UNDEFINED_STAT ? na :m.getTotalContests()%>
        </td>
        <td class="border-b"><%=m.getTotalRepostedContests() == CopilotPoolMember.UNDEFINED_STAT ? na : m.getTotalRepostedContests()%>
        </td>
        <td class="border-b"><%=m.getTotalFailedContests() == CopilotPoolMember.UNDEFINED_STAT ? na : m.getTotalFailedContests()%>
        </td>
        <td class="border-b"><%=m.getTotalBugRaces()  == CopilotPoolMember.UNDEFINED_STAT ? na : m.getTotalBugRaces() %>
        </td>
        <td class="border-b border-l current"><%=m.getCurrentProjects()  == CopilotPoolMember.UNDEFINED_STAT ? na : m.getCurrentProjects()%>
        </td>
        <td class="border-b border-l current"><%=m.getCurrentContests()  == CopilotPoolMember.UNDEFINED_STAT ? na : m.getCurrentContests()%>
        </td>
        <td class="border-b border-l"><img src="/i/copilots/view.png" alt=""/>&nbsp;<a href="/tc?module=ViewCopilotProfile&amp;pid=<%=m.getCopilotProfile().getUserId()%>">View</a>
        </td>
    </tr>

    <% } %>

    </tbody>
</table>
<% } %>

<div class="pagination">
    <div>
        <!-- prev -->
        <% if (currentPage == 1) { %>
        <span class="prev">Prev</span>
        <% } else { %>
        <a href="/tc?module=ViewCopilotPool&amp;size=<%=pageSize%>&amp;page=<%=currentPage-1%>&amp;view=<%=viewType%>&amp;sort=<%=sorting%>">
            Prev
        </a>
        <% } %>

        <!-- pages -->
        <%
            for (int i = 1; i <= allowedPages; ++i) {
                if (i == currentPage) {
        %>
        <span class="curpage b"><%=i%></span>
        <% } else { %>
        <a href="/tc?module=ViewCopilotPool&amp;size=<%=pageSize%>&amp;page=<%=i%>&amp;view=<%=viewType%>&amp;sort=<%=sorting%>"><%=i%>
        </a>
        <% } %>
        <%
            }
        %>

        <!-- next -->
        <% if (currentPage == allowedPages) { %>
        <span class="next">Next</span>
        <% } else { %>
        <a href="/tc?module=ViewCopilotPool&amp;size=<%=pageSize%>&amp;page=<%=currentPage+1%>&amp;view=<%=viewType%>&amp;sort=<%=sorting%>">Next
        </a>
        <% } %>


    </div>
</div>

</div>
<!-- end of the copilot pool grid content -->
</td>


</tr>
</tbody>
</table>


<jsp:include page="/foot.jsp"/>

</body>

</html>
