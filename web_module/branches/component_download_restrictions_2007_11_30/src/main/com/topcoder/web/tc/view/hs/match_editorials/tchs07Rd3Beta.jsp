<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10713&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514495" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 3 Beta</span><br>Monday, March 26, 2007
<br><br>

<h2>Match summary</h2> 

This round brought the online phase of the tournament to a conclusion, with another 25 skilled coders claiming their spots in what is sure to be an exciting on-site event.  Good luck to all advancers in the final rounds!
<br /><br />

The match started off with a very easy 250 problem that everyone was able to solve.  The medium was a little trickier, but didn't stop a respectable number of coders from earning high scores on it.  The third problem was supposed to reward the competitors able to grasp the idea behind it but, unfortunately, in the end dealing with precision issues was the most important part.  Even though a lot of coders submitted or compiled solutions that were on the right track, few passed it.  <tc-webtag:handle coderId="22652504" context="hs_algorithm"/> spotted this issue and, along with his challenges on the medium, earned no less than 450 points during the challenge phase, securing him the win.  In second and third came <tc-webtag:handle coderId="15600321" context="hs_algorithm"/> and <tc-webtag:handle coderId="15604398" context="hs_algorithm"/>.  In the end an accumulated high score on the first two problems was required in order to advance on-site.
<br /><br />


<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7612&amp;rd=10713" name="7612">CandyBoxes</a></b> 

</font> 

<A href="Javascript:openProblemRating(7612)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      81 / 81 (100.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      81 / 81 (100.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>fpavetic</b> for 249.19 points (1 mins 37 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      231.70 (for 81 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


This problem is a generalization of Euclid's algorithm (the subtracting version) for calculating the greatest common divisor of two numbers.  Specifically, after the algorithm terminates, the result is the greatest common divisor of the numbers in candies.  Because of the low constraints, a successful submission didn't need anything more than just implementing the algorithm described in the problem statement.  However, an approach based on this observation can handle numbers much higher than those that were given.  For a clean implementation see <tc-webtag:handle coderId="22212467" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=22212467&rd=10713&pm=7612">solution</a>.
<br /><br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7528&amp;rd=10713" name="7528">StringOfNumbers</a></b> 

</font> 

<A href="Javascript:openProblemRating(7528)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      64 / 81 (79.01%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      42 / 64 (65.62%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>fpavetic</b> for 494.88 points (2 mins 53 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      381.34 (for 42 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


The first and most important step in solving this problem is figuring out if a fixed value of <i>N</i> is a solution to the problem and a candidate for the return value.  A simple solution is to concatenate all the numbers from 1 to <i>N</i>, obtaining the original string, and then check if the given string is a substring of this resulting string.  This can be done with a greedy method.  For each character of the given string, find its first occurrence in the original string, starting from the character next to the one found in the last search.  Let's say that we are interested in finding out whether the string <i>s1</i> = "3702" is a substring of <i>s2</i> = "123456789101112."  First, we search for the first occurrence of character '3' in <i>s2</i>, and get index 2.  Next, we search for the first appearance of '7', starting from index 3, and get the new index 6.  Similarly, we find that the last two characters appear in <i>s2</i> in positions 10 and 14, so we conclude that <i>s1</i> is indeed a substring of <i>s2</i>.  However, if <i>s2</i> was two characters shorter, we would have reached the end of <i>s2</i> before succeeding in finding the character '2', so <i>s1</i> would not have been a substring of <i>s2</i>.
<br />
<br />

Now we try all possible values of <i>N</i> starting from 1, and return the first value of <i>N</i> that works.  We have to be careful though, because applying the above method exactly as described may result in exceeding the time limit.  The key observation is that, for a given <i>N</i> higher than 1, we don't need to restart the whole process all over again, and can use the information obtained from the previous step, when we tried <i>N-1</i>.  Specifically, we concluded that <i>N-1</i> is not a solution to the problem since the search for some character <i>c</i> of <b>leftDigits</b> was unsuccessful, and the end of the original string was reached.  If we concatenate the string representation of <i>N</i>, <i>s</i>, to the original string, the search for all characters before and including <i>c</i> would go on in the same fashion until we reach <i>s</i>.  Now we can continue with the search of <i>c</i> in <i>s</i>. If this search is successful and <i>c</i> is the last character of <b>leftDigits</b>, we can return <i>N</i>.  Otherwise, we continue in a similar manner with the character following <i>c</i> in <b>leftDigits</b>.  For a clean implementation of this approach, see <tc-webtag:handle coderId="12005484" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=12005484&rd=10713&pm=7528">solution</a>.
<br />
<br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7648&amp;rd=10713" name="7648">SafeDrive</a></b> 

</font> 

<A href="Javascript:openProblemRating(7648)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      31 / 81 (38.27%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      7 / 31 (22.58%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>otinn</b> for 643.29 points (24 mins 11 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      442.88 (for 7 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


