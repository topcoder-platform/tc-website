<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CampaignDetailTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CampaignDetailTask" />

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
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/corp/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

<!-- Gutter begins -->
        <td width="6"><img src="/i/corp/clear.gif" width="6" height="8" alt="" border="0"></td>
<!-- Gutter ends -->

<!-- Center Column begins -->
        <td class="bodyText" width="100%" align="center">

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td align="center">
                        <p>
                        <tces:trailIterator id="trailItem" trailList="<%=CampaignDetailTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name" /></a> &gt;
                        </tces:trailIterator>
                        </p>
                    </td>
                </tr>
            </table>
            
            <p><strong><jsp:getProperty name="CampaignDetailTask" property="CompanyName" /></strong><br>
            <jsp:getProperty name="CampaignDetailTask" property="CampaignName" /></p>
        
            <p><strong>Total Hits:</strong> <jsp:getProperty name="CampaignDetailTask" property="TotalHits" /><br>
            <strong>Most Recent Hit:</strong> <jsp:getProperty name="CampaignDetailTask" property="MostRecentHit" /></p>
        
            <p><A href="<jsp:getProperty name="CampaignDetailTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignDetailTask" property="CampaignID" />" class="bodyText">View Overall Campaign Interest</A></p>

            <h2>Employment Campaign Positions</h2>
            
            <table id="datatable" cellspacing="0" cellpadding="5" border="0">
                <tr>
                    <td class="testTableTitle"><strong>Position Name</strong></TD>
                    <td class="testTableTitle" align="right"><strong>Total Hits&#160;&#160;</strong></TD>
                    <td class="testTableTitle"><strong>Most Recent Hit</strong></TD>
                </tr>

                <% int i=0; %>
                    <tces:mapIterator id="position" mapList="<%=(List)CampaignDetailTask.getPositionList()%>">
                <% i++; %>
                                
                <tr>
                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><A href="<jsp:getProperty name="CampaignDetailTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignDetailTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=(String)position.get("job_id")%>" class="bodyText"><%= (String)position.get("job_desc") %></A></td>
                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= (String)position.get("hit_count") %></td>
                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= (String)position.get("most_recent") %></td>
                </tr>
                                
                </tces:mapIterator>

                <% if(CampaignDetailTask.getPositionList().isEmpty()){ %>
                                
                <tr><td class="bodyText" colspan="3"><br></td></tr>
                                
                <tr><td class="bodyText" align="center" colspan="3">No positions available.</td></tr>
                                
                <% } %>

            </table>

            <p><br></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/corp/clear.gif" width="6" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

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
