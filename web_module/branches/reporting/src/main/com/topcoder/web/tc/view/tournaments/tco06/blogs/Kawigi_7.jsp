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
<span class="bigTitle">Unsolved mysteries (and another opportunity to embarrass <tc-webtag:handle coderId="272072" darkBG="true" />)</span><br>
05.05.06 9:30 PM
<br><br>
<img src="/i/m/Kawigi_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8416646" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
There are certain questions that many people have asked before and probably not gotten particularly satisfying answers for.
<br/><br/>
The first big question everyone wants answered is "How tall is <tc-webtag:handle coderId="8357090" darkBG="true" />?"  Well, I only come up to about <tc-webtag:handle coderId="8357090" darkBG="true" />'s waist, but I still found a way to take a picture that captures how much larger he is than life.  <tc-webtag:handle coderId="15082287" darkBG="true" /> is next to him, and he has to be at least 7 feet tall as well.  While I'm assembling sports teams among TopCoder finalists, I should consider going Slovakian on my Basketball and Volleyball teams.
<br/><br/>
<div align="center"><img src="/i/tournament/tco06/blogs/kawigi-07-01.jpg" /></div>
<br/><br/>
The next big question is, "How does <tc-webtag:handle coderId="119676" darkBG="true" />'s legendary laugh sound?"  Of course, my camera can't really capture a laugh quite so well, but with the enlisted help of <tc-webtag:handle coderId="7446789" darkBG="true" />, whose camera is by far more rich with multimedia features, we have video of a lunch-time conversation with <tc-webtag:handle coderId="119676" darkBG="true" /> interjecting a few giggles here and there.  You can watch it <a href="/movies/tournament/tco06/PopsLaugh.wmv">here</a> (1.0 MB).
<br/><br/>
Another question that people aren't asking but should is what <tc-webtag:handle coderId="272072" darkBG="true" />'s laugh sounds like.  Well, it's nothing particularly special, in fact sometimes it's basically completely silent.  What's more interesting is what <tc-webtag:handle coderId="272072" darkBG="true" />'s laugh <i>looks</i> like.  Again, with the help of <tc-webtag:handle coderId="7446789" darkBG="true" />'s The Cheat-like camera reflexes, we have exclusive footage of his legendary "shrug laugh".  Unfortunately, <tc-webtag:handle coderId="7446789" darkBG="true" /> was also using extreme stealth in capturing this cutting-edge video, and to get a better angle without making his camera prominent, the camera was sideways at the time.  So turn your head 90 degrees to the left and <a href="/movies/tournament/tco06/SnapLaugh.wmv">enjoy</a> (733 KB).  Basically, his laugh looks like <tc-webtag:handle coderId="119676" darkBG="true" />'s laugh sounds.
<br/><br/>
Side note - I have a sneaking suspicion <tc-webtag:handle coderId="272072" darkBG="true" /> isn't going to want to hang out with me anymore soon, since I keep embarrassing him.  Hopefully he won't hold it against me.
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
