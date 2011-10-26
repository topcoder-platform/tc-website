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
<span class="bigTitle">I'm blogging this.</span><br>
05.03.06 10:00 PM
<br><br>
<img src="/i/m/Kawigi_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8416646" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
We're waiting for the results of semifinal 2 right now, which had somewhat more action than the first semifinal round.  More submissions, more challenges, more movement, and still a few people with no submissions (but this time they managed to just use their one failed challenge opportunity).
<br /><br />
Before this round, a group of people making a documentary of some kind took the other bloggers and me aside for a group interview kind of thing, which was interrupted by <tc-webtag:handle coderId="7346876" darkBG="true" />'s "Darth Vader" voice (as <tc-webtag:handle coderId="251184" darkBG="true" /> has tagged it).
<br /><br />
I spent some time around the monitors this time, spending the first half or so of the competition explaining what was going on to some of the sponsors while watching <tc-webtag:handle coderId="304031" darkBG="true" /> struggle with the 250, for which he was trying to tweak an algorithm that probably wasn't quite right (don't you hate when something looks like LCS, but the definition of "Longest" is changed?)
<br /><br />
When I got back to the scoreboard, there was lots of movement, and after awhile we started seeing some submissions on the hard problem.  Sure, all of them died in the challenge phase, but last round the reference solution wasn't even run.  When people came to ask me about my analysis, I pointed out the fact that <tc-webtag:handle coderId="7340263" darkBG="true" /> had submitted the easy and hard problems, but hadn't yet opened the medium.  People asked if he might be playing some kind of mind game or something, but my analysis was that he submitted his hard and then ran a few more test cases on his solution, just to be sure.  Obviously, at least one of those tests exposed a bug in his solution that he needed to fix, or he would have moved on in at most 5 minutes.  My supposition was proven true when he resubmitted with less than a minute left for 300 points.
<br /><br />
When the challenge phase started, it took a little bit of time before <tc-webtag:handle coderId="10599449" darkBG="true" /> got his obligatory challenge.  Everyone was watching for him to get in completely on challenges, but he was rather quiet after that.  But the Challenge Phase didn't get any more boring, as <tc-webtag:handle coderId="293874" darkBG="true" /> got three challenges, all on the hard problem.  None of the hard solutions survived the challenge phase (sorry, <tc-webtag:handle coderId="7340263" darkBG="true" />), and the standings were looking very odd in some ways.
<br /><br />
As if the leader board couldn't get any weirder, the system tests just started being reported.  The first few problems were passing as we crawled up the list, another notable difference from last round.  The bottom half of the list, in fact, had no failed submissions.  It was starting to look like the challenge phase might have found everything this time.  Of course, moving up the list where correct submissions were increasingly important, <tc-webtag:handle coderId="310333" darkBG="true" />, <tc-webtag:handle coderId="293874" darkBG="true" /> and <tc-webtag:handle coderId="8355516" darkBG="true" />, the top three competitors in the room, all failed their level 2 problems.  <tc-webtag:handle coderId="310333" darkBG="true" />'s drop was possibly the most dramatic, both because his was the first to fail, and because it combined with his earlier failed challenge to drop him from 3rd to 14th.  With <em>three</em> previous challenges, <tc-webtag:handle coderId="293874" darkBG="true" /> dropped just to 6th, where he'll have a chance to redeem himself in the wildcard round tomorrow.  <tc-webtag:handle coderId="8355516" darkBG="true" />, of course, has been <a href="/stat?c=problem_solution&rm=248115&rd=9816&pm=6094&cr=8355516">known to say</a> "<em>I think it is good to submit wrong solutions sometimes to give others challenging opportunities.</em>"  (That's far from the only link I could post there, he's got that in every submission he's done since after last year's TopCoder Open Finals).
<br /><br />
One last thing - after the round ended, <tc-webtag:handle coderId="270505" darkBG="true" /> recommended that I buy <a target="_blank" href="/?t=sponsor&c=link&link=http://www.thinkgeek.com/oreilly/tshirts/5eb7/">this shirt</a>.  That's right John, I even blogged that.
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
