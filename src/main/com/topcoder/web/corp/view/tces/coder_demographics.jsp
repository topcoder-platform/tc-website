<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CoderDemographicsTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CoderDemographicsTask" />

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
                        <tces:trailIterator id="trailItem" trailList="<%=CoderDemographicsTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href" />" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></a> &gt;
                        </tces:trailIterator>
                        </div>
                    </td>
                </tr>
            </table>

            <table cellspacing="10" cellpadding="0" border="0">
                <tr>
                    <td class="bodyText" align="left">
                        <strong>Member Profile: <%= CoderDemographicsTask.getMemberInfo().getItem(0, "handle").toString()%></strong><br>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= CoderDemographicsTask.getMemberInfo().getItem(0, "middle_name").toString()%> <%= CoderDemographicsTask.getMemberInfo().getItem(0, "last_name").toString()%><br/>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address1").toString()%><br/>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address2").toString().length()==0?"":CoderDemographicsTask.getMemberInfo().getStringItem(0, "address2")+"<br/>"%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address3").toString().length()==0?"":CoderDemographicsTask.getMemberInfo().getStringItem(0, "address3")+"<br/>"%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "province").toString()%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "city").toString()%>,
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "state_code").toString()%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "zip").toString()%><br/>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "country_name").toString()%><br/>
                        <a href="mailto:<%=CoderDemographicsTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= CoderDemographicsTask.getMemberInfo().getItem(0, "email").toString() %></A> | <%= CoderDemographicsTask.getMemberInfo().getItem(0, "home_phone").toString()%> <br>
                        <strong>Interested in:</strong> <jsp:getProperty name="CoderDemographicsTask" property="JobName"/><br>
                        <% if (CoderDemographicsTask.hasResume()) { %>
                          <a href="<jsp:getProperty name="CoderDemographicsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="MemberID"/>" class="bodyText"><B>Resume</B></a>
                        <% } %>
                    </td>
                </tr>
            </table>

<% if (CoderDemographicsTask.getIsRanked()) { %>
            <table id="linksTable" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td class="bodyText" align="center" width="33%">
                        Coder Demographic Info
                    </td>
                        
                    <td class="bodyText" align="center" width="33%">
                        <A href="<jsp:getProperty name="CoderDemographicsTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CoderDemographicsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CoderDemographicsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CoderDemographicsTask.getMemberID()%>" class="bodyText">Coder Competition History</A>
                    </td>
                    
                    <td class="bodyText" align="center" width="33%">
                        <A href="<jsp:getProperty name="CoderDemographicsTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CoderDemographicsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CoderDemographicsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CoderDemographicsTask.getMemberID()%>" class="bodyText">Coder Problem Submissions</A>
                    </td>
                </tr>
            </table>             
<% } %>
             
            <h2>Coder Demographic Info</h2>
                        
            <table id="dataTable" cellspacing="0" cellpadding="5" border="0">               
                <tr>
                    <td class="testTableTitle">Question</td>
                    <td class="testTableTitle">&#160;&#160;</td>
                    <td class="testTableTitle">Response</td>
                </tr>
                
                <% int i=0; %>
                    <tces:mapIterator id="question" mapList="<%=(List)CoderDemographicsTask.getQuestionList()%>">
                <% i++; %>
                            
                <tr>
                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= (String)question.get("question") %></td>
                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;&#160;</td>
                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><strong><%= (String)question.get("response") %></strong></td>
                </tr>
                </tces:mapIterator>

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
