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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/tc?module=HSRoundOverview&rd=10807&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="516574" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 48</span><br />Thursday, December 13, 2007
<br /><br />


<h2>Match summary</h2> 

 

<p>This match saw a tough hard problem with only one passing solution and even that was submitted with little time left. In addition to that, less than half of the submitted solutions were correct. In the end, <tc-webtag:handle coderId="22647753" context="hs_algorithm"/> won the match by being the only one to solve all 3 problems, <tc-webtag:handle coderId="22663117" context="hs_algorithm"/> came in second with fast easy & medium solutions + 225 points from challenges, <tc-webtag:handle coderId="22673643" context="hs_algorithm"/> followed in third.
<br /><br />Even though SRM 383 took place at the exact same time, 7 coders attempted to compete in both. This proved not to be a great idea as only <tc-webtag:handle coderId="22699336" context="hs_algorithm"/> was able to increase his rating in both.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8456&amp;rd=10807" name="8456">SendingCards</a></b> 

</font> 

<A href="Javascript:openProblemRating(8456)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 

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

      142 / 148 (95.95%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      127 / 142 (89.44%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>exod40</b> for 249.55 points (1 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      224.79 (for 127 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
In this problem all one had to do was count the number of times a friend sent a card and did not receive one in return or vice versa. Most people who failed to solve this problem did not check the second condition and therefore failed on a simple case: <pre>NN<br />YN</pre>The correct answer is 1. Java solution follows:
<pre>public class SendingCards {
    public int howMany(String[] friends) {
        int result = 0;
        for(int i = 0; i &lt; friends.length; ++i)
            for(int j = i + 1; j &lt; friends.length; ++j)
                if(friends[i].charAt(j) != friends[j].charAt(i))
                    ++result;
        return result;
    }
}</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8140&amp;rd=10807" name="8140">CommonFactors</a></b> 

</font> 

<A href="Javascript:openProblemRating(8140)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 

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

      97 / 148 (65.54%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      44 / 97 (45.36%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>maciejk</b> for 493.20 points (3 mins 20 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      338.50 (for 44 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
In this problem the most straightforward solution is to calculate all distinct factors for every number, count the number of occurrences over all numbers and then return the largest solution (not equal to 1) with most occurrences.
The easiest way to get the factors of <b>N</b> is to try for every <b>i</b> (1 &lt;= <b>i<sup>2</sup></b> &lt;= <b>N</b>) whether <b>i</b> divides <b>N</b>. If it does then it is a factor of <b>N</b> and so is <b>N / i</b>. Just take care not to count any factors of <b>N</b> more than once.
The following C++ solution does just that:
<pre>struct CommonFactors {
    int mostCommon(vector &lt;int&gt; n) {
        map &lt;int, int&gt; f;
        for(int i = 0; i &lt; n.size(); ++i)
            for(int j = 1; j * j &lt;= n[i]; ++j)
                if(n[i] % j == 0) {
                    if(j != 1)
                        ++f[j];
                    if(j * j != n[i])
                        ++f[n[i] / j];
                }
        int result = 0, count = 0;
        for(map &lt;int, int&gt;::iterator i = f.begin(); i != f.end(); ++i)
            if(i-&gt;second &gt;= count) {
                result = i-&gt;first;
                count = i-&gt;second;
            }
        return result;
    }
};</pre>For an alternative solution see <tc-webtag:handle coderId="22285847" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=22285847&rd=10807&pm=8140">code</a>.
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8265&amp;rd=10807" name="8265">ThreeWatchtowers</a></b> 

</font> 

<A href="Javascript:openProblemRating(8265)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516574" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 

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

      15 / 148 (10.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 15 (6.67%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>zmy</b> for 412.26 points (54 mins 16 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      412.26 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
<div align="center"><img src="/i/education/tchs_srm48_hard.png" /></div>


<br />
First we are going to prove the following property.
We always can construct an optimal solution in such way that each of the towers is located 
either at a point of interest, or in such way that at least 2 points of interest will
lie on the border of watchtower's field of view.
Really, if a tower sees exactly one point, we can always put the watchtower exactly 
at this point. If a tower sees at least two points, then we can move it in some direction
until at least 2 points will lie on the border of its field of view.
<br /><br />



What you want to do with a watchtower is to put it between 2 points such that it is equally far from both of them and is as far as possible. 
This ensures that it can cover a maximum amount of other points.
 This means that all such points will lie on the green line. If the distance between the points is equal to the diameter of the watchtower’s visibility range then there will be exactly one such point, otherwise there will be either infinite amount (if the points are at the same location) or 2 as shown on the picture by the blue circles for one watchtower and with red circles for another watchtower. 
<br /><br />
This C++ solution uses bitmasks to represent sets of points of interests visible from watchtowers. Operator <b>|</b> is used to add an element to a set and <b>__builtin_popcount()</b> is GCC function that counts the number of bits set (in this context: the number of points of interest visible from a certain watchtower). To get more information about playing with bits see <tc-webtag:handle coderId="251074" context="hs_algorithm"/>’s article <a href="/tc?module=Static&d1=tutorials&d2=bitManipulation">A bit of fun: fun with bits</a>.

<pre>template &lt;typename T&gt;
inline T sqr(T a) {
  return a * a;
}

struct ThreeWatchtowers {
  int N;
  
  // count the number of points of interest visible from point (cx,cy)
  int getMask(vector &lt;int&gt; &amp;x, vector &lt;int&gt; &amp;y, double cx, double cy, int R) {
    int result = 0;
    for(int i = 0; i &lt; N; ++i) {
      double dist = sqrt(sqr(x[i] - cx) + sqr(y[i] - cy));
      if(dist &lt;= R + 1e-9)
        result |= (1 &lt;&lt; i);
    }
    return result;
  }
  
  // get bitmasks of all interesting placements
  vector &lt;int&gt; masks(vector &lt;int&gt; &amp;x, vector &lt;int&gt; &amp;y, int R) {
    // case1: no points of interest can be seen
    vector &lt;int&gt; result(x.size() + 1);
    // case2: the watchtower is placed at a point of interest and can only see
    //        points at the exact same location
    for(int i = 0; i &lt; N; ++i)
      for(int j = 0; j &lt; N; ++j)
        if(x[i] == x[j] &amp;&amp; y[i] == y[j])
          result[i] |= (1 &lt;&lt; j);
    // case3: try to place a watchtower between each pair of points
    for(int i = 0; i &lt; N; ++i)
      for(int j = i + 1; j &lt; N; ++j) {
        int sq = sqr(x[i] - x[j]) + sqr(y[i] - y[j]);
        // if a watchtower between points <b>i</b> &amp; <b>j</b> can not possibly
        //      see both at once then try next points
        if(sq &gt; sqr(2 * R))
          continue;
        double cx = (x[i] + x[j]) / 2.0;
        double cy = (y[i] + y[j]) / 2.0;
        double dist = sqrt(sq);
        double pdist = sqrt(sqr(R) - sq / 4.0);
        double nx = (x[j] - x[i]) / dist;
        double ny = (y[j] - y[i]) / dist;
        result.push_back(getMask(x, y, cx - pdist * ny, cy + pdist * nx, R));
        result.push_back(getMask(x, y, cx + pdist * ny, cy - pdist * nx, R));
      }
    return result;
  }
  
  int maximumCoverage(vector &lt;int&gt; x, vector &lt;int&gt; y, vector &lt;int&gt; view) {
    N = x.size();
    vector &lt;int&gt; a = masks(x, y, view[0]);
    vector &lt;int&gt; b = masks(x, y, view[1]);
    vector &lt;int&gt; c = masks(x, y, view[2]);
    int result = 0;
    // use the best combination of watchtower locations
    for(int i = 0; i &lt; a.size(); ++i)
      for(int j = 0; j &lt; b.size(); ++j)
        for(int k = 0; k &lt; c.size(); ++k)
          result = max(result, __builtin_popcount(a[i] | b[j] | c[k]));
    return result;
  }
};</pre>

</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21547660" context="algorithm"/><br />    <em>TopCoder Member</em>
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
