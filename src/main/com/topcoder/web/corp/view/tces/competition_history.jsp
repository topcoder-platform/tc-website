<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CompetitionHistoryTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CompetitionHistoryTask" />

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
</jsp:include>
<!-- Header Ends -->
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
                        <tces:trailIterator id="trailItem" trailList="<%=CompetitionHistoryTask.getTrail()%>">
                            <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                        </tces:trailIterator>
                        </div>
                    </td>
                </tr>
            </table>

            <table cellspacing="10" cellpadding="0" border="0">
                <tr>
                    <td class="bodyText" align="left">
              <strong>Member Profile: <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "handle").toString()%> </strong> <BR/>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "middle_name").toString()%> <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "last_name").toString()%><br/>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address1").toString()%><br/>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address2").toString().length()==0?"":CompetitionHistoryTask.getMemberInfo().getStringItem(0, "address2")+"<br/>"%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address3").toString().length()==0?"":CompetitionHistoryTask.getMemberInfo().getStringItem(0, "address3")+"<br/>"%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "province").toString()%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "city").toString()%>,
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "state_code").toString()%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "zip").toString()%><br/>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "country_name").toString()%><br/>
              <A HREF="mailto:<%=CompetitionHistoryTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= CompetitionHistoryTask.getMemberInfo().getItem(0, "email").toString() %></A> | <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "home_phone").toString()%> <BR/>
              <strong>Interested in:</strong> <jsp:getProperty name="CompetitionHistoryTask" property="JobName"/><BR/>
              <% if (CompetitionHistoryTask.hasResume()) { %>
                <a href="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="MemberID"/>" class="bodyText"><strong>Resume</strong></a>
              <% } %>
                    </td>
                </tr>
            </table>

            <table id="linksTable" cellspacing="0" cellpadding="0" border="0">
                <tr valign="middle">
                    <td class="bodyText" align="center" width="33%">
                        <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>" class="bodyText">Coder Demographic Info</A>
                    </td>
                    
                    <td class="bodyText" align="center" width="33%">
                        Coder Competition History
                    </td>
                    
                    <td class="bodyText" align="center" width="33%">
                        <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>" class="bodyText">Coder Problem Submissions</A>
                    </td>
                </tr>
            </table>             
             
            <h2>Coder Competition History</h2>
                        
            <p>
                <A HREF="JavaScript:getGraph('/corp/graph/?c=rating_history_graph&cr=<jsp:getProperty name="CompetitionHistoryTask" property="MemberID"/>&cm=<jsp:getProperty name="CompetitionHistoryTask" property="CompanyId"/>','800','600','history')" class="bodyText">Rating History Graph</a> &nbsp;&nbsp;|&nbsp;&nbsp;
                <A HREF="JavaScript:getGraph('/corp/graph/?c=rating_distribution_graph&cm=<jsp:getProperty name="CompetitionHistoryTask" property="CompanyId"/>','600','400','distribution')" class="bodyText">Overall Rating Distribution Graph</a>
            </p>
             
            <table id="dataTable" cellspacing="0" cellpadding="5" border="0">               
                <tr>
                  <td class="testTableTitle">Date</td>
                  <td class="testTableTitle"><strong>Event Name</strong></td>
                  <td class="testTableTitle"><strong>Division</strong></td>
                  <td class="testTableTitle"><strong>Coder Points</strong></td>
                  <td class="testTableTitle"><strong>Avg Points</strong></td>
                  <td class="testTableTitle"><strong>Pre-Rating</strong></td>
                  <td class="testTableTitle"><strong>Post-Rating</strong></td>
                </tr>
                
                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                    <tces:mapIterator id="comp" mapList="<%=CompetitionHistoryTask.getCompetitionList()%>"><% i++; %><tr>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= (String)comp.get("date") %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>&<%=TCESConstants.ROUND_ID_PARAM%>=<%= (String)comp.get("round_id") %>" class="bodyText"><%= (String)comp.get("contest_name") %></A></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= (String)comp.get("division_name") %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="right"><%= (String)comp.get("final_points") %>&#160;&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="right"><%= (String)comp.get("avg_points") %>&#160;&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="right"><%= (String)comp.get("old_rating") %>&#160;&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="right"><%= (String)comp.get("new_rating") %>&#160;&#160;</td>
</TR></tces:mapIterator>
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
