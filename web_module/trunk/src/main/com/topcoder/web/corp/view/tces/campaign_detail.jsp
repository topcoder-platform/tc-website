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

<table width=700 border=0 cellpadding=0 cellspacing=0 align=center>
	<TR valign="top">
<!-- Center Column Begins -->
        <td class=recruitingBody>
			<img src="/i/corp/clear.gif" width="400" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class=bodyText>
                        <p>
                        <tces:trailIterator id="trailItem" trailList="<%=CampaignDetailTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name" /></a> &gt;
                        </tces:trailIterator>
						<br/>
						<span class=testHead>Employment Campaign Positions</span>
						<br/><br/>
			            <strong><jsp:getProperty name="CampaignDetailTask" property="CompanyName" /></strong><br/>
			            <strong>Campaign:</strong> <jsp:getProperty name="CampaignDetailTask" property="CampaignName" /><br/>
			            <strong>Total Hits:</strong> <jsp:getProperty name="CampaignDetailTask" property="TotalHits" /><br/>
			            <strong>Most Recent Hit:</strong> <jsp:getProperty name="CampaignDetailTask" property="MostRecentHit" /></p>
			            <p><A href="<jsp:getProperty name="CampaignDetailTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignDetailTask" property="CampaignID" />" class="bodyText">View Overall Campaign Interest</A></p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="50%">Position Name</td>
                    <td class="screeningHeader" width="50%" align=center>Total Hits</td>
                    <td class="screeningHeader" align=center>Most Recent Hit</td>
                </tr>

                <% int i=0; %>
                    <tces:mapIterator id="position" mapList="<%=(List)CampaignDetailTask.getPositionList()%>">
                <% i++; %>
                                
                <tr>
                    <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap><A href="<jsp:getProperty name="CampaignDetailTask" property="ServletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignDetailTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=(String)position.get("job_id")%>" class="bodyText"><%= (String)position.get("job_desc") %></A></td>
                    <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=center><%= (String)position.get("hit_count") %></td>
                    <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=center><%= (String)position.get("most_recent") %></td>
                </tr>
                                
                </tces:mapIterator>

                <% if(CampaignDetailTask.getPositionList().isEmpty()){ %>
                                
                <tr><td class="bodyText" colspan="3"><br/></td></tr>
                                
                <tr><td class="bodyText" align=center colspan="3">No positions available.</td></tr>
                                
                <% } %>

            </table>

            <p><br/></p>

        </td>
<!-- Center Column Ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</body>
</html>
