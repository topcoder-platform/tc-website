<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505991" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 316</span><br>Saturday, August 19, 2006
<br><br>

<h2>Match summary</h2>



<p>

<p>Taking place the same day as this year's International Olympiad in Informatics awards ceremony, SRM 316 proved to be an exciting event with an active challenge phase that some coders will find hard to forget. Notably, this was <tc-webtag:handle coderId="144400" context="algorithm"/>’s first rated event after the TCO06 Finals. He came into the match with a chance of hitting the 3600 rating mark, though unfortunately he didn't quite get there this time.</p>

<p>After completing the easy and evaluating the medium and hard problems, some of the coders in Division 1 opted for the tricky 550 while others went directly for the reasonably easy 900. By the end of the coding phase a respectable number of mediums and hards were in, with <tc-webtag:handle coderId="10574855" context="algorithm"/> in first with the highest scores on all three problems. A truly amazing challenge phase followed, with several coders raking in points  and significantly reducing the time required for system testing. Top performers were <tc-webtag:handle coderId="310723" context="algorithm"/>, with nine successful challenges on the easy, and <tc-webtag:handle coderId="309453" context="algorithm"/>, who brought down eight mediums. With 225 points from challenges, <tc-webtag:handle coderId="10574855" context="algorithm"/> looked to have secured another convincing win, but to everyone’s surprise his hard failed, leaving <tc-webtag:handle coderId="14946025" context="algorithm"/>, another student of the Moscow State University, to enjoy his first SRM win thanks to four successful challenges. <tc-webtag:handle coderId="309453" context="algorithm"/> came in second, with a failed medium submission he made up for in the challenge phase, and <tc-webtag:handle coderId="7485898" context="algorithm"/> took third with a fine performance in the challenge phase as well. <tc-webtag:handle coderId="144400" context="algorithm"/> finished fourth due to a resubmission on the medium. After rounding up the top five, <tc-webtag:handle coderId="7581406" context="algorithm"/> will enjoy being the only red coder from India at the moment.</p>

<p>In Division 2 things were a little more calm, with another Russian coder, <tc-webtag:handle coderId="21691199" context="algorithm"/>, winning the division and moving to Division 1 in the process. Newcomer <tc-webtag:handle coderId="22636969" context="algorithm"/> placed second, followed by <tc-webtag:handle coderId="22629339" context="algorithm"/> in third and another newcomer, <tc-webtag:handle coderId="22636477" context="algorithm"/>, in fourth.</p>

</p>



<H1>

The Problems

</H1>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6618&amp;rd=9996" name="6618">HiddenMessage</a></b>

</font>

