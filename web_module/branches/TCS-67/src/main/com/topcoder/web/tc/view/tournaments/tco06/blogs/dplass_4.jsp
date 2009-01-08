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
<span class="bigTitle">Finally, <tc-webtag:handle coderId="251184" darkBG="true" /> talks about Design and Development</span><br>
05.03.06 7:30 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
This morning, during the Algorithm Room 1 round, I got to talking with some of the developers and designers who were here.  I finally met the infamous <tc-webtag:handle coderId="299979" darkBG="true" />, who has a reputation for being a <i>very</i> fast coder.
Yesterday, one of the TopCoder admins said that he once saw him code an entire component
in 3 hours in a hotel lobby.  That's <em>fast</em>.  It usually takes me 30-40 hours (working mostly
from 9 pm to midnight) for a component.  So, I got to meet the man behind the legend.
I made a joke, "Is doing TopCoder components your new profession?," which was pretty funny; I did once
consider that, but the problem is that the income isn't guaranteed!  We were able to turn that into a Div 1 500 dynamic programming problem - computing the "expected income" based on the relative difficulty of the component, probability of winning, and actual payment of the component. (This was all in jest, natch.)
<br/><br/>
He was very gracious, saying that it was disappointing that I was not able to make the TCO '05 finals in Santa Clara.  (I had personal conflicts with both the on-line finals and the on-site finals as it turns out.  I believe <tc-webtag:handle coderId="7210680" darkBG="true" />
progressed to the finals instead.  He is here, but I haven't spoken to him yet -- despite eating lunch next to him.)
<br/><br/>
Anyway, during the Algorithm round, <tc-webtag:handle coderId="252022" darkBG="true" /> came over and introduced himself.  It's his first on-site as well, so we have a similar view on the whole experience.  We actually started talking about algorithm SRMs and how stressful they can be sometimes.  "When I can't get a problem, I just feel my blood pressure rising," he said.  I also used to be like that, but finally learned how to relax, even though you wouldn't know it by my rating.  <tc-webtag:handle coderId="15664457" darkBG="true" /> came over as well, and the three of us chatted about the relative plusses and minuses of development and design competitions at TopCoder.
<br/><br/>
The consensus was that it takes less time for design projects than development projects, but the trouble that I myself 
have with them is that there is too much left for interpretation in design.  As a result, reviewers sometimes force "scope creep" by their own interpretation of the requirements, which may be different than the designer's view.  Just then
the proceedings were interrupted with:
<h2>"Attention please! There are 2 minutes left in the coding phase...phase...phase"</h2>
OK, now <i>that</i> scared the bejebus out of nearly everyone in the room! <tc-webtag:handle coderId="7346876" darkBG="true" />'s computer-bass-enhanced voice was a bit, er, LOUD.
<br/><br/>
After the room had a nice laugh, the three of us continued.  I feel that development is more 
"cut and dry" in this area - either you follow the design or you don't.  But, occasionally you run into platform-specific
problems.  <tc-webtag:handle coderId="15664457" darkBG="true" /> related to us a problem he had with the Java "default locale", which of course is
different in his native Germany than in China, where the reviewer was.  Similarly, <tc-webtag:handle coderId="252022" darkBG="true" /> had a development
bug whereby all three reviewers, and the developer, were getting different results on different operating systems and
JVM versions.  Myself, while doing the final final final fixes (<tc-webtag:handle coderId="156859" darkBG="true" /> might remember this as the
final fixes that lasted 2 months) for the <a href=" http://software.topcoder.com/catalog/c_component.jsp?comp=9932722&ver=1">API Analysis</a> component, I found myself having to work around
a known bug in Java's URLClassLoader class.  How frustrating!
<br/><br/>
<hr/>
After lunch, the Design and Development competition started with similar fanfare to the Algorithm Room 1 Competition
this morning.  <tc-webtag:handle coderId="7210680" darkBG="true" /> and <tc-webtag:handle coderId="15664457" darkBG="true" /> had their own cheering section, perhaps
related to their nationality or ???.
<br/><br/>
Today, the designers were appealing their "Relations" component, and the developers were appealing
the "Document Indexing Persistence" submissions. All components had been submitted a month ago, which
added to the challenge for the competitors.  I was a bit ambivalent as to whether or not watching the competitors
write appeals would make for good spectating, but went into it with an open mind.  Similar to this morning, I was hopeful to 
learn how other developers and designers approach their appeals.  Certainly there were many fewer
people here than in the morning session.  This was a bit sad, especially because the business model that TopCoder relies
on to generate income is based on their ability to design, develop and deliver components to their clients.
<br/><br/>
Anywho, when the round started, <tc-webtag:handle coderId="293874" darkBG="true" /> (the TCO 05 design champion) was leading the designers, in first place over <tc-webtag:handle coderId="278342" darkBG="true" /> (the TCCC '05 champion) by 5 points (a large lead), with <tc-webtag:handle coderId="119676" darkBG="true" /> in third, lagging
by another 4 points.  The development finalists were a lot closer, with <tc-webtag:handle coderId="10098406" darkBG="true" /> leading <tc-webtag:handle coderId="7548200" darkBG="true" /> by less than a point, and <tc-webtag:handle coderId="299979" darkBG="true" /> (the TCO 05 development champion) in third by also less than a point.  Then the competitors opened up their reviews, the first time they've seen any of them.  (They had already placed their bets before the appeals round even started.)
<br/><br/>
As during the Algorithms semi-final, the designers' and developers' screens are shown to the spectators.  Most of them
read through an entire review, appealing their points one by one, and then moving onto the next review scorecard.  By looking
around, you could see many common design and development appeals:
<ul>
<li> <tc-webtag:handle coderId="293874" darkBG="true" /> wrote an exposition on proper "Use case" design</li>
<li> <tc-webtag:handle coderId="119676" darkBG="true" /> used the ".NET 1.1 doesn't support that" defense (presumably successfully)</li>
<li> <tc-webtag:handle coderId="15664457" darkBG="true" /> appealed with "that would change the public API"</li>
<li> <tc-webtag:handle coderId="299979" darkBG="true" /> wrote the appeal that developers probably use the most, saying that the designer
made the change in the forums, and pasted in the reference to the post.  He also defended his demo section, saying it was much expanded over the designer's in the original CS</li>
</ul>
<br/>
Along the way, I saw some appeals that I myself wouldn't have made.  One developer was clearly in the wrong (I saw him bring up his code) and yet appealed it anyway.  Often as a developer, you feel each point deducted as a reflection of your personal integrity.  It is very tempting to appeal each and every scorecard item that you didn't get a '4' on.  But, you have to be truthful to the reviewers.  In fact, today we saw quite a few appeals get rejected (and not surprisingly, some appeals succeed).
<br/><br/>
On the other hand, I did see some really good appeals.  <tc-webtag:handle coderId="11797255" darkBG="true" /> appealed an item which said he didn't
describe the thread safety in the interfaces he proposed.  His response was right-on, because some components didn't
have thread safety requirements, so if he were to specify it in the <em>interface</em> it would be too restrictive in
the implementations of that interface.
<br/><br/> 
After 30 minutes, the top two developers hadn't made ANY appeals.  In fact, after 60 minutes, <tc-webtag:handle coderId="7548200" darkBG="true" /> still
hadn't made any, which was surprising.  (He later made some, and his score increased accordingly.)  I picked up on a
conversation between <tc-webtag:handle coderId="156859" darkBG="true" /> and <tc-webtag:handle coderId="275071" darkBG="true" /> about <a href="/dr">The Digital Run</a>, which
has an interesting "Rookie of the Year" concept.  I myself was thinking about re-entering the design competitions, for which
I might be a candidate for the designer ROTY (hmm, reminds me of <a href="/?t=sponsor&c=link&link=http://www.imdb.com/title/tt0086190/">ROTJ</a>. Maybe I can pull off the Star Wars motif after all...)  <tc-webtag:handle coderId="275071" darkBG="true" /> had the opposite point of view, that over the summer the <em>development</em> projects would be attractive to him (for the money), and then <b>he</b> might be eligible for the development ROTY.
<br/><br/>
More interesting appeals that I saw included:
<ul>
<li> <tc-webtag:handle coderId="7210680" darkBG="true" /> appealed, for the zillionth time, a reviewer who said he should consolidate the null/empty string checks into a helper class or method.</li>
<li> <tc-webtag:handle coderId="299979" darkBG="true" /> got tagged for not properly writing \0 in the output XML.  Those of you familiar with
XML would know that XML just doesn't allow \0.  I myself had run into that at a previous job -- ASCII 0 kept cropping
up in the XML that we were receiving, and no parser would (or should) accept it.</li>
<li> <tc-webtag:handle coderId="150498" darkBG="true" /> had a reviewer who gave a 3 in one section relating to how the design fulfills the design
because two classes should've been in the sub-package rather than the main package.  His appeal was proper, because
this doesn't affect how the design fulfills the requirements (but I'm betting the same reviewer tagged him elsewhere
for his general class design, hopefully this works out for him.)</li>
</ul>
<br/>
While the reviewers posted their responses, after almost 2 hours, the <u>relative</u> placement of all the competitors was the same.  Lesson learned: appeals are a hard way to improve your score; the best way is to design or develop a solid submission in the first place.
<br/><br/>
Latr dayz<br/>
-- <tc-webtag:handle coderId="251184" darkBG="true" />
<br/><br/>
P.S. I saw <tc-webtag:handle coderId="119676" darkBG="true" />' favorite bug appear multiple times: timeout in the appeals arena -- you submit your appeal but your session has timed out.  Competitors
quickly found a defense to this, by pre-writing their reviews in Word or Notepad, and then
pasting into the form.  This way, if they get the (error 500), they haven't lost their
text.  Maybe they'll fix it for next year!
<br /><br /><br/><br/>
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
