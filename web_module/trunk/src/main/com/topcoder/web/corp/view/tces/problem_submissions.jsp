<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="ProblemSubmissionsTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.ProblemSubmissionsTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
    <jsp:include page="script.jsp" />
</head>

<body>

<!-- Header Begins -->
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include><!-- Header Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="11" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/corp/clear.gif" width="6" height="8" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodytext" width="100%" align="center">
        
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodytext" width="100%">
                        <div align="center">
                        <tces:trailIterator id="trailItem" trailList="<%=ProblemSubmissionsTask.getTrail()%>">
                            <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                        </tces:trailIterator>
                        </div>
                    </td>
                </tr>
            </table>

            <table cellspacing="10" cellpadding="0" border="0">
                <tr>
                    <td class="bodyText" align="left">
              <strong>Member Profile: <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "handle").toString()%> </strong> <BR/>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "middle_name").toString()%> <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "last_name").toString()%><br/>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address1").toString()%><br/>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address2").toString().length()==0?"":ProblemSubmissionsTask.getMemberInfo().getStringItem(0, "address2")+"<br/>"%>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address3").toString().length()==0?"":ProblemSubmissionsTask.getMemberInfo().getStringItem(0, "address3")+"<br/>"%>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "province").toString()%>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "city").toString()%>,
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "state_code").toString()%>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "zip").toString()%><br/>
                        <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "country_name").toString()%><br/>
              <A HREF="mailto:<%=ProblemSubmissionsTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "email").toString() %></A> | <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "home_phone").toString()%> <BR/>
              <strong>Interested in:</strong> <jsp:getProperty name="ProblemSubmissionsTask" property="JobName"/><BR/>
              <% if (ProblemSubmissionsTask.hasResume()) { %>
                <a href="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="MemberID"/>" class="bodyText"><strong>Resume</strong></a>
              <% } %>
                    </td>
                </tr>
            </table>

            <table id="linksTable" cellspacing="0" cellpadding="0" border="0">
                <tr valign="middle">
                    <td class="bodyText" align="center" width="33%">
                        <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>" class="bodyText">Coder Demographic Info</A>
                    </td>
                    
                    <td class="bodyText" align="center" width="33%">
                        <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>" class="bodyText">Coder Competition History</A>
                    </td>

                    <td class="bodyText" align="center" width="33%">
                        Coder Problem Submissions
                    </td>
                </tr>
            </table>

            <h2>Coder Problem Submissions</h2>

            <p>
                <A HREF="JavaScript:getGraph('/graph?c=rating_history_graph&amp;cr=<jsp:getProperty name="ProblemSubmissionsTask" property="MemberID"/>','800','600','history')" class="bodyText">Rating History Graph</a> &nbsp;&nbsp;|&nbsp;&nbsp;
                <A HREF="JavaScript:getGraph('/graph?c=rating_distribution_graph','600','400','distribution')" class="bodyText">Overall Rating Distribution Graph</a>
            </p>

            <table id="dataTable" cellspacing="0" cellpadding="5" border="0">
                <tr>
                  <td class="testTableTitle"<strong>Date</strong></td>
                  <td class="testTableTitle"><strong>Event Name</strong></td>
                  <td class="testTableTitle"><strong>Division</strong></td>
                  <td class="testTableTitle"><strong>Level</strong></td>
                  <td class="testTableTitle"><strong>Coder Points</strong></td>
                  <td class="testTableTitle"><strong>Language</strong></td>
                  <td class="testTableTitle"><strong>Result</strong></td>
                </tr>

                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                <tces:rowIterator id="submission" rowList="<%=(List)ProblemSubmissionsTask.getSubmissionList()%>"><% i++; %><tr>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= TCESConstants.DATE_FORMAT.format((java.sql.Timestamp)submission.getItem("date").getResultData()) %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>&<%=TCESConstants.ROUND_ID_PARAM%>=<%= submission.getItem("round_id").toString() %>" class="bodyText"><%= submission.getItem("name").toString() %></A></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= submission.getItem("division_desc").toString() %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%= submission.getItem("problem_id").toString() %>" class="bodyText"><%= submission.getItem("level_desc").toString() %></A></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="right"><%= submission.getItem("final_points").toString() %>&#160;&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= submission.getItem("language_name").toString() %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= submission.getItem("end_status_text").toString() %></td>
</TR>
</tces:rowIterator>

            </table>
                        
            <p><br></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/corp/clear.gif" width="6" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"><br>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</body>
</html>
