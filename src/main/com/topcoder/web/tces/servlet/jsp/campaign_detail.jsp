<%@  page 
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CampaignDetailTask" scope="request" class="com.topcoder.web.tces.bean.CampaignDetailTask" />

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
<jsp:include page="top.jsp" />             
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

<!-- Gutter begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="8" alt="" border="0"></td>
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
        
            <p><a href="<jsp:getProperty name="CampaignDetailTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignDetailTask" property="CampaignID" />" class="bodyText">View Overall Campaign Interest</a></p>

            <table border="0" cellspacing="10" cellpadding="0">
                <tr valign="top">
                    <td class="bodyText"><img src="/i/clear.gif" alt="" width="400" height="1" border="0">
                        <h2>Employment Campaign Positions</h2>
                        <table id="datatable" cellspacing="0" cellpadding="3" border="0">
                            <tr>
                                    <td class="testTableTitle">&#160;&#160;</td>
                                    <td width="49%" class="testTableTitle"><strong>Position Name</strong></TD>
                                    <td class="testTableTitle">&#160;&#160;</td>
                                    <td width="24%" class="testTableTitle"><strong>Total Hits</strong></TD>
                                    <td class="testTableTitle">&#160;&#160;</td>
                                    <td width="24%" class="testTableTitle"><strong>Most Recent Hit</strong></TD>
                                    <td class="testTableTitle">&#160;&#160;</td>
                                </tr>

                                <% int i=0; %>
                                <tces:mapIterator id="position" mapList="<%=(List)CampaignDetailTask.getPositionList()%>">
                                <% i++; %>
                                
                                <tr>
                                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;&#160;</td>
                                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><a href="<jsp:getProperty name="CampaignDetailTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignDetailTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=(String)position.get("job_id")%>" class="bodyText"><%= (String)position.get("job_desc") %></a></td>
                                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;&#160;</td>
                                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= (String)position.get("hit_count") %></td>
                                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;&#160;</td>
                                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><%= (String)position.get("most_recent") %></td>
                                    <td class="<%=i%2==1?"testTableOdd":"testTableEven"%>">&#160;&#160;</td>
                                </tr>
                                
                                </tces:mapIterator>

                                <% if(CampaignDetailTask.getPositionList().isEmpty()){ %>
                                
                                <tr><td class="bodyText" COLSPAN="20"><br></td></tr>                
                                
                                <tr><td class="bodyText" align="center" colspan="20">No positions available.</td></tr>
                                
                                <% } %>

                            </table>
                            
                            <p><br></p>
                            
                        </td>
                    </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"><br>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="foot.jsp" />             
<!-- Footer ends -->

</body>
</html>
