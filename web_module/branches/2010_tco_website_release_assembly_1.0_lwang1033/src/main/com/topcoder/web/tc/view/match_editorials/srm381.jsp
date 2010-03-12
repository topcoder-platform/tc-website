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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10804">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516078" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 381</span><br />Saturday, December 8, 2007
<br /><br />



<h2>Match summary</h2>

 

<p>
Saturday, the 8th of December, such a beautiful evening here in Ukraine. SRM 381 made it even better. 1500 coders (it seems that there was at least one more who wished to take part in) from all over the world were ready to do their best during amazing 95 minutes of coding and challenging.
</p>

<p>
Unfortunately, nobody was able to solve all three problems correctly in division 1, but division 2 guys showed that they are quite good and as a result some of them solved all problems in 75 minutes.
</p>

<p>
<tc-webtag:handle coderId="15982182" context="algorithm"/>, <tc-webtag:handle coderId="310333" context="algorithm"/> and <tc-webtag:handle coderId="14970299" context="algorithm"/> took first three places in division 1. <tc-webtag:handle coderId="22679165" context="algorithm"/>, <tc-webtag:handle coderId="22677219" context="algorithm"/> and <tc-webtag:handle coderId="22696493" context="algorithm"/> did the same in division 2.
</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8413&amp;rd=10804" name="8413">TheBestName</a></b>

</font>

