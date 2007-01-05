<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.Constants" %>

<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<% ResultSetContainer dates = (ResultSetContainer) request.getAttribute("dates");
    ResultSetContainer reviewers = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("reviewers_for_project");
    ResultSetContainer projectInfo = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("project_info");
    ResultSetContainer submissions = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("submissions");
    //ResultSetContainer hasUnknownRSC = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("has_unknwon");
    //boolean hasUnknown = hasUnknownRSC.getIntItem(0, "has_unknown") > 0;

    long projectId = ((Long) request.getAttribute("pid")).longValue();
    boolean first = true;

    String imgName = "";
    if (projectInfo.getStringItem(0, "category_desc").equals("Java")) {
        imgName = "/i/development/smJava.gif";
    }
    if (projectInfo.getStringItem(0, "category_desc").equals(".NET")) {
        imgName = "/i/development/netSm.gif";
    }
    if (projectInfo.getStringItem(0, "category_desc").equals("Java Custom")) {
        imgName = "/i/development/smJavaCustom.gif";
    }
    if (projectInfo.getStringItem(0, "category_desc").equals(".NET Custom")) {
        imgName = "/i/development/smNetCustom.gif";
    }

    boolean canDownloadSubm = ((Boolean) request.getAttribute("isComplete")).booleanValue();
    boolean isDev = "113".equals(projectInfo.getStringItem(0, "phase_id"));

%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node"
                   value='<%="112".equals(projectInfo.getStringItem(0, "phase_id"))?"des_stats":"dev_stats"%>'/>
    </jsp:include>
</td>


<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Contest Details"/>
</jsp:include>

<span class="bodySubtitle">Component Statistics >
<a href='/tc?module=CompList&amp;<%=Constants.PHASE_ID%>=<rsc:item set="<%=projectInfo%>" name="phase_id"/>'
   class="statLink">
    <rsc:item set="<%=projectInfo%>" name="phase_desc"/>
    Contests</a>
 > Contest Details
</span><br>
<span class="bc">
<% if (dates.size() > 1) { %>
                 <rsc:iterator list="<%=dates%>" id="resultRow">

                     <% if (!first) { %>
                     &#160;|&#160;
                     <% } else {
                         first = false;
                     }
                     %>

                     <% if (resultRow.getLongItem("project_id") == projectId) { %>
                     <rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
                     <% } else { %>
                     <A HREF='/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>'
                        class="bcLink">
                         <rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
                     </A>
                     <% } %>
                 </rsc:iterator>
<% } %>

</span>

<div class="pagingBox">&#160;</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder" style="border-top: 1px solid #999999;">
<tr>
<td class="divider">
    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat" style="border: none;">
        <tr>
            <td class="title" colspan="2">
                <rsc:item set="<%=projectInfo%>" name="phase_desc"/>
                Contest Details
            </td>
        </tr>
        <tr>
            <td class="value" colspan="2" style="border: 0px none ;"><strong>Contest:</strong><br>
                <rsc:item set="<%=projectInfo%>" name="component_name"/>
                <rsc:item set="<%=projectInfo%>" name="version_text"/>
                <br><br>
            </TD>
        </tr>
        <tr>
            <td class="value" colspan="2" style="border: 0px none ;"><strong>Component:</strong><br>
                <% if (projectInfo.getIntItem(0, "viewable_category_ind") == 1) { %>
                <A href='http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item set="<%=projectInfo%>" name="component_id"/>&ver=<rsc:item set="<%=projectInfo%>" name="version_id"/>'
                   class="statLink">
                    <rsc:item set="<%=projectInfo%>" name="component_name"/>
                </A>
                <% } else { %>
                <rsc:item set="<%=projectInfo%>" name="component_name"/>
                <% } %>
                <br><br>
            </TD>
        </tr>
        <tr>
            <td class="value" valign="top" style="border: none; padding-top: 3px"><strong>Catalog:</strong></td>
            <TD class="value" align="right" valign="top" style="border: none; padding-top: 3px">
                <img src='<%=imgName%>' alt='<rsc:item set="<%=projectInfo%>" name="category_desc"/>' border="0"/>
            </TD>
        </tr>
        <tr>
            <td class="value" style="border: none;"><strong>Registrants:</strong></TD>
            <TD class="value" style="border: none;" align="right">
                <rsc:item set="<%=projectInfo%>" name="num_inquiries" ifNull="unknown*"/>
            </TD>
        </tr>
        <tr>
            <td class="value" style="border: none;"><strong>Submissions:</strong></TD>
            <TD class="value" style="border: none;" align="right">
                <rsc:item set="<%=projectInfo%>" name="num_submissions" ifNull="unknown*"/>
            </TD>
        </tr>
        <tr>
            <td class="value" style="border: none;" nowrap="nowrap"><strong>Submission %:</strong></TD>
            <TD class="value" style="border: none;" align="right">
                <rsc:item set="<%=projectInfo%>" name="submission_percent" format="0.00'%'" ifNull="unknown*"/>
            </TD>
        </tr>
        <tr>
            <td class="value" style="border: none;" nowrap="nowrap"><strong>Passed Screening:</strong></TD>
            <TD class="value" style="border: none;" align="right">
                <rsc:item set="<%=projectInfo%>" name="passed" ifNull="unknown*"/>
            </TD>
        </tr>
        <tr>
            <td class="value" style="border: none;" nowrap="nowrap"><strong>Passed %:</strong></TD>
            <TD class="value" style="border: none;" align="right">
                <rsc:item set="<%=projectInfo%>" name="passed_percent" format="0.00'%'" ifNull="unknown*"/>
            </TD>
        </tr>
        <tr>
            <td class="value" style="border: none;" nowrap="nowrap"><strong>Avg Initial Score:</strong></TD>
            <TD class="value" style="border: none;" align="right">
                <rsc:item set="<%=projectInfo%>" name="avg_raw_score" format="0.00" ifNull="unknown*"/>
            </TD>
        </tr>
        <tr>
            <td class="value" style="border: none;" nowrap="nowrap"><strong>Avg Final Score:</strong></TD>
            <TD class="value" style="border: none;" align="right">
                <rsc:item set="<%=projectInfo%>" name="avg_final_score" format="0.00" ifNull="unknown*"/>
            </TD>
        </tr>
    </table>
