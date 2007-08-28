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
    <A href="/stat?c=round_overview&er=5&rd=10709">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516049" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 352</span><br>Saturday, June 2, 2007
<br><br>



<h2>Match summary</h2> 

<p> 
<tc-webtag:handle coderId="10574855" context="algorithm"/> continues his dominance, winning for the 3rd time out of the past three contests. 
After his third win he has also gained a new TopCoder rating record - 3744! Congratulations! 
<tc-webtag:handle coderId="251074" context="algorithm"/> took the second place. He submitted Medium and Hard problems in about 12 minutes. However, as it is often the case, quick code is not always good code, and he had to resubmit them both. <tc-webtag:handle coderId="21659750" context="algorithm"/> finished third with two problems and four successful challenges. 
<br />
<br />

This SRM seemed more difficult than the last few contests. 
Division I participants easily rushed through the easy, but only 24 of them were able to successfully pass the medium, though many tried. There were less then 20 coders who opened the Hard and they were faced with a ferocious problem, with only <tc-webtag:handle coderId="10574855" context="algorithm"/> solving it correctly. As a result of two above-average problems a lot of high-rated coders, and even a few targets, took very low places.
<br />
<br />

This SRM became 
a good start for two newcomers who were able to take two of the three top spots in Division II. Moreover 
both gained yellow color and moved to Division I. 
 <tc-webtag:handle coderId="22685946" context="algorithm"/>, a newcomer from the United States wins, <tc-webtag:handle coderId="20187495" context="algorithm"/> finished second and <tc-webtag:handle coderId="22672268" context="algorithm"/> from India is third. 
