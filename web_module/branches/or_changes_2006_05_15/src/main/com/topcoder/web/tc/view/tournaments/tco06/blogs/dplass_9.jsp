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
<span class="bigTitle">CDDC 2 - What the reviewers saw</span><br>
05.04.06 7:25 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
[Before I start, I'd like to give an update from the CDDC Round 1.  In the forums, <tc-webtag:handle coderId="7390772" darkBG="true" /> was
wondering what the outcome of the round was.  As it turned out, the relative placement of the <b>design</b>
entries was the same -- <tc-webtag:handle coderId="293874" darkBG="true" /> in first, <tc-webtag:handle coderId="278342" darkBG="true" /> second, followed by <tc-webtag:handle coderId="119676" darkBG="true" />
in third.  However, for <b>development</b>, the ordering did in fact change.  After appeals, <tc-webtag:handle coderId="299979" darkBG="true" /> 
came in first (he had been third), <tc-webtag:handle coderId="7548200" darkBG="true" /> in second (as he was before) and <tc-webtag:handle coderId="10098406" darkBG="true" /> 
was in third, having
dropped from first.  I guess the <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_4">"lesson learned"</a> really shoujld've been, "It's not over until the
<strike>fat lady sings</strike> last appeal is resolved."]
<br/><br/>
<hr/>
For the second set of CDDC appeals, I decided to take a different tack - from the reviewer's point of view.
I went backstage to the <a href="/i/tournament/tco06/blogs/dplass_09_01.jpg">war room</a> and observed, and
interacted with, the three development reviewers, <tc-webtag:handle coderId="7545675" darkBG="true" />, <tc-webtag:handle coderId="287614" darkBG="true" /> and
<tc-webtag:handle coderId="260952" darkBG="true" />, who were resolving appeals for both the <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=20007420">Java</a> 
and the <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=20610008">.NET (C#)</a>
implementations of the Testing Framework component.  <font size="0">Note: I will be concentrating on development only
for this blog entry.</font>
<br/><br/>
The way the appeals process works mechanically is almost identical for a reviewer as for a developer or designer.
When an appeal is filed, an email goes to the appropriate reviewer, who opens (or refreshes) the Project Submit & Review
page (a.k.a. "View My Open Projects").  In the list of appeals, all the appeals for a single projects are grouped
together (and a reviewer can only see the appeals to his own review, not the other reviewers.)  The reviewer can 
look at the appeal, and (new for the TCO) <font color="#00d000"><b>accept</b></font> or 
<font color="red"><b>deny</b></font> it, as well as write a comment back.  Of course, they are
free to change the number of points assigned to that review question, and/or change an item from recommended to 
required (or vice versa.)  For the sake of the TCO, when an appeal is accepted or rejected, it doesn't necessarily
mean that the point score for that question has gone up or down, but whether or not the reviewer agreed with the
appeal or not.
<br/><br/>
Looking at the "big board" for development, <tc-webtag:handle coderId="7548200" darkBG="true" /> started out in 1st place, 
followed by <tc-webtag:handle coderId="14926554" darkBG="true" /> and <tc-webtag:handle coderId="15664457" darkBG="true" />. However, the scores were <i>very</i> 
close &mdash; less than two points from first (98.49) to 
third (96.07).  Behind the scenes, the three reviewers felt it was a fairly straightforward component, much
less difficult than yesterday's component (Document Indexer Persistence) or tomorrow's (Bread Crumb Trail). As a result,
<tc-webtag:handle coderId="260952" darkBG="true" /> said it would be a "light day".  This obviously makes the reviewer's job easier, even if there
is a large volume of appeals, they can often be resolved quickly.
<br/><br/>
Yesterday I noticed that the developers all submitted appeals for the reviews by <tc-webtag:handle coderId="260952" darkBG="true" /> and
<tc-webtag:handle coderId="7545675" darkBG="true" /> before touching <tc-webtag:handle coderId="287614" darkBG="true" />'s.  He noticed
this, and said that it was 45 minutes until his first appeal yesterday!  Today, though, they came through right away
and steadily for all 3 reviewers, which meant constant work.  An added source of pressure is that for a normal component
compeitition, reviewers have 24 hours to resolve appeals, but here the time is much more limited.  A technique that
<tc-webtag:handle coderId="287614" darkBG="true" /> said he uses is to do the easy ones quickly, and "batch up" the harder, more detailed responses
for the quieter times so he can spend enough time to write a coherent thoughtful response.
<br/><br/>
Possibly the most amusing appeal (maybe in the history of TopCoder?) I saw was one where the developer had forgotten
to remove an unused private method, which caused him to lose a point for that item.  He wrote in his appeal "Arrrgh.  
Silly me.  This is not an appeal. Just complaining so I feel better. Thank you."  To which 
<tc-webtag:handle coderId="7545675" darkBG="true" /> replied "Thank you for writing an appeal that doesn't
make me think or go digging in code."  Who says reviewing can't be fun?!
<br/><br/>
<hr/>
While I was in the war room during all this, all of a sudden we heard this teeny, squeeky voice saying something like 
<font size="0">"Welcome to the TopCoder Open 2006 Algorithm Wildcard Round."</font>  Turns out, <tc-webtag:handle coderId="7346876" darkBG="true" /> was testing the <a href="/i/tournament/tco06/blogs/dplass_09_02.jpg">sound system</a> (which you should not touch, ever, 
no matter what happens, or who tells you to, by the way) and, oops, had the wrong 
speed setting on the playback.  <tc-webtag:handle coderId="14999860" darkBG="true" /> thought it would be funny to really use it (as a joke) 
in one of the rounds.  I'm not sure which is funnier &mdash; using that munchkin voice, or the booming Darth Vader voice
scaring the bejebus out of us, interrupting the algorithm rounds with <b>"Attention please! There are two minutes left 
in the coding phase."</b>!)
<br/><br/>
Wish you were here,<br/>
&mdash; <tc-webtag:handle coderId="251184" darkBG="true" />
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
