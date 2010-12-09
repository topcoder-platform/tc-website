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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10786">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516067" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 370</span><br />Tuesday, October 9, 2007
<br /><br />



<h2>Match summary</h2> 

 

<p> 

During SRM 370, division one coders were presented with a rather easy problem set, while division two, after fast submissions on easy and 
medium couldn't get through the hard. The success rates for division one proved that the problems were well chosen, while 0% accuracy on 
division two hard was a bit surprising, as the problem was rather standard. In both divisions, all top coders after coding phase were 
pretty close to each other so the challenge phase was a great show. <tc-webtag:handle coderId="19849563" context="algorithm"/>, who has 
taken the lead of division one during the coding phase stayed on top thanks to 300 points gathered during the challenges.
<tc-webtag:handle coderId="7340263" context="algorithm"/> and <tc-webtag:handle coderId="14970299" context="algorithm"/> rounded up 
the top three in the division one.<br></br>
Division two was ruled out by <tc-webtag:handle coderId="22681392" context="algorithm"/> with other coders (including 
<tc-webtag:handle coderId="19760328" context="algorithm"/> and <tc-webtag:handle coderId="21586093" context="algorithm"/> 
rounding up the top three) being very close to each other. That's probably due to the fact that the easy and medium were 
relatively easy this time.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8186&amp;rd=10786" name="8186">Containers</a></b> 

</font> 

