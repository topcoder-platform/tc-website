<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
   <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>TopCoder FX</title>
   <link type="text/css" rel="stylesheet" href="/css/creative/main.css">
   <link type="text/css" rel="stylesheet" href="/css/creative/stats.css">
   <link type="text/css" rel="stylesheet" href="/css/creative/coders.css">
</head>

<body>

<jsp:include page="/creative_top.jsp">
   <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="/creative_left.jsp">
   <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
   <div class="contentInner">

      <div class="linkBox"><A href="">discuss this</A></div>
      <div class="breadcrumb">
         <A href="/?module=Static&d1=activeContests">Active Contests</A>
          > Contest Name
      </div>

      <h1>Registrants</h1>

      <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
      <div class="tableHolder">
      <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
      <tbody>
         <tr>
            <td class="title" colspan="3">Registrants</td>
         </tr>
         <tr class="light">
            <td class="header">Handle</td>
            <td class="headerC" width="100%">Registration Date</td>
            <td class="headerC">Submission Date</td>
         </tr>
         <tr class="light">
            <td class="value"><A href="">duner</A></td>
            <td class="valueC">07.07.2006 05:05 PM EDT</td>
            <td class="valueC">07.07.2006 05:05 PM EDT</td>
         </tr>
         <tr class="light">
            <td class="value"><A href="">duner</A></td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
         </tr>
         <tr class="light">
            <td class="value"><A href="">duner</A></td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
         </tr>
         <tr class="light">
            <td class="value"><A href="">duner</A></td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
         </tr>
         <tr class="light">
            <td class="value"><A href="">duner</A></td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
         </tr>
         <tr class="light">
            <td class="value"><A href="">duner</A></td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
         </tr>
         <tr class="light">
            <td class="value"><A href="">duner</A></td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
            <td class="valueC" nowrap="nowrap">07.07.2006 05:05 PM EDT</td>
         </tr>
      </tbody>
      </table>
      </div>
   
      <jsp:include page="/creative_foot.jsp" />
   </div>
</div>
</body>
</html>
