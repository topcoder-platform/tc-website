<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.tag.HandleTag,
                com.topcoder.web.tc.Constants"
        %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer generalInfo = null;
    generalInfo = (ResultSetContainer) ((Map) request.getAttribute("div1Results")).get("general_problem_info");
    if (generalInfo.isEmpty())
        generalInfo = (ResultSetContainer) ((Map) request.getAttribute("div2Results")).get("general_problem_info");

%>
<% ResultSetContainer divisionInfo = (ResultSetContainer) ((Map) request.getAttribute("div1Results")).get("problem_division_info"); %>

<% ResultSetContainer div1Lang = (ResultSetContainer) ((Map) request.getAttribute("div1Results")).get("problem_detail_by_language"); %>
<% ResultSetContainer div2Lang = (ResultSetContainer) ((Map) request.getAttribute("div2Results")).get("problem_detail_by_language"); %>
<% ResultSetContainer div1Overall = (ResultSetContainer) ((Map) request.getAttribute("div1Results")).get("problem_detail_overall"); %>
<% ResultSetContainer div2Overall = (ResultSetContainer) ((Map) request.getAttribute("div2Results")).get("problem_detail_overall"); %>
<% ResultSetContainer testers = (ResultSetContainer) ((Map) request.getAttribute("div1Results")).get("problem_testers");
    if (testers.isEmpty())
        testers = (ResultSetContainer) ((Map) request.getAttribute("div2Results")).get("problem_testers");
%>

<% SimpleDateFormat sdfTime = new SimpleDateFormat("H:mm:ss.S");
    sdfTime.setTimeZone(java.util.TimeZone.getTimeZone("GMT"));%>
<% String forumID = generalInfo.getItem(0, "forum_id").toString(); %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<html>
<head>
    <title>TopCoder Statistics - Problem Archive</title>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>
<jsp:include page="../top.jsp"/>
<table WIDTH="100%" border="0" CELLPADDING="0" CELLSPACING="0">
<tr>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="algo_problem_archive"/>
    </jsp:include>
</TD>
<td WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>

<!-- BEGIN BODY -->
<td CLASS="bodyText" WIDTH="100%" VALIGN="top" align="center">
<IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" border="0"><BR/>
<table border="0" CELLSPACING="0" CELLPADDING="0" width="100%" align="center">
    <tr>
        <td WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom" class="alignBottom">
            <IMG WIDTH="11" HEIGHT="26" border="0" SRC="/i/steelblue_top_left1.gif"></TD>
        <td VALIGN="bottom" class="alignBottom" WIDTH="180" ALIGN="left">
            <IMG WIDTH="180" HEIGHT="26" border="0" SRC="/i/header_statistics.gif"></TD>
        <td CLASS="bodyTextBold" VALIGN="middle" class="alignMiddle" WIDTH="100%">
            &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Problem Detail&#160;&#160;</SPAN>
        </TD>
        <td VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" border="0"></TD>
    </tr>
</table>

<div class="statTableIndent">
<table border="0" CELLSPACING="0" cellpadding="2"  class="paddingTable2" BGCOLOR="#001B35" WIDTH="100%" align="center">
    <tr>
        <td class="statTextBig" nowrap=nowrap valign="top">
            Problem Name:
        </td>
        <td class="statText" width="100%" valign="top">
            <% if (generalInfo.getIntItem(0, "algo_rating_type_id") == Constants.TC_ALGO_RATING_TYPE_ID) { %>
            <A HREF="/stat?c=problem_statement&amp;pm=<rsc:item set="<%=generalInfo%>" name="problem_id"/>&amp;rd=<rsc:item set="<%=generalInfo%>" name="round_id"/>" class="statText">
                <rsc:item set="<%=generalInfo%>" name="class_name"/>
            </A>
            <% } else { %>
            <A HREF="/tc?module=HSProblemStatement&amp;pm=<rsc:item set="<%=generalInfo%>" name="problem_id"/>&amp;rd=<rsc:item set="<%=generalInfo%>" name="round_id"/>" class="statText">
                <rsc:item set="<%=generalInfo%>" name="class_name"/>
            </A>
            <% } %>


        </td>
    </tr>
    <tr>
        <td class="statTextBig" nowrap=nowrap>
            Used In:
        </td>
        <td class="statText">
            <% if (generalInfo.getIntItem(0, "algo_rating_type_id") == Constants.TC_ALGO_RATING_TYPE_ID) { %>
            <A HREF="/stat?c=round_overview&amp;rd=<rsc:item set="<%=generalInfo%>" name="round_id" />" class="statText">
                <rsc:item set="<%=generalInfo%>" name="event_name"/>
            </A>
            <% } else { %>
            <A HREF="/tc?<%=Constants.MODULE_KEY%>=HSRoundOverview&amp;<%=Constants.ROUND_ID%>=<rsc:item set="<%=generalInfo%>" name="round_id" />" class="statText">
                <rsc:item set="<%=generalInfo%>" name="event_name"/>
            </A>
            <% } %>
        </td>
    </tr>
    <tr>
        <td class="statTextBig" nowrap=nowrap>
            Used As:
        </td>
        <td class="statText">
            <rsc:item set="<%=generalInfo%>" name="div1_use"/>
            <%=generalInfo.getItem(0, "div2_use").getResultData() != null && generalInfo.getItem(0, "div1_use").getResultData() != null ? ", " : ""%>
            <rsc:item set="<%=generalInfo%>" name="div2_use"/>
        </td>
    </tr>
    <tr>
        <td class="statTextBig" nowrap="nowrap">
            Categories:
        </td>
        <td class="statText">
            <rsc:item set="<%=generalInfo%>" name="categories"/>
        </td>
    </tr>
    <tr>
        <td class="statTextBig" nowrap="nowrap">
            Writer:
        </td>
        <td class="statText">
            <% if (generalInfo.getItem(0, "writer_id").getResultData() != null) {%>
            <tc-webtag:handle coderId='<%=generalInfo.getLongItem(0, "writer_id")%>' context='<%=HandleTag.HS_OR_ALGORITHM%>'/>
            <% } else { %>
            Unknown
            <% } %>
        </td>
    </tr>
    <tr>
        <td class="statTextBig" nowrap="nowrap">
            <%= testers.size() > 1 ? "Testers: " : "Tester:" %>
        </td>
        <td class="statText">
            <% if (testers.size() == 0) {%>
            Unknown
            <% } else {
                for (int i = 0; i < testers.size(); i++) {
                    if (i > 0) {%>, <% } %>
            <tc-webtag:handle coderId='<%=testers.getLongItem(i, "tester_id")%>' context='<%=HandleTag.HS_OR_ALGORITHM%>'/>


            <% }
            } %>
        </td>
    </tr>

    <tr>
        <td class="statTextBig" valign="top" colspan="2">
            <div style="float:left; padding-right: 5px;">
                <A HREF="Javascript:void openProblemRating(<rsc:item set="<%=generalInfo%>" name="problem_id"/>)" class="statText"><img border="0" src="/i/rate_it.gif"/></A>
            </div>
            <% if (!forumID.equals("")) { %>
            <div style="float:left; padding-right: 5px;">
                <A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&amp;forumID=<%=forumID%>" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>
            </div>
            <% } %>
        </td>
    </tr>

    <tr>
        <td class="bodyText"><br/></td>
        <tr/>
</table>
<table border="0" CELLSPACING="0" cellpadding="2"  class="paddingTable2" BGCOLOR="#001B35" WIDTH="100%" align="center">
    <tr>
        <td BACKGROUND="/i/steel_bluebv_bg.gif"></td>
        <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
            <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statTextBig" align="right" width="40%">
                <rsc:item name="division" row="<%=resultRow%>"/>
            </TD>
        </rsc:iterator>
    </tr>
    <tr>
        <td class="statText">
            Point Value
        </td>
        <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
            <td class="statText" align="right">
                <rsc:item name="points" row="<%=resultRow%>" format="#" ifNull="&#160;"/>
            </TD>
        </rsc:iterator>
    </tr>
    <tr>
        <td class="statText">
            Competitors
        </td>
        <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
            <td class="statText" align="right">
                <rsc:item name="competitors" row="<%=resultRow%>" ifNull="0"/>
            </TD>
        </rsc:iterator>
    </tr>
    <tr>
        <td class="statText">
            Opens
        </td>
        <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
            <td class="statText" align="right">
                <rsc:item name="problems_opened" row="<%=resultRow%>" ifNull="0"/>
            </TD>
        </rsc:iterator>
    </tr>
    <tr>
        <td class="statText">
            Percent Open
        </td>
        <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
            <td class="statText" align="right">
                <rsc:item name="open_percentage" row="<%=resultRow%>" ifNull="0.00%" format="0.00%"/>
            </TD>
        </rsc:iterator>
    </tr>
    <tr>
        <td class="statText">
            Percent Submitted
        </td>
        <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
            <td class="statText" align="right">
                <rsc:item name="submission_percentage" row="<%=resultRow%>" ifNull="0.00%" format="0.00%"/>
            </TD>
        </rsc:iterator>
    </tr>
    <tr>
        <td class="statText">
            Overall Accuracy
        </td>
        <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
            <td class="statText" align="right">
                <rsc:item name="overall_accuracy" row="<%=resultRow%>" ifNull="0.00%" format="0.00%"/>
            </TD>
        </rsc:iterator>
    </tr>

    <tr>
        <td class="bodyText"><br/></td>
        <tr/>
