<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>


<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506161" message="Discuss this article" />
</div>

<span class="bigTitle">TCCC Preview: Component Competitions</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/AleaActaEst_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="252022" context="design"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

It has been a while since the last Collegiate Challenge (or it at least seems that way); with the competition enhancements first introduced at the 2006 TCO adding some interesting twists to this TCCC's design/development competitions, it should prove to be an exciting one.
<br><br>
How do onsite component competitions work, anyway? Most of us are familiar, through participation in SRMs, with how the algorithm competitions are done &mdash; they're fast and furious, and undeniably exciting to watch. But how do you get excited about design and development if you're not a finalist? 
<br><br>
The keys to understanding and enjoying the component finals lie in the changes that TopCoder introduced during the 2006 TCO, which I was lucky enough to experience firsthand as a design finalist. These changes include the wagering system, in which competitors have to decide how much each submission will contribute to their overall score, and the real time appeals phase, which is open to any and all viewers.
<br><br>
These changes added a lot of excitement to the TCO. I can't wait to see what kind of effect they have on the TCCC, especially since there are a number of newcomers among this year's finalists.
<br><br>
<span class="subtitle">Interesting and interactive</span><br>
Of these two major changes, the one I found most exciting during the 2006 TCO was the wagering system. In this system, each competitor is given 100 points to wager on each of their own three final design or development submissions. What this means is that having the highest score is not the only factor anymore (though scoring well is of course still very important). The wagering system adds another dimension into the process, challenging competitors to not just create quality submissions but to exercise judgment in assessing those submission and evaluating their competitors.
<br><br>
If a competitor thinks they did a bad job on one of the designs, they could wager the minimum points (20) to minimize the impact of a low relative score; if they feel that a particular design is definitely the best they have done, they could wager the maximum points (60) to maximize the impact of a possible high score. There is of course a caveat: If you wager x points you will only win x points if you come in first for that component. Scoring a 2nd place would only give you x/2 point, scoring 3rd only x/3, and so on. And, of course, you must plan your wagers without knowing your competitors' moves. I found this to be very exciting, and so did the spectators &mdash; unlike previous scoring systems, the wagering approach means you won't really know who won until the very end.
<br><br>
The other change is the real-time appeals and appeal responses. During each appeals round of the Collegiate Challenge, spectators will see a two-hour flurry of activity as the designers and developers race against time to appeal as many aspect of the review as they can. The outnumbered reviewers (three of them) try valiantly to respond in real time, a big screen shows the changing scores, and you can see the competitors trading places over the course of the round&#8230; it's very cool! 
<br><br>
<span class="subtitle">TCCC vs. TCO</span><br>
The main difference between TopCoder's two tournaments comes down to the size of the competitor pool: The TCO is open to anybody over 18, while the TCCC is open to full time students only. If your mind is conjuring pictures of 1st and 2nd year freshmen, well, that's not exactly accurate &mdash; there are a couple PhD students in the mix &mdash; but in general, the TCCC component finalists are mostly younger and less experienced than their TCO counterparts. With most TCO veterans out of school and sitting this one out, a new crop of competitors will experience their first on-site tournament &mdash; and there is nothing else like it. It makes you hungry for more, and of course nothing succeeds like success. I expect we'll hear more from these finalists, and that the 2007 TCO will see many of them giving component veterans a run for their money.
<br><br>
<span class="subtitle">Competition format</span><br>
To become a finalist all eligible competitors fight it out online over a period of 5 weeks, in which 4 of their best scoring designs/developments are used in ranking. The finals are split into two parts -- first there are three designs/development submissions that need to be finished (1 every two weeks, with a week of rest in between). The components are selected by TopCoder &mdash; competitors get to choose between .NET or Java-based specs, but the actual tasks are the same. The second part of the finals is the on-site appeals and responses, along with the wagering.
<br><br>
<span class="subtitle">The Digital Run connection</span><br>
In design, there are many new faces in the finalist group. Not at all new faces are inexperienced, though -- thanks to the magic of the Digital Run, some of them have crystallized their skills and become much more formidable opponents than their limited component competition experience might suggest. 
<br><br>
<tc-webtag:handle coderId="275071" context="design"/> and <tc-webtag:handle coderId="275640" context="design"/> are two such competitors on the design side. They have  been around, but thanks to the DR they have really cranked it up a notch or two. I would definitely watch them in the finals. On the development side we have <tc-webtag:handle coderId="8347577" context="development"/>, <tc-webtag:handle coderId="302810" context="development"/>, and <tc-webtag:handle coderId="20256177" context="development"/>, all of whom are relatively new to the competition.
<br><br>
In this <A href="http://forums.topcoder.com/?module=Thread&threadID=508788&start=0&mc=33">thread</A> many of the top designers such as <tc-webtag:handle coderId="151743" context="design"/> and <tc-webtag:handle coderId="287614" context="design"/> discuss how important it is to feel like you can win in order to be able to actually do it. It will be interesting to see if the incentive and reward system put in place by the DR helps in this regard &mdash; though some finalists are component rookies, their DR successes could have given them the mindset of a more seasoned winner. We'll see if it makes the difference for them&#8230; 
<br><br>
<span class="subtitle">Who to watch</span><br>
On the design side, <tc-webtag:handle coderId="293874" context="design"/> is a veteran and a winner of the 2005 TCO, as well as a finalist from the 2006 TCO. He's very formidable, and my personal bet for first place. (Actually, if you are a new competitor, or are thinking about starting up in design, have a look at some of <tc-webtag:handle coderId="293874" context="design"/>'s designs.) But let's not write off <tc-webtag:handle coderId="275071" context="design"/> and <tc-webtag:handle coderId="275640" context="design"/>, either of whom could throw a kink into <tc-webtag:handle coderId="293874" context="design"/>'s plans. The spread for design is quite interesting, going from a gray designer (<tc-webtag:handle coderId="15247903" context="design"/>) all the way through green and blue to a yellow designer (<tc-webtag:handle coderId="293874" context="design"/>). It should make for a volatile and interesting finale.
<br><br>
On the development side the competitors are congregated a little more tightly toward the upper end of the ratings chart. The only current red in development (<tc-webtag:handle coderId="8375801" context="development"/>) is at the top, followed by three strong yellows, a blue and two greens. I expect that development will see some very fierce fighting for first place!
<br><br>
<span class="subtitle">Appeals and wagers</span><br>
In the final onsite round we will see who will emerge victorious (and if you will not be onsite be sure to watch the AOL webcast). How people appeal and how they wager will be crucial, and will probably decide their placement. My own strategy during the 2006 TCO was to estimate how much of the design I felt was done properly &mdash; if I knew that I had missed documentations, or I had a weak Use Case diagram or an unfinished algorithms section, I scored my self down, and placed my wagers accordingly. Looking back, it seems most of the other design competitors in that round took a <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_des_finals">similar approach</A> &mdash; of the 8 of us, only one competitor went for a balanced 35-35-30 wager.
<br><br>
I'm looking forward to seeing what strategies the TCCC finalists take, and I'm sure the moments leading to the revelation of development and design champions will be exciting ones. Good luck to all the competitors! 
<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