<br />
<br />
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7777&amp;rd=10709" name="7777">AttendanceShort</a></b> 
</font> 
<A href="Javascript:openProblemRating(7777)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516049" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      649 / 702 (92.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      546 / 649 (84.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petrs</b> for 248.31 points (2 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      199.10 (for 546 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem was pretty straightforward. To solve it we need to check if each student meets the attendance requirements or not. A student doesn't meet the requirements if and only if the number of 'P' characters in his attendance string is less than 75% of the total amount of 'P' and 'A' characters altogether. 
<br />
<br />

Note, in this problem you can safely use float point arithmetic because 75% has only power of two in divisor. Change it with, for example, 80%, and number of accepted solutions will decrease in half.
<br />
<br />

You can use <tc-webtag:handle coderId="22685946" context="algorithm"/>'s C++ solution as a reference:

<pre>
vector&lt;string&gt; shortList(vector&lt;string&gt; names, vector&lt;string&gt; attendance)
{
    vector&lt;string&gt; ret;
    for (int i = 0; i &lt; names.size(); i ++)
    {
        int present = 0, total = 0;
        for (int j = 0; j &lt; attendance[i].size(); j ++)
        {
            switch(attendance[i][j])
            {
            case 'P': present ++;
            case 'A': total ++;
            default: break;
            }
        }
        if (present * 4 &lt; total * 3) ret.push_back(names[i]);
    }
         
    return ret;
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2292&amp;rd=10709" name="2292">NumberofFiboCalls</a></b> 
</font> 
<A href="Javascript:openProblemRating(2292)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516049" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      608 / 702 (86.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      521 / 608 (85.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>programdigest</b> for 493.93 points (3 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      400.11 (for 521 correct submissions) 
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
      571 / 576 (99.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      560 / 571 (98.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JongMan</b> for 249.03 points (1 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231.78 (for 560 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Usually a Fibonacci numbers example is used in computer science lectures to illustrate the principles of dynamic programming. Exponentially slow algorithms become sufficiently fast by inserting a few lines of code. In this problem we should do the same with two element vectors instead of numbers.
<br />
<br />

Let F[i][0] and F[i][1] be the number of times '0' and '1', respectively, will be printed during a fibonacci(i) call. Then 
<ul>
<li>F[0][0] = 1; F[0][1] = 0;</li>
<li>F[1][0] = 0; F[1][1] = 1;</li>
<li>For i greater than 1: F[i][0] = F[i-1][0] + F[i-2][0]; F[i][1] = F[i-1][1] + F[i-2][1];</li>
</ul>

The answer is F[n][0] and F[n][1]. F values can be calculated either by forward dynamic programming (calculate F[i] using known F[i-1] and F[i-2]) or by lazy evaluations with memorization (do not calculate F[i] in recursive function if it was calculated before, just take it from the cache). Here is <tc-webtag:handle coderId="7446789" context="algorithm"/>'s code which uses the second (lazy evaluations) approach:

<pre>
  vector&lt;int&gt; cache[41]; 

  vector &lt;int&gt; fiboCallsMade(int n) 
  {
    if(cache[n].size()) return cache[n];
    vector&lt;int&gt;& ret = cache[n];
    ret.resize(2);
    if(n == 0) ret[0] = 1; 
    else if(n == 1) ret[1] = 1;
    else
    {
      vector&lt;int&gt; a = fiboCallsMade(n-1);
      vector&lt;int&gt; b = fiboCallsMade(n-2);
      ret[0] = a[0] + b[0];
      ret[1] = a[1] + b[1];
    }
    return ret;
  } 
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7822&amp;rd=10709" name="7822">RaceManagement</a></b> 
</font> 
<A href="Javascript:openProblemRating(7822)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516049" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      149 / 702 (21.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      44 / 149 (29.53%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>falsifian</b> for 758.58 points (17 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      498.00 (for 44 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First we will calculate the expected earnings of the company. 
The company can lose money if some horse wins outright, and it can earn money in all 
other cases. Let S be the sum of all <b>amounts</b>, P[i] be the probability that 
the i-th horse wins outright and W[i] be the earnings of the company in case that i-th 
horse wins outright. The fact that the i-th horse wins the race outright means that this 
horse wins and all others lose. So, the probability P[i] equals to the product 
of shares of all horses: <b>probability</b>[i] for the i-th horse and (100%-<b>probability</b>[j]) for all other horses. The value W[i] equals to (S - <b>amounts</b>[i]) - <b>amounts</b>[i]* payload_factor.
<br />
<br />
Therefore, the expected company's earnings can be calculated by the following formula:

<pre>expected_earnings = (100% - sum(all P[i]))*S - sum(all products P[i]*W[i])</pre>

To solve the problem we should solve the inequality "expected_earnings &ge; minimumMoney" with the only unknown variable - payload_factor.
<br /><br />

Note that in this problem the maximal number of horses is 5. This fact allows us to write the solution without using a double type and to avoid precision issues. Here is Java sample code without using float point operations:

<pre>
    public double getPayoutFactor(int[] probability, int[] amounts, int minimumMoney) {
        long sum = 0;
        for (int amount : amounts) {
            sum += amount;
        }
        long minm = minimumMoney; //long type variable for minimumMoney
        long p=1;
        for (int amount : amounts) {
            p*=100;
            minm *= 100;
        }
        long win = 0; 
        long payloadFactor = 0;
        for(int i=0; i&lt;amounts.length; i++) {
            long cur = 1;
            for(int j = 0; j&lt;amounts.length; j++)
                cur *= i == j? probability[j] : 100 - probability[j];
            payloadFactor += cur * amounts[i];
            win += (sum - amounts[i]) * cur;
            p-= cur;
        }

        win += sum * p;

        if (payloadFactor == 0) {
            if (win - minm &gt;=0) return -2;
            else return -1;
        }

        if (win - minm &lt; 0) return -1;

        return (double)(win - minm) / payloadFactor; 
    }
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7481&amp;rd=10709" name="7481">FibonacciKnapsack</a></b> 
</font> 
<A href="Javascript:openProblemRating(7481)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516049" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      188 / 576 (32.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 188 (12.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bmerry</b> for 373.23 points (12 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      242.88 (for 24 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The key to this problem is the fact that the weight of the item can take 
on only a few distinct values. And it is important that these values 
increase exponentially. This condition allows us to put 
forward the bold idea: "If we dismiss an item with a big weight the 
released space can hold a lot of smaller items.&quot; This idea is not a 
strict proof of a solution but it is good enough to understand the main process. 
<br />
<br />

Let's represent the <b>C</b> value into the Fibonaccimal system (it is also called 
as <a href="http://mathworld.wolfram.com/ZeckendorfRepresentation.html">Zeckendorf Representation</a>). This action  
gives us the array C<sub>0</sub>, C<sub>1</sub>, ..., C<sub>M</sub> where each C<sub>i</sub> 
represents how many Fibonacci numbers F<sub>i</sub> we have (initially 0 or 1). Let's consider 
the maximal C<sub>i</sub> that is greater than 0. We can take from 0 to C<sub>i</sub> items 
with the weight F<sub>i</sub>. If we take less than C<sub>i</sub> such items, we  
transform the remaining Fibonacci numbers into C<sub>i-1</sub> and C<sub>i-2</sub>.
<br /><br />

More formally, let's A[i][C<sub>i</sub>][C<sub>i-1</sub>] be a maximal cost that 
could be taken by items with weight greater than F<sub>i</sub> in such way, that 
all C<sub>j</sub> with j &gt; i are equal to zero, C<sub>i</sub> and C<sub>i-1</sub> have 
corresponding values and all C<sub>j</sub> with j &lt; i - 1 remain as in the initial 
Zeckendorf Representation. Choosing how many items with weight equal to F<sub>i</sub> are
taken, we can update next values of the A.
<br /><br />

Note, that if C<sub>i</sub> is not less than number of remained items, we can easily 
take all of them. This optimization gives no more than M*N*N (M - index of largest 
Fibonacci number in <b>C</b>'s Zeckendorf Representation, N - number of items) distinct 
indexes for the array A.
<br /><br />

This wandering around Zeckendorf Representation and many-dimensional dynamic 
programming is, of course, very interesting, but, in fact, is not necessary at all. 
You can take a look at <tc-webtag:handle coderId="15094447" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&cr=15094447&rd=10709&pm=7481">solution</a>. 
He has implemented simple memorization with the optimization that if we have 
enough space to take all remained items we should get them all. Our preceding matting shows 
that this solution will be fast enough as well.
<br /><br />
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6879&amp;rd=10709" name="6879">PaperRacing</a></b> 
</font> 
<A href="Javascript:openProblemRating(6879)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516049" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      18 / 576 (3.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 18 (5.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 661.83 points (22 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      661.83 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is not very hard theoretically but most of the coders who tried to solve 
it were confronted with difficulties in realizing the theoretical solution. It is quite obvious that the car is represented by four parameters - its coordinates and its speed. 
So, it is possible to build the graph where vertices are the car states and edges are the possible moves. 
After that we just need to run <a href="http://en.wikipedia.org/wiki/Breadth-first_search">Breadth-first search</a> algorithm to find the shortest path to the finish.
<br />
<br />

The most tricky part of this problem is to check if a move is possible or not. This part can 
be solved using <a href="http://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm">Bresenham's line algorithm</a>. Look at <tc-webtag:handle coderId="10574855" context="algorithm"/>'s perfect <a href="/stat?c=problem_solution&cr=10574855&rd=10709&pm=6879">realization</a> of it. 
<br /><br />
</p>





<div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
