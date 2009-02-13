<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Marathon Match Tutorials</title>
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
   width: 500;
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
            <jsp:param name="node" value="mm_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="mm_tut"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=mm_index">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="516840" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>

<span class="bigTitle">Stepping up to a Marathon Match problem</span>
<br />
<br />

<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10407399" context="marathon"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>In a <a href="/tc?module=Static&d1=tutorials&d2=mmIntro">previous tutorial</a> by <tc-webtag:handle coderId="21464956" context="marathon"/>, we learned about how Marathon Matches work, and were provided with some excellent advice on getting ourselves set up and going on a problem, including some very helpful tips on version control and time management. Now, we need to think a bit about solving the problem. When we step up to approach a marathon problem, we might get knee-deep in a room full of robots before asking ourselves some of the critical questions about our approach... can this run in time and do I have enough memory to keep track of all required information? How can I improve my approach? What kind of strategies are, initially, most appealing for the type of problem I have to solve? Let's look at a few different angles to help answer these kinds of questions.</p>


<p><span class="bodySubtitle">The Time Limit</span><br>
Seasoned algorithm competitors know very well that in an SRM, you get 2 seconds of execution time, and 64 megabytes of RAM. Those who read enough forum posts and match editorials might even offer, as a rough estimate, that your solution can do a billion integer multiplications with room for loop overhead and the like. It does not take much math to realize that for <span style="font-style: italic;">n</span> = 50, a concise O(<span style="font-style: italic;">n</span><sup>5</sup>) solution will often do just fine, whereas a more complicated sorting process with <span style="font-style: italic;">n</span> = 100,000 will probably require an O(<span style="font-style: italic;">n</span> * lg(<span style="font-style: italic;">n</span>)) approach.
</p>

<p>Now, one might be tempted to simply extend the arithmetic to a marathon-style time limit of 30 or 60 seconds, and make some assumptions based upon the theoretically available number of operations. Technically, this might be true, but it also misses some of the important subtleties of having so much time at our disposal.</p>

<p>In a Marathon Match, a solution can obviously have a fair amount of slop without worrying about timeout, but what about matches where execution time is a scoring factor? Having the long time limit is still helpful in other ways, namely, it makes it easier to get started on a problem. In a problem like <a href="/longcontest/?module=ViewProblemStatement&compid=7056&rd=10834">BlockEditDistance</a>, the scoring formula makes it clear that our solution needs to run quickly, with a bit of a ceiling at around 5 seconds. This gives us a good meter stick with which to gauge our solution, and having plenty of time helps us to know just how well (or poorly) we are doing. Compare that to the algorithm scenario, where timeout effectively looks the same for a solution that would take 2.1 seconds versus a solution that would take 2.1 years.</p>

<p>How about for problems where time is not a part of the score? First, be careful about how to consider this. Even though only <a href="/longcontest/?module=ViewProblemStatement&compid=7056&rd=10834">BlockEditDistance</a> specifically includes runtime in the scoring function, it is not the only problem where runtime is important for score. In particular, <a href="/longcontest/?module=ViewProblemStatement&compid=6983&rd=10815">ContinuousSameGame</a> had the unique property that a game could, in theory, go on forever (albeit with vanishingly small probability), and the problem itself placed no constraint on the number of moves that could be made, beyond the total runtime execution. Reversing this logic, that means the only limit on how many moves you can make (in other words, the number of opportunities to score points), is how quickly your function can return the next move. This is an oversimplification of the match, maybe, but the point is that runtime is still an important consideration.</p>

<p>Though no longer directly relevant, it is worth discussing the former <a href="/longcontest/?module=ViewActiveContests&rt=15">Intel Multi-threaded competition series</a> a bit. Because the focus of the competition was on utilizing the power of multi-threading on multi-core systems, performance was a more important factor than it has been in most other marathon matches, and in fact runtime was frequently part of the scoring. In this case, sometimes it was useful to take advantage of multiple execution threads to accomplish more heavy lifting in the same amount of time. At the same time, as <tc-webtag:handle coderId="7504863" context="marathon"/> pointed out in a <a href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_11">post-match writeup</a>, it was easy to see that multi-threading was no substitute for implementing a better algorithm.</p>

<p><span class="bodySubtitle">The Scoring Function</span><br>
Let's compare Marathon Matches once again to an SRM, where scoring is rather simple -- submit the problem quicker to get more points. Scoring in a marathon match is typically more complicated, and may vary greatly between problems. In fact, the scoring function often says more about the core goal of the problem than everything else in the problem statement does.</p>

<p>Consider the <a href="/longcontest/?module=ViewProblemStatement&compid=7074&rd=10845">Navigator</a> problem, used at the TCO07 finals. In the paragraph describing the scoring, there are two important details to highlight. The first detail -- &quot;Your base score will be time + fuel * 10&quot; -- suggests that we should probably prioritize minimizing fuel usage, and to a lesser extend time. The next detail, though, makes it clear that these considerations are secondary: &quot;If you touched at least one waypoint and as many as the person who touched the most (for a particular test case) you will get [your biggest amount of] points for that test. Otherwise, you will get 0.&quot;  </p>
<p>In this case, the importance of that last requirement is nothing less than huge. As a second place competitor, you risk getting no points for any test cases where the leader is hitting just one more waypoint than you. Conversely, you can secure a comfortable lead by hitting just one more waypoint than anyone else, even only part of the time. Consider if there were 1000 system test cases, and your solution could get one more waypoint than anyone else even only 10% of the time. For 100 cases, you would score 10 point while everyone else would score a 0. In other words, if your solution is even moderately competitive with the others on most of the remaining 900 cases, then you may be rewarded with a 100 point lead by virtue of those special 10%.</p>