</table>
<table border="0" CELLSPACING="0" cellpadding="2"  class="paddingTable2" BGCOLOR="#001B35" WIDTH="100%" align="center">
<% if (!div1Lang.isEmpty()) { %>
<tr>
    <td class="statText">Division I</td>
</tr>
<tr>
    <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText" width="28%"></TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText" width="12%" align="right">
            <rsc:item name="language_name" row="<%=resultRow%>"/>
        </TD>
    </rsc:iterator>
    <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText" width="12%" align="right">Overall</TD>
</tr>
<tr>
    <td class="statText">Problems Submitted</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Problems Correct</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Submission Accuracy</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </TD>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Problems Failed by Challenge</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Problems Failed by System Test</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Challenge Attempts Made</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/>
        </TD>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Challenge Accuracy</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </TD>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Best Time</TD>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("best_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %>
        </TD>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("best_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Fastest</td>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <% if (resultRow.getItem("coder_id").getResultData() != null) { %>
            <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context='<%=HandleTag.HS_OR_ALGORITHM%>'/>
            <% } %>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <% if (resultRow.getItem("coder_id").getResultData() != null) { %>
            <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context='<%=HandleTag.HS_OR_ALGORITHM%>'/>
            <% } %>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Top Submission</td>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right">
            <% if (resultRow.getItem("coder_id").getResultData() != null) { %>
            <% if (generalInfo.getIntItem(0, "algo_rating_type_id") == Constants.TC_ALGO_RATING_TYPE_ID) { %>
            <a href="/stat?c=problem_solution&amp;cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } else { %>
            <a href="/tc?module=HSProblemSolution&amp;<%=Constants.CODER_ID%>=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;<%=Constants.ROUND_ID%>=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } %>


            <% } %>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right">
            <% if (resultRow.getItem("coder_id").getResultData() != null) { %>
            <% if (generalInfo.getIntItem(0, "algo_rating_type_id") == Constants.TC_ALGO_RATING_TYPE_ID) { %>
            <a href="/stat?c=problem_solution&amp;cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } else { %>
            <a href="/tc?module=HSProblemSolution&amp;<%=Constants.CODER_ID%>=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;<%=Constants.ROUND_ID%>=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } %>
            <% } %>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Average Correct Time</td>
    <rsc:iterator list="<%=div1Lang%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("avg_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div1Overall%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("avg_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %>
        </td>
    </rsc:iterator>
</tr>
<% } %>

<tr>
<td class="bodyText"><br/></td>
<tr/>

<% if (!div2Lang.isEmpty()) { %>
<tr>
    <td class="statText">Division II</td>
</tr>
<tr>
    <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText" width="28%"></td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText" width="12%" align="right">
            <rsc:item name="language_name" row="<%=resultRow%>"/>
        </td>
    </rsc:iterator>
    <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText" width="12%" align="right">Overall</td>
</tr>
<tr>
    <td class="statText">Problems Submitted</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Problems Correct</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Submission Accuracy</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Problems Failed by Challenge</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Problems Failed by System Test</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Challenge Attempts Made</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Challenge Accuracy</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Best Time</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("best_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("best_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">High Scorer</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <% if (resultRow.getItem("coder_id").getResultData() != null) { %>
            <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context='<%=HandleTag.HS_OR_ALGORITHM%>'/>
            <% } %>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <% if (resultRow.getItem("coder_id").getResultData() != null) { %>
            <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context='<%=HandleTag.HS_OR_ALGORITHM%>'/>
            <% } %>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Top Submission</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right">
            <% if (generalInfo.getIntItem(0, "algo_rating_type_id") == Constants.TC_ALGO_RATING_TYPE_ID) { %>
            <a href="/stat?c=problem_solution&amp;cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } else { %>
            <a href="/tc?module=HSProblemSolution&amp;<%=Constants.CODER_ID%>=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;<%=Constants.ROUND_ID%>=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } %>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right">
            <% if (generalInfo.getIntItem(0, "algo_rating_type_id") == Constants.TC_ALGO_RATING_TYPE_ID) { %>
            <a href="/stat?c=problem_solution&amp;cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } else { %>
            <a href="/tc?module=HSProblemSolution&amp;<%=Constants.CODER_ID%>=<rsc:item row="<%=resultRow%>" name="coder_id"/>&amp;<%=Constants.ROUND_ID%>=<rsc:item row="<%=resultRow%>" name="round_id"/>&amp;pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
            <% } %>
        </td>
    </rsc:iterator>
</tr>
<tr>
    <td class="statText">Average Correct Time</td>
    <rsc:iterator list="<%=div2Lang%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("avg_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %>
        </td>
    </rsc:iterator>
    <rsc:iterator list="<%=div2Overall%>" id="resultRow">
        <td class="statText" align="right"><%= resultRow.getItem("avg_time").getResultData() == null ? "" : sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %>
        </td>
    </rsc:iterator>
</tr>


<% } %>

</table>
</div>

<p><br/></p>
<!-- END BODY -->
</td>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></td>
<!-- Gutter Ends -->
<td WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" border="0">
    <jsp:include page="../public_right.jsp"/>
</td>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></td>
<!-- Gutter Ends -->
</tr>
</table>
<jsp:include page="../foot.jsp"/>
</body>
</html>


