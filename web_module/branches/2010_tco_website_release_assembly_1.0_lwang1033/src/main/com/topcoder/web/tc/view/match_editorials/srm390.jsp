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
    <A href="/stat?c=round_overview&er=5&rd=11124">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519365" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 390</span><br />Saturday, February 2, 2008
<br /><br />



<h2>Match summary</h2> 

<p>Being the last SRM before TCO, the match attracted 1361 competitors. However, the problems in both division were not easy. 
The success rate for two DPs in both divisions was surprisingly low, making the challenge phase very eventful.</p>

<p>Only two competitors solved all three problems successfully. 
<tc-webtag:handle coderId="10574855" context="algorithm"/> won the match by a huge gap, despite resubmitting the hard, 
<tc-webtag:handle coderId="15206296" context="algorithm"/> got the second and
became the sixth target from China. Congratulations to <tc-webtag:handle coderId="15206296" context="algorithm"/>! 
They're followed by <tc-webtag:handle coderId="12005484" context="algorithm"/>, 
with 7 successful challenges on the medium.</p>

<p>Nobody got all 3 problems correct in Division 2. <tc-webtag:handle coderId="22678139" context="algorithm"/>
 won with 7 successful challenges on the hard, despite his own solution failed. 
A newcomer <tc-webtag:handle coderId="22708521" context="algorithm"/>
closely followed and got the second place. 
He had a small bug on his medium, which made him the only person who failed the medium among the top 100 competitors in Division 2. 

<tc-webtag:handle coderId="22692775" context="algorithm"/>, with 5 successful challenges, rounded the top-3.</p> 

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8300&amp;rd=11124" name="8300">FingerCounting</a></b> 

</font> 

