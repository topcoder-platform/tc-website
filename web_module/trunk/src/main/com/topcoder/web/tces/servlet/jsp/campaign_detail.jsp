<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CampaignDetailTask" scope="request" class="com.topcoder.web.tces.bean.CampaignDetailTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>topcoder | employment services</title>

<link rel="stylesheet" type="text/css" href="/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/css/coders.css"/>

<jsp:include page="script.jsp" />
    
</head>

<body class="tces">

<jsp:include page="top.jsp" />             

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="8"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="stattext" width="100%"><img src="/i/clear.gif" width="400" height="11" border="0"><br>
            <jsp:include page="/body_top.jsp" >  
                <jsp:param name="image" value="tces"/>  
                <jsp:param name="image1" value="steelblue"/>  
                <jsp:param name="title" value="<%=CampaignDetailTask.getCompanyName()%>"/>
                </jsp:include>
            <p align="center">
            <tces:trailIterator id="trailItem" trailList="<%=CampaignDetailTask.getTrail()%>">
            <a href="<jsp:getProperty name="trailItem" property="href"/>" class="statText"><jsp:getProperty name="trailItem" property="name"/></a> &gt;
            </tces:trailIterator>
            </p>
            
            <p align="center"><strong><jsp:getProperty name="CampaignDetailTask" property="CompanyName"/></strong><br />
            <jsp:getProperty name="CampaignDetailTask" property="CampaignName"/></P>
        
            <p align="center"><strong>Total Hits:</strong> <jsp:getProperty name="CampaignDetailTask" property="TotalHits"/><br />
            <strong>Most Recent Hit:</strong> <jsp:getProperty name="CampaignDetailTask" property="MostRecentHit"/></p>
        
            <p align="center"><a href="<jsp:getProperty name="CampaignDetailTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignDetailTask" property="CampaignID"/>" class="statText">View Overall Campaign Interest</a></p>
        
            <img src="/i/clear.gif" alt="" width="1" height="6" border="0"><br>
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr valign="top">
                        <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                        <td class="statText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0" />
                            <p><font size="5" color="#FFFFFF" face="Arial, Verdana, Tahoma">Employment Campaign Positions</font></p>
                            <table id="datatable" width="100%" cellspacing="0" cellpadding="0" border="0">               
                                <tr>
                                    <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                    <td width="49%" class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18"><strong>Position Name</strong></TD>
                                    <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                    <td width="24%" class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><strong>Total Hits</strong></TD>
                                    <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                    <td width="24%" class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><strong>Most Recent Hit</strong></TD>
                                    <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                </TR>

                                <tces:mapIterator id="position" mapList="<%=(List)CampaignDetailTask.getPositionList()%>">
                                
                                <tr>
                                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                    <TD class="statText" HEIGHT="18">&#160;<A HREF="<jsp:getProperty name="CampaignDetailTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignDetailTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=(String)position.get("job_id")%>" class="statText"><%= (String)position.get("job_desc") %></A></TD>
                                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                    <TD class="statText"><%= (String)position.get("hit_count") %></TD>
                                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                    <TD class="statText"><%= (String)position.get("most_recent") %></TD>
                                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                                </tr>
                                
                                </tces:mapIterator>

                                <% if(CampaignDetailTask.getPositionList().isEmpty()){ %>
                                
                                <tr><td class="statText" HEIGHT="18" COLSPAN="20"><br /></td></tr>                
                                
                                <tr><td class="statText" HEIGHT="18" align="center" colspan="20">No positions available.</td></tr>
                                
                                <% } %>

                            </table>
                            
                            <p><br></p>
                        </td>
                        <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    </tr>
                <tr><td colspan="3" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"><br>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

</body>
</html>
