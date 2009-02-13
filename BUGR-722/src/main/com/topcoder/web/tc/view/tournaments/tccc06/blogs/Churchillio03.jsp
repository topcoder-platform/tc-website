<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../../script.jsp" />
<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float:right;">
<tc-webtag:forumLink forumID="506180" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Competition Arena Layout</span><br>
11.15.06 12:30 PM
<br><br>
<img src="/i/m/Churchillio_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21181561" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
If you've never been to a live TopCoder competition, it is really a great setup. The competition room is a massive convention-style room with a central stage where the competitors are seated. The stage is raised about 2 feet from the ground, and is comprised of 4 smaller stages each seating 4 competitors. It is subdivided into two halves by a large wall, on each side of which are two projection screens, which initially showed promos and home countries of each competitor. Each of these halves then consist of 2 square areas where 4 competitors each sit back to back, so nobody can see each other's code. Behind each monitor is a sheet of tinted plastic so that nobody can see past their monitor into any other monitor. The competitor stage is pretty intense -- it would be intimidating just being up there, let alone competing. 
<br /><br />
At the front of the room where you enter, there are two huge flat panel displays which show live results from the competition. In the back of the room there is a similar large screen which at the initial meet and greet was open to internet access for people to check the TopCoder website. 
<br /><br />
Now comes the fun part! There are two pillars on each side of the competitors stage, each with 8 monitors facing outwards. These monitors each mirror exactly what is happening on each of the competitors screens, every word they type can be seen here in real time, as well as each problem they open, each mistake they make. <tc-webtag:handle coderId="275071" context="algorithm"/> explained to me that the usual phenomenon is people rushing up the monitors to see which problems are opened, then they run off to discuss them themselves. Here is where the real spirit of the competition can be seen by people at the live event that I am going to focus on tomorrow, if anything goes down I'll be sure and tell you about it.
<br /><br />
On top of all these fancy screens, the TopCoder sponsors each had booths set up around the front perimeter of the room, the back perimeter being occupied by the buffet and bar. Bar stools and tables as well as black and red bean bags finished off the room, making for an almost ironically relaxed atmosphere.
<br /><br />
       </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../../foot.jsp" />
</body>

</html>
