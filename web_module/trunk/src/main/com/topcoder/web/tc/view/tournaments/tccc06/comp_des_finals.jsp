<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="finals"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center" class="bodyText" style="padding-top: 10px; padding-bottom: 40px; padding-left: 15px; padding-right: 15px;">

<span class="bigTitle">Component Design Competition Finals</span>
<br><br>
<%--
--%>
            <table class="sidebarBox" border="0" cellpadding="3" cellspacing="0" width="500">
               <tr>
                  <td class="advHeader">Contest:</td>
                  <td class="advHeader" colspan="5" align="center" style="border-left: 1px solid #999999;">Relation<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21305812"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21305849"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" colspan="5" align="center" style="border-left: 1px solid #999999;">XSD2DDL<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21542476"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21542696"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" colspan="5" align="center" style="border-left: 1px solid #999999;">Result Set Collection Decorator<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21663072"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21662984"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" style="border-left: 1px solid #999999;">&#160;</td>
               </tr>
               <tr>
                  <td class="advHeader">Handle</td>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Initial<br>Score</td>
                  <td class="advHeader" align="center">Final<br>Score</td>
                  <td class="advHeader">Place</td>
                  <td class="advHeader">Wager</td>
                  <td class="advHeader">Points</td>
<%--
                  <td class="advHeader" align="center">DL</td>
--%>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Initial<br>Score</td>
                  <td class="advHeader" align="center">Final<br>Score</td>
                  <td class="advHeader">Place</td>
                  <td class="advHeader">Wager</td>
                  <td class="advHeader">Points</td>
<%--
                  <td class="advHeader" align="center">DL</td>
--%>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Initial<br>Score</td>
                  <td class="advHeader" align="center">Final<br>Score</td>
                  <td class="advHeader">Place</td>
                  <td class="advHeader">Wager</td>
                  <td class="advHeader">Points</td>
<%--
                  <td class="advHeader" align="center">DL</td>
--%>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Total<br>Points</td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="293874" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">89.60</td>
                  <td class="advanceDk" align="center">89.60</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">48</td>
                  <td class="advanceDk" align="center">48</td>
<%--
                  <td class="advanceDk" align="center"><A href="/i/tournament/tccc06/comp_submissions/"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
--%>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">93.56</td>
                  <td class="advanceDk" align="center">96.43</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center">20</td>
<%--
                  <td class="advanceDk" align="center"><A href="/i/tournament/tccc06/comp_submissions/"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
--%>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">88.85</td>
                  <td class="advanceDk" align="center">96.34</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">60</td>
                  <td class="advanceDk" align="center">60</td>
<%--
                  <td class="advanceDk" align="center"><A href="/i/tournament/tccc06/comp_submissions/"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
--%>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>86</strong></td>
               </tr>
            </table>

<br><br>
<%--
<div align="center"><img src="/i/interface/download.gif" alt="download" border="0" /> = download submission</div>
--%>

      </div>
      </td>


<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>

   </tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
