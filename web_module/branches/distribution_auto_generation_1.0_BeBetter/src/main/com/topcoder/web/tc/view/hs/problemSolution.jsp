<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.Request,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,
                java.util.Map"

        %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

<%
    Map queryEntries = (Map) request.getAttribute("QUERY_RESPONSE");

//common code that pulls out the request bean.
    Request srb = (Request) request.getAttribute("REQUEST_BEAN");
    String sCoderId = srb.getProperty("cr", "");
    String sRoundId = srb.getProperty("rd", "");
    String sProblemId = srb.getProperty("pm", "");

    String seasonName = (String) request.getAttribute("seasonName");

    int pm = Integer.parseInt(srb.getProperty("pm", ""));
    int forumId = -1;
//get the Header info

    boolean highSchool = false;

    ResultSetContainer rscHdr = (ResultSetContainer) queryEntries.get("Room_Header_Information");
    ResultSetContainer image = (ResultSetContainer) queryEntries.get("Round_Sponsor_Image");

    ResultSetContainer.ResultSetRow resultRowHdr = rscHdr.isValidRow(0) ? rscHdr.getRow(0) : null;

    String sSeason = "";
    String sMatch = "";
    String sRoomName = "";
    String sRoomId = "";

    if (resultRowHdr != null) {
        highSchool = resultRowHdr.getIntItem("algo_rating_type_id") == 2;
        sSeason = (highSchool ? seasonName : "");
        sMatch = resultRowHdr.getItem(0).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(1).toString();
        sRoomName = resultRowHdr.getItem(2).toString();
        forumId = resultRowHdr.getIntItem("forum_id");
        sRoomId = resultRowHdr.getStringItem("room_id");
    }

//get the Problem Name info
    ResultSetContainer rscInfo = (ResultSetContainer) queryEntries.get("Problem_Data");
    ResultSetContainer.ResultSetRow resultRow_Info = rscInfo.isValidRow(0) ? rscInfo.getRow(0) : null;
    String sClassName = resultRow_Info != null ? resultRow_Info.getItem(0).toString() : "";

//get the solution text
    ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Problem_Submission");
    ResultSetContainer.ResultSetRow resultRow_0 = rsc.isValidRow(0) ? rsc.getRow(0) : null;
    String sSolutionText = resultRow_0 != null ? resultRow_0.getItem("submission_text").toString() : "";

    ResultSetContainer rscSubmissions = (ResultSetContainer) queryEntries.get("Coder_Problems");
    ResultSetContainer rscSysTest = (ResultSetContainer) queryEntries.get("System_Tests");
    ResultSetContainer rscDefense = (ResultSetContainer) queryEntries.get("Problem_Defenses");
    boolean even = false;

    String roundOverviewLink = null;
    String roomStatsLink = null;

    String context = highSchool ? "hs_algorithm" : "algorithm";

    if (highSchool) {
        roundOverviewLink = "/tc?module=HSRoundOverview&rd=" + sRoundId;
        roomStatsLink = "/tc?module=HSRoomStats&rd=" + sRoundId + "&rm=" + sRoomId;
    } else {
        roundOverviewLink = "/stat?c=round_overview&rd=" + sRoundId;
        roomStatsLink = "/stat?c=room_stats&rd=" + sRoundId + "&rm=" + sRoomId;
    }

%>


<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value='<%= highSchool? "m_hs_stats" : "m_algo_stats" %>'/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value='<%= highSchool? "high_school" : "algorithm" %>'/>
    <jsp:param name="title" value="Problem Solution"/>
</jsp:include>

<span class="subtitle"><%=sSeason%> > <A href="<%= roundOverviewLink %>" class="bcLink"><%=sMatch%></A> > <A href="<%=roomStatsLink%>" class="bcLink"><%= sRoomName %></A> > 
 </span>
<br>
<br><br>
<%--
<span class="bodySubtitle"><%= highSchool? "High School" : "Algorithm" %> Statistics > <A href="<%= roundOverviewLink %>" class="bcLink">Match Overview</A> >
<A href="<%= roomStatsLink%>" class="bcLink">Room Statistics</A> > Problem Solution</span>
<br><br>
<strong>Match:</strong> <A href="<%= roundOverviewLink %>" class="bcLink"><%=sHeader%></A><br>
<strong>Room:</strong> <A href="<%=roomStatsLink%>" class="bcLink"><%= sRoomName %></A><br>
<strong>Coder:</strong> <tc-webtag:handle coderId="<%= sCoderId %>" context='<%=context%>' /><br>
<% if(forumId > 0) { %>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=forumId %>" class="bcLink">Discuss this contest</a>
<% } %>
<br><br>
--%>

