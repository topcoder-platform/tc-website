<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505738" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 247</span><br>Saturday, June 18, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Division 1 had a pretty hard problem set, as a great number of coders received 0 points.  At the end of the challenge phase, it looked like Yarin would come out on top, with an impressive time on the hard problem.  However, his medium submission failed system tests and he ended up in fourth place.  Veteran John Dethridge ended up taking the match, followed by jvpardon in second, and halyavin in third, competing in only his third SRM.<br/><br/>
Division 2 had a much easier set with high success rates.  As in division 1, a TopCoder veteran, kmd-10 took first place.  He was followed by first time competitor {dano} in second and galkovsk in third.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4610&amp;rd=7222"
name="4610">TriangleType</a></b>
</font>
<A href="Javascript:openProblemRating(4610)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505738" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      288 / 299 (96.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      224 / 288 (77.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jambon_vn</b> for 246.17 points (3 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      207.73 (for 224 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
First, you need to sort the three dimensions so that you can apply the
formulas in the notes, using x, y and z where x &#8804; y &#8804; z.  Once you
do this, you pretty much just need to make sure that you spell the return values
correctly.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4522&amp;rd=7222"
name="4522">FracCount</a></b>
</font>
<A href="Javascript:openProblemRating(4522)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505738" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      219 / 299 (73.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      174 / 219 (79.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Jsub</b> for 483.18 points (5 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      343.17 (for 174 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Since the numerator can not be more than 1000, the return is always
relatively small.  In fact, example 2 shows that the largest return is
only about 300,000.  As a result, it is easy to use brute force to
generate all fractions in the list up to numerator/denominator.  Simply use
two nested loops to generate all numerators (the outer loop) and
denominators (the inner loop) up to the fraction represented by the input.
 As you generate the fractions in the list, you need to check that the
greatest common denominator of the numerator and denominator is 1.
<pre>
    int cnt = 0;
    for(int i = 2; ; i++)for(int j = 1; j&lt;i; j++){
        if(gcd(i,j) == 1)cnt++;
        if(j==numerator &amp;&amp; i == denominator)return cnt;
    }
</pre>
The gcd function can be written quite concisely as:
<pre>
    int gcd(int a, int b){return b == 0 ? a : gcd(b , a%b);}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4521&amp;rd=7222" name="4521">Speller</a></b>
</font>
<A href="Javascript:openProblemRating(4521)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505738" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      111 / 299 (37.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      72 / 111 (64.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kmd-10</b> for 862.70 points (11 mins 43 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      576.07 (for 72 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This was rather easy as far as div 2 hard problems go.  You simply need to
generate all of the numbers from 1 to 100, as specified, and then see
which one is closest to the input.  To generate the numbers, you should
have three arrays of strings for the ones, tens, and teens.  Having the strings in
order in arrays makes it easy to generate the correct string from a number by
either looking them up directly or by combining the appropriate two strings.
To check the distance between two strings, just compare each character one at a
time.  </p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4495&amp;rd=7222" name="4495">Musical</a></b>
</font>
<A href="Javascript:openProblemRating(4495)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505738" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      198 / 237 (83.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      153 / 198 (77.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>John Dethridge</b> for 278.86 points (7 mins 56 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      178.56 (for 153 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem tripped up a lot of coders.  However, the last sentence of
the problem provides the key to solving it.  Since the child
farthest from a chair is the loser, we simply need to calculate the
distance from each child to the chair closest that child.  To do this for
a particular child, first compute the position of the child.  We can say
that child i starts 1-i/n, where the distance around the circle is 1 (this
makes then evenly spaced, and in the correct order).  After time seconds, the
child advances time/10 to position (1-i/n+time/10) mod 1.  Next, we compute the
distance to the nearest chair from this position.  A simple way to do this is
to compute the distance to every chair, as there are at most 25 of them.
Alternatively, you can compute that the nearest chair is at either 
floor(pos*(n-1))/(n-1) or ceil(pos*(n-1))/(n-1).  A lot of coders made the mistake of
sending the children in the wrong direction, with A following B instead of the
other way around.  </p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=875&amp;rd=7222" name="875">WordTrain</a></b>
</font>
<A href="Javascript:openProblemRating(875)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505738" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      75 / 237 (31.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      21 / 75 (28.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ardiankp</b> for 384.84 points (16 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      298.20 (for 21 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first step in this problem is to reverse some of the words so that the
front of the train car is the same as the front of the word.  This can be done
by always using the lexicographically earlier of the input word and its
reverse, which has the added benefit of being the correct direction for the tie
breaking rules on the output.  Once the words are all facing the proper
direction, you can sort them in a particular way that makes the problem quite
simple.  Sort primarily be the first letter of each word.  When ties occur, put
the words whose first and last characters are the same earlier.  When ties still
remain, break them lexicographically.  This order is the same as the order the
words will have in the output (meaning that the output words are a subsequence
of the words when sorted like this).<br/><br/>

Next, we can use dynamic programming to compute the output.  For
each word, find the longest sequence that ends at that word by looking
back at all of the previously computed sequences:

<pre>
    for(int i = 0; i&lt;cars.length; i++){
        best[i] = cars[i];
        for(int j = 0; j&lt;i; j++){
            if(cars[i].charAt(0) == cars[j].charAt(cars[j].length()-1)){
                best[i] = better(best[i],best[j]+"-"+cars[i]);
            }
        }
        ret = better(ret,best[i]);
    }
    return ret;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3487&amp;rd=7222" name="3487">Necklaces</a></b>
</font>
<A href="Javascript:openProblemRating(3487)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505738" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      26 / 237 (10.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      17 / 26 (65.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Yarin</b> for 772.90 points (16 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      577.90 (for 17 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
We can use brute force to find one of the segments, which we will denote
as the segment with the smallest sum.  Starting with this segment, we can
use dynamic programming to minimize the sum of the largest segment,
subject to the constraint that all segments have sum at least as high as
the initial segment we found via brute force.  The idea is to compute the
best way to use k gems to make j segments such that all
of the segments have a sum at least as large as the segment designated as
the lowest sum segment.  For a particular smallest segment, we can call
this value dp[k][j].<br/><br/>

If we know dp[k][j], then we can consider making a segment
out of the gems from k+1 to i.  If the sum of those gems is not as high as the
value of the segment designated as the lowest sum segment, then those 
gems do not form a valid segment.  Otherwise, we know that one possible
value for dp[i][j+1] is max(dp[k][j],sumOfGems(k+1..i)).  In other words,
we have added on segment, making j+1 total, the last one of whose sum is
sumOfGems(k+1..i).  Since we already know the best way to arrange the first
j segments, the value of the largest segment must either be the value of
the largest from those j, or else the value of the new segment.
<pre>
public int inequity(int n, int[] gems){
    int[] v = new int[gems.length+1];
    int ret = Integer.MAX_VALUE;
    for(int x = 0; x&lt;gems.length; x++){
        int min = 0;
        <font color="blue">//precompute the sum of gems[0..a] for each a</font>
        for(int a = 1; a&lt;v.length; a++)v[a] = v[a-1] + gems[a-1];
        for(int y = 0; y&lt;gems.length ;y++){
            min+=gems[y];
            <font color="blue">//gems[0..y] forms the segment with smallest sum, min</font>
            int[][] dp = new int[n+1][gems.length+1];
            dp[1][y+1] = min;
            <font color="blue">//dp[1][y+1] represents the best and only way
            //to arrange the first y gems in one segment</font>
        
            <font color="blue">//now loop over j -- add segments</font>
            for(int j = 2; j&lt;=n; j++){
                <font color="blue">//loop over i -- the number of gems used to make j segments</font>
                for(int i = y+1; i&lt;=gems.length; i++){
                    <font color="blue">//loop over k -- the number of gems used to make j-1 segments</font>
                    for(int k = y+1; k&lt;i; k++){
                        <font color="blue">//first make sure that the gems from k+1 to i form a valid
                        //segment and that it is possible to make j-1 segments with k gems</font>
                        if(v[i]-v[k] &lt; min || dp[j-1][k] == 0)continue;
                        int t = Math.max(dp[j-1][k],v[i]-v[k]);
                        <font color="blue">//t holds a possible value for dp[j][i]</font>
                        if(dp[j][i] == 0 || t &lt; dp[j][i]){
                            dp[j][i] = t;
                        }
                    }
                }
            }
            <font color="blue">//If it was possible to make n segments using this 
            //initial segment, minimize the return value</font>
            if(dp[n][gems.length]!=0){
                ret = Math.min(ret,dp[n][gems.length]-min);
            }
        }
        <font color="blue">//rotate the gems array 1 position to keep things simple</font>
        int t = gems[0];
        for(int a = 0; a+1&lt;gems.length; a++)gems[a] = gems[a+1];
        gems[gems.length-1] = t;
    }
    return ret;
}
</pre>
An analogous solution treats the initial segment chosen via brute force as the
largest segment, instead of the smallest.  Both algorithms are about the same
in terms of coding difficulty, and have the same runtime.  If M is the number
of gems, then there are O(M<sup>2</sup>) ways to pick the initial segment.  The
three inner loops clearly has a runtime of O(M<sup>2</sup>*N).  Since all of
the parameters are bounded by 50, this gives us an overall runtime around
50<sup>5</sup>.  This should make you somewhat leery, as it is around 300
million, and experienced TopCoders will tell you this is approaching the time
limit.  However, the innermost operations are pretty simple, and the worst case
runtime is under half a second for the Java solution above.
</p>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
