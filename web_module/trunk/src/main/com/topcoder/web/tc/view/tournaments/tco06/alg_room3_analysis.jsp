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
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room3"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco06/onsite_photos/shot_room3.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle"> wins Room 3</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="505963" message="Discuss this match" /><br>
Thursday, May 4, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
CONTENT
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
