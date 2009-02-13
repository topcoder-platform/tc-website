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
<span class="bigTitle">Exploring the Strip</span><br>
05.03.06 2:20 PM
<br><br>
<img src="/i/m/omgrace_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21518515" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Last night after the opening reception, I met up with a friend of mine and headed out to explore Las Vegas.  The strip is really deceptive because everything looks like it’s within walking distance, but in reality, things are actually pretty spread out.  Since it was pretty late when we headed out (I was finishing up my first blog), we decided to just walk along the strip and explore a bit.  
<br><br>
Something interesting about Las Vegas - the streets are so busy here that they have walkways to go from one casino to another.  They have escalators and elevators outside so you can easily go from one casino to another.  Here’s a picture of me and my friend Audrey getting ready to cross to the Bellagio:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-2-01.jpg" /></div>
<br><br>
Here’s a picture I took when we were walking across the bridge between the Bellagio and Ballys:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-2-02.jpg" /></div>
<br><br>
They also have plexiglass on top of the bridges that connect the casinos (I’m guessing it’s for safety so no one is tempted to jump off the bridge if they lose all their money...).
<br><br>
We ended up going into Caesar’s Palace.  It’s like a compound - there are so many different parts to it that it’s really quite beautiful.  Really, everything in Las Vegas is grand - they have cool replicas like this one:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-2-03.jpg" /><br>
(<tc-webtag:handle coderId="21471147" darkBG="true" /> standing in front of... David).</div>
<br><br>
We didn’t gamble in Caesar’s Palace (mainly because I didn’t bring any cash - oops!) and all the tables had a minimum of $10, which is a little too much for me.  We walked over to the Bellagio, using another bridge, and ended up sitting at a blackjack table.  There weren’t too many people there, maybe because it was a Tuesday night, but the game moves so quickly. Before you knew it, <tc-webtag:handle coderId="21471147" darkBG="true" /> was out $40!  I guess gambling’s just for fun if you’re not a high roller.  
<br><br>
This morning, I took some pictures as I walked to the Aladdin:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-2-04.jpg" /></div>
<br><br>
(Okay only one picture, but who’s counting?)  As you can see from the scaffolding, there’s a bunch of construction going on here as they get ready for the new Planet Hollywood.  There are a ton of shops around here (so there is DEFINITELY something for the competitors to do after their tough algorithm competitions...).  
<br><br>
Here are the top three things the competitors can do today after their first algorithm semifinal:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-2-05.jpg" /></div>
<br><br>
3.  Play in the High Limit Casino!  <tc-webtag:handle coderId="21471147" darkBG="true" /> and I passed through the "high limit" casino while walking to breakfast in the Curve Lounge and saw ONE person playing. The dealer was actually counting his money and there were lines of $100’s - I don’t think I’ve ever seen that much cash!  I’d like to see the winner of the TopCoder Open bring their check to be turned into chips (I brought a Sharpie so you can endorse the check!)    
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-2-06.jpg" /></div>
<br><br>
2.  Get married!  The Aladdin has a nice wedding chapel inside the casino, so if any of the competitors brought their girlfriends and they’re in a really good mood because they won the algorithm semifinal... impulsive decisions are the best! :-) 
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-2-07.jpg" /></div>
<br><br>
1.  Listen to AWESOME MUSIC!  Oddly enough, I found this in the TopCoder employee room.  I’m sure they’ll let you borrow their CD if you ask nicely.
<br><br>
I’ll be back later in the evening with an update on the algorithm semifinal - be sure to post on the forum if there’s anything you want us to cover!  Also, be sure to check out <tc-webtag:handle coderId="8416646" darkBG="true" />, <tc-webtag:handle coderId="251184" darkBG="true" />, and <tc-webtag:handle coderId="21471147" darkBG="true" /> to see what else is going on in Las Vegas! 
<br><br>        </div>
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