<A href="Javascript:openProblemRating(8300)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519365" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      692 / 771 (89.75%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      586 / 692 (84.68%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ChronotriggerBG</b> for 246.69 points (3 mins 18 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      192.52 (for 586 correct submissions)  

    </td> 

  </tr> 

</table></blockquote> 

<p>Since <b>maxCount</b> is small, counting numbers one by one will be sufficient.
A method used by many coders uses a variable <b>dir</b> to represent the current counting direction.
Change the direction when finger 1 or 5 is just used. See <tc-webtag:handle coderId="20213936" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268809&rd=11124&pm=8300&cr=20213936">solution</a>.
It's not hard to see that the fingers he used is periodic. A period could be stored in an array <b>fingers</b>, so the <b>i</b>-th finger he used would be <b>fingers[i % 8]</b>, where <b>i % 8</b> means <b>i</b> modulo <b>8</b>.
This is another way to simulate the counting process. See <tc-webtag:handle coderId="22692775" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268778&rd=11124&pm=8300&cr=22692775">solution</a> for a clear implementation.
The most common mistake in these simulation-based solutions is to count the next number first, then update the counter. These solutions fail the test case "1,1".</p>

<p>It is also possible to calculate the answer directly by some maths. See <tc-webtag:handle coderId="22702038" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268788&rd=11124&pm=8300&cr=22702038">solution</a> for example. 
But it is relatively easy to make mistakes, as in many failed solutions.</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8589&amp;rd=11124" name="8589">ConcatenateNumber</a></b> 

</font> 

<A href="Javascript:openProblemRating(8589)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519365" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      324 / 771 (42.02%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      122 / 324 (37.65%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>rudiso</b> for 469.44 points (7 mins 20 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      329.08 (for 122 correct submissions) 

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

      548 / 588 (93.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      435 / 548 (79.38%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>lovro</b> for 249.01 points (1 mins 48 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      206.99 (for 435 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>This problem may look terrible, but actually it's not that hard.
let <b>d[i]</b> be the remainder of the concatenation of <b>i</b> copies of <b>number</b>, divided by <b>k</b>,
Then we're to find the smallest <b>i</b> such that <b>d[i]=0</b>. From number theory, for <b>i >= 2</b>, we have <b>b[i]=(b[i-1] * 10<sup>m</sup> + number) mod k</b>,
where <b>m</b> is the number of digits in <b>number</b>. This avoids BigInteger operations and keeps <b>b[i]</b> smaller than <b>k</b>.</p>

<p>But <b>k</b> could be up to 10<sup>5</sup>, so the recurrence above may still overflow if coders use 32-bit integers. This provides a good chance for the challenge phase.
In fact, we've added an example test case to warn people that multiplication might overflow, but the test case "10<sup>9</sup>,3" is so special that even if the multiplication overflowed, 
the result didn't change. A sensible coder might be aware of this if he checks the examples by hand, though.</p>

<p>The main algorithm loops the answer starting from 1, until a solution is found. But what is the maximal possible answer? How can we discover the situation when no solution could be found?
The situation is very much like expanding a fraction to an infinite decimal: stop when a cycle is found. Cycle detection could be done with a set of numbers that have been already encountered, but since the cycle length cannot exceed <b>k</b>, a quicker solution is to simply loop the answer from 1 to <b>k</b>.
See <tc-webtag:handle coderId="7390467" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268751&rd=11124&pm=8589&cr=7390467">solution</a> for a clear implementation.</p>

<p>A few coderes had trouble calculating the number of digits in <b>number</b>, some other coders did this <i>after</i> updating <b>number</b> to <b>number mod k</b>, but the number of digits in <b>number mod k</b> is usually different from that in <b>number</b>.</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8307&amp;rd=11124" name="8307">SetOfPatterns</a></b> 

</font> 

<A href="Javascript:openProblemRating(8307)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519365" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      127 / 771 (16.47%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 127 (0.79%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ljcarter15</b> for 712.03 points (19 mins 50 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      712.03 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The extremely low success rate is a surprise. The low constraint on the number of patterns strongly 
suggests that the problem could be solved by dynamic programming, as many Div 2 hard problems.
Let <b>d[i][S]</b> be the number of strings of length <b>i</b> that matches all pattersn in the set <b>S</b>
 but <i>none of other patterns</i>. Then for each character <b>c</b>, we can use <b>d[i-1][S]</b> to update <b>d[i][S &amp; v]</b>,
where &amp; stands for bitwise-add operator, and <b>v</b> is the set of patterns that character <b>c</b> matches at position <b>i</b>.
For more information on bitwise operations and this kind of dynamic programming, see this <a href="/tc?module=Static&d1=tutorials&d2=bitManipulation">tutorial</a>.

</p>

<p>Here is the implementation of that algorithm in C++. To make it more clear to most people, we did not include any tricks on bitwise operations.</p>

<pre>
    <font color="blue">int</font> d[50][1&lt;&lt;15];
    <font color="blue">int</font> n = patterns.size();
    <font color="blue">int</font> m = patterns[0].size();
    memset(d, 0, sizeof(d));

    <font color="green"> // for every location, try each character</font>
    <font color="blue">for</font>(<font color="blue">int</font> i = 0; i &lt; m; i++)
        <font color="blue">for</font>(<font color="blue">char</font> c = 'a'; c &lt;= 'z'; c++) {

          <font color="green">// v is the set of patterns that character c matches at position i</font>
          <font color="blue">int</font> v = 0;
          <font color="blue">for</font>(<font color="blue">int</font> j = 0; j &lt; n; j++)
              <font color="blue">if</font>(patterns[j][i] == c || patterns[j][i] == '?')
                  v |= (1 &lt;&lt; j);

          <font color="green">// dynamic programming</font>
          <font color="blue">if</font>(i == 0)
              d[i][v]++;
          <font color="blue">else for</font>(<font color="blue">int</font> j = 0; j &lt; (1 &lt;&lt; n); j++)
              d[i][j &amp; v] = (d[i][j &amp; v] + d[i - 1][j]) % 1000003;
        }

    <font color="green">// accumulate the answer</font>
    <font color="blue">int</font> ans = 0;
    <font color="blue">for</font>(<font color="blue">int</font> i = 0; i &lt; (1 &lt;&lt; n); i++) {
        <font color="blue">int</font> bitCount = 0;
        <font color="blue">for</font>(<font color="blue">int</font> j = 0; j &lt; n; j++)
            if(i &amp; (1 &lt;&lt; j)) bitCount++;
        <font color="blue">if</font>(bitCount == k)
            ans = (ans + d[m - 1][i]) % 1000003;
    }
    <font color="blue">return</font> ans;
</pre>

<p>The main algorithm has time complexity <b>O(m * c * (n + 2<sup>n</sup>))</b>, which is roughly <b>O(m * c * 2<sup>n</sup>)</b>, 
Many people came up with an algorithm with a slightly higher time complexity, i.e. <b>O(m * c * n * 2<sup>n</sup>)</b>, thus failed due to time outs.
The trick here is that we only need to compute <b>v</b> once for each character/position combination. This could be done in a separate preprocessing routine,
or, like in the sample code above, done together with the dynamic programming. Many coders used another trick to speed up the solution: skip the use of <b>d[i][S]=0</b>,
since it cannot update anything. To use the trick, you need a different way to implement the main loop, i.e. loop for <b>S</b> first, then <b>c</b>. Unfortunately, 
this speed up does not gauarantee to get rid of time outs on some special data in system tests, but on most cases, optimized solution runs a lot faster.</p>

<p>Of 126 failed solutions, 100 has been successfully challenged. Many incorrect solutoins failed a surprisingly test case "?","?",1. The answer should be 0, but many solutions got 52.
Many solutions that yielded 52 for this test case loops for all the set of patterns (with <b>k</b> patterns) that are matched, then accumulate the answer for all sets. Unfortunately, 
calculating the number of strings that matches every pattern in a set <i>but none in another</i> is not particularly easy.</p>

<p>Exercises:</p>
<ol>
<li>Find a test case for which the <b>d[i][S]=0</b> speed up does not help.</li>
<li>Can this problem solved by the principle of inclusion and exclusion?</li>
</ol>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8516&amp;rd=11124" name="8516">PaintingBoards</a></b> 

</font> 

<A href="Javascript:openProblemRating(8516)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519365" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      340 / 588 (57.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      42 / 340 (12.35%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Vasyl(alphacom)</b> for 438.71 points (10 mins 56 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      248.68 (for 42 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>This is a tough medium, and the low success rate reflected that.
Of 298 failed solutions, 212 has been successfully challenged. 
Most of failed solutions, either by challenge or system test, are due to unfortunate time outs.
</p>

<p>Yes, it is a dynamic programming problem, as many coder can guess with a first glance of the problem, but it isn't that easy.
Some coders came up with the following algorithm: let <b>d[i][S]</b> be the minimal time for the set <b>S</b> of painters to paint the
first <b>i</b> boards. To calculate <b>d[i][S]</b>, we need to loop for the last painter that worked, and the starting position. The resulting algorithm
has time complexity <b>O(m<sup>2</sup> * n * 2<sup>n</sup>)</b>, where <b>n</b> and <b>m</b> are the number of painters and the number of boards, respectively.
This complexity is a little bit high and can hardly pass system tests. There are lucky exceptions, though, solutions that runs for >1.7 seconds for many test cases.</p>

<p>Some other coders realized that binary search helps here. If we binary searches the answer, what is left is just check a solution exists. To check this,
some coders uses a boolean array <b>d[i][S]</b> to represent whether it is possible to paint the first <b>i</b> boards with a set <b>S</b> of painters.
This is correct, but it is almost the same as the slow algorithm mentioned above, except that we have a binary search on top of it!
A clever state representation is <b>d[S]</b>, how <i>far</i> the set <b>S</b> of painters can paint. Since we've binary searched the answer, each painter should paint
as far as he can, which can be done greedily. That is, to calculate <b>d[S]</b>, loop for the last painter <b>w</b> that worked, and let him greedily paint as far as he could, as long as the time he spends
does not exceed the currenet answer. </p>

<p>This is very close to the intended solution, but here is a question about the implementation details. How to paint as far as a painter can? This could be done adding a loop, but this increases the time complexity!
In the worst case, the greedy painting process can take <b>O(m)</b> time, so the whole time complexity would be <b>O(T * 2<sup>n</sup> * n * m)</b>, where <b>T</b> is the number of iterations of our binary search, which will at most 15.
Why 15? Well, the answer should be the work time of a painter, which is always the length of some consecutive boards, divided by some speed. There are only <b>1+2+...+50=1275</b> possible lengths, thus <b>1275*15=19125</b> possible times, and <b>log<sub>2</sub>19125 &lt; 15</b>.
This complexity seems too pessimistic, since in most cases, greedy painting processes are very short. I guess this is why many people stopped here. If you discovered that some greedy painting processes are done more than once, you'll
happily adds memoization to your code, as in <tc-webtag:handle coderId="15206296" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268745&rd=11124&pm=8516&cr=15206296">solution</a>, and reduce the time complexity to <b>O(T * (2<sup>n</sup> * n + m * m * n))</b>, which is almost same as <b>O(T * 2<sup>n</sup> * n)</b>.</p>

<p>Combining all these together, you'll get a solution that runs for at most 60ms on all test cases. Here is the implementation of that algorithm in C++. </p>

<pre>
    <font color="green">// sum[i]: sum of lengths of first i boards</font>
    <font color="blue">int</font> n = painterSpeed.size();
    <font color="blue">int</font> m = boardLength.size();
    <font color="blue">int</font> sum[51] = {0};
    <font color="blue">for</font>(<font color="blue">int</font> i = 0; i &lt; m; i++)
        sum[i+1] = sum[i] + boardLength[i];

    <font color="green">// every possible answer</font>
    <font color="blue">int</font> total = (m+1)*m/2*n, cur = 0;
    <font color="blue">double</font> sortedTime[19125];
    <font color="blue">for</font>(<font color="blue">int</font> L = 0; L &lt; m; L++)
        <font color="blue">for</font>(<font color="blue">int</font> R = L; R &lt; m; R++)
            <font color="blue">for</font>(<font color="blue">int</font> W = 0; W &lt; n; W++)
                sortedTime[cur++] = (<font color="blue">double</font>)(sum[R+1]-sum[L])/painterSpeed[W];
    sort(sortedTime, sortedTime + total);

    <font color="blue">int</font> d[1&lt;&lt;15], extend[15][51];
    <font color="blue">int</font> left = 0, right = total - 1;

    <font color="green">// binary search</font>
    <font color="blue">while</font>(left &lt; right) {
        <font color="blue">int</font> med = (right - left) / 2 + left;
        <font color="blue">double</font> T = sortedTime[med];

        <font color="green">// how far the i-th painter can paint from the j-th board</font>
        <font color="blue">for</font>(<font color="blue">int</font> i = 0; i &lt; n; i++)
            <font color="blue">for</font>(<font color="blue">int</font> j = 0; j &lt;= m; j++) {
                <font color="blue">int</font> E = j, L = 0;
                <font color="blue">while</font>(E &lt; m &amp;&amp; L + boardLength[E] &lt; painterSpeed[i] * T + EPS)
                  L += boardLength[E++];
                extend[i][j] = E; 
            }

        <font color="green">// dynamic programming</font>
        <font color="blue">for</font>(<font color="blue">int</font> mask = 0; mask &lt; (1 &lt;&lt; n); mask++) {
            d[mask] = 0;
            <font color="blue">for</font>(<font color="blue">int</font> w = 0; w &lt; n; w++)
                <font color="blue">if</font>((mask &amp; (1 &lt;&lt; w)) &gt; 0)
                    d[mask] = max(d[mask], extend[w][d[mask ^ (1 &lt;&lt; w)]]);
        }

        <font color="green">// check if the answer is possible</font>
        <font color="blue">if</font>(d[(1 &lt;&lt; n)-1] == m) right = med; else left = med + 1;
    }
    <font color="blue">return</font> sortedTime[left];
</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8510&amp;rd=11124" name="8510">BuildCircuit</a></b> 

</font> 

<A href="Javascript:openProblemRating(8510)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519365" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      13 / 588 (2.21%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      5 / 13 (38.46%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>zcgzcgzcg</b> for 459.29 points (43 mins 42 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      427.77 (for 5 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>Though many people realized that the solution is some kind of brute force, only 13 coders managed to submit something. Among these solutions, only 5 was correct.
The intended solution was probably sillier than many people have expected: search twice, forward and backward. Nothing special then - no prunings needed, though possible.</p>

<p>First, precalculate everything that can be created with 10 resistors. This could be done with dynamic programming: compute the set of possible results with <b>N</b> resistors, <b>all[N]</b> by
combining some result of <b>i</b> resistors and <b>N-i</b> resistors. Don't forget to eliminate duplicates. The number of possible values for N resistors are: 2,4,12,34,108,360,1232,4190,14516,51034.</p>

<p>Here comes the crucial part: backward search. The first way is to do another dynamic programming: let <b>unall[i]</b> be the set of <i>wanted</i> resistance if <b>i</b> resistors have been taken out of the circuit.
That is, if you found a circuit with resistance value equal to some element in <b>unall[i]</b>, you can obtain the target circuit <b>R=a/b</b> with another <b>i</b> resistors. Initialize <b>unall[0]</b> as a singleton, <b>{a/b}</b>.
When calculating <b>unall[i]</b>, try every <b>j+k=i</b>, and take out another <b>k</b> resistors (i.e. an element from <b>all[k]</b>) from some element from <b>unall[j]</b>. How many <b>unall[i]</b> should we calculate? 
Suppose we've taken out <b>5</b> resistors, that is, we get a circuit from <b>unall[5]</b>. We cannot check whether it can be obtained with 16 resistors directly,
since we haven't prepared <b>all[11]</b>. So we have to continue our backward search. If this circuit must be created as a combination of one from <b>all[5]</b> and one from <b>all[6]</b>, the best thing we can do is to take one from <b>all[5]</b>
and update <b>unall[10]</b>. That is, we should compute up to <b>unall[10]</b>. For a clear implementation of this method, see <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268747&rd=11124&pm=8510&cr=10574855">solution</a>. This is the only successful solution that uses this method.</p>

<p>The second way to do backward search is probably easier to understand. Create a method ok(Fraction f, int r) that <i>recursively</i> checks if a resistance <b>f</b> could be obtained by <b>r</b> resistors. During the recursion, look up in <b>all</b> directly when <b>r<=10</b>.
4 out of 5 successful solutions used this method. For a clear implementation of this method, see <tc-webtag:handle coderId="22221928" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268759&rd=11124&pm=8510&cr=22221928">solution</a>.

<p>Exercises:</p>
<ol>
<li>What is the maximum number of iterations in the backward search, for both methods?</li>
<li>What is the maximum value of nominator and denominator we might encounter, for both mehods? Is 32-bit integer sufficient to store resistor values?</li>
<li>By checking the maximal value of nominator and denominator in <b>all</b> it seems that the maximum value for both nominator and denominator in <b>all[i]</b> is exactly 2<sup>i</sup>. Is that true? If the answer is "yes", how to utilize this conclusion to speed up the solution?</li>
</ol>



<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11907556" context="algorithm"/><br />
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
