<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer devContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("dev_contests");%>
<% ResultSetContainer designContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("design_contests");%>
<% boolean design = ((Boolean)request.getAttribute("phase_id_is_design")).booleanValue(); %>

<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
<title>Active Contests</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="javascript" type="text/javascript">
<!--
var objPopUp = null;
function popUp(event,objectID){
   objPopTrig = document.getElementById(event);
   objPopUp = document.getElementById(objectID);
   xPos = objPopTrig.offsetLeft+10;
   yPos = objPopTrig.offsetTop + objPopTrig.offsetHeight - 5;
   if(xPos + objPopUp.offsetWidth > document.body.clientWidth) xPos = xPos - objPopUp.offsetWidth;
   if(yPos + objPopUp.offsetHeight > document.body.clientHeight) yPos = yPos - objPopUp.offsetHeight - objPopTrig.offsetHeight;
   objPopUp.style.left = xPos + 'px';
   objPopUp.style.top = yPos + 'px';
   objPopUp.style.visibility = 'visible';
}
function popHide(){
   objPopUp.style.visibility = 'hidden';
   objPopUp = null;
}

// -->
</script>
<STYLE TYPE="text/css">
.popUp
{
width: 140px;
font-size: 10px;
text-align: center;
background-color: #FFFFCC;
visibility: hidden;
margin: 10px;
padding: 3px;
position: absolute;
white-space: nowrap;
border: solid 1px black;
z-index: 1;
}
#container
{
position: relative;
}
</STYLE>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="<%= design ? "des_compete" : "dev_compete"%>"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= design ? "comp_design":"comp_development"%>"/>
    <jsp:param name="title" value="Active Contests"/>
</jsp:include>

<% if (design) { %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
   <tr>
      <td><A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/development/digitalRun.gif" alt="The Digital Run" border="0" /></A></td>
      <td align="right"><A href="/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></td>
   </tr>
</table>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="9">Active Component Design Contests</td>
    </tr>
   <tr>
      <td class="headerC">Catalog</td>
      <td class="header" width="100%">Component</td>
      <td class="header">&#160;</td>
      <td class="headerC" style="width: 80px;">Registrants<br/>Rated/Unrated</td>
      <td class="headerC" style="width: 130px;">Registration Ends</td>
      <td class="headerC" style="width: 80px;">Submissions</td>
      <td class="headerR" style="width: 65px;">Payment*</td>
      <td class="headerC" style="width: 130px;">Submit by</td>
   </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=designContests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="valueC">
                <% if ("Java".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJava.gif"/>
                <% } else if ("Java Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJavaCustom.gif"/>
                <% } else if (".NET".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/netSm.gif"/>
                <% } else if (".NET Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smNetCustom.gif"/>
                <% } else if ("Flash".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/flashSm.gif"/>
                <% } else { %>
                <rsc:item name="catalog_name" row="<%=resultRow%>"/>
                <% } %>
            </td>
            <td class="value">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/> Version
                    <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
         <%=resultRow.getItem("max_unrated_registrants").getResultData()!=null && resultRow.getIntItem("max_unrated_registrants") == 0 ? "**" : ""%>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("tourny_project")>0) { %>
                     <div id="container">
                        <img src="/i/tournament/tco06/emblem.gif" alt="" border="0" id="pop<rsc:item name="project_id" row="<%=resultRow%>"/>" onmouseover="popUp(this.id,'popUp<rsc:item name="project_id" row="<%=resultRow%>"/>')" onmouseout="popHide()"/>
                        <div id="popUp<rsc:item name="project_id" row="<%=resultRow%>"/>" class="popUp">Eligible for the TCO06 CDDC</div>
                     </div>
                <% } %>
            </td>
            <td class="valueC">
         <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
         <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
         <% } %>
         <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>/<rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
         <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
         </a>
         <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>
            <td class="valueC">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
            <td class="valueR">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/></td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/></td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<br/>
<%  } else {   // Development %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
   <tr>
      <td><A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/development/digitalRun.gif" alt="The Digital Run" border="0" /></A></td>
      <td align="right"><A href="/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></td>
   </tr>
</table>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="9">Active Component Development Contests</td>
    </tr>
   <tr>
      <td class="header" style="width: 55px;">Catalog</td>
      <td class="header" width="100%">Component</td>
      <td class="header">&#160;</td>
      <td class="headerC" style="width: 80px;">Registrants<br/>Rated/Unrated</td>
      <td class="headerC" style="width: 130px;">Registration Ends</td>
      <td class="headerC" style="width: 80px;">Submissions</td>
      <td class="headerR" style="width: 65px;">Payment*</td>
      <td class="headerC" style="width: 130px;">Submit by</td>
   </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=devContests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="valueC">
                <% if ("Java".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJava.gif"/>
                <% } else if ("Java Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJavaCustom.gif"/>
                <% } else if (".NET".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/netSm.gif"/>
                <% } else if (".NET Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smNetCustom.gif"/>
                <% } else if ("Flash".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/flashSm.gif"/>
                <% } else { %>
                <rsc:item name="catalog_name" row="<%=resultRow%>"/>
                <% } %>
            </td>
            <td class="value">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/> Version
                    <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
                <%=resultRow.getItem("max_unrated_registrants").getResultData()!=null && resultRow.getIntItem("max_unrated_registrants") == 0 ? "**" : ""%>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("tourny_project")>0) { %>
                     <div id="container">
                        <img src="/i/tournament/tco06/emblem.gif" alt="" border="0" id="pop<rsc:item name="project_id" row="<%=resultRow%>"/>" onmouseover="popUp(this.id,'popUp<rsc:item name="project_id" row="<%=resultRow%>"/>')" onmouseout="popHide()"/>
                        <div id="popUp<rsc:item name="project_id" row="<%=resultRow%>"/>" class="popUp">Eligible for the TCO06 CDDC</div>
                     </div>
                <% } %>
            </td>
            <td class="valueC">
               <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
               <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
               <% } %>
               <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>/<rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
               <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
               </a>
               <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>
            <td class="valueC">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
            <td class="valueC">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/></td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/></td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<br/>
<% } %>

<p align="left">* And that's before royalty payments. The more Component
    <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/subscriptions.jsp">Subscriptions</A> we sell, the more royalties we
    pay out to our winners! Please note
    that custom components do not get added to the catalog and therefore do not have royalties.</p>
<p align="left">** Only rated members may register for this component</p>

<%--
<div style="float: left; padding-right: 5px;"><img src="/i/tournament/tco06/emblem.gif" alt="TCO06 Component Contest" border="0" /></div>
<p align="left">This component is eligible for for the 2006 TopCoder Open CDDC</p>
--%>

<p><br/></p>


</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="180">
    <jsp:include page="right.jsp"/>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
