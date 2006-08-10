<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
   <div class="contentOut">

   <jsp:include page="top.jsp">
       <jsp:param name="section" value="default"/>
   </jsp:include>
   <jsp:include page="topNav.jsp">
       <jsp:param name="node" value="contests"/>
   </jsp:include>

      <div class="contentIn">

         <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;" />
         <div class="contentSpacer">


<div class="linkBox"><A href="">discuss this</A></div>

<div class="breadcrumb">
    <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A>
    &gt; ${contest.name}
</div>

<h1>Project Details</h1>

<div align="center">
    <div style="width:510px;" align="left">

      <div class="header">Overview</div>
      ${contest.overview.value}
      <br><br>
      <strong>Documentation</strong><br>
      <c:forEach items="${contest.documents}" var="document">
         ${document.type.description}:
         <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                 ${document.originalFileName}</a> <br/>
      </c:forEach>
      <br><br>
      
      <div class="header">Payment</div>
      ${contest.prizeDescription.value}
      <br><br>
      
      <c:choose>
         <c:when test="${fn:length(contest.prizes)==1}">
             <c:forEach items="${contest.prizes}" var="prize">
                 <strong>Winning Designer: <fmt:formatNumber value="${prize.amount}" type="currency"/></strong>
             </c:forEach>
             <br><br>
         </c:when>
         <c:otherwise>
             <% int i = 1;%>
             <c:forEach items="${contest.prizes}" var="prize">
                 <strong>Prize <%=i++%>: <fmt:formatNumber value="${prize.amount}" type="currency"/></strong><br>
             </c:forEach>
             <br><br>
         </c:otherwise>
      </c:choose>
      
      
      <div class="header">Eligibility</div>
      
      <p>You must be a TopCoder Studio member, at least 18 years of age, meeting all of the membership requirements.
         In addition, you must fit into one of the following categories.
      </p>
      
      <p>If you reside in the United States, you must be either:</p>
      <ul>
         <li>A US Citizen</li>
         <li>A Lawful Permanent Resident of the US</li>
         <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
             permitting unrestricted employment in the U.S.</li>
      </ul>
      
      <p>If you do not reside in the United States:</p>
      <ul>
         <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will
             not need to do anything to become authorized)</li>
      </ul>
      
      
      <br><br>
      
      <div class="header">Timeline</div>
      All submissions are required to be submitted by the End Date.
      <br><br>
      
      
      <div align="center">
         <table cellpadding="4" cellspacing="0" width="250">
             <tbody>
                 <tr>
                     <td valign="top" nowrap="nowrap"><strong>Start Date:</strong></td>
                     <td>
                         <tc-webtag:format object="${contest.startTime}" format="EEEE, MMMM d, yyyy 'at' hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                 </tr>
                 <tr>
                     <td valign="top" nowrap="nowrap"><strong>End Date:</strong></td>
                     <td>
                         <tc-webtag:format object="${contest.endTime}" format="EEEE, MMMM d, yyyy 'at' hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                 </tr>
             </tbody>
         </table>
      </div>
      
      <br><br>
      
      
      <div class="header">Upload Your Submission</div>
      If you are ready to submit your design for this contest, click the button below.
      <br><br>
      <div align="center">
      <A href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="btn_submit">&nbsp;</A>
      </div>
   </div>
</div>

         </div>
         <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;" />
      </div>

      <jsp:include page="foot.jsp"/>

      <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
   </div>
</div>

</body>
</html>