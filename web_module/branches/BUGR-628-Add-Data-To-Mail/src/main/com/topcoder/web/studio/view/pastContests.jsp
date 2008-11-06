<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script type="text/javascript">
<!--
    function filterDateChange(){
        var myForm = document.submissionsForm;
	 myForm.<%=DataAccessConstants.START_RANK%>.value ="";
        myForm.<%=DataAccessConstants.END_RANK%>.value ="";
	 myForm.submit();
    }
     function filterYearChange(value,filterMonth){
        if(value == "All"){
         var i,num,op;
         num = filterMonth.length;
           for(i=0;i<num;i++){
               op= filterMonth.options[i]
               if(op.value=="All") op.selected=true;
           }
        }
    }
    //--></script>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<h1>Past Contests</h1>

<form name="submissionsForm" method="get" action="${sessionInfo.servletPath}">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewPastContests"/>
<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>

<div align="right"><strong>Need help? Learn how to
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get
        started</a>.<br />
    Got <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">questions</a>?</strong>
</div>


<div class="tableTabOff" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a></div>
<div class="tableTabOn"><a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a></div>
<br  clear="all"/>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">

<table style="padding-bottom: 5px;">
<tr>
<td width="80%" align="right">
<b>Filter by Date:</b>
</td>
<td>
<%
String val = request.getAttribute("filterMonth") == null ? null : request.getAttribute("filterMonth").toString();
%>
<select name="filterMonth">
<option value="1" <%= val.equals("1") ? "selected" : "" %>>January</option>
<option value="2" <%= val.equals("2") ? "selected" : "" %>>February </option>
<option value="3" <%= val.equals("3") ? "selected" : "" %>>March</option>
<option value="4" <%= val.equals("4") ? "selected" : "" %>>April</option>
<option value="5" <%= val.equals("5") ? "selected" : "" %>>May</option>
<option value="6" <%= val.equals("6") ? "selected" : "" %>>June</option>
<option value="7" <%= val.equals("7") ? "selected" : "" %>>July</option>
<option value="8" <%= val.equals("8") ? "selected" : "" %>>August</option>
<option value="9" <%= val.equals("9") ? "selected" : "" %>>September</option>
<option value="10" <%= val.equals("10") ? "selected" : "" %>>October</option>
<option value="11" <%= val.equals("11") ? "selected" : "" %>>November</option>
<option value="12" <%= val.equals("12") ? "selected" : "" %>>December</option>
<option value="All" <%= val.equals("All") ? "selected" : "" %>>Entire Year</option>
</select>
</td>
<td>
<%
val = request.getAttribute("filterYear") == null ? null : request.getAttribute("filterYear").toString();
%>
<select name="filterYear" onChange="filterYearChange(submissionsForm.filterYear.options[submissionsForm.filterYear.selectedIndex].value,submissionsForm.filterMonth)">
<option value="2008" <%= val.equals("2008") ? "selected" : "" %>>2008</option>
<option value="2007" <%= val.equals("2007") ? "selected" : "" %>>2007</option>
<option value="2006" <%= val.equals("2006") ? "selected" : "" %>>2006</option>
<option value="All" <%= val.equals("All") ? "selected" : "" %>>All Years</option>
</select>
</td>
<td>
<input type="image" src="/i/v2/view-button.png" onClick="filterDateChange"></input>
</td>
</tr>
</table>

<table class="stat" cellpadding="0" cellspacing="0">
    <tbody>
        <tr>
</tr>

        <tr>
            <td class="headerW"><div>&nbsp;</div></td>
            <td class="header" width="100%">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start
                    Date</a></td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End
                    Date</a></td>
            <td class="headerR" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("amount")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">First Prize</a>
            </td>
            <td class="headerR">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("dr_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">SC Points</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("registrants")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Registrants</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("passing_submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Passed Screening</a>
            </td>
<%--
            <td class="headerC">
                &nbsp;
            </td>
            <td class="headerC">
                &nbsp;
            </td>
--%>
            <td class="headerE"><div>&nbsp;</div></td>
        </tr>
        <% boolean even = true;
            int i = 0; %>
        <rsc:iterator list="<%=contests%>" id="resultRow">
            <tr><td class="space" colspan="11">&nbsp;</td></tr>
            <tr class="<%=even?"light":"dark"%>">
                <td class="valueW">
                    <div>&nbsp;</div>
                </td>
                <td class="value">
                    <%-- Since TopCoder Studio Modifications assembly Req# 5.2 --%>
                    <div class="contestEmblem"><studio_tags:contestIcon row="${resultRow}"/></div>
                    <div class="contestTitle"><a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                        <rsc:item name="name" row="<%=resultRow%>"/>
                    </a></div>

                    <div class="contestLinks">
                        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">contest
                            details</a>
                        <c:if test="${resultRow.map['forum_id']!=null}">| <studio:forumLink forumID="${resultRow.map['forum_id']}" message="discuss"/></c:if>
                        <% if (resultRow.getBooleanItem("results_available")) { %>
                        |
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">winners</a>
                        <% } %>
                    </div>
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
                <td class="valueR">
                    <rsc:item name="dr_points" row="<%=resultRow%>" format="######" ifNull="&nbsp;"/>
                </td>
                <td class="valueC">
                    <rsc:item name="registrants" row="<%=resultRow%>"/>
                </td>
                <td class="valueC">
                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("show_submissions")%>">
                            <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                <rsc:item name="submission_count" row="<%=resultRow%>"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <rsc:item name="submission_count" row="<%=resultRow%>"/>
                        </c:otherwise>
                    </c:choose>

                </td>
                <td class="valueC">
                    <rsc:item name="passing_submission_count" row="<%=resultRow%>"/>
                </td>
                    <%--
                                    <td class="valueC">
                                        <% if (resultRow.getBooleanItem("results_available")) { %>
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">winners</a>
                                        <% } else {%>
                                        &#160;
                                        <% } %>
                                    </td>
                                    <td class="valueC" nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">contest details</a>
                                    </td>
                    --%>
                <td class="valueE">
                    <div>&nbsp;</div>
                </td>
            </tr>
            <% even = !even; i++; %>
        </rsc:iterator>
    </tbody>
</table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>

</form>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>
