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
<span class="bigTitle">Hearts, Stars, and Fanny Packs</span><br>
05.05.06 6:00 PM
<br><br>
<img src="/i/m/omgrace_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21518515" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Since everyone (or at least <tc-webtag:handle coderId="21494813" darkBG="true" /> enjoyed the competitions I posted yesterday, I have decided to add another component to the TopCoder Open - the BEST DRESSED COMPETITION!  There's a common misconception that computer scientists and engineers don't dress well -- but this post will prove everyone wrong (or right... it depends who's reading this).  On with the contest!  
<br><br>
<b>Best Dressed in Las Vegas</b>
<br><br>
1. I've entered myself into the contest.  I know what you're thinking - Grace, you're such a great dresser, how will the others even come CLOSE to beating you and your classic style? Here I'm sporting the sock/sandal combo as well as my Illini colors.  By the way, the sock/sandal combo is the MOST uncomfortable thing EVER!  
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-01.jpg" /></div>
<br><br>
You might be thinking, wow, let's declare her the winner NOW, but read on and you'll see why it's such stiff competition this year at the TCO...
<br><br>
2.  <tc-webtag:handle coderId="262056" darkBG="true" />, must be friends with my roommate, Joe Xu; they both love to pop their collars!   The question is, who do you think pulls it off better? 
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-02.jpg" /></div>
<br><br>
(Actually, the real question is - how does <tc-webtag:handle coderId="262056" darkBG="true" /> keep his collar popped WHILE playing DDR?  Now THAT takes talent).  
<br><br>
3. The next contestant, <tc-webtag:handle coderId="15891862" darkBG="true" /> is definitely one of my favorites.  How does he pull off the headband and pointy shoes?  He definitely looks like he's striking a pose - bonus points!
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-03.jpg" /></div>
<br><br>
4. Here we have <tc-webtag:handle coderId="260835" darkBG="true" /> at the Gameworks event.  Brrrr it's COLD in Las Vegas!  I wonder if that sweater is warm enough for the desert...
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-04.jpg" /></div>
<br><br>
5. <tc-webtag:handle coderId="310430" darkBG="true" /> carries off the sweater around the waist well; so well that we should just call off the contest and announce the winner now. But we will continue...
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-05.jpg" /></div>
<br><br>
6. I like <tc-webtag:handle coderId="15485957" darkBG="true" />'s style because he's a forward thinker with his blavy outfit...
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-06.jpg" /></div>
<br><br>
7. <tc-webtag:handle coderId="8357090" darkBG="true" />, <tc-webtag:handle coderId="8357090" darkBG="true" />, <tc-webtag:handle coderId="8357090" darkBG="true" />.  There's not much I can say about this competitor... except that I love everything he's worn this past week.  How many guys do you know will wear a shirt with hearts, stars, rainbows, and clouds?  My only own complaint - where are the BUTTERFLIES?!  Also, I LOVE LOVE LOVE his scarf!  I can't say enough about it... maybe he'll let me borrow it later and I'll post a pic!
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-07.jpg" /></div>
<br><br>
8. I entered one of the spectators into the best dressed competition because I love this purse... I think I might have one in navy at home.  First it's the purse, next it's the fannypack!
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-08-08.jpg" /></div>
<br><br>
And the winner is... <tc-webtag:handle coderId="8357090" darkBG="true" />!  No one can beat his shirt/scarf combo - and no one EVER will... don't even TRY!  He's also my favorite for the overall winner of the TopCoder Open algorithm competition - I'll post on it soon!
<br><br>

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
