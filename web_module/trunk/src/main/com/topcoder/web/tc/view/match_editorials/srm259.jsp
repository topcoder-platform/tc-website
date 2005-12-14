<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505755" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 259</span><br>Monday, August 22, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
SRM 259 kicked off A few hours before the start of the Google Code Jam,
providing one last chance for coders to practice their trade before switching
arenas and tackling the quals.  Division 1 coders were faced with a rather
difficult problem set, particularly the medium problem which had many
submissions, but few successful ones.  Topping out the list was ploh, who would
have got 5th if it weren't for 150 points during the challenge phase.
ivan_metelsky had the highest score from coding, and took second, while rem
rounded out the top 3.  In division 2, xuezaiyue took first by a wide margin,
followed by first timer e-yura and Chenhong.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4716&amp;rd=8012" name="4716">CompetitionStatistics</a></b>
</font>
<A href="Javascript:openProblemRating(4716)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505755" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      240 / 254 (94.49%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      194 / 240 (80.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>topiori</b> for 249.93 points (0 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      222.41 (for 194 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The simplest way to do this is to loop over the elements in the input.  As you
go, keep a counter.  If an element if positive, increment the counter, otherwise
reset it to 0.  The return value is simply the maximum value this counter
achieves.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4475&amp;rd=8012" name="4475">PrimePolynom</a></b>
</font>
<A href="Javascript:openProblemRating(4475)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505755" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      215 / 254 (84.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      55 / 215 (25.58%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>vdave</b> for 582.38 points (4 mins 58 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      440.82 (for 55 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
The examples in this problem showed that the greatest return was less than 100,
so a simple brute force approach to finding the first non-prime should work.
Initialize M to 0, and then start iterating the values of the quadratic.  For
each value of the quadratic, check if it is prime.  Almost all coders had the
right basic approach, but many (almost 75%) failed because of bugs in their
prime checker.  The most common errors seem to be related to the number 1 (which
is not prime) and 2 (which is prime).  Here is a very simple way to find if a
number if prime:
<pre>
    boolean isPrime(int N){
        if(N&lt;2)return false;
        for(int i = 2; i*i&lt;=N; i++){
            if(N%i == 0)return false;
        }
        return true;
    }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4619&amp;rd=8012" name="4619">NumericalSequence</a></b>
</font>
<A href="Javascript:openProblemRating(4619)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505755" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      98 / 254 (38.58%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      73 / 98 (74.49%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>King_Bette</b> for 846.77 points (7 mins 12 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      591.92 (for 73 correct submissions)
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
      157 / 185 (84.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      130 / 157 (82.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lovro</b> for 247.98 points (2 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      204.91 (for 130 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
At first, you might think that this problem would require some sort of
complicated dynamic programming, or other algorithm.  However, a little more
thought leads to a simple greedy algorithm.  In order for the sequence to be a palindrome, 
the two numbers on the ends must match.  If they do, we can remove them,
and continue working on the rest of the sequence.  If not, then the smaller of
the two must get bigger (there is no way for the bigger one to get smaller).
Hence, we combine the smaller of the two end numbers with the one adjacent to it
and continue with the resulting sequence.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4718&amp;rd=8012" name="4718">SuperString</a></b>

</font>
<A href="Javascript:openProblemRating(4718)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505755" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      159 / 185 (85.95%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      43 / 159 (27.04%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>rem</b> for 572.18 points (6 mins 19 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      430.56 (for 43 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Like the division 2 medium, only about a quarter of the submissions for this
problem passed.  In this case, it was the time limit that caused many
failures.<br/><br/>
First off, note that there are up to 2500 characters in the combined sequence.
This is quite a few, but not so many that an O(N^2) algorithm won't work.  That
means that we can afford to consider every possible substring, as long as we are
quick about it.  The most common way to do this was simply with two nested loops
like this:
<pre>
for(i = 0 to lengthof(s)-1){
    int[] cnt = new int[26];
    int goodness = 0;
    for(int j = i to lengthof(s)-1){
        int v = s[j]-'A';
        if(cnt[v] == 0)goodness++;
        else if(cnt[v] == 1)goodness--;
        cnt[v]++;
        <font color="blue">//here we have the goodness of the substring from i to j, inclusive</font>
    }
}
</pre>
From here, we just need to find the substring with the highest goodness, and we
need to handle ties appropriately.  Of substrings that start at the same place,
we want shorter ones, so we only need to consider substrings for which the
goodness has just increased.  As long as you do that, runtime should be no
problem, and you can use the built in string comparison functions to do the
rest.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4468&amp;rd=8012" name="4468">CardRemover</a></b>
</font>

<A href="Javascript:openProblemRating(4468)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505755" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      80 / 185 (43.24%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      25 / 80 (31.25%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ivan_metelsky</b> for 761.72 points (12 mins 35 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      612.38 (for 25 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

To start off on this problem, let's think backwards.  Say we are going to remove
every card but the first and last ones.  In that case there must be some card,
call it X that is going to be the last on removed.  If this is the case, then
all of the cards to the left of X and all of the cards to the right of X (except
the end cards) must be removed first.  Since these two sets of cards can't
affect each other, we can solve the two halves independently.  Of course, if we
can't remove all of the cards to the left, and all of the cards to the right,
then we can't end up removing X at the end.<br/><br/>
Now, there is another case.  Let's say that we can't remove every card but the
end ones.  In this case there must be some card, X, which doesn't get removed.
As before, we can try to remove the cards to the left and right of X
independently.  So, this leads us to a fairly simple algorithm to recursively
solve the whole problem:
<pre>
    <font color="blue">//returns the number of things that can
    //be removed between a and b, exclusive.</font>
    int solve(int a, int b){
        int ret = 0;
        for(int x = a+1; x&lt;b; x++){
            int s1 = solve(a,x);
            int s2 = solve(x,b);
            if(s1 + s2 + 2 == b-a &amp;&amp; match(a,b)){
                <font color="blue">//match returns true if cards a and b have sufficient 
                //conformity.  So here we can remove all cards to
                //right and left and also card x.</font>
                ret = max(ret,s1+s2+1);
            }else{
                ret = max(ret,s1+s2);
            }
        }
        return ret;
    }
</pre>

Of course, you need to add some memoization to cache the result for a particular
(a,b) pair, or else you will time out.
</p>





                <p>
                <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
                <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                </p>
             </td>
          </tr>
       </table>

       <p><br /></p>

    </td>
<!-- Center Column Ends -->

<!-- Gutter -->
    <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
    <td width="170">
       <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
       <xsl:call-template name="public_right_col"/>
    </td>
<!-- Right Column Ends -->

<!-- Gutter -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
