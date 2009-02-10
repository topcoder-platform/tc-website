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
<span class="bigTitle">Customer Round Table</span><br>
05.05.06 2:00 AM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
To paraphrase Sally Fields, "They like us, they really like us."  This afternoon TopCoder moderated a Customer Round table, with three current clients who are using TopCoder Software for internal software projects.  There were some "pre-canned" questions as well as questions from the field.  (Amazingly, I prepared 4 or 5 questions, but most of them were covered by the canned questions, or by the panelists themselves.)
<br/><br/>
Some of the more interesting questions and answers were:
<blockquote><b>Q:</b> What is your current software development methodology and process?<br/><br/>
<b>A:</b> Jeff Kish, CIO of <a href="?t=sponsor&c=link&link=http://www.stagestores.com/" target="_blank">Stage 
Stores</a>, said they use a <a href="?t=sponsor&c=link&link=http://www-306.ibm.com/software/rational/" target="_blank">
RUP</a> variant.  All three panelists said that there was some resistance on the part of their internal developers to adopt the TopCoder Component Based Software Engineering (CBSE) methodology.  Jeff thought that it was perhaps because developers were worried that they would be made "less important", or that an outsider couldn't possibly integrate with an insider who had built-in knowledge of the business.  That's just "not true" according to Jeff, and it winds up being an ego issue.  He said, "This is what we're going to do - get over it. Is that a methodology?"  The audience, a mixture of TopCoder members, current and prospective clients, roared!
<br/><br/>
Similarly, Grady Bryant, Director of Engineering for <a href="/?t=sponsor&c=link&link=http://www.verisign.com/" target="_blank">Verisign</a> reported that "job security" and the <a href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Not_Invented_Here"
target="_blank">NIH syndrome</a> likely contributed to resistance.  But TopCoder's model works because
of the competitve spirit (and the money).  He said this might wind up translating into money incentives for his internal developers to design and build their systems using a component-based approach.<br/>
<br/>
<b>Q:</b> What are the negatives and positives of working with TopCoder?<br/><br/>
<b>A:</b> Rob Longfellow, Director of Information Systems at <a href="/?t=sponsor&c=link&link=http://www.abb.com/"
target="_blank">ABB</a> could only point out a single negative; that since they started with such a big project with TopCoder, it took some time for both themselves to get used to the process, and for TopCoder to learn the business.  Unfortunately that project took longer than they expected. But now that both are up to speed, it has been smoother.  In terms of the TopCoder advantage over doing it themselves, he pointed out that the TopCoder community provides access to "hiqh quality resources" and it is a global community.  He couldn't possibly staff 10,000 people around the world, which translates into the ability to scale up.  TopCoder provides the "depth and breadth" of resources needed and the TopCoder component library is extensive, which speeds up the development process as well.
<br/><br/>
Verisign said there were no negatives, and that there were immense
positives.  One such effect was the mere exposure to an international engineering <a href="http://forums.topcoder.com/?module=Main">community</a>, which just didn't exist
within Verisign.  They have gleaned something from this model, with the intention that their global network 
of 1,600 technical staff will be able to trade ideas and learn from each other.  To this end, TopCoder will be 
building a community website and a component library for Verisign, to house their own components.  In fact, going one step further, the CBSE process is going to be promoted within Verisign, as currently they have myriad development methodologies due to their many acquisitions of mostly start-up companies (40 in the last two years.)
<br/><br/>
Jeff from Stage Stores said one of the big plusses of using TopCoder is that they have expertise that
his staff didn't.  The code worked "flawlessly" due to the quality assured by the TopCoder review process.
Not only did TopCoder excel on the technical side, but on the business as well.  "TopCoder understands my business,"
Jeff said, and that the excellence of the PMs was unmatched.
</blockquote>
<br/><br/>
One question that I <em>intended</em> to ask, but never actually did, was regarding maintenance of applications 
developed by TopCoder.  It was on my list of questions, but while answering another question, Grady from
Verisign pointed out that since TopCoder's source is provided, they can do their own maintenance.  The component
library provides "stability through exposure" -- since so many people around the world use the components, their
quality has only improved.
<br/><br/>Aside from the "get over it" quote, probably the quote that stood out most was that Jeff from Stage Stores
said that there are "no surprises when I do a project with TopCoder." 'Nuff said.
<br/><br/>
It was very gratifying to be able to hear TopCoder's clients give such positive feedback.  As a competitor in
development, and a little design as well, I have only ever been part of the "little picture."  Hearing the feedback
at this round table really helped give me perspective on the "big picture," that it's all about doing the best possible
job for the client.
<br/><br/>
<hr/>
Tonight was a <a href=" /?t=sponsor&c=link&link=http://www.amd.com/us-en/" target="_blank">AMD</a> sponsored event at <a href=" /?t=sponsor&c=link&link=http://www.gameworks.com/" target="_blank">GameWorks</a>, which is an 
arcade-type amusement center.  Before we even had dinner, we
got our three-hour <b>unlimited play</b> game cards. As someone played in the <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_4">Scrabble game</a> on Wednesday, "woot"!<br/><br/> 
During dinner with <tc-webtag:handle coderId="119676" darkBG="true" />, <tc-webtag:handle coderId="252022" darkBG="true" />,
<tc-webtag:handle coderId="15664457" darkBG="true" /> and <tc-webtag:handle coderId="287614" darkBG="true" />, we caught up on the day's activities, and even talked about such
mundane topics as snow removal, planting flowers, and our children.  Then, we hit the arcade, where <tc-webtag:handle coderId="119676" darkBG="true" /> got the high score on <a href=" /?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Asteroids_%28game%29" target="_blank">Asteroids</a>(and I got a few of the top ten myself.)  After many driving and shoot-em-up games later, I emerged to a beautiful Las Vegas evening filled with people and stars for an entertaining walk back to the hotel.
<br/><br/>
Viva Las Vegas baby,<br/>
--dplass<br/>
<br/><br/>        </div>
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
