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

<table width="100%" border=0 cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">ResultSetAssociatedDataAndColumnAddedDecoratedCollection. Nuff said.</span><br>
05.05.06 3:30 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Here's an update from round 2 of the CDDC; the design project was XSD2DDL:
<br><br>
<table border="1" cellspacing="0" cellpadding="3" class="bodyText">
<tr><td><b>Handle</b></td><td>Score</td></tr>
<tr><td><tc-webtag:handle coderId="119676" darkBG="true" /></td><td>96.42</td></tr>
</td></tr><tr><td><tc-webtag:handle coderId="278342" darkBG="true" /></td><td>96.12</td></tr>
</td></tr><tr><td><tc-webtag:handle coderId="293874" darkBG="true" /></td><td>94.27</td></tr>
</table>
<br/><br/>
For the developers it was the Testing Framework.
<br><br>
<table border="1" cellspacing="0" cellpadding="3" class="bodyText">
<tr><td><b>Handle</b></td><td>Score</td></tr>
<tr><td><tc-webtag:handle coderId="7548200" darkBG="true" /></td><td>98.49</td></tr>
</td></tr><tr><td><tc-webtag:handle coderId="14926554" darkBG="true" /></td><td>98.19</td></tr>
</td></tr><tr><td><tc-webtag:handle coderId="299979" darkBG="true" /></td><td>97.76</td></tr>
</table>
<br/><br/>
Some interesting line items: <tc-webtag:handle coderId="7210680" darkBG="true" /> got a perfect score of 100.00 from developer reviewer
<TC-WEBTAG:HANDLE CODERID="260952" DARKBG="TRUE" /> and <tc-webtag:handle coderId="7548200" darkBG="true" /> got a 99.00 from <tc-webtag:handle coderId="7545675" darkBG="true" />, also in development.
While I was backstage, traugust was leapfrogged by two competitors and dropped from third to
fifth place.
<br/><br/>
<hr/>
As I noticed in the <a href="http://forums.topcoder.com/?module=Thread&threadID=510556">forums</a>, calling this round the "Finals" is a bit of a misnomer.  It's
actually the 3rd out of 3 appeals rounds for the TCO '06.  For the designers, they were appealing
DataView Decorator for C# and Result Set Collection Decorator for Java.  The developers were appealing
the Bread Crumb Trail Tag for Java and the Bread Crumb Trail Control for C#.  Initially the starting scores
were <em>very</em> close for both design and development:
<br><br>
<table border="1" cellspacing="0" cellpadding="3" class="bodyText">
<tr><td colspan=2 align=center>Design</td><td colspan=2 align=center>Development</td></tr>
<tr><td>Handle</td><td>Score</td><td>	Handle</td><td>	Score</td></tr>
<tr><td><tc-webtag:handle coderId="119676" darkBG="true" /></td><td>88.85</td><td><tc-webtag:handle coderId="7210680" darkBG="true" /></td><td>92.41</td></tr>
<tr><td><tc-webtag:handle coderId="278342" darkBG="true" /></td><td>88.45</td><td><tc-webtag:handle coderId="7548200" darkBG="true" /></td><td>92.26</td></tr>
<tr><td><tc-webtag:handle coderId="152342" darkBG="true" /></td><td>88.07</td><td><tc-webtag:handle coderId="10098406" darkBG="true" /></td><td>91.22</td></tr>
</table>