<A href="Javascript:openProblemRating(8413)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516078" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      659 / 806 (81.76%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      452 / 659 (68.59%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>bugzpodder</b> for 244.83 points (4 mins 8 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      178.44 (for 452 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem was really not very difficult. All you have to do is just to simulate process of sorting described in problem statement. Generally, there were two basic approaches. First one is to count all Johns and sort other names separately. Another opportunity is to take into account special name John while sorting.
</p>

<p>
While comparing two names you have to evaluate their weights and in case of a tie compare them lexicographically.
</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8414&amp;rd=10804" name="8414">TheDiceGame</a></b>

</font>

<A href="Javascript:openProblemRating(8414)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516078" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      99 / 806 (12.28%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      71 / 99 (71.72%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Hamster1800</b> for 487.56 points (4 mins 33 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      325.60 (for 71 correct submissions)

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

      366 / 577 (63.43%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      324 / 366 (88.52%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Ted</b> for 249.64 points (1 mins 5 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      190.61 (for 324 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This one requires some basic knowledge from a field of probability theory.
</p>

<p>
Let’s denote <b>Res[n]</b> as expected number of throws needed for John to get at least <b>n</b> candies.
</p>

<p>
Obviously, <b>Res[n] = 0</b> for each <b>n</b> less than or equal to zero. Than, if you just think a little you’ll get very good looking and useful for this problem formula:
</p>

<p>
<b>Res[n] = 1 + Res[n-1]/6 + Res[n-2]/6 + Res[n-3]/6 + Res[n-4]/6 + Res[n-5]/6 + Res[n-6]/6</b>
</p>

<p>
Then you should take a look at constrains and decide to implement some simple DP. Sounds easy! And only after the match if you have free time you can spend it working on formal proof of the formula mentioned above.
Really, after each John’s throw there are equal possibilities of decreasing required number of candies by 1, 2, 3, 4, 5 and 6. Thus, if you know answers for smaller required numbers you can easily calculate result for <b>n</b>.
</p>

<p>
Another approach is based on the fact that in average John gets 3.5 points per throw. Thus, for big enough <b>n</b>’s we can assume that <b>Res[n]</b> is very close to <b>Res[n-7] + 2</b>. Thinking like this is not strict and formal but can help you to get high score on problems like this.
</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8419&amp;rd=10804" name="8419">TheNumbersLord</a></b>

</font>

<A href="Javascript:openProblemRating(8419)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516078" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      179 / 806 (22.21%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      29 / 179 (16.20%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Nikelandjelo</b> for 899.03 points (9 mins 44 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      617.47 (for 29 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem is very practical one. Even if you don’t know how to solve it after reading problem statement you can try to construct some big numbers by yourself. Just take a piece of paper, write down some numbers and guess what is the biggest possible one to achieve. And maybe it helps you, but maybe not. In second case you have no choice and should prepare some tricky test cases for future challenges. Who knows, perhaps it will get you more points than correct solution.
</p>

<p>
Obviously, we can treat numbers as strings and solve the same problem but with strings. By the way, result wouldn’t change at all. Next observation is that we need to use each string once and if we have some extra slots we should pick up the longest string several times. In case if we have many longest strings, lexicographically last will be chosen. Formal proof of this is rather simple and goes as home task for you.
</p>

<p>
Now suppose we have <b>n</b> strings (we will make some copies of the longest string if needed). Our task is to arrange them in the best way to form the biggest number. This sound like sorting! Such an amazing idea comes to your mind. Moreover, this idea is really very good.
</p>

<p>
Suppose, we have two strings <b>s</b> and <b>t</b>. If <b>t</b> comes immediately after <b>s</b> in some arrangement and <b>s+t < t+s</b> we can easily swap them and receive bigger number. So, we can sort all strings according to this rule. It reminds bubble sort. Proof of this is a home task too and you should make it until next SRM.
</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8415&amp;rd=10804" name="8415">TheHomework</a></b>

</font>

<A href="Javascript:openProblemRating(8415)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516078" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

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

      366 / 577 (63.43%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      111 / 366 (30.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>kalinov</b> for 454.52 points (9 mins 10 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      304.85 (for 111 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
In this problem John has to solve not so hard task. And it wouldn’t be good for him to fail it. So he needs just to concentrate on facts he has and figure out some nice solution.
</p>

<p>
First of all John can make his task more understandable. Let’s denote <b>n</b> as number of elements in <b>first</b>, <b>m</b> as number of elements in <b>second</b> and <b>k</b> as number of their common elements. I think that calculation of <b>k</b> wouldn’t be a hard task for such a good programmers as you are! Thus <b>n</b> and <b>k</b> will describe a state in John’s homework. So after each operation John will move from one state to another. His task is to reach state (<b>m</b>, <b>m</b>) with minimal possible number of moves.
</p>

<p>
While adding elements it is very logical for John first of all to add elements that are present in <b>second</b>, but missing in <b>first</b>. Similarly, while deleting/changing elements first of all John will remove/replace elements that are not present in <b>second</b>. Clearly, if after some operation we have at least <b>n+m</b> elements in the list, the number of common elements will be definitely equal to <b>m</b>, so it doesn't make sense to add new elements. This observation allows us to limit the search.
</p>

<p>
Thus, we can implement simple BFS with initial state (<b>m</b>, <b>m</b>) and find out minimal possible number of operations needed to reach each state. Constrains allow to do this in any way you like.
</p>
 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8418&amp;rd=10804" name="8418">TheSquares</a></b>

</font>

<A href="Javascript:openProblemRating(8418)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516078" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

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

      80 / 577 (13.86%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      3 / 80 (3.75%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Egor</b> for 539.86 points (32 mins 51 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      444.23 (for 3 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
There were distinct names of squares in the first edition of this problem. It was quite interesting. But when names may coincide, it becomes more interesting. And, as far as we like interesting problems very much, it was decided to let squares have equal names.
</p>

<p>
It is not hard to find maximal possible length of described sequence for each square as initial one. If there are no squares with such maximal length not less than <b>k</b>, then we have no answer at all. Otherwise we will look for lexicographically first square with maximal length not less than <b>k</b> and it’s name will be first element of the answer. But be careful, there may be several appropriate squares with that name and we don’t know which one is better to start from. So we need to hold set of squares with the best possible name and maximal length more than or equal to <b>k</b>. On the next step we will look for a set of squares such that each one lies inside at least one square from previous set and has maximal length of sequence not less than <b>k-1</b>. And so on and so on.
</p>

<p>
Some accuracy needed when dealing with equal squares. If we have some equal squares (with equal x, y, lengths and names), we will use them in a sequence in order they follow in array. For example we can’t use 4-th square inside of 7-th if they are equal.
</p>

<p>
Looks not so difficult! But wait, is it division 1 hard? It should be difficult! So what’s the problem? Complexity of algorithm described above is O(N^3) and it is too slow. Thus, we need some additional optimizations to pass system tests.
</p>

<p>
One way is to to speed up our solution by using some bitsets. Another is to use the following observation. If we have some two squares with equal names and first one lies inside second one, then it is illogical to use them together in a set of squares of some level. If first square generates some sequence, then second one can generate it, too, and, maybe, can generate even better sequence. This observation leads to O(N^2) algorithm, because each square can be present only in one set of squares.
</p>




<br /><br />


<div class="authorPhoto">
    <img src="/i/m/Vasyl(alphacom)_big3.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="13351270" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