</td>
<td width="75%" valign="top">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat" style="border: none;">
<tr>
    <td class="title" colspan="<%= canDownloadSubm? 12 : 11 %>">
        Competitors
    </td>
</tr>
<tr>
    <TD CLASS="header" rowspan="2">Handle</TD>
    <TD CLASS="headerC" rowspan="2">Date inquired</TD>
    <TD CLASS="headerC" rowspan="2">Date submitted</TD>
    <TD CLASS="headerC" rowspan="2" colspan="2">Screening Score</TD>
    <TD CLASS="headerC" rowspan="2">Initial Score</TD>
    <TD CLASS="headerC" rowspan="2">Final Score</TD>
    <TD CLASS="headerC" rowspan="2">
        <div id="popDR" class="popUp">
            <div>Digital Run</div>
        </div>
        <a href='/tc?module=Static&d1=digital_run&d2=description'><img class="emblem" src="/i/interface/emblem/digitalrun.png" alt="" border="0" onmouseover="popUp(this,'popDR')" onmouseout="popHide()"/></a>
        Points
    </TD>
    <TD CLASS="headerC">&nbsp;</TD>
    <TD CLASS="headerC">Reviewers</TD>
    <TD CLASS="headerC">&nbsp;</TD>
    <% if (canDownloadSubm) { %>
    <TD CLASS="headerC" rowspan="2">&nbsp;</TD>
    <% } %>
</tr>
<tr>
    <%
        if (reviewers.isEmpty()) {
    %>
    <TD CLASS="headerC">unknown*</TD>
    <TD CLASS="headerC">unknown*</TD>
    <TD CLASS="headerC" colspan="2">unknown*</TD>
    <% } else {
        for (int k = 0; k < 3; k++) {
    %>
    <TD CLASS="headerC">
        <% if (reviewers.size() < k) { %>
        unknown*
        <% } else { %>
        <% if ("Stress".equalsIgnoreCase(reviewers.getStringItem(k, "review_resp_desc"))) { %>
        <div id="popStress" class="popUp">
            <div>Stress</div>
        </div>
        <div align="center">
            <img src="/i/interface/emblem/stress.png" alt="" border="0" onmouseover="popUp(this,'popStress')" onmouseout="popHide()"/>
        </div>
        <% } else if ("Accuracy".equalsIgnoreCase(reviewers.getStringItem(k, "review_resp_desc"))) { %>
        <div id="popAccuracy" class="popUp">
            <div>Accuracy</div>
        </div>
        <div align="center">
            <img src="/i/interface/emblem/accuracy.png" alt="" border="0" onmouseover="popUp(this,'popAccuracy')" onmouseout="popHide()"/>
        </div>
        <% } else if ("Failure".equalsIgnoreCase(reviewers.getStringItem(k, "review_resp_desc"))) { %>
        <div id="popFailure" class="popUp">
            <div>Failure</div>
        </div>
        <div align="center">
            <img src="/i/interface/emblem/failure.png" alt="" border="0" onmouseover="popUp(this,'popFailure')" onmouseout="popHide()"/>
        </div>
        <% } %>
        <tc-webtag:handle coderId='<%= reviewers.getLongItem(k, "reviewer_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>
        <% } %>

    </TD>
    <% } %>
    <% } %>

