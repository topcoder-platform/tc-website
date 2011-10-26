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
<span class="bigTitle">Art imitates life</span><br>
05.04.06 3:15 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Yesterday after the NSA talk (check out <tc-webtag:handle coderId="21471147" darkBG="true" />'s excellent blog entry for details) the "game room" was opened.  They had Monopoly, Scrabble, chess, and a bunch of other games.  I watched <tc-webtag:handle coderId="272072" darkBG="true" /> and <tc-webtag:handle coderId="260835" darkBG="true" /> play a curious game with a magnetic sphere whereby the players had to alternate placing hexagonal
or pentagonal pieces around the sphere.   Each piece formed the surface of the sphere, and the goal was to be the
last player to place a piece on the sphere.  The catch was that it was illegal for two pieces of the same color
to touch edges.  (A kink in the rules seemed to allow a <em>vertex</em> of a piece to touch an <em>edge</em> of another piece of the same color, which of course occurred.)
<br /><br />
The point of my story, and I do have one, is that later last night I started reading a book by one of my favorite 
Sci-fi authors, Roger McBride Allen, called <a target="_blank" href="/?t=sponsor&c=link&link=http://www.amazon.com/gp/product/0553574973/sr=8-1/qid=1146759736/ref=pd_bbs_1/104-7190786-7770350?%5Fencoding=UTF8">The Depths of Time</a>.
<br /><br />  
In the opening gambit, a group of six bogeys appear out of a wormhole and start dispersing away.  After the good guys who were guarding the wormhole killed one of them, their sensors were overloaded and they lost track of the other five.  The junior watch officer found the second one on a straight line trajectory away from the worm hole.  She deduced that they were traveling away from the wormhole in a regular pattern, and based on the tracks of the first two targets, she used five-sided and six-sided pyramids in three dimensions to predict where the other targets had gone.  This reminded me of the game I had seen the guys playing in the game room earlier.  Art imitates life!
<br/><br/>
That's all for now, I'll write some more in a bit after the first developer forum, "Secondhand Shopping: Efficient Component Reuse".
<br/>
--DP
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