<br/><br/>
Less than a point separated the top 3 designers, and less than 1.5 points separated the top 3 developers.
It's anybody's game at this point!
<br/></br>
I decided to follow the appeals of a single designer (since <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_9">yesterday</a> I looked at only the development side of the CDDC Round 2), and settled on <tc-webtag:handle coderId="278342" darkBG="true" /> because he was in second place and I wanted to see if he could leapfrog <tc-webtag:handle coderId="119676" darkBG="true" /> to repeat his previous design championship wins.  I started off by only looking at his screen, but there were just so many appeals coming on so many different items for so many designers, that I will have to resort to more of a summary than a play-by-play.
<br/><br/>
<tc-webtag:handle coderId="278342" darkBG="true" /> looked over his three reviews and original submission for over 15 minutes before making his first appeal.  While flipping through the screens I saw that he had about 5 projects (including the TCO projects) in review and one project for which he's a reviewer.  Busy guy!  By 9:15, <tc-webtag:handle coderId="119676" darkBG="true" /> and <tc-webtag:handle coderId="152342" darkBG="true" /> had both already submitted appeals, but he had not.
<br/><br/>
At the beginning, there were a lot of algorithm competitors also present and watching. <tc-webtag:handle coderId="260835" darkBG="true" /> and both <tc-webtag:handle coderId="113178" darkBG="true" /> and <tc-webtag:handle coderId="7462740" darkBG="true" /> were trying to follow the appeals on <tc-webtag:handle coderId="252022" darkBG="true" />'s and <tc-webtag:handle coderId="11797255" darkBG="true" />'s screens, but since they weren't familiar with the process or the tools, it was as mysterious to them as a 1k algorithms problem is to this blogger. (This made me feel better, also supporting one of my theories that "everyone has something they're good at.")  
<br/><br/>
One extremely long class name caught <tc-webtag:handle coderId="260835" darkBG="true" />'s eye named (deep breath)
<tt>ResultSetAssociatedDataAndColumnAddedDecoratedCollection</tt>. Whew!
<br/><br/>
The general strategy that <tc-webtag:handle coderId="278342" darkBG="true" /> followed seemed to be to open each review and appeal 
everything that was not a 4 out of 4, from top to bottom.  A few times, a forum post (including one made by 
fellow competitor <tc-webtag:handle coderId="119676" darkBG="true" />) was used to support an appeal.  It seemed like he referenced his UML
and use case diagrams in <a target="_blank" href="/?t=sponsor&c=link&link=http://www.gentleware.com">Poseidon</a> a lot more often than he referenced the component specification.
In more than one case, a reviewer seemed to misunderstand the intention of the design, which allowed arbitrary
"mapping" between columns using a mathematic equation.  Multiple times, he explained how the end-user would be
able to define intermediate columns to achieve the desired behavior.  In fact, this was one of the times that
he referenced the CS, and even I could see that it clearly described exactly what the reviewer was unclear about.
<br/><br/>
During the course of the morning, the scores and placements for both design and development changed wildly.
Here is but a sample of the way things changed (all times are <a target="_blank" href="/?t=sponsor&c=link&link=http://www.timeanddate.com/worldclock/city.html?n=127">PDT</a>):
<ul>
<li>At 9:27, <tc-webtag:handle coderId="278342" darkBG="true" /> submitted his 3rd appeal. By this time, <tc-webtag:handle coderId="152342" darkBG="true" /> was ahead of <tc-webtag:handle coderId="119676" darkBG="true" />, 89.22 vs 89.00 (<tc-webtag:handle coderId="278342" darkBG="true" />'s score
hadn't changed from his original 88.45)
</li><li><tc-webtag:handle coderId="278342" darkBG="true" /> submitted two or three more appeals, whcih were accepted.
</li><li>At 9:41, <tc-webtag:handle coderId="278342" darkBG="true" /> was in first with 90.06 points, <tc-webtag:handle coderId="152342" darkBG="true" /> second with 89.67 and <tc-webtag:handle coderId="119676" darkBG="true" /> in third with 89.00. All but two designers have increased in score from appeals.
</li><li>At 9:49 <tc-webtag:handle coderId="152342" darkBG="true" /> increased to 90.02, but still in second (by just 0.04 points!)
</li><li>by 9:51, <tc-webtag:handle coderId="152342" darkBG="true" /> was up to 90.27, the other two unchanged.
</li><li>All this time, <tc-webtag:handle coderId="278342" darkBG="true" /> was submitting appeals about every 5 minutes
</li><li>At 10:02, some responses came back and seven out of the eight designers had increased points. <tc-webtag:handle coderId="278342" darkBG="true" /> was in first with 90.31, <tc-webtag:handle coderId="152342" darkBG="true" /> in second with 90.27 and <tc-webtag:handle coderId="119676" darkBG="true" /> still 3<sup>rd</sup>.
</li><li>A few more appeal responses later, and <tc-webtag:handle coderId="152342" darkBG="true" /> took over first place with 90.74, <tc-webtag:handle coderId="278342" darkBG="true" /> unchanged, and <tc-webtag:handle coderId="119676" darkBG="true" /> had bumped up to 89.25
</li><li>Then, a whole bunch of appeal responses came in for <tc-webtag:handle coderId="152342" darkBG="true" />, and he went from 90.99 to 91.49 to 92.14. <tc-webtag:handle coderId="278342" darkBG="true" /> and <tc-webtag:handle coderId="119676" darkBG="true" /> were 
a "distant" second and third with 90.31 and 90.08 points respectively.  <tc-webtag:handle coderId="293874" darkBG="true" /> was in fourth with 89.47 (which would've put him in first place at the beginning of the appeals phase!)
</li><li><tc-webtag:handle coderId="278342" darkBG="true" /> just widened his lead on <tc-webtag:handle coderId="119676" darkBG="true" /> by another few tenths, to 90.64.
</li><li>At the end of the appeal phase, here are still about 20 appeals oustanding, so even though the current
standings as of 11:15 am (PDT) are as follows, anything can still happen:
<br><br>
<table border="1" cellspacing="0" cellpadding="3" class="bodyText">
<tr><td>Handle</td><td>Points</td></tr>
<tr><td><tc-webtag:handle coderId="152342" darkBG="true" /></td><td>    92.14</td></tr>
<tr><td><tc-webtag:handle coderId="278342" darkBG="true" /></td><td>    90.64</td></tr>
<tr><td><tc-webtag:handle coderId="119676" darkBG="true" /></td><td>    90.08</td></tr>
<tr><td><tc-webtag:handle coderId="293874" darkBG="true" /></td><td> 89.97</td></tr>
<tr><td><tc-webtag:handle coderId="11797255" darkBG="true" /></td><td>  88.12</td></tr>
<tr><td><tc-webtag:handle coderId="150498" darkBG="true" /></td><td> 83.31</td></tr>
<tr><td><tc-webtag:handle coderId="15891862" darkBG="true" /></td><td> 77.45</td></tr>
<tr><td><tc-webtag:handle coderId="252022" darkBG="true" /></td><td> 65.09</td></tr>
</ul>
I don't know about you, but this was pretty exciting, watching <tc-webtag:handle coderId="278342" darkBG="true" /> and <tc-webtag:handle coderId="152342" darkBG="true" /> swapping places (and -- this just in -- Pops moved up to second with 91.23 at 11:31 PDT) for almost two hours!  At the very beginning of the phase, <tc-webtag:handle coderId="282718" darkBG="true" /> stopped by and said "anything exciting"?  I answered "Well, it's <i>interesting</i> at least", but as it turned out, watching the board change every few minutes was exciting, to me at least.
<br/><br/>
Stay tuned for the final results!
<br/><br/>
With just two blog entries more to go,
<br/><br/>
&mdash; <tc-webtag:handle coderId="251184" darkBG="true" />
<br/><br/>
PS. The development appeals phase was pretty exciting as well. <tc-webtag:handle coderId="7548200" darkBG="true" /> got a perfect score from reviewer
<tc-webtag:handle coderId="7545675" darkBG="true" />, who also gave near-perfect scores to <tc-webtag:handle coderId="7210680" darkBG="true" /> (99.62) and <tc-webtag:handle coderId="15664457" darkBG="true" /> 
(99.37).  He also got a near-perfect (99.06) from <TC-WEBTAG:HANDLE CODERID="260952" DARKBG="TRUE" />.  As of 11:33 AM PDT, the development results were: (with still 11 outstanding appeals)
<br><br>
<table border="1" cellspacing="0" cellpadding="3" class="bodyText">
<tr><td>Handle</td><td>Points</td></tr>
<tr><td><tc-webtag:handle coderId="7548200" darkBG="true" /></td><td>   95.39</td></tr>
<tr><td><tc-webtag:handle coderId="10098406" darkBG="true" /></td><td>   94.24</td></tr>
<tr><td><tc-webtag:handle coderId="7210680" darkBG="true" /></td><td> 93.45</td></tr>
<tr><td><tc-webtag:handle coderId="299979" darkBG="true" /></td><td>   93.05</td></tr>
<tr><td><tc-webtag:handle coderId="14926554" darkBG="true" /></td><td>    92.42</td></tr>
<tr><td><tc-webtag:handle coderId="15664457" darkBG="true" /></td><td>    90.23</td></tr>
<tr><td><tc-webtag:handle coderId="15832159" darkBG="true" /></td><td>    83.18</td></tr>
<tr><td><tc-webtag:handle coderId="10526732" darkBG="true" /></td><td> 54.54 (who had zero successful appeals :-( )</td></tr>
</table>
<br/><br/>
Reviewer <tc-webtag:handle coderId="7545675" darkBG="true" /> sent me this humorous appeal and response text:
<pre>
Appeal Text:
I am so so sorry for submitting this unfinished component, actually,
when the other competitors were busying developing, I was in San
Atonio to pariticpate in the ACM/ICPC world final 2006. Finally, we
got the 13th place, which is the best place ever got by my University.
:) Ah, Wish you get less appeals today. :D

Appeal Response:
Congratulations about the 13th place!! I didn't know there was such a
place, I'd have thought that after the 12th there would be the 14th.
</pre>
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