<table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
    <tr>
        <td class="title" colspan="6">
            Problem Solutions
        </td>
    </tr>
    <tr>
        <td class="header">&#160;
        </td>
        <td class="header">
            Class Name
        </td>
        <td class="header">
            Method Name
        </td>
        <td class="header">
            Difficulty
        </td>
        <td class="header">
            Status
        </td>
        <td class="headerR">
            Points
        </td>
    </tr>

    <rsc:iterator list="<%= rscSubmissions %>" id="resultRow">
        <% even = !even;
            boolean selected = resultRow.getIntItem("problem_id") == pm;
        %>
        <tr class='<%= selected? "highlight" : (even? "light" : "dark") %>'>
            <td class="value" style="vertical-align: middle;">
                <A href='/tc?module=HSProblemSolution&amp;rd=<%= sRoundId %>&amp;pm=<%= resultRow.getIntItem("problem_id") %>&amp;cr=<%= sCoderId %>'>
                    <img src='<%= "/i/interface/" + (selected? "exp_ed_w.gif" : "exp_w.gif") %>' alt=""/>
                </A>
            </td>
            <td class="value">
                <rsc:item name="class_name" row="<%=resultRow%>"/>
            </td>
            <td class="value">
                <rsc:item name="method_name" row="<%=resultRow%>"/>
            </td>
            <td class="value">
                <rsc:item name="level_desc" row="<%=resultRow%>"/>
            </td>
            <td class="value">
                <rsc:item name="end_status_text" row="<%=resultRow%>"/>
            </td>
            <td class="valueR">
                <rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/>
            </td>
        </tr>
    </rsc:iterator>
</table>

<br><br>

<div style="float:right;"><A href="/tc?module=HSProblemStatement&pm=<%=sProblemId%>&rd=<%=sRoundId%>">view problem
    statement</A></div>
<span class="title"><tc-webtag:handle coderId="<%= sCoderId %>" context='<%=context%>'/>'s solution to <%=sClassName%></span>
<br><br>

<pre>
    <%= sSolutionText.trim().length() == 0 ? "Solution Not Available" : JSPUtils.htmlEncode(sSolutionText) %>
</pre>

<a name="Defenses"></a>
<% if (rscDefense.size() > 0) { %>
<table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
    <tr>
        <td class="title" colspan="4">
            Defense Results
        </td>
    </tr>
    <tr>
        <td class="header">
            Challenger
        </td>
        <td class="header">
            Challenge Arguments
        </td>
        <td class="headerR">
            Expected Result
        </td>
        <td class="headerR">
            Succeeded
        </td>
    </tr>
    <rsc:iterator list="<%= rscDefense %>" id="resultRow">
        <% even = !even; %>
        <tr class="<%=even?"dark":"light"%>">
            <td class="value">
                <tc-webtag:handle coderId='<%= resultRow.getIntItem("challenger_id") %>' context='<%=context%>'/>
            </td>
            <td class="value">
                <%= JSPUtils.htmlEncode(resultRow.getItem("args"))%>
            </td>
            <td class="valueR">
                <%= JSPUtils.htmlEncode(resultRow.getItem("expected"))%>
            </td>
            <td class="valueR">
                <%= resultRow.getItem("succeeded").toString().equals("Y") ? "Yes" : ("No - Result:&#160;&#160;&#160;&#160;" + JSPUtils.htmlEncode(resultRow.getItem("received"))) %>
            </td>
        </tr>
    </rsc:iterator>
</table>
<% } %>


<br>

<% if (rscSysTest.size() > 0) { %>
<table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
    <tr>
        <td class="title" colspan="3">
            System Test Results
        </td>
    </tr>
    <tr>
        <td class="header">
            Test Arguments
        </td>
        <td class="headerR">
            Expected Result
        </td>
        <td class="headerR">
            Success
        </td>
    </tr>
    <rsc:iterator list="<%= rscSysTest %>" id="resultRow">
        <% even = !even; %>
        <tr class="<%=even?"dark":"light"%>">
            <td class="value">
                <%= JSPUtils.htmlEncode(resultRow.getItem("args"))%>
            </td>
            <td class="valueR">
                <%= JSPUtils.htmlEncode(resultRow.getItem("expected_result"))%>
            </td>
            <td class="valueR">
                <%= resultRow.getItem("succeeded").toString().equals("1") ? "Passed" : "<span class=bigRed>FAILED - Result:&#160;&#160;&#160;&#160;" + JSPUtils.htmlEncode(resultRow.getItem("received")) + "</span>"%>
            </td>
        </tr>
    </rsc:iterator>
</table>
<% } %>


</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="tchs"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
