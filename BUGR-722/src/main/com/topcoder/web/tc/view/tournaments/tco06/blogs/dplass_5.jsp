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
<span class="bigTitle">Components in the "Real World"</span><br>
05.03.06 9:50 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
During the Algorithms Semifinals, room 2, I got a chance to watch some talented coders try their best.
Check out <tc-webtag:handle coderId="21471147" darkBG="true" />'s blog entry about the round itself.  I actually understood the 250-pointer,
which might explain the high success rate (i.e., it was relatively easy).
<br/><br/>
I had two interesting conversations regarding component design and development.  The first was more overhearing
than an actual conversation with <tc-webtag:handle coderId="119676" darkBG="true" />, talking about the actual big-screen displays they use
for the "leader board" (see <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_1">my first blog entry</a> for a picture.)  He said that it can support up to 60 frames
per second, which it can get up to near the end of the round.  Little known secret: <tc-webtag:handle coderId="119676" darkBG="true" /> is 
not just a top designer, he's a top developer as well.  Amazingly, he has never submitted a development component.
(Personally I'm glad about this, I have enough competition from folks like <tc-webtag:handle coderId="299979" darkBG="true" /> and <tc-webtag:handle coderId="7210680" darkBG="true" />!)
<br/><br/>
Like many projects that evolve over time, the leader board has lots of "features" that have never seen the light 
of day.  Not to give away the farm, but if they wanted to alternate left and right, or every 4 competitors, they could
do it.  Next year there might be even more changes, but I'll keep those under my hat. (Hint: it's like in the Olympics
when they project the flag into the pool during swim meets. Rats! I gave it away! As <tc-webtag:handle coderId="119676" darkBG="true" /> would say,
"hyah, hyah, hyah.")
<br/><br/>
He also wrote the leader board for the design and development appeals phase.  During the CDDC round earlier today,
I was talking with someone (forgive me, but I forgot who), and we thought of a cool enhancement, to show the number
of pending, approved, and rejected appeals for each competitor's review card.  Great minds think alike, because
when I mentioned to Pops that we thought of "an enhancement" he told me that he was thinking about (you guessed it!)
adding a count of pending, approved, and rejected appeals for each competitor's review card.  I've always had the
ability to think of improvements in interfaces, or code -- it's thinking of the original idea that often eludes me.
<br/><br/>
<hr/>
The second interesting conversation was one that I just walked into, with a prospective client of TopCoder Software.  <tc-webtag:handle coderId="305384" darkBG="true" /> and another admin were talking with them, and they were asking some really interesting questions, such as:
<ul>
<li>How are bugs in the custom (or generic) components handled? (Answer: reproduce the bug with a set of test cases,
fix it, and make sure the regression tests still pass. Many bugs are resolved with 48 hours.)</li>
<li>What's the intellectual property rights of the developed components? How do you keep designers (or developers)
from going to the client's competition with the same design or code? (Answer: TopCoder members agree that the IP
belongs to either TopCoder or the client, depending on the arrangement.  In no situation does the member retain
any ownership of the design or code.)</li>
</ul>
I was able to field some of their other TopCoder Software process questions, and along the way, <tc-webtag:handle coderId="305384" darkBG="true" /> brought up 
<a href="/tc?module=MemberProfile&cr=251184">my ugly mug</a> on the 99 inch plasma display (thanks
for that, by the way.)  It was really gratifying to be able to help TopCoder promote its obviously successful business model,
as someone who has been intimately involved with it. At least, I <em>hope</em> I helped!
<br/><br/>
I'm off tonight for a night on the town with my brother-in-law, who lives here in Vegas.  Good luck to everyone in the poker
tourney!
<br/><br/>
Peace out -DP
<br/><br/>
PS They just announced the winner of room 2 - <tc-webtag:handle coderId="8357090" darkBG="true" /> and <tc-webtag:handle coderId="16056363" darkBG="true" /> made it into the finals.
I spoke with <tc-webtag:handle coderId="8357090" darkBG="true" /> briefly, and find him very eager to explain solutions to people.  Not surprisingly,
his solutions are among the most readable!
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
