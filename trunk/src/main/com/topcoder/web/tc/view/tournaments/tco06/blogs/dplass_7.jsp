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

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Still in "Gee-whiz" phase</span><br>
05.04.06 3:15 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
<em>Here I am, writing on a TopCoder pad with an NSA pen.  I'm still in the "gee-whiz" phase, that's for sure.</em>
<br/><br/>
I got interviewed on camera by the Blue Chip producer Nick, regarding <tc-webtag:handle coderId="144400" darkBG="true" />'s 500 pointer in
room 2 of the Algorithm semifinal round.  I attempted to describe (a) what the problem was asking, (b) what 
category of solution it was in, but sadly, not (c) how to solve it.  
<br/><br/>
Based on the code that he had started writing, I could guess that it wasn't a really geometry problem but actually a math or counting problem.  I'm hardly qualified 
to analyze, or, sheesh, second guess someone who I myself predicted to be the winner of the TCO, but compared to 
"Joe and Sally Sixpack", I hoped to be able to provide an "acecssible" explanation for the documentary.  Nick
asked good questions that enabled me to use my knowledge of both algorithms and TopCoder to give him some useful
footage.
<br/><br/>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="/foot.jsp" />

</body>

</html>