<A href="Javascript:openProblemRating(6618)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505991" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level One: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      250

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      427 / 457 (93.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      390 / 427 (91.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>bor1</b> for 249.58 points (1 mins 10 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      225.64 (for 390 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>Problems don’t get much easier than this. This task asked coders to parse the given string and concatenate the initial letters from the words contained in it. An easy way to do this is to scan the input string two characters at a time. If the first character is a space and the next one is a letter, then this second character must be the first letter of a word, so we append it to the result. See <tc-webtag:handle coderId="21691199" context="algorithm"/>’s <a href=/stat?c=problem_solution&rm=249445&rd=9996&pm=6618&cr=21691199>solution</a> for the implementation of this. Alternatively, coders used tools from their preferred languages to split the input string into words.</p>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6619&amp;rd=9996" name="6619">InboxCleanup</a></b>

</font>

<A href="Javascript:openProblemRating(6619)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505991" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      500

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      289 / 457 (63.24%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      131 / 289 (45.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>FedorTsarev</b> for 454.08 points (9 mins 13 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      288.15 (for 131 correct submissions)

    </td>

  </tr>

</table></blockquote>



Used as: Division One - Level One: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      250

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      386 / 395 (97.72%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      249 / 386 (64.51%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 244.47 points (4 mins 17 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      192.69 (for 249 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>The strategy described in the problem statement of selecting all messages on a page and then individually deselecting some of them might actually help in some situations. It surely did for the purpose of this task. A hidden trick turned what seemed to be a really easy problem into a ticking bomb during the challenge or system test phases and caught some of the leading coders off-guard.</p>

<p>The first step of the solution is iterating through all possible values <i>K</i> for the number of emails per page, computing the minimal number of clicks required for each one and choosing the best. Once you determine how to calculate the number of clicks required for a fixed number of emails per page you’re pretty much done. We have to iterate over each page of emails, make a selection with the minimal number of clicks, press delete only if there is at least one message to delete, and advance to the next page (if the current page is not the last one). In making the selection, there are only two options, both of them mentioned in the problem statement: either select messages individually or select all messages and then deselect the ones we must keep. So all we need to know for each page is the number <i>delete</i> of emails to delete and the number <i>keep</i> of messages to keep. The optimal number of clicks required to do a selection will then be <i>min(delete, keep+1)</i>. This is what went wrong for some coders: they evaluated <i>keep</i> to be equal to <i>K–delete</i>, overlooking the fact that the last page might contain fewer than <i>K</i> messages. For a nice implementation of the above algorithm, see <tc-webtag:handle coderId="10574855" context="algorithm"/>’s <a href=/stat?c=problem_solution&rm=249409&rd=9996&pm=6619&cr=10574855>solution</a>.</p>


</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6538&amp;rd=9996" name="6538">SpreadingNews</a></b>

</font>

<A href="Javascript:openProblemRating(6538)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505991" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      1000

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      101 / 457 (22.10%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      57 / 101 (56.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>BVCoder</b> for 931.72 points (7 mins 48 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      630.67 (for 57 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>The first thing to notice is the recursive structure of the problem: to find the minimum time required for the manager to spread the news, we must know the minimum times for each direct subordinate to spread the news among their own subordinates (direct or indirect). Note that it wouldn’t be of any help to the manager if at least one subordinate doesn’t spread the news in a minimal time -- this might lead to a worse solution, but not to an improvement. In other words, the optimal solution to the problem will be built from optimal solutions to the sub-problems.</p>

<p>More formally, we define a sub-problem as the minimum time required for one of the employees to spread the news among their direct or indirect subordinates. Let’s also define <i>time[i]</i> the answer to the i-th sub-problem -- that is, the time required for the i-th employee. Our goal is to calculate <i>time[0]</i>, and then return it. Let s<sub>i</sub> be the number of direct subordinates of the i-th employee. The base case is when the i-th employee doesn’t have any direct subordinates (s<sub>i</sub> = 0) yielding <i>time[i] = 0</i>. For the other sub-problems, let’s assume we have already solved their sub-sub-problems and we know how long it takes for each of the direct subordinate of the i-th employee to spread the news. We have to use this information for solving the sub-problem at hand. It is easy to see that an employee must give the first phone call as soon as they hear the news from a supervisor, and call all their subordinates in some order without any pause between calls. How can we find this order so that the spreading time is minimized? Let’s take a closer look at what happens if the s<sub>i</sub> subordinates are called in the order p<sub>0</sub>, p<sub>1</sub>, ..., p<sub>s<sub>i-1</sub></sub>. Specifically, employee numbered <i>i</i> will call employee p<sub>0</sub> at time 0, then employee p<sub>1</sub> at time 1, and so on, where the times are relative to the moment of time employee <i>i</i> has heard the news from its supervisor. The moment of time at which p<sub>0</sub> or any of his direct and indirect subordinates will have heard the news is clearly <i>1 + time[p<sub>0</sub>]</i>, and the moment of time at which p<sub>1</sub> or any of his direct or indirect subordinates will have heard the news is <i>2 + time[p<sub>1</sub>]</i>. The more general statement holds: the moment of time at which employee p<sub>i</sub> and all subordinates will have heard the news is <i>i + 1 + time[p<sub>i</sub>]</i>. So putting all these head to head we can deduce the following relation: 
<pre>time[i] = max(1 + time[p<sub>0</sub>], 2 + time[p<sub>1</sub>], ..., s<sub>i</sub> + time[p<sub>S<sub>i-1</sub></sub>])</pre> From this it is rather easy to conclude that the i-th employee must call his direct subordinates in decreasing order of their spreading times. The proof that this greedy strategy works is easy and it is left as an exercise for the reader. If you are stuck somewhere, you can always use the <a href=http://forums.topcoder.com/?module=ThreadList&forumID=505991>forums</a> to ask whatever question you may have.</p>

<p>The implementation of the above algorithm is not too difficult. One may choose to write a recursive function close to what was described above, just as <tc-webtag:handle coderId="15076432" context="algorithm"/> did in his <a href=/stat?c=problem_solution&rm=249449&rd=9996&pm=6538&cr=15076432>solution</a>. Note that you don’t need to memoize the function as some coders did in their solutions, since it will be called exactly once for each parameter. Alternatively, one may iterate through each employee in decreasing index order, since all his direct subordinates have greater indexes. This leads to a very concise implementation, like <tc-webtag:handle coderId="22636477" context="algorithm"/>’s <a href=/stat?c=problem_solution&rm=249440&rd=9996&pm=6538&cr=22636477>solution</a>. Note that his solution has time complexity <i>O(N<sup>2</sup> lg N)</i>, but it can easily be modified to run in <i>O(N lg N)</i>, by replacing the second loop with one that iterates over direct subordinates only.</p>


</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6540&amp;rd=9996" name="6540">PlacingPieces</a></b>

</font>

<A href="Javascript:openProblemRating(6540)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505991" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      550

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      125 / 395 (31.65%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      23 / 125 (18.40%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 489.72 points (10 mins 13 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      305.85 (for 23 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>The first thing that occurred to most coders after reading the problem statement was a greedy algorithm. Ideally, such solutions shouldn’t have lived for too long as some of the examples were counterexamples for such approaches and a hint that no greedy strategy would do. Sadly though, some coders didn’t take a close look at the examples and, even worse, overlooked the condition that the total length of the placed pieces couldn’t be greater than the length of the board <b>L</b>. As a result, the most common greedy approach passed the example that had been specifically designed against it. Unfortunately, this same miss caused some other solutions to fail that were otherwise on the right track. (As it turns out, this problem is very similar to the knapsack problem.)</p>

<p>The first thing one should realize here is that when placing some pieces on the board, we are interested in the total length, <i>len</i>, and the number of pieces used, <i>count</i>. To check whether any other piece fits on the board, we only have to check if the smallest unused piece, of length <i>s</i>, fits. When placing the pieces on the board, we will have <i>L-len</i> total space left. It is easy to see and prove that the best strategy is to divide this space evenly among two consecutive pieces or the edges of the board and the first and the last pieces, and leave <i>count+1</i> spaces on the board. To conclude, at least one more piece fits on the board if the following expression evaluates to true: 
<pre>(count + 1) * s &lt= L - len</pre> If this expression is false, we have a valid solution, and a candidate for the optimal solution.</p>

<p>With this key observation at hand we are ready to build a dynamic programming algorithm. After sorting the pieces in increasing order by length, we will iterate over the index <i>ind</i> of the smallest unused piece, and place all pieces with a smaller index (since their length is smaller), with a total length of <i>smallerLen</i>. With the remaining pieces we will fill up the table <i>canPlace</i>, where <i>canPlace[higherCount][higherLen]</i> is true if and only if there is a way to place <i>higherCount</i> pieces with the total length of <i>higherLen</i>. Now, we take each pair <i>(higherCount, higherLen)</i> for which <i>canPlace[higherCount][higherLen]</i> is true, and check whether by adding these <i>highestCount</i> pieces to the partially filled board (do not forget to check whether they can be added, ie. <i>smallerLen + higherLen &lt;= L</i>) we get a valid solution, by using a similar expression to the one in the last paragraph (where <i>count</i> is replaced by <i>smallerCount + higherCount</i> and <i>len</i> is replaced by <i>smallerLen + higherLen)</i> -- if we do, we have to compare it with the best solution so far. If we are not able to find any solution at all, then all pieces must be placed on the board.</p>

<p>A straighforward implementation of the above algorithm runs in <i>O(N<sup>3</sup> * L)</i> time complexity -- see <tc-webtag:handle coderId="7462740" context="algorithm"/>’s <a href=/stat?c=problem_solution&rm=249414&rd=9996&pm=6540&cr=7462740>solution</a> for a nice implementation. You can turn this into a <i>O(N<sup>2</sup> * L)</i> algorithm if, instead of building and then filling the table <i>canPlace</i> independently for each smallest unused piece, you use the information obtained at the last iteration as well. For more details, you can check out <tc-webtag:handle coderId="8472826" context="algorithm"/>’s <a href=/tc?module=MemberProfile&cr=8472826>solution</a>, which turns out to be quite similar to the referenced solution.</p>

<p>There is an alternate solution to this, thanks to <tc-webtag:handle coderId="251317" context="algorithm"/>. At every iteration over the smallest unused piece, instead of filling in the table <i>canPlace</i>, we can use another one, <i>best</i>, so that <i>best[b]</i> will contain the minimum number of pieces, from the remaining ones, for which the total length is <i>b</i>. The valid solutions are then found similarly to the algorithm above. To keep this article easy to read, the proof on why this works will be omitted and left as a useful exercise to the reader. If it doesn’t work out, I will be happy to answer in the <a href=http://forums.topcoder.com/?module=ThreadList&forumID=505991>forums</a>. A straighforward implementation of this runs in <i>O(N<sup>2</sup> * L)</i> but can be improved to run in <i>O(N * L)</i>. </p>


</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6621&amp;rd=9996" name="6621">RoboRace</a></b>

</font>

<A href="Javascript:openProblemRating(6621)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505991" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      900

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      102 / 395 (25.82%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      61 / 102 (59.80%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>konqueror</b> for 765.56 points (12 mins 21 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      531.66 (for 61 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>This problem not only required a correct algorithm but an efficient one as well. However, this didn’t trouble coders too much, as reflected by the high submission and success rates.</p>

<p>Let’s start with the first solution that comes to mind: check every possible starting time, and return the first that guarantees a win for our robot. To accomplish this, we could use a slightly modified version of a breadth first search. A state in the search will be represented by three integer values: <i>row</i>, <i>col</i> and <i>time</i> for the current row, column or time, respectively. When being in state <i>(row, col, time)</i> a robot has two options: ignore the command for this time unit and go to state <i>(row, col, time+1)</i> or following the command and reach the state <i>(newRow, newCol, time+1)</i>. Now, for each possible starting time <i>T</i> we perform a BFS starting from the state <i>(startRow<sub>i</sub>, startCol<sub>i</sub>, T)</i> where <i>(startRow<sub>i</sub>, startCol<sub>i</sub>)</i> are the starting positions for the two robots and the index <i>i</i> distinguishes between them. The states for each we search -- let’s call them final states -- are <i>(destRow, destCol, T’)</i> for some <i>T’</i> greater than <i>T</i>, where <i>(destRow, destCol)</i> is the position of the destination cell. Obviously the robots would like to reach the destination as soon as possible, so final states with smaller <i>T'</i>s are preferred. If our robot reaches the destination first -- in other words reaches a final state with a lower <i>T' -- </i> we can return <i>T</i>. This may pass test cases where the return <i>T</i> is low enough, or even a few tougher ones if optimized a bit, but it wouldn’t have a big chance of passing test cases where the return is -1.</p>

<p>Let’s see how the BFS works in more detail. For a better understanding of what is stated below it would help to think of the searches in a reversed way: if the length of the string of commands is <i>N</i>, first perform a search for the starting time <i>N-1</i>, then for <i>N-2</i>, and all the way down to 0. Notice that a state can be visited many times for multiple starting times, and each time the states reached from it are the same, thus performing redundant work. Now assume we had already done searches for the starting times greater than <i>T</i>. If we perform a BFS for the starting time <i>T</i> we will reach states that were either visited in a previous search or not. If the state is not visited we have no choice but to continue the search, but if it has already been visited there is no reason to do so: after all, we will get the same conclusions as the last time we did it. This way we make sure each state is visited at most once, and since the number of states is <i>W * H * N</i>, where <i>W</i> and <i>H</i> are the dimensions of the board, this will run quickly enough. For a nice implementation, check out <tc-webtag:handle coderId="7433858" context="algorithm"/>’s <a href=/stat?c=problem_solution&rm=249417&rd=9996&pm=6621&cr=7433858>solution</a>.</p>

<p>Most coders preferred dynamic programming or memoized solutions instead, based on the same key idea. Let <i>best[row][col][time]</i> be the earliest time to reach the destination cell from the state <i>(row, col, time)</i> -- that is, <i>best[row][col][time]</i> equals <i>T</i> if and only if the final state <i>(destRow, destCol, T)</i> is reachable from <i>(row, col, time)</i> and there is no reachable final state with a lower <i>T</i>. For any <i>T</i>, we have that <pre>best[destRow][destCol][T] = T</pre> and <pre>best[row][col][T] = min(best[row][col][T+1], best[newRow][newCol][T+1])</pre> where <i>(newRow, newCol)</i> is the new position after following the command given at time <i>T</i>. We return the lowest <i>T</i> for which <i>best[startRow<sub>1</sub>][startCol<sub>1</sub>][T]</i> is less than <i>best[startRow<sub>2</sub>][startCol<sub>2</sub>][T]</i>. For solutions based on this approach see <tc-webtag:handle coderId="309453" context="algorithm"/>’ DP <a href=/stat?c=problem_solution&rm=249419&rd=9996&pm=6621&cr=309453>solution</a>, or <tc-webtag:handle coderId="144400" context="algorithm"/>’s <a href=/stat?c=problem_solution&rm=249416&rd=9996&pm=6621&cr=144400>memoized version</a>.</p>

</p><div class="authorPhoto">
    <img src="/i/m/_efer__big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8593420" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="privatelabel"/>
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