<A href="Javascript:openProblemRating(8186)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516067" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      613 / 645 (95.04%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      508 / 613 (82.87%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>narri</b> for 249.64 points (1 mins 5 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      205.85 (for 508 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Although the constraints for this problem are low enough to solve it by a simple simulation, we can do it even faster.
The problem statement says that we can always put all the packages inside the containers using 
given procedure. So it is obvious that the answer will be the sum of capacities of all containers 
minus the sum of sizes of all packages.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8016&amp;rd=10786" name="8016">DrawingMarbles</a></b> 

</font> 

<A href="Javascript:openProblemRating(8016)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516067" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      555 / 645 (86.05%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      480 / 555 (86.49%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>domeng</b> for 481.94 points (5 mins 32 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      369.02 (for 480 correct submissions) 

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

      558 / 563 (99.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      516 / 558 (92.47%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ainu7</b> for 248.64 points (2 mins 6 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      222.62 (for 516 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Let's try to find a probability that all <b>n</b> marbles drawn will be of color <i>i</i>. Let C(<i>m</i>, <i>n</i>) denote a 
binomial coefficient - number of ways to choose <b>n</b> differents element from the set of <i>m</i> elements. 
The probability we'll looking for is obviously C(<b>color</b>[<i>i</i>], <b>n</b>) / C(<i>total</i>, <b>n</b>), where <i>total</i> is the sum 
of all elements of <b>color</b>. Summing these possibilities for all colors will give us the answer. We can compute all binomial 
coefficients with the memoization using the following formula:
<pre>
&nbsp;&nbsp;C(<i>m</i>, <i>n</i>) = C(<i>m</i> - 1, <i>n</i> - 1) + C(<i>m</i> - 1, <i>n</i>)  .
</pre>

As these numbers can be really large, we should use doubles to compute the answer. Precision issues are not so important here, as for 
big <b>n</b> the answer is smaller than 1E-9. The problem can be also solved without using binomial coefficients. Note, that 
when we have drawn <i>j</i> marbles of color <i>i</i>, the probability that the next drawn marble will be of 
color <i>i</i> is equal to (<b>color</b>[<i>i</i>] - <i>j</i>) / (<i>total</i> - <i>j</i>). So the probability for a single color can be computed as:
<pre>
&nbsp;&nbsp;p(<i>i</i>) = product for all <i>j</i> from 0 to <i>n</i> - 1 ( (<b>color</b>[<i>i</i>] - <i>j</i>) / (<i>total</i> - <i>j</i>) )  .
</pre>
Of course when <b>color</b>[<i>i</i>] is smaller than <b>n</b>, p(<i>i</i>) is equal to 0.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7967&amp;rd=10786" name="7967">JohnnysPhone</a></b> 

</font> 

<A href="Javascript:openProblemRating(7967)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516067" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      10 / 645 (1.55%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      0 / 10 (0.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>null</b> for null points (NONE) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      No correct submissions 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The message is a list of words separated with spaces (not necessarily single). Thus, we can count spaces to know how many 
we will have to press "Space" button and then consider each word separately. So, we're given a word and a dictionary 
and we want to find the minimal number of button presses necessary to type such word. Of course the process of typing 
this word will looks as follows. At the beginning we have to type the digits corresponding to some prefix of a word and 
then possibly press "Next in dictionary" several times, until we'll see the exact prefix of our word. If we don't have 
the whole word written yet, we must press "New word" and type the digits corresponding to the prefix of the rest of the word 
and so on. Let's assume that we have function g(<i>i</i>, <i>j</i>) that returns the minimal number of button presses needed to type the 
subword starting at position <i>i</i> and ending at position <i>j</i> of the word we want to type if we typed it in the most obvious way (by just 
pressing digits corresponding to the following letters and then possibly pressing "Next in dictionary" several times) or 
infinity if it's not possible. Let f(<i>i</i>) denote the minimal number of button presses necessary to type the word assuming that 
we've typed <i>i</i> digits so far and we pressed "New word" already. Our last thoughts immediately lead to the following recurrence:
<pre>
&nbsp;&nbsp;f(<i>i</i>) = minimum for all <i>j</i> from <i>i</i> to <i>length</i> - 1 ( g(<i>i</i>, <i>j</i>) + 1 + f(<i>j</i> + 1) ) ,
</pre>
where length is the length of our word and f(<i>length</i>) = -1. Why do we want it to be -1? Because we won't have to press 
"New word" when we finish our word (and we've already added 1 in the recurrence). How can we compute g? Of course it will 
be <i>j</i> - <i>i</i> + 1 + the number of necessary pushes of "Next in dictionary". How can we found the latter? We can iterate 
over the whole dictionary and check how many words have prefixes fitting to the digit pattern of our subword until we 
reach what we want (or if we never reach it we return infinity, as it's impossible to type the given subword). Sample 
Java solution with memoization follows:
<pre>
&nbsp;&nbsp;public class JohnnysPhone {
    String cur, dict;
    int inf = 1000000000;
    int[] tab = { 2, 2, 2,
                  3, 3, 3,
                  4, 4, 4,
                  5, 5, 5,
                  6, 6, 6,
              7, 7, 7, 7,
              8, 8, 8,
              9, 9, 9, 9 };
    int[] dp;

    public int check (String word, String pattern) {
        StringTokenizer st = new StringTokenizer(dict);
        int res = 0;
        while (st.hasMoreTokens()) {
            String tmp = st.nextToken();
            if (tmp.length() &lt; word.length()) continue;
            if (tmp.substring(0,word.length()).equals(word))
                return res;
            String pat = "";
            for (int i = 0; i &lt; word.length(); i++)
                pat += tab[tmp.charAt(i) - 'a'];
            if (pat.equals(pattern)) res++;
        }

        return inf;
    }

    public int recur (int i) {
        if (i == cur.length()) return -1;
        if (dp[i] == -1) {
            dp[i] = inf;
            String tmp = "", pat = "";
            for (int j = i; j &lt; cur.length(); j++) {
                tmp += cur.charAt(j);
                pat += tab[cur.charAt(j) - 'a'];
                dp[i] = Math.min(dp[i], j - i + 1 +
                    check(tmp, pat) + 1 + recur(j + 1));
            }
        }
        return dp[i];
    }

    public int minimizePushes(String[] dictionary, String message) {
        dict = "";
        for (int i = 0; i &lt; dictionary.length; i++)
            dict += dictionary[i];
        StringTokenizer st = new StringTokenizer(message);
        int res = 0;
        for (int i = 0; i &lt; message.length(); i++)
            if (message.charAt(i) == ' ') res++;
        while (st.hasMoreTokens()) {
            cur = st.nextToken();
            dp = new int[cur.length()];
            for (int i = 0; i &lt; cur.length(); i++) dp[i] = -1;
            res += recur(0);
            if (res &gt;= inf) return -1;
        }
        return res;
    }
&nbsp;&nbsp;}
</pre>


</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8185&amp;rd=10786" name="8185">ConnectTheCities</a></b> 

</font> 

<A href="Javascript:openProblemRating(8185)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516067" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      366 / 563 (65.01%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      213 / 366 (58.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 485.63 points (4 mins 54 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      321.95 (for 213 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Imagine that we know how to compute the minimal cost of rearranging the transmitters so that there exists a connection 
between the cities, given a fixed transmission range. If we're able to do that we can do a search for the answer. We don't 
even need a binary search as the constraints are low enough for a linear one. But of course the function of cost with respect 
to the transmission range is non-increasing so binary is indeed correct. 
Ok, so let's assume that we have fixed transmission range and let it be <i>r</i>. How can we find the minimal 
cost of setting up a connection? If we look at the sequence of transmitters in the order of increasing distance 
from the city A, we will see that in the optimal solution we won't change this order itself. We're slowly approaching 
to a dynamic programming solution. Let A[<i>i</i>][<i>j</i>] be the minimal cost of rearranging the transmitters 0 through <i>i</i> in 
such way that there is a connection between the city A and the <i>i</i>-th transmitter and the <i>i</i>-th transmitters is exactly <i>j</i> units away 
from city A. How can we compute it? Simply:
<pre>
&nbsp;&nbsp;A[<i>i</i>][<i>j</i>] = minimum for <i>k</i> from 0 to <i>r</i> ( A[<i>i</i>-1][<i>j</i>-<i>k</i>] + abs(<i>j</i> - <b>position</b>(<i>i</i>)) ) .
</pre>
Of course we should initialize A[0][<i>j</i>] for all <i>j</i> prior to the rest of the algorithm. The answer for the case will be the minimum over 
all A[<i>n</i>-1][<i>j</i>] for <i>j</i> from <b>distance</b> - <i>r</i> to <b>distance</b> (as we want the <i>n</i>-1-th transmitter to be able to 
be able to connect to city B. You can see the fastest <tc-webtag:handle coderId="19849563" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=266613&rd=10786&pm=8185&cr=19849563">solution</a> for reference.<br></br><br></br>

Exercises:
<ul>
<li>prove that there always exists an optimal solution with the transmitters being in integer coordinates even if we're not limited by the problem statement</li>
<li>prove that the function of cost with respect to the transmission range is non-increasing</li>
</ul>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7863&amp;rd=10786" name="7863">NumberOfDivisors</a></b> 

</font> 

<A href="Javascript:openProblemRating(7863)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516067" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      950 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      276 / 563 (49.02%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      108 / 276 (39.13%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Daumilas</b> for 921.47 points (5 mins 1 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      597.73 (for 108 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Number of divisors of integer <i>n</i> = <i>p</i><sub>0</sub><sup>a<sub>0</sub></sup> * <i>p</i><sub>1</sub><sup>a<sub>1</sub></sup> * ... 
* <i>p</i><sub>m</sub><sup>a<sub>m</sub></sup> (where all <i>p</i><sub>i</sub> are prime) is equal to (a<sub>0</sub> + 1) * (a<sub>1</sub> + 1) 
* ... * (a<sub>m</sub> + 1). We want this number to be equal to <b>k</b>, so all (a<sub>i</sub> + 1) should be divisors of <b>k</b>. 
Also we want <i>n</i> to be as small as possible, so of course <i>p</i><sub>0</sub>, <i>p</i><sub>1</sub>, ..., <i>p</i><sub>m</sub> 
should be the first primes. Now, let's imagine that we have all exponents at <i>p</i><sub>0</sub> throgh <i>p</i><sub>i</sub> fixed 
already, (a<sub>0</sub> + 1) * ... * (a<sub>i</sub> + 1) is equal to <i>l</i>, and we want to choose an exponent at <i>p</i><sub>i + 1</sub>. 
We have to assign it in such way that (a<sub>i + 1</sub> + 1) is a divisor of (<b>k</b> / <i>l</i>). Ok, so our state looks like 
a pair (<i>i</i>, <i>l</i>) where <i>i</i> denotes which prime we want to assign an exponent to and <b>k</b> / <i>l</i> is the number 
of divisors we need. Again, we can solve it with dynamic programming (but we have to be careful not to overflow types):
<pre>
&nbsp;&nbsp;public class NumberOfDivisors {
    boolean prime[] = new boolean[1005];
    long A[][] = new long[101][50001];
    int P[] = new int[100];
    long lim = 1000000000000000000L;

    public long pow (long a, int b) {
        long res = 1;
        while (b-- &gt; 0) {
            if (res &gt; lim / a) return lim + 1;
            res *= a;
        }
        return res;
    }

    public long recur (int id, int div) {
        if (div == 1) return 1;
        if (A[id][div] == -1) {
            A[id][div] = pow(P[id], div - 1);
            for (int i = 2; i * i &lt;= div; i++) if ((div%i) == 0) {
                long tmp = pow(P[id], i - 1);
                if (tmp &gt; lim / recur(id + 1, div / i))
                    tmp = lim + 1;
                else
                    tmp *= recur(id + 1, div / i);
                A[id][div] = Math.min(A[id][div], tmp);

                tmp = pow(P[id], (div / i) - 1);
                if (tmp &gt; lim / recur(id + 1, i))
                    tmp = lim + 1;
                else
                    tmp *= recur(id + 1, i);
                A[id][div] = Math.min(A[id][div], tmp);
            }
        }
        return A[id][div];
    }

    public long smallestNumber (int k) {
        int upper = 1000;
        for (int i = 2; i &lt;= upper; i++) prime[i] = true;
        for (int i = 2; i * i &lt;= upper; i++) if (prime[i])
            for (int j = 2*i; j &lt;= upper; j += i) prime[j] = false;

        int tmp = 0;
        for (int i = 2; tmp &lt; 100; i++) if (prime[i]) P[tmp++] = i;

        for (int i = 0; i &lt; 100; i++)
            for (int j = 0; j &lt;= 50000; j++)
                A[i][j] = -1;

        return recur(0,k) &lt;= lim ? recur(0,k) : -1;
    }
&nbsp;&nbsp;}
</pre>
In the above approach we're trying every possible prime factorization of <i>n</i>, so it's trivially correct. Also, when we observe that 
there will always be a<sub>0</sub> &gt;= a<sub>1</sub> &gt;= ... &gt;= a<sub>m</sub>, we can solve the task with a very simple backtracking 
(that's why it was 950, not 1000).<br></br><br></br>

Exercises:
<ul>
<li>if you're not sure about the given formula for the number of divisors, try to find it out yourself</li>
<li>try to prove how many first prime numbers are needed given that <b>k</b> is not greater than 50000</li>
</ul>
</p>

<br /><br />



<div class="authorPhoto">
    <img src="/i/m/mateuszek_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11801002" context="algorithm"/><br />
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
