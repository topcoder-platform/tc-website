<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Testing Competitions</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>


<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="testing_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<div align="right" style="margin: 6px 0px;">
    <a href="/tc?module=Static&d1=dev&d2=testing&d3=instructions"><img src="/i/interface/getStarted.png" alt="Need help? Learn how to get started" /></a>
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="8">Active Software Testing Contests</td></tr>
   <tr>
      <td class="tableHeader" colspan="3" nowrap="nowrap">Contest</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Competitors</td>
      <td class="tableHeader" align="center" nowrap="nowrap">1st Place</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Register By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Submit By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Forums</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_modulePlatformDeveloper">Module Platform Developer Testing Competition</A>
      </td>
      <td class="valueC">
      <%--
      registration closed
      --%>
      <A href="mailto:mailto:TestingSubmissions@topcoder.com?subject=Register:%20Module%20Platform%20Developer%20Competition">register</A>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_registrationToolTeams">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_registrationToolTeams">standings</A>
      --%>
      </td>
      <td class="valueC">$1,200</td>
      <td class="valueC">
      01.17.2008 9:00 AM EDT
      </td>
      <td class="valueC">
      01.21.2008 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="518877" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_modulePlatformAdmin">Module Platform Admin Testing Competition</A>
      </td>
      <td class="valueC">
      <%--
      registration closed
      --%>
      <A href="mailto:mailto:TestingSubmissions@topcoder.com?subject=Register:%20Module%20Platform%20Admin%20Testing">register</A>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_registrationToolTeams">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_registrationToolTeams">standings</A>
      --%>
      </td>
      <td class="valueC">$1,200</td>
      <td class="valueC">
      01.17.2008 9:00 AM EDT
      </td>
      <td class="valueC">
      01.21.2008 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="518878" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
</table>

<div align="right" style="padding-top: 10px">
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&c=rss_Upcoming_Contests&dsid=29"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td>
   <jsp:include page="/public_right.jsp">
       <jsp:param name="level1" value="default"/>
   </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