The constraints in this problem were higher than they needed to be, and made this problem a lot harder than it was supposed to be.  In fact, not even the original reference solution has handled correctly the unforeseen precision issues that had appeared.  While this wasn't reflected in the system tests, <tc-webtag:handle coderId="22652504" context="hs_algorithm"/> came up with a killer test during the challenge phase.  Let's analyze the algorithmic part of the problem first and then see how to safely deal with floating point arithmetic in this case.
<br />
<br />

The key observation to this problem is actually contradicting the annotation given in example 2.  It is of no use to travel with a variable speed: if you are going to reach a certain speed <i>s</i> at some point in time anyway, why not drive at this speed at all times?  The time needed to get to the destination may improve, but would certainly not be worse.
<br /><br />

Now, given a speed <i>s</i>, you need to see if driving at this speed allows you to arrive on time at the meeting &mdash; that is, check whether the time needed to reach position <b>D</b> is less than or equal to <b>T</b>.  This could be done with a simulation: for each traffic light on the way, calculate the time of your arrival at that light, using the time of departure from the previous light.  If this time is during an interval in which the light is red, wait until it switches to green, otherwise you don't need to stop.
<br />
<br />

Situations like this, when it is possible to find a method (a predicate) to check if, by keeping a parameter constant (fixing it), you have a solution to the problem, should activate a binary search trigger.  Of course, to be possible to use binary search, another property must hold:  the method should give the same answer if you increase (or decrease in case a maximum is asked) the value of the parameter.  For more details and a nice introduction to binary search, see this <a href="/tc?module=Static&d1=tutorials&d2=binarySearch">tutorial</a>.  Applied to this problem, it is obvious that this property holds: if we reached the destination in time driving at a certain speed, we would arrive on time for any higher speed.  This solves the last piece of the puzzle, and you can use binary search to find the minimum speed.
<br /><br />

While all the above looks nice in theory, strange errors could occur in practice, especially when dealing with floats or doubles.  Many competitors, even though they got the right idea, were burnt by these kinds of errors.  What happened in the case of this problem?  Let's say we are given two doubles <i>a</i> = 750000000.0 and <i>b</i> = 0.00000005 (that is 7.5e8 and 5e-8 respectively).  Due to the way the doubles are stored (see this nice <a href="/tc?module=Static&d1=tutorials&d2=integersReals">tutorial</a> for all the details), <i>a + b</i> would be stored as 750000000.0 rather than the actual result 750000000.00000005.  Briefly, about 17 digits are needed to store the correct result while doubles are able to provide only about 15 digits.  <tc-webtag:handle coderId="22652504" context="hs_algorithm"/>'s test case uncovered this aspect.  To work around this, my (new) solution stores the time needed to get to the destination, for a fixed value of the speed, as two numbers -- an integer for the integral part and a double for the fractional part -- rather than only one double.  Even though the computations are still not entirely accurate (for example, try dividing the integer 999999999 by 999999999.00000001 and see what happens), it is more than enough to return an answer accurate to the most significant 9 digits, as is needed to pass.  Note that comparing doubles using a tolerance is not needed in this case.

<pre>
struct light {
    int a, b, pos;
    light() {}
    light(int na, int nb, int npos): a(na), b(nb), pos(npos) {}
};
bool operator &lt; (const light& a, const light& b) {
    return a.pos &lt; b.pos;
}

struct SafeDrive {
    double minSpeed(vector &lt;string> lights, int T, int D) {
        int N = 0;
        light ls[64];

        for (int i = 0; i &lt; lights.size(); ++i) {
            int a, b, pos;
            sscanf(lights[i].c_str(), "%d %d %d", &a, &b, &pos);
            if (pos &lt; D) ls[N++] = light(a, b, pos);
        }
        ls[N++] = light(0, 0, 0);
        ls[N++] = light(0, 1, D);
        
        sort(ls, ls + N);

        double lo = 1.0 * D / T, hi = 1e10, res = -1.0;

        // it is better to loop through a predefined number of steps 
        //than checking whether lo and hi are equal within a given tolerance
        for (int steps = 0; steps &lt; 200; ++steps) {
            double mid = 0.5 * (lo + hi);

            long long intTime = 0;
            double fracTime = 0.0;
            for (int i = 1; i &lt; N; ++i) {
                long long n = ((long long)ls[i].pos - ls[i-1].pos) / mid;
                double z = (ls[i].pos - ls[i-1].pos - n * mid) / mid;

                // just to make sure
                if (z &lt; 0) {
                    intTime--;
                    z += 1.0;
                }
                if (z >= 1) {
                    intTime++;
                    z -= 1.0;
                }

                intTime += n, fracTime += z;
                if (fracTime >= 1) {
                    intTime++;
                    fracTime -= 1.0;
                }

                if (intTime % (ls[i].a + ls[i].b) &lt; ls[i].a) {
                    intTime += ls[i].a - (intTime % (ls[i].a + ls[i].b));
                    fracTime = 0.0;
                }
            }

            if (intTime &lt; T || (intTime == T && fracTime == 0.0)) {
                hi = mid;
                res = mid;
            } else {
                lo = mid;
            }
        }

        return res;
    }
};
</pre>

<br /><br />
 




<div class="authorPhoto">
    <img src="/i/m/_efer__big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8593420" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
