<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>
          
<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CampaignInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CampaignInterestTask" />
          
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<title>TopCoder | Recruiting Reports</title>

<!-- JavaScript begins -->
<jsp:include page="script.jsp" />
<!-- JavaScript ends -->
    
</head>

<body>

<!-- Top begins -->
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include><!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
      <td WIDTH="25"><img src="/i/corp/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></td>
<!-- Left Column Ends -->

<!-- Gutter begins -->
        <td width="6"><img src="/i/corp/clear.gif" width="6" height="8" alt="" border="0"></td>
<!-- Gutter ends -->

<!-- Center Column begins -->
        <td width="100%" align="center">

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td align="center">
                        <p>
                        <tces:trailIterator id="trailItem" trailList="<%=CampaignInterestTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href" />" class="bodyText"><jsp:getProperty name="trailItem" property="name" /></a> &gt;
                        </tces:trailIterator>
                        </p>    
                    </td>
                </tr>
            </table>

            <h2>Campaign Interest</h2>

            <table border="0" cellspacing="10" cellpadding="0">
                <tr valign="top">
                    <td class="bodyText">
                        <p>
                            <strong><%=CampaignInterestTask.getCampaignName()%></strong><br>
                            <a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>" class="bodyText">View collective demographic info</a><BR>
                        </p>
                    </td>
                </tr>
            </table>
                        
            <table id="datatable" cellspacing="0" cellpadding="5" border="0">
                <tr>
                    <td class="testTableTitle"><A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=handle&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="tableColLink"><strong>Handle</strong></a></td>
                    <td class="testTableTitle">&#160;</td>
                    <td class="testTableTitle"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=rating_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="tableColLink"><strong>Rating</strong></a></td>
                    <td class="testTableTitle">&#160;</td>
                    <td class="testTableTitle"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=state_code_sort" class="tableColLink"><strong>State</strong></a></td>
                    <td class="testTableTitle">&#160;</td>
                    <td class="testTableTitle"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=country" class="tableColLink"><strong>Country</strong></a></td>
                    <td class="testTableTitle">&#160;</td>
                    <td class="testTableTitle"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc" class="tableColLink"><strong>Type</strong></a></td>
                    <td class="testTableTitle">&#160;</td>
                    <td class="testTableTitle"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=school_name_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="tableColLink"><strong>School</strong></a></td>
                    <td class="testTableTitle">&#160;</td>
                    <td class="testTableTitle"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=job_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="tableColLink"><strong>Position</strong></a></td>
                    <td class="testTableTitle">&#160;</td>
                    <td class="testTableTitle"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=hit_date_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="tableColLink"><strong>Hit Date</strong></a></td>
                </tr>

                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                <tces:rowIterator id="hit" rowList="<%=CampaignInterestTask.getHitList()%>"><% i++; %><tr>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_PROFILE_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<%=hit.getItem("job_id").toString()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=hit.getItem("coder_id").toString()%>" class="bodyText"><%= hit.getItem("handle").toString() %></a></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("rating").toString() %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("state_code").toString() %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("country").toString() %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("coder_type_desc").toString() %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;</td>
<td class="<%=i%2==1?"testTableOddWrapping":"testTableEvenWrapping"%>"><%= hit.getItem("school_name").toString() %></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<%=hit.getItem("job_id").toString()%>" class="bodyText"><%= hit.getItem("job_desc").toString() %></a></td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;</td>
<td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= hit.getItem("hit_date").toString() %></td></tr></tces:rowIterator>

                <% if(CampaignInterestTask.getHitList().isEmpty()){ %>
                            
                <tr><td class="bodyText" HEIGHT="18" COLSPAN="20"><BR></td></tr>                
                            
                <tr><td class="bodyText" HEIGHT="18" align="center" colspan="20">No hits available.</td></tr>
                            
                <% } %>

            </table>
                            
            <p><br></p>

            </table>
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
