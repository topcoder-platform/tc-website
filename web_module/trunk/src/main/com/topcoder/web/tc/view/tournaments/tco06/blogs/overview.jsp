<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<span class="bigTitle">Member Blogs</span>
<br><br>
<div align="center">
<table cellpadding="6" cellspacing="0" width="600">
   <tr>
      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/davidyang_big.jpg" /><br>
      <tc-webtag:handle coderId="21471147" darkBG="true" />
      <div align="left">
         <ul>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_2">Your mission, if you choose to accept it</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=davidyang_1">TopCoder's May Madness</A></li>
         </ul>
      </div>
      </td>



      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/dplass_big.jpg" /><br>
      <tc-webtag:handle coderId="251184" darkBG="true" />
      <div align="left">
         <ul>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_5">Components in the "Real World"</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_4">Finally, dplass talks about Design and Development</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_3">The one where dplass takes a walk</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_2">Episode II: Attack of the... oh, never mind</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_1">Episode I: The Phantom Menace</A></li>
         </ul>
      </div>
      </td>



      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/Kawigi_big.jpg" /><br>
      <tc-webtag:handle coderId="8416646" darkBG="true" />
      <div align="left">
         <ul>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_2">Algrorithm Semifinal 1: Dropping like flies</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_1">This morning was like Christmas</A></li>
         </ul>
      </div>
      </td>



      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/omgrace_big.jpg" /><br>
      <tc-webtag:handle coderId="21518515" darkBG="true" />
      <div align="left">
         <ul>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_3">Nothing in this world has prepared you for this</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_2">Exploring the Strip</A></li>
         <li><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_1">From Champaign to Vegas</A></li>
         </ul>
      </div>
      </td>
   </tr>
</table>
</div>
<br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="/foot.jsp" />

</body>

</html>
