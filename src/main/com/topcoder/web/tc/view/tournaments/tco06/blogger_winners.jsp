<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
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
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="pickme"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div style="float:right;"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=pickme_contest">What is the "Pick Me Contest"?</A><br>
<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=overview">Read the blogs</A></div>
<span class="bigTitle">Pick Me Contest Winners</span>
<br><br>
<div align="center">
<table cellpadding="6" cellspacing="0" width="600">
   <tr>
      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/davidyang_big.jpg" /><br>
      <tc-webtag:handle coderId="21471147" darkBG="true" /><br>
      <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_davidyang">winning submission</A>
      </td>
      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/dplass_big.jpg" /><br>
      <tc-webtag:handle coderId="251184" darkBG="true" /><br>
      <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_dplass">winning submission</A>
      </td>
      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/Kawigi_big.jpg" /><br>
      <tc-webtag:handle coderId="8416646" darkBG="true" /><br>
      <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_kawigi">winning submission</A>
      </td>
      <td class="bodyText" align="center" valign="top" width="25%"><img src="/i/m/omgrace_big.jpg" /><br>
      <tc-webtag:handle coderId="21518515" darkBG="true" /><br>
      <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_omgrace">winning submission</A>
      </td>
   </tr>
</table>
</div>
<br><br>
In deciding what our lucky winners should blog about at the TCO06, we figured asking the members would be a good place to start.  So please <strong><tc-webtag:forumLink forumID="505936" message="tell us and the bloggers" /></strong> what you guys would like to hear about.  For example:
<br><br>
<ul>
   <li>What's it like to meet everyone in person?</li>
   <li>What did everyone do while they weren't competing?</li>
   <li>Anything really interesting happen? (We are talking about Vegas after all)</li>
   <li>Were there any "close calls" or "if only's" that the final scores don't portray?
   <li><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=507641">How tall is misof?</A></li>
</ul>
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
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
