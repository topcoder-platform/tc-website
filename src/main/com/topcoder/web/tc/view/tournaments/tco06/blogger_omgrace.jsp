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

<span class="bigTitle">I'm the perfect candidate to blog about the TopCoder Open for the following reasons:</span>
<br><br>
<img src="/i/m/omgrace_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<%--
--%>
By&#160;<tc-webtag:handle coderId="21518515" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
<span class="bodySubtitle">5. I'm already an expert blogger.</span><br>
You can just visit my current xanga to see: <A target="_blank" href="/?t=sponsor&c=link&link=http://www.xanga.com/omgrace">www.xanga.com/omgrace</A>.  I recall facts, funny things people said/did, and I take a ton of pictures so every reader is always entertained.  Also, I can make a big deal out of everything...even a programming competition!  I'll report on all of the forums and make sure to keep every reader interested in the TopCoder Open.  
<br><br>
<span class="bodySubtitle">4. I have a technology background.</span><br>
UIUC is one of the best schools for computer science.  I'm a management information systems major, but I've taken some CS courses, including java, asp.net, and VB.  That means I'll understand the jargon at the tournament and be able to communicate with everyone in Las Vegas.  
<br><br>
<span class="bodySubtitle">3. I'm very responsible and organized.</span><br>
I wouldn't miss any of the deadlines, which means I wouldn't leave topcoder.com readers in the dark about the competition.  Also, I had a promising career in broadcast journalism before I switched into a more technology focused major, so I can definitely whip up an article in time for deadlines.
<br><br>
<span class="bodySubtitle">2. I bring in a different perspective.</span><br>
Seriously, how many females actually submit entries to blog for the TopCoder competition?  By bringing a fresh face to the table, I'll draw in more interest from the female population - maybe even more female groups to compete in next year's competition!  I know you're interested now...
<br><br>
And the number one reason I should be chosen to blog for the TopCoder Open:
<br><br>
<span class="bodySubtitle">1. I'm FUN!!</span><br>
The competition is in LAS VEGAS - if you were competing, wouldn't you want to spend your free time with someone that will always be a good time? 
<br><br>
I'm sure you'll have a lot of qualified applicants apply to be the blogger for the TopCoder Open, but if you pick me, it'll be a year none of your readers will soon forget! 
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