<p>Now consider a very different problem, <a href="/longcontest/?module=ViewProblemStatement&compid=6983&rd=10815">ContinuousSameGame</a>. Note that you score points incrementally for removing blocks of same-color squares, in particular, a block with <span style="font-style: italic;">n</span> squares scores <span style="font-style: italic;">n</span> * (<i>n</i> - 1) points. It is not hard to notice that larger blocks are preferred. For instance, removing one block of 6 scores 30 points, while removing two blocks of 3 would only score 6 points each. Knowing that we not only want to keep removing squares for as long as possible, but that we want to remove the largest possible blocks all at once, we can go about crafting a solution with that goal in mind. Not surprisingly, the most successful approaches all involved some form of removing all but one color, which could then be left for a really large block all at once.</p>

<p><span class="bodySubtitle">Approaching a solution</span><br>
The simplest marathon problems require your solution to include only a single method, which gets called exactly once, and at the end of this single call returns the entire required response. These types of problems, including among others, <a href="/longcontest/?module=ViewProblemStatement&compid=6081&rd=10685">SortedCube</a>, <a href="/longcontest/?module=ViewProblemStatement&compid=6775&rd=10758">RobotRouting</a>, and <a href="/longcontest/?module=ViewProblemStatement&compid=7056&rd=10834">BlockEditDistance</a>, are most similar to SRM problems. At the time your method is called, you already have as much data as you are ever going to have in order to solve the problem, and by the end of your method, the return value is a one-shot deal.</p>

<p>In most cases, you can even program an evaluator into your solution and know immediately how good a return value will score, before actually returning it. This is the cornerstone to a common, and good strategy: attempt to solve the problem by any number of different approaches, and select the one that scores the best. The only thing limiting the number of approaches to try is time (either an explicit runtime limit, or imposed through scoring).</p>

<p>To put it in more concrete terms, suppose in working through the problem you notice that one strategy scores better on about half of the example cases, while another strategy scores better on the other half, and that you cannot discern an obvious pattern as to what distinguishes the approach that is likely to fare better. Unlike an SRM, a Marathon Match gives you the time to try both. Then, select the one that does better to use as your return. Even better, if the basic thrust of your solution can be tweaked with a bit of randomness, try the exact same thing many times over, and keep the one that does best.</p>

<p>In some cases, we can build further upon randomly searching for good solutions. For example, consider applying something like a genetic algorithm to the problem. You would first generate several candidate solutions, and pick the top few that do well. Then, randomly (or otherwise) select pairs of candidate solutions, and combine them to form a new solution. Keep those among the newly formed solutions that score better than the predecessors.</p>

<p>The exact details of how to combine two such solutions may require some ingenuity and will certainly be specific to the problem at hand. As an example, consider a problem that calls for returning points along a path. If each of two solutions has the same number of points, one could create a solution by taking the midpoint between the <i>n</i>-th point of the first and second solution, and using that midpoint as the <span style="font-style: italic;">n</span>-th point of the new solution. If two solutions had different numbers of points, then perhaps the solution with fewer points could first have some additional points added, using linear interpolation to create new points along the longest segments. Again, some level of creativity and ingenuity is called for here.</p>

<p>Continuing on this same example, our next consideration might be that, since our path is only represented by points along it, some segments of our path might be much longer, and more significant than others. Consider two paths with three points each:</p>

<pre class="code">
 (0, 0), (1, 5), (10, 10)
 (0, 0), (9, 6), (10, 10)
</pre>

<p>The first path defines two segments, of approximate lengths 5.1 and 10.3. The second path has segments with lengths 10.8 and 4.1. In the first path, the "mid"-point is about 1/3 of the total distance from start to finish, while on the second path the "mid"-point is more like 2/3 of the distance down the path. So, combining the two "mid"-points is probably not the optimal way to generate a new path (at least not in the general case). Another approach might be to interpolate to find the point along each of the two paths that is exactly 1/2 of the total distance between the begin and end of the path, and combine those two points. Better yet, perhaps would could even find the 1/4 and 3/4 points, as well, and return a new path constructed from five points instead of just 3.</p>

<p>This is just one example -- genetic algorithms won't apply to every problem -- but this is exactly the type of thought process one goes through during a week-long Marathon Match. Especially in cases where scores are clustered at one or more intervals (often as the result of multiple competitors coming up with the same general approach to the problem), these small enhancements can affect one's rank by several places.</p>

<p><span class="bodySubtitle">What we have learned</span><br>
Hopefully, what we have discussed thus far helps to offer some insight on how one might approach a problem. In particular, simply thinking for just a few moments about the nature of the problem helps to dictate quite a bit about how a solution might be constructed. In <a href="/tc?module=Static&d1=tutorials&d2=mmProblems2">Part 2</a> we will look into some other common patterns and approaches to the problems.</p>
<p>&nbsp;</p>

<br /><br />
<%--
<a href="/tc?module=Static&d1=tutorials&d2=mmProblems2">Part 2</a>
--%>
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
