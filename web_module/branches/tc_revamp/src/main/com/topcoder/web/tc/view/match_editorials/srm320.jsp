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
<tc-webtag:forumLink forumID="505995" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 320</span><br>Saturday, September 30, 2006
<br><br>

<h2>Match summary</h2> 

<p>
With TCCC and GCJ matches filling up the whole month, this was
only the second -- and also the last SRM -- of September. Whether the tournament advancers wanted more practice, or the other members were just hungry
for matches, there were 1149 participants joining this SRM -- a new record of TopCoder!
(Or maybe the actual reason is a simple one, and TopCoder is just getting more popular than ever.)
<br />
<br />
In Division 1, fast submissions of the 500 and 1000 along with a feast of challenges gave first place to <tc-webtag:handle coderId="19849563" context="algorithm"/>,
with 1813.92 points. This score also earned him a spot on the <a href="http://www.topcoder.com/stat?&c=highest_totals&dn=1">Highest Match Total</a> list.
Rounding out the top three were <tc-webtag:handle coderId="10574855" context="algorithm"/>
and <tc-webtag:handle coderId="2058177" context="algorithm"/> in second and third.
<br />
<br />
In Division 2, three first-time participants -- <tc-webtag:handle coderId="22652232" context="algorithm"/>,
<tc-webtag:handle coderId="22652597" context="algorithm"/> and
<tc-webtag:handle coderId="22654563" context="algorithm"/> --
locked up the top three positions. 
Congratulations on a nice debut! One surprise is that none of the three come from Top 10 countries for algorithm competitors; instead, they hail from Indonesia, Japan and Australia.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6442&amp;rd=10000" name="6442">StringSegment</a></b> </font> <A href="Javascript:openProblemRating(6442)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505995" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      523 / 553 (94.58%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      496 / 523 (94.84%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ainu7</b> for 249.14 points (1 mins 40 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      216.87 (for 496 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
In this problem, you need to compute (the sum of segment length)/(number of segments).
It is simple and there are no hidden tricks to take down others' solutions. However, if
you figure out that the required value is actually equal to (length of s)/(number of segments in s),
you can probably save some time.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6398&amp;rd=10000" name="6398">ExtraordinarilyLarge</a></b>
</font>
<A href="Javascript:openProblemRating(6398)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505995" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      251 / 553 (45.39%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      32 / 251 (12.75%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>broutcha</b> for 444.50 points (10 mins 18 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      265.11 (for 32 correct submissions) 
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
      468 / 528 (88.64%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      161 / 468 (34.40%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>andrewzta</b> for 243.43 points (4 mins 41 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      163.49 (for 161 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
When I got the idea for this problem, I could already foresee the ocean of challenges.
What I couldn't foresee is that even my own solution was faulty. (Yes, a solution that
I got several weeks to prepare for is faulty.) Fortunately, <i>this is fixed</i> by
<tc-webtag:handle coderId="15545604" context="algorithm"/> before the challenge phase :)
<br />
<br />
The fastest solutions from <tc-webtag:handle coderId="11829284" context="algorithm"/>,
<tc-webtag:handle coderId="310333" context="algorithm"/>
and <tc-webtag:handle coderId="15868491" context="algorithm"/>
all adopted the same approach.
Given any extraordinarily large number:
<pre>
Find out the integer part x and the number of factorial n.
while(x<=15 and n>0)
{
   x = factorial of x;
   n--;
}
</pre>
Finally, with two numbers (x1,n1) and (x2,n2), the answer can simply determined by n1 and n2
if they are different, otherwise, determined by x1 and x2.
<br />
<br />
You can read <tc-webtag:handle coderId="310333" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=249820&rd=10000&pm=6398&cr=310333">solution</a>
for a very clear implementation. (By the way, you probably have no idea how exciting it is to watch the challenge phase!)
<br />
<br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6708&amp;rd=10000" name="6708">ContestSchedule</a></b>
</font>
<A href="Javascript:openProblemRating(6708)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505995" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      127 / 553 (22.97%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      86 / 127 (67.72%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ainu7</b> for 930.13 points (7 mins 54 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      654.80 (for 86 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

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
      433 / 528 (82.01%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      392 / 433 (90.53%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 493.56 points (3 mins 15 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      386.26 (for 392 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
This problem was not supposed to be a Div 1-medium originally, so I wasn't surprised
by the high submission rate and success rate in Division 1. This is a typical dynamic
programming problem. Let A[s] be the expected number of matches John will win in the
time interval [s,infinity). Then the value of A[s] can be computed backward. A[s] must not
be less than A[s+1], since John can choose to give up the time interval [s,s+1) and see
how many matches he will win in time interval [s+1,infinity). And for any match that starts
at s, ends with t, and with winning probability p, A[s] must be not be less than A[t]+p.
Thus, the following pseudo code will compute all the entries of A correctly.
<pre>
A[maximum_time] = 0
for T = maximum_time - 1 down to 0
   A[T] = A[T+1]
   for each match(s,t,p) with s=T
      A[T] = max(A[T], p+A[t]);
</pre>
Then A[0] is the answer. But there is a problem with the above method.
The size of A is too large, up to 1000000000. Note that there are at most 50 cases
and thus at most 100 distinct values of time. So a mapping of the times to [0,100]
will resolve the problem.
<br />
<br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6400&amp;rd=10000" name="6400">SeatingPlan</a></b> </font> <A href="Javascript:openProblemRating(6400)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505995" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      102 / 528 (19.32%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      74 / 102 (72.55%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 843.97 points (12 mins 42 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      523.76 (for 74 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
If the probability of an event to occur is p, then the expected number of trials
before that event will occur is just 1/p. So, in this problem, you need to find the probability that a random seating plan is good (i.e. no two cheaters sitting
on two adjacent seats), and return its reciprocal.
<br />
<br />
This probability is simply (the number of good seating plans)/(the number
of all possible seating plans). The number of all possible seating plans is
just (m*n choose k), which is at most (80 choose 20) and fitted within 64-bit
integer. The hard part would be to compute the number of good seating plans.
Without loss of generality, assume m<=n. Let A[u][v][b] be the number of
good seating plans of m by u seats with v cheaters and the u-th column is
assigned with cheaters according to the 1-bits in b.
<br />
<br />
A column with cheaters as bits in b is good if there are no two adjacent bits
as 1 in b. Two adjacent columns with cheaters as bits in b1 and b2 is good if
b1 is good and b2 is good and b1 bitwise-and b2 is 0. Thus,
<pre>
if b is good
   for all good b'
      A[u+1][v][b]+=A[u][v-(number of 1's in b)][b']
</pre>
After filling the whole table A bottom-up, the number of good seating plan
would be the sum of A[n][k][b] for all good b. The following is an implementation
of the above method:
<pre>
public class SeatingPlan
{
   private long gcd(long a, long b)
   {
      return a!=0?gcd(b%a, a):b;
   }
   
   public String expectedTrial(int m, int n, int k)
   {
      long[][] nCr=new long[128][128];
      boolean[] ok=new boolean[256];
      int[] count=new int[256];
      long[][][] dp=new long[128][256][32];
      long a, b, g;
      int i, j, p, q;
      
      if(m>n) { p=m; m=n; n=p; }
      
      for(i=1; i&lt;=m*n; i++)
         nCr[i][0]=nCr[i][i]=1;
      for(i=2; i&lt;=m*n; i++)
         for(j=1; j&lt;i; j++)
            nCr[i][j]=nCr[i-1][j-1]+nCr[i-1][j];
      
      count[0]=0;
      ok[0]=true;
      for(i=1; i&lt;1&lt;&lt;m; i++)
      {
         count[i]=count[i&i-1]+1;
         for(j=0; j&lt;m && (3&lt;&lt;j&i)!=3&lt;&lt;j; j++);
         ok[i]=j==m;
      }
      
      dp[0][0][0]=1;
      for(p=1; p&lt;=n; p++)
         for(i=0; i&lt;1&lt;&lt;m; i++)
            for(j=0; j&lt;1&lt;&lt;m; j++)
               if(ok[i] && ok[j] && (i&j)==0)
                  for(q=0; q+count[j]&lt;=k; q++)
                     dp[p][j][q+count[j]]+=dp[p-1][i][q];
      
      for(a=i=0; i&lt;1&lt;&lt;m; a+=dp[n][i++][k]);
      if(a==0)
         return "Impossible!";
      g=gcd(a, b=nCr[m*n][k]);
      a/=g;
      b/=g;
      return ""+b+"/"+a;
   }
}
</pre>
</p><div class="authorPhoto">
    <img src="/i/m/lyc1977_big3.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7488783" context="algorithm"/><br />
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
