<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="PositionInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.PositionInterestTask" />

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
                        <tces:trailIterator id="trailItem" trailList="<%=PositionInterestTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></a> &gt;
                        </tces:trailIterator>
                        </div>
                    </td>
                </tr>
            </table>

            <h2>Position Interest</h2>

            <table cellspacing="10" cellpadding="0" border="0">
                <tr>
                    <td class="bodyText" align="left">
                        <p>
                        <strong>Campaign:</strong> <jsp:getProperty name="PositionInterestTask" property="CampaignName"/><br>
                        <strong>Position:</strong> <jsp:getProperty name="PositionInterestTask" property="PositionName"/><br>
                        <a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>" class="bodyText">View collective demographic info</a><br>
                        </p>
                    </td>
                </tr>
            </table>

            <table id="dataTable" cellspacing="0" cellpadding="5" border="0">
                <tr>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=handle&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="tableColLink">Handle</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=rating_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="tableColLink">Rating</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=state_code_sort" class="tableColLink">State</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=country_code" class="tableColLink">Country</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc" class="tableColLink">Type</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=school_name_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="tableColLink">School</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=gpa_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="tableColLink">GPA</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=grad_year_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="tableColLink">Grad. Year</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=hit_date_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="tableColLink">Hit Date</a></td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=has_resume&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="tableColLink">Resume</a> </td>
                  <td class="testTableTitle"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=language_name&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="tableColLink">Lang.</a></td>
                </tr>

                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                <tces:rowIterator id="hit" rowList="<%=PositionInterestTask.getHitList()%>"><% i++; %><tr>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
  <a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_PROFILE_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=hit.getItem("coder_id").toString()%>" class="bodyText"><%= hit.getItem("handle").toString() %></a></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="right"><%= hit.getItem("rating").toString() %>&#160;</td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="center"><%= hit.getItem("state_code").toString() %></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("country_code").toString() %></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("coder_type_desc").toString() %></td>
 <td class="<%=i%2==1?"testTableOddWrapping":"testTableEvenWrapping"%>"><%= hit.getItem("school_name").toString() %></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("gpa").toString() %></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="center"><%= hit.getItem("grad_year").toString() %></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("hit_date").toString() %></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>" align="center"><%=hit.getItem("has_resume").toString().equals("1")?"Yes":"No"%></td>
 <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%=hit.getItem("language_name").toString()%></td>
</tr></tces:rowIterator>

                <% if(PositionInterestTask.getHitList().isEmpty()){ %>
                <tr><td class="bodyText" colspan="10"><br></td></tr>
                <tr><td class="bodyText" align="center" colspan="10">No hits available.</td></tr>
                <% } %>

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
