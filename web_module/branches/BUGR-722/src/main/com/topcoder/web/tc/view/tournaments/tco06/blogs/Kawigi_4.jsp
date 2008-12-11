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
<span class="bigTitle">Kawigi's writing an editor.  What else is new?</span><br>
05.04.06 3:10 PM
<br><br>
<img src="/i/m/Kawigi_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8416646" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
It's finished!
<br /><br />
Ok, you're probably wondering what's finished.  Well, I suppose I can get away with at least showing you a picture.  Where the other bloggers are walking around with their cameras, you guys get a screen shot.
<br /><br />
<div align="center"><A href="/i/tournament/tco06/blogs/kawigi-editor1.png"><img src="/i/tournament/tco06/blogs/kawigi-04-01.gif" border="0" alt="" /></A></div>
<br /><br />
The other cool thing is it converts my handle tags, so if I want to mention how <tc-webtag:handle coderId="144400" darkBG="true" /> is currently in the lead in semifinal 3, it looks like this:
<br /><br />
<div align="center"><A href="/i/tournament/tco06/blogs/kawigi-editor2.png"><img src="/i/tournament/tco06/blogs/kawigi-04-02.gif" border="0" alt="" /></A></div>
<br /><br />
Anyways, I started working on this on Tuesday night, and I had a few little weird issues I had to work through to get it working.  It downloads the CSS used in the blog entries on the website to render stuff on top, and it downloads (and caches) the "coders" XML data feed provided by TopCoder (one such weird issue was that I apparently was working with an incomplete XML file at first, which made it so that some handles got converted and others didn't).  Now it's refreshing to have it working and actually be writing a blog entry with it :-)  Maybe I should send the others a copy, too, just because I'm such a nice guy.  The problem is it doesn't appear to render images...
<br /><br />
As always a quick web search tells me what the problem is.  Of course, there's some website where some guy had a similar problem and had this great way of solving it.  Except that the way he chose to solve it involved writing 2 or 3 new classes and doing all these hacks to get around stuff.  On the bright side, he said just enough for me to realize what the more correct, easier fix was, and 2 lines of code later, I have images:
<br /><br />
<div align="center"><A href="/i/tournament/tco06/blogs/kawigi-editor3.png"><img src="/i/tournament/tco06/blogs/kawigi-04-03.gif" border="0" alt="" /></A></div>
<br /><br />
Anyways, <tc-webtag:handle coderId="8416646" darkBG="true" /> writing an editor is hardly ground-breaking news, I should get back to talking about what's happening here that's <em>not</em> about me.
<br /><br />
With 12 minutes left, the third semifinal looks like probably the highest scoring one of all.  All 16 people have at least *submitted* the 250, it looks like <tc-webtag:handle coderId="8527113" darkBG="true" /> and <tc-webtag:handle coderId="275071" darkBG="true" /> (who originally submitted second after <tc-webtag:handle coderId="144400" darkBG="true" /> have both resubmitted at least once for the minimum score on the problem.  Seven people have submitted the 500 with varying scores, <tc-webtag:handle coderId="270505" darkBG="true" /> has the highest score on that problem by some margin, assuming it's right ;-)
<br /><br />
Since I haven't been watching the score board as religiously as in the last two rounds, I don't have as much to guess about what's going on, except that I know that <tc-webtag:handle coderId="270505" darkBG="true" /> opened the hard and then the medium problem at pretty much the same time, so the score counter has counted down further on his 1000 than others.  We're getting down to the wire, but it will be interesting to see if anyone submits it.
<br /><br />
One thing that's kind of weird with all this is I have this feeling that I'd like to be competing, but it's completely cured when I read the 250 each round.  People know how to solve this stuff?  This match's 250 is something that I think I could at <em>least</em> understand if someone explained it to me, which is true for most 1000-point problems in regular matches.  I have this funny feeling that I'm not going to make it to the final any time soon, if I ever even make it onsite.  The sad thing is that I'll probably be red by that time, and we all know that TopCoder will explode when I break 2200.  Still, <tc-webtag:handle coderId="8493941" darkBG="true" /> eventually did it, and it only took him about 90 matches.  Maybe I'm just 20 away.  But then again, maybe I'm not <a href="http://forums.topcoder.com/?module=Thread&threadID=509991&start=0">Eastern European</a> enough to make it onsite.  If I was fluent in both Polish and Russian, I could be in on so many more conversations around here.
<br /><br />
The challenge phase is starting, let's see how this all unfolds.
<br /><br />
I'm glad I was looking up at the monitors when this one started, and that I got my share of blinking in beforehand, because otherwise I would have missed even more than I already did with my eyes glued to the screens.  Time yourself as you read this.
<br /><br />
With seemingly only enough time to open the first few problems, <tc-webtag:handle coderId="8527113" darkBG="true" /> successfully challenged <tc-webtag:handle coderId="7546048" darkBG="true" /> 's 500, <tc-webtag:handle coderId="260835" darkBG="true" /> on <tc-webtag:handle coderId="346607" darkBG="true" /> 's 500, and <tc-webtag:handle coderId="144400" darkBG="true" /> challenged <tc-webtag:handle coderId="7442498" darkBG="true" /> 's 500.  By the time one could scan the macros at the beginning of someone's code, and definitely in the time it took me to just write down the handles of the first three challengers, <tc-webtag:handle coderId="310430" darkBG="true" /> dropped <tc-webtag:handle coderId="15094447" darkBG="true" /> 's 500 as well.
<br /><br />
Possibly with the pressure set by the pace of the challenge phase, <tc-webtag:handle coderId="7446789" darkBG="true" /> failed a challenge against <tc-webtag:handle coderId="7433858" darkBG="true" /> 's 500 and <tc-webtag:handle coderId="270505" darkBG="true" /> failed another on <tc-webtag:handle coderId="7462740" darkBG="true" />.
<br /><br />
With momentum and confidence, we saw <tc-webtag:handle coderId="8527113" darkBG="true" /> and <tc-webtag:handle coderId="310430" darkBG="true" /> both fail their second challenges, both against <tc-webtag:handle coderId="7433858" darkBG="true" />.  In another few seconds, <tc-webtag:handle coderId="260835" darkBG="true" /> follows suit and fails a challenge on <tc-webtag:handle coderId="7433858" darkBG="true" />.  Apparently, challenging <tc-webtag:handle coderId="7433858" darkBG="true" /> as your second challenge isn't good luck - his 500 survived both the bloodbath of the challenge phase and the milder system test results (ooh, foreshadowing).
<br /><br />
The action continued <tc-webtag:handle coderId="144400" darkBG="true" /> gets his second challenge, this time on <tc-webtag:handle coderId="275071" darkBG="true" />'s 500.  I was half expecting <tc-webtag:handle coderId="7346876" darkBG="true" /> 's voice to come over the speakers with a big
<br /><br />
<span class="bigTitle">Double Kill!!!</span>
<br /><br />
<tc-webtag:handle coderId="7462740" darkBG="true" /> failed a challenge on <tc-webtag:handle coderId="260835" darkBG="true" /> 's 500, and somewhere in there, <tc-webtag:handle coderId="310430" darkBG="true" /> failed two more challenges against <tc-webtag:handle coderId="7462740" darkBG="true" /> and <tc-webtag:handle coderId="270505" darkBG="true" />.
<br /><br />
Alright, stop time now.  I had <tc-webtag:handle coderId="282718" darkBG="true" /> come and say something to me while I was reading it, but I clocked myself at about 70 seconds.  All that happened in the first two minutes of the challenge phase.  All you people who complain in the forums about how the challenge phase is too much about being lucky enough to open the obviously wrong solution first.  I have a funny feeling that if I had opened any of those solutions first, I still wouldn't have had a chance to challenge it before someone else did.  And of course, this was definitely the fastest-paced challenge phase so far.
<br /><br />
After the first two minutes, it seemed like nothing happened until the challenge phase was within 30 seconds of ending.  Apparently the problem is that the competitors were out of wrong 500's, and apparently the real reason so many people challenged 500's is because they weren't sure what the answer was for the biggest test case.  Finally, <tc-webtag:handle coderId="7446789" darkBG="true" /> downed <tc-webtag:handle coderId="8584656" darkBG="true" />'s 250 with seconds left, <tc-webtag:handle coderId="275071" darkBG="true" /> failed a challenge almost simultaneously, and <tc-webtag:handle coderId="260835" darkBG="true" /> took his chances with <tc-webtag:handle coderId="144400" darkBG="true" />'s 500 to lose the rest of his challenge points from the beginning of the challenge phase.  As the challenge phase ended, it was interesting to note that every 500 got challenged at least once, whether it was right or not.
<br /><br />
Within a few minutes, the results were coming up from the system tests.  Moving up the list, <tc-webtag:handle coderId="8584656" darkBG="true" /> had been challenged out of his only points, and was the only person at 0 after the challenge phase.  The system test results came in, one competitor at a time, starting from the bottom of the list.
<br /><br />
<tc-webtag:handle coderId="275071" darkBG="true" /> 's 250 passed.  With his resubmit and a failed challenge, his 50 points look like they probably won't be enough.
<br /><br />
<tc-webtag:handle coderId="8472826" darkBG="true" /> 's 250 passed.
<br /><br />
<tc-webtag:handle coderId="8527113" darkBG="true" /> 's 250 passed.
<br /><br />
<tc-webtag:handle coderId="310430" darkBG="true" /> 's 250 failed, and he dropped to the bottom of the list with -25 points because of his assortment of failed challenges.
<br /><br />
<tc-webtag:handle coderId="10270846" darkBG="true" />'s 250 passed.
<br /><br />
<tc-webtag:handle coderId="346607" darkBG="true" />'s 250 passed.
<br /><br />
<tc-webtag:handle coderId="15094447" darkBG="true" /> 's 250 dropped and he fell down the list.
<br /><br />
Moving on to the left monitor (which shows the top half of the leader board), <tc-webtag:handle coderId="7546048" darkBG="true" />, <tc-webtag:handle coderId="7442498" darkBG="true" /> and <tc-webtag:handle coderId="7446789" darkBG="true" /> passed on the 250.
<br /><br />
Finally, we were to the top 5 competitors, who all had two solutions to defend.  <tc-webtag:handle coderId="7433858" darkBG="true" /> passed on both problems, although he appeared to be everyone's favorite guy to challenge.
<br /><br />
<tc-webtag:handle coderId="260835" darkBG="true" /> and <tc-webtag:handle coderId="7462740" darkBG="true" /> also pass on both.
<br /><br />
We watched for the possibility of a big upset or unexpected shuffling in the standings as round favorites <tc-webtag:handle coderId="270505" darkBG="true" /> and <tc-webtag:handle coderId="144400" darkBG="true" /> waited for their final results.  With cheers (but maybe a little disappointment for some people), both of our targets passed both problems to advance to the final.
<br /><br />
You can't ask for much more late action in an onsite match, and I'm really getting less and less skeptical that programming can be a spectator sport.  I haven't had much opportunity to even watch the competitors' code, although I've taken a quick look at what some of the problems were in each match, but just watching the score board is exciting and interesting, presumably even with little or no understanding of the technical parts of the competition.  Plenty of people stand around it, discussing what's happening and explaining to the uninitiated anything non-obvious that might be happening.
<br /><br />
The Wildcard round is coming up this afternoon, and I'm not sure how much more action and excitement I can take.
<br /><br />


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
