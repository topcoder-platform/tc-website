<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 550;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
.GAtableText, .GAtableText2, .GAtableText3, .GAtableText4, .GAtableText5
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
}
.GAtableText {    background-color: #EEEEEE; }
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
    <tc-webtag:forumLink forumID="515805" message="Discuss this article" />
</div>

<span class="bigTitle">TCO Preview: Component Design and Development Competition</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/sql_lall_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="275640" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

    <p><span class="bodySubtitle">What is it?</span><br />
    Every year, the TopCoder Open (TCO) includes two component tracks allowing members to compete on top of the usual
    design and development contests that appear on the site weekly. While not the most popular or spectator-friendly tournament track, 
    the component contest always proves to be a tough, five-week competition, and this year hundreds of members registered, with over 
    100 submitting. Over the five weeks, a large amount of quality work was generated, with both new members and component regulars 
    raising their work intensity to compete for the final 8 design and 8 development positions in Las Vegas.</p>
    
    <p>For those new to the format, the TCO component contest works as follows:<br/>
    During a five week period, members can submit in the usual TopCoder Software component contests, to gain themselves points in the TCO. 
    Unlike the Digital run, points depend solely on final placement for everyone who scores over 75%; If you win your component, you get 10 points,
    second place gets you 7 points, a third placing is worth 5 points, 4 points for fourth, and zero points for fifth or below. While 
    these point values may seem strange, if you play around with them you may notice some complex orderings, such as:</p>
    <ul>
        <li>Three 2nd places (21 points) beats two wins (20 points)</li>
        <li>First and 3rd (15) beats two 2nds (14)</li>
        <li>2nd and 4th (11) beats one 1st (10), equivalent to two 3rds (10) which beats a 3rd and 4th (9)</li>
    </ul>
    <p>Additionally, only your best four component placings are counted (i.e. maximum score 40), and ties are broken by component review score.
    This leads to a number of possibilities for the lower placements, however to gain a spot in the top 5 or 6 in both design and development,
    there is no doubt that you need mostly firsts - something that gets increasingly difficult each year as more and more people submit.</p>
    
    <p><span class="bodySubtitle">The Digital Run effect</span><br />
    This was the first year that the TCO component contest was run at the same time as a stage of the 
    <a href="/dr">Digital Run</a> (DR), and it was interesting to see how 
    the two concurrent competitions affected the results of each other. For one, any member who had placed in the top five in a DR stage
    already had won a trip to the finals as a spectator. The four-submission cap for the Open meant that 
    the submit-a-lot strategy required to gain points in the DR would not be as successful in gaining a TCO spot -- while concentrating
    on submitting fewer, higher-quality submissions in the TCO could result in losing some places in the DR. Overall, the DR didn't seem
    to disrupt the usual TCO results, with the possible exception that the more active submitters did not stop submitting even after they
    had locked up a guaranteed place in the finals. In past years, early TCO leaders might have been more likely to back off in the later rounds and allow other competitors to notch some critical first-place finishes, but there was no relenting this year.</p>

    <p><span class="bodySubtitle">Design contest (<a href="/tc?module=TCO07ContestDetails&ct=286">results</a>)</a>: </span><br />
    <table class="formFrame" width="450" cellpadding="6" cellspacing="2">
        <tr class="GAtableText">
            <td># registrants</td><td>109</td><td># who submitted</td><td>52</td>
        </tr>
        <tr class="GAtableText">
            <td># of components</td><td>52</td><td># of submissions</td><td>157</td>
        </tr>  
    </table></p>

    <p><b><i>Overview:</i></b><br />
    This year's designers were provided with a large number of components from which they could gain points - with the usual mixture of mainly
    Java components, but with enough .NET ones to give C# designers a chance of making the finals. The early weeks consisted of a number
    of generic catalog components (Logging Wrapper, Collection Wrappers, Object Diff, ...) as well as components to help organise
    TC's new assembly contests (Phase / Project / Team Management). Many early projects proved popular, as designers took the opportunity
    to get some early points on the board. Part way through, the relatively simple
    <a href="http://www.topcoder.com/tc?module=CompContestDetails&pj=30001310">Null Streams</a> component proved one of the most popular
    design contests ever with 12 submissions -- all of them passing review. Then in the final week, a number of Survey components gave
    members a last chance to climb up the leaderboard towards the top 8.</p>

    <p><b><i>Observations:</i></b>
    <ul>
        <li>Three designers - <tc-webtag:handle coderId="287614" />, <tc-webtag:handle coderId="152342" /> and <tc-webtag:handle coderId="119676" /> - all managed to reach the 40-point mark, with <tc-webtag:handle coderId="22498968" /> also getting 30 from 3 contests.</li>
        <li><tc-webtag:handle coderId="287614" /> submitted in 10 components, with an impressive 7 wins and 3 seconds.</li>
        <li>Not to be outdone, <tc-webtag:handle coderId="252022" /> made 17 submissions, with 14 passing review, 3 wins and 6 seconds.</li>
        <li><tc-webtag:handle coderId="152342" /> managed to score the second ever perfect score for design, with 100% for <a href="/tc?module=CompContestDetails&pj=30001385">Survey Model</a>.</li>
    </ul></p>
    
    <p><span class="bodySubtitle">Development contest (<a href="/tc?module=TCO07ContestDetails&ct=287">results</a>): </span><br />
    <table class="formFrame" width="450" cellpadding="6" cellspacing="2">
        <tr class="GAtableText">
            <td># registrants</td><td>243</td><td># who submitted</td><td>99</td>
        </tr>
        <tr class="GAtableText">
            <td># of components</td><td>82</td><td># of submissions</td><td>204</td>
        </tr>  
    </table></p>

    <p><b><i>Overview:</i></b><br />
    The development side has certainly grown in popularity, and the increase in competitors was matched by an increase in available components
    -- during the TCO there was an average of around 16 components per week (including reposts) which gave many chances to get on the scoreboard.
    Included among them were a large number of the Time Tracker custom components, to be used on what looks like a large 
    user- and project-tracking website. In addition to these were some of the regular siren components that seem to draw developers towards them,
    such as <a href="/tc?module=CompContestDetails&pj=30001408">Object Diff</a> (19 submissions) and 
    <a href=/tc?module=CompContestDetails&pj=30001320">Text Normalization</a> (24 submissions). The final weeks proved to be more of 
    the same, however developers now were able to enjoy asking questions to designers who were near the end of their own busy 5 week schedule.
    </p>

    <p><b><i>Observations:</i></b>
    <ul>
        <li>Four developers - <tc-webtag:handle coderId="14926554" />, <tc-webtag:handle coderId="14788013" />, <tc-webtag:handle coderId="9998760" /> and <tc-webtag:handle coderId="14820574" /> all obtained 40 points, and <tc-webtag:handle coderId="22655076" /> won 30 points from 3 contests. </li>
        <li><tc-webtag:handle coderId="14820574" /> was the most active submitter in the contest, with 8 components, including 5 wins. </li>
        <li>Three of <tc-webtag:handle coderId="14926554" />'s wins came from the difficult Time Tracker projects, netting $5600 in prizes and 1825 Digital Run points.</li>
        <li><tc-webtag:handle coderId="14788013" />  joined an exclusive club -- the small handful of developers who have reached red -- after scoring 99.6 for <a href="/tc?module=CompContestDetails&pj=30001320">Text Normalization</a>.</li>
    </ul></p>
    
    <p><span class="bodySubtitle"><strong>The Finals: </strong></span></p>
    <p>Due to travel problems, many of the best-performing competitors -- especially among the developers -- won't be able to able to make it to
Las Vegas to participate in the finals. Nevertheless, there's enough talent and experience among the finalists that I expect an interesting match. 
Congratulations to the finalists - 8 for <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desBracket">design</a> and 6 for
<a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=devBracket">development.</a>.</p>
    
    <p>However, their finals experience begins long before setting foot in Las Vegas -- over the next five weeks, each finalist will
    be working on three components of a traditionally tough difficulty, with a week's break between each round. All finalists 
    work on the same components (choosing Java or .NET versions), which are then judged by two panels of hand-picked reviewers, 3 for design 
    and 3 for development. The contestants, however, do not find out their score immediately, and so the suspense builds until the trip to Las Vegas.</p>
    
    <p>Once onsite, the finalists participate in what is called the "Appeals Phase" for each of their three submissions, one per day. 
    First, before each phase, the contestants get to wager part of a total of 100 'points' on how they think they'll do for the component -- 
    this comes into play once final results are known. Scores are then revealed, along with the comments from reviewers detailing why 
    certain scores were given. Each finalist has two hours to enter 'appeal' text for sections of the scorecard if they feel they have not 
    been awarded the appropriate marks. If successful, their scores may be increased, and it's possible for the scores and leaders to change
    many times during this phase (score changes in the order of 15% are not unheard of).</p>
    
    <p>Each contestant's score is revealed after reviewers have responded to all the appeals -- which may be a long time after the appeals phase 
      ends, as eight contestants can generate a lot of appeals in two hours! Then, the contestant's initial wager is divided by their place -- 
      for instance, if you wagered 40 and came 1st, you get 40. If you come in fourth, you  get 40 / 4 = 10 points. After all the wagers have 
      been scaled down by placement, the totals are accumulated, and whoever has the most will be the TCO winner! </p>

<p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