</tr>

<% boolean even = true;
    int i = 0; %>
<rsc:iterator list="<%=submissions%>" id="resultRow">
    <tr class="<%=even?"light":"dark"%>">
        <TD class="value">
            <tc-webtag:handle coderId='<%= resultRow.getLongItem("user_id") %>'
                              context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>
        </TD>

        <TD class="valueC">
            <rsc:item name="inquire_timestamp" row="<%=resultRow%>"
                      format="MM.dd.yyyy" ifNull="unknown*"/>
        </TD>
        <TD class="valueC">
            <rsc:item name="submit_timestamp" row="<%=resultRow%>"
                      format="MM.dd.yyyy" ifNull="unknown*"/>
        </TD>
        <TD class="valueR">
            <% if (resultRow.getItem("screening_score").getResultData() == null) { %>
            <rsc:item row="<%=resultRow%>" name="screening_score" format="0.00" ifNull="unknown*"/>
            <% } else { %>
            <A HREF='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>'
               class="bcLink">
                <rsc:item row="<%=resultRow%>" name="screening_score" format="0.00" ifNull="unknown*"/>
            </A>
            <% } %>
        </TD>
        <TD class="value">
            <% if (resultRow.getIntItem("passed_screening") == 1) { %>
            <img src="/i/interface/greencheck.png" alt="pass" border="0"/>
            <% } else { %>
            <img src="/i/stats/fail.gif" alt="fail" border="0"/>
            <% } %>

        </TD>
        <% if (resultRow.getIntItem("passed_screening") == 1) { %>
        <TD class="valueC">
            <rsc:item row="<%=resultRow%>" name="initial_score" format="0.00" ifNull="unknown*"/>
        </TD>
        <TD class="valueC"><b>
            <rsc:item row="<%=resultRow%>" name="final_score" format="0.00" ifNull="unknown*"/>
        </b></TD>
        <TD class="valueC"><b>
            <rsc:item row="<%=resultRow%>" name="final_points" ifNull="N/A"/>
            <% if (resultRow.getItem("final_points").getResultData() != null &&
                    resultRow.getIntItem("final_points") != resultRow.getIntItem("initial_points")) { %>
            **
            <% } %>
        </b></TD>
        <%
            for (int k = 0; k < 3; k++) {
                if (reviewers.size() < k) { %>
        <TD class="valueC">
            <rsc:item row="<%=resultRow%>" name="<%="score"+(k+1)%>" format="0.00"/>
        </TD>
        <%
        } else { %>
        <TD class="valueC">
            <A HREF='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>&rid=<%=reviewers.getLongItem(k, "reviewer_id")%>' class="bcLink">
                <rsc:item row="<%=resultRow%>" name="<%="score"+(k+1)%>" format="0.00"/>
            </A>
        </TD>
        <% }
        %>
        <% } %>
        <% if (canDownloadSubm) { %>
        <TD class="valueC" nowrap="nowrap">
            <div id="pop<%=i%>" class="popUp">
                <div>Download submission</div>
            </div>
            <a href='/tc?module=DownloadSubmission&cr=<%= resultRow.getLongItem("user_id") %>&pj=<%= projectId %>&st=1&ph=<%= projectInfo.getStringItem(0, "phase_id") %>'>
                <img src="/i/interface/emblem/disk.gif" alt="Download submission" border="0" onmouseover="popUp(this,'pop<%=i%>')" onmouseout="popHide()"/></a>
        </TD>
        <% } %>


        <% } else { %>
        <TD class="valueC" colspan="7">&nbsp;</TD>
        <% } %>
    </tr>
    <%
        even = !even;
        i++;
    %>
</rsc:iterator>
</table>
</td>
</tr>
</table>

* Some information may be unknown due to missing data from old projects
<br>** This score has been changed for missed deadlines and/or quality issues
</td>
<!-- Center Column Ends -->
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>