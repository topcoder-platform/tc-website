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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10790&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516568" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 42</span><br />Wednesday, October 17, 2007
<br><br>


<h2>Match summary</h2>

 

<p>

With 102 registrants, 13 of them were newcomers, the TopCoder High School Single Round Match 42 started, and 91 contestants competed. The contestants were confronted with a straightforward easy problem. The code was so simple and readable that all buggy solutions but one were successfully challenged. The medium problem was implementation tricky. The medium and hard problems presented an entertaining challenge phase, then the system test came after all to reorder the division summary.<br />
<br />
The first two problems in addition to 100 point challenges, put <tc-webtag:handle coderId="12012913" context="hs_algorithm"/> in the third place. The hard problem was somehow counter-intuitive, and only two submissions passed the system test. The first place went to <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, thanks to his fastest hard problem submission (besides the other two successful ones and six successful challenges). Followed by <tc-webtag:handle coderId="22659963" context="hs_algorithm"/> in the second place having solved all three problems successfully.
</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<strong><a href="/stat?c=problem_statement&amp;pm=7888&amp;rd=10790" name="7888">FancyGUI</a></strong>

</font>

<A href="Javascript:openProblemRating(7888)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516568" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level One: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Value</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      250

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Submission Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      84 / 91 (92.31%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Success Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      74 / 84 (88.10%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>High Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      <strong>Zuza</strong> for 248.95 points (1 mins 50 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Average Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      213.87 (for 74 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The problem proved to be pretty straight forward. It required a careful implementation. The problem asked to return the number of pixels, above which lie more than <strong>N</strong> windows. So, one implementation goes by passing over all pixels, counting the number of windows above it, and if the number exceeds <strong>N</strong>, increasing the return value by one (as one pixel was found meeting the required condition). The small limits of the problem made of the time limit no issue. As a notice, most of the failing submissions resulted from looping from (0, 0) to (99, 99) instead of (1, 1) to (100, 100). Here goes a sample Java solution:
</P>
<p>
<pre>
<strong><font COLOR="#000080">public</font></strong><strong><font COLOR="#000080"> int</font></strong> totalDarkArea<font COLOR="#000000">(</font><strong><font COLOR="#000080">int</font></strong> N<font COLOR="#000000">,</font><strong><font COLOR="#000080"> int</font></strong><font COLOR="#000000">[]</font> x1<font COLOR="#000000">,</font><strong><font COLOR="#000080"> int</font></strong><font COLOR="#000000">[]</font> y1<font COLOR="#000000">,</font><strong><font COLOR="#000080"> int</font></strong><font COLOR="#000000">[]</font> x2<font COLOR="#000000">,</font><strong><font COLOR="#000080"> int</font></strong><font COLOR="#000000">[]</font> y2<font COLOR="#000000">)
{</font><strong><font COLOR="#000080">

    int</font></strong> result<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">
    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> x<font COLOR="#000000"> =</font><font COLOR="#000000"> 1</font><font COLOR="#000000"> ;</font> x<font COLOR="#000000"> &lt;=</font><font COLOR="#000000"> 100</font><font COLOR="#000000"> ; ++</font>x<font COLOR="#000000">)</font><strong><font COLOR="#000080">

        for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> y<font COLOR="#000000"> =</font><font COLOR="#000000"> 1</font><font COLOR="#000000"> ;</font> y<font COLOR="#000000"> &lt;=</font><font COLOR="#000000"> 100</font><font COLOR="#000000"> ; ++</font>y<font COLOR="#000000">)
        {</font><strong><font COLOR="#000080">

            int</font></strong> count<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">
            for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> k<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> k<font COLOR="#000000"> &lt;</font> x1<font COLOR="#000000">.</font>length<font COLOR="#000000"> ; ++</font>k<font COLOR="#000000">)</font><strong><font COLOR="#000080">

                if</font></strong><font COLOR="#000000"> (</font>x<font COLOR="#000000"> &gt;=</font> x1<font COLOR="#000000">[</font>k<font COLOR="#000000">] &amp;&amp;</font> x<font COLOR="#000000"> &lt;=</font> x2<font COLOR="#000000">[</font>k<font COLOR="#000000">] &amp;&amp;</font> y<font COLOR="#000000"> &gt;=</font> y1<font COLOR="#000000">[</font>k<font COLOR="#000000">] &amp;&amp;</font> y<font COLOR="#000000"> &lt;=</font> y2<font COLOR="#000000">[</font>k<font COLOR="#000000">])</font><font COLOR="#008000">

                    // The pixel (x, y) lies beneath the k-th window
</font>                    count<font COLOR="#000000"> ++;</font><strong><font COLOR="#000080">
            if</font></strong><font COLOR="#000000"> (</font>count<font COLOR="#000000"> &gt;</font> N<font COLOR="#000000">)</font>

                result<font COLOR="#000000"> ++;
        }</font><strong><font COLOR="#000080">
    return</font></strong> result<font COLOR="#000000">;
}</font>
</pre>

</p>

 

<font size="+2">

<strong><a href="/stat?c=problem_statement&amp;pm=7855&amp;rd=10790" name="7855">TwoWords</a></strong>

</font>

<A href="Javascript:openProblemRating(7855)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516568" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Value</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      500

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Submission Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      71 / 91 (78.02%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Success Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      31 / 71 (43.66%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>High Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      <strong>ahyangyi</strong> for 483.87 points (5 mins 13 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Average Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      363.47 (for 31 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Having 71 submissions, 11 submissions were successfully challenged, and 31 submbissions failed the system result. Most of the failing solutions were due to buggy implementations. However, there is a safe and clear way to break the problem down correctly. The problem asked if the two strings <strong>word1</strong> and <strong>word2</strong>, which have wildcard characters ('?'), can be found in <strong>statement</strong> without overlapping. Finding only one word in the base string is easy, just check if that word is a substring of the base string (considering the wildcards). Then, how to find two words? The string <strong>statement</strong> can be split into two strings in N+1 ways (where N is its length). For all splits, try to find <strong>word1</strong> in the first part, and <strong>word2</strong> in the second part. Try also to find <strong>word2</strong> in the first part, and <strong>word1</strong> in the second part. Following is the C++ coded solution:<br />
Note that the C++ substr function arguments are the beginning position and the substring length (not the ending position).
</p>
<p>
<pre>
<strong><font COLOR="#000080">bool</font></strong> match<font COLOR="#000000"> (</font>string a<font COLOR="#000000">,</font> string b<font COLOR="#000000">)
{</font><font COLOR="#008000">

    // match (a, b) is true only if a = b, considering the wildcards
</font><strong><font COLOR="#000080">    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> i<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000"> &lt;</font> a<font COLOR="#000000">.</font>size<font COLOR="#000000">() ;</font> i<font COLOR="#000000">++)</font><strong><font COLOR="#000080">

        if</font></strong><font COLOR="#000000"> (</font>a<font COLOR="#000000">[</font>i<font COLOR="#000000">] !=</font><font COLOR="#000000"> '?'</font><font COLOR="#000000"> &amp;&amp;</font> b<font COLOR="#000000">[</font>i<font COLOR="#000000">] !=</font><font COLOR="#000000"> '?'</font><font COLOR="#000000"> &amp;&amp;</font> a<font COLOR="#000000">[</font>i<font COLOR="#000000">] !=</font> b<font COLOR="#000000">[</font>i<font COLOR="#000000">])</font><strong><font COLOR="#000080">

            return</font></strong><strong><font COLOR="#000080"> false</font></strong><font COLOR="#000000">;</font><strong><font COLOR="#000080">
    return</font></strong><strong><font COLOR="#000080"> true</font></strong><font COLOR="#000000">;
}</font><strong><font COLOR="#000080">

int</font></strong> find<font COLOR="#000000"> (</font>string phrase<font COLOR="#000000">,</font> string word<font COLOR="#000000">)
{</font><font COLOR="#008000">

    // find (phrase, word) returns 1 if the word was found in the phrase
</font><strong><font COLOR="#000080">    if</font></strong><font COLOR="#000000"> (</font>word<font COLOR="#000000">.</font>size<font COLOR="#000000">() &gt;</font> phrase<font COLOR="#000000">.</font>size<font COLOR="#000000">())</font><strong><font COLOR="#000080"> return</font></strong><font COLOR="#000000"> 0</font><font COLOR="#000000">;</font><font COLOR="#008000">      // can not be found

</font><strong><font COLOR="#000080">    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> i<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000"> &lt;=</font> phrase<font COLOR="#000000">.</font>size<font COLOR="#000000">() -</font> word<font COLOR="#000000">.</font>size<font COLOR="#000000">() ;</font> i<font COLOR="#000000">++)</font><strong><font COLOR="#000080">

        if</font></strong><font COLOR="#000000"> (</font>match<font COLOR="#000000"> (</font>phrase<font COLOR="#000000">.</font>substr<font COLOR="#000000"> (</font>i<font COLOR="#000000">,</font> word<font COLOR="#000000">.</font>size<font COLOR="#000000">()),</font> word<font COLOR="#000000">))</font><strong><font COLOR="#000080"> return</font></strong><font COLOR="#000000"> 1</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">

    return</font></strong><font COLOR="#000000"> 0</font><font COLOR="#000000">;
}</font>

string howMany<font COLOR="#000000"> (</font>string statement<font COLOR="#000000">,</font> string word1<font COLOR="#000000">,</font> string word2<font COLOR="#000000">)
{</font><strong><font COLOR="#000080">

    int</font></strong> result<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000">;</font><font COLOR="#008000">
    // result is the maximum number of words found non-overlapping
</font><strong><font COLOR="#000080">    
    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> split<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> split<font COLOR="#000000"> &lt;=</font> statement<font COLOR="#000000">.</font>size<font COLOR="#000000">() ;</font> split<font COLOR="#000000">++)</font>

        result<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>result<font COLOR="#000000">,</font> find<font COLOR="#000000"> (</font>statement<font COLOR="#000000">.</font>substr<font COLOR="#000000">(</font><font COLOR="#000000">0</font><font COLOR="#000000">,</font> split<font COLOR="#000000">),</font> word1<font COLOR="#000000">)
                            +</font> find<font COLOR="#000000"> (</font>statement<font COLOR="#000000">.</font>substr<font COLOR="#000000">(</font>split<font COLOR="#000000">),</font> word2<font COLOR="#000000">));</font><strong><font COLOR="#000080">

    
    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> split<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> split<font COLOR="#000000"> &lt;=</font> statement<font COLOR="#000000">.</font>size<font COLOR="#000000">() ;</font> split<font COLOR="#000000">++)</font>

        result<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>result<font COLOR="#000000">,</font> find<font COLOR="#000000"> (</font>statement<font COLOR="#000000">.</font>substr<font COLOR="#000000">(</font><font COLOR="#000000">0</font><font COLOR="#000000">,</font> split<font COLOR="#000000">),</font> word2<font COLOR="#000000">)
                            +</font> find<font COLOR="#000000"> (</font>statement<font COLOR="#000000">.</font>substr<font COLOR="#000000">(</font>split<font COLOR="#000000">),</font> word1<font COLOR="#000000">));</font><strong><font COLOR="#000080">

    
    if</font></strong><font COLOR="#000000"> (</font>result<font COLOR="#000000"> ==</font><font COLOR="#000000"> 2</font><font COLOR="#000000">)</font><strong><font COLOR="#000080"> return</font></strong><font COLOR="#000000"> "both"</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">
    if</font></strong><font COLOR="#000000"> (</font>result<font COLOR="#000000"> ==</font><font COLOR="#000000"> 1</font><font COLOR="#000000">)</font><strong><font COLOR="#000080"> return</font></strong><font COLOR="#000000"> "one"</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">

    return</font></strong><font COLOR="#000000"> "none"</font><font COLOR="#000000">;
}</font>
</pre>

</p>

 

<font size="+2">

<strong><a href="/stat?c=problem_statement&amp;pm=8020&amp;rd=10790" name="8020">MonkeyTreeDistance</a></strong>

</font>

<A href="Javascript:openProblemRating(8020)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516568" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Value</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      1000

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Submission Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      34 / 91 (37.36%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Success Rate</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      2 / 34 (5.88%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>High Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      <strong>Zuza</strong> for 837.50 points (13 mins 2 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <strong>Average Score</strong>

    </td>

    <td class="bodyText" style="background: #eee;">

      685.93 (for 2 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Although it has a low success rate, this problem has many correct approaches. I will mention two correct approaches, neither one of them was used in the passing solutions.
</p>
<p><strong>First approach:</strong><br />
<A HREF="/tc?module=Static&amp;d1=tutorials&amp;d2=binarySearch">Binary search</A> on the return result works fine for this problem. Assume the answer for the problem is that the minimal maximum distance between all pairs of monkeys is <strong>u</strong>. That means for all <strong>d</strong> &gt; <strong>u</strong>, there exists at least one line y = <strong>N</strong>, where the maximum distance between all pairs for monkeys is less than <strong>d</strong>. Also, for all <strong>d</strong> &lt; <strong>u</strong>, one can not achieve more than the optimal answer, and thus there exists no such line. So, the approach is to binary search on the answer d. That transforms the given problem into this problem:<br />
For the given monkeys, and an assumed distance <strong>d</strong>, is there a line y = <strong>N</strong>, where the maximum distance between all pairs of monkeys is less than <strong>d</strong>? In the sample solution given, this transformed problem is solved by the function <strong>can</strong>. Noticing that the distance between a pair of monkeys <strong>i</strong> and <strong>j</strong> is either constant and independent of N if they were in the same tree, or if the line is in between the two monkeys, this distance is used in the solution as <strong>dx + dy</strong>. Otherwise, the distance increases by 2 over <strong>dx + dy</strong> for each unit of distance to the nearest monkey. That means, for each pair of monkeys and a distance <strong>d</strong>, we can limit an interval [a, b] for which any line y = <strong>N</strong>, a &lt;= <strong>N</strong> &lt;= b, the distance between the pair is less than <strong>d</strong>. Intersecting the intervals for all pairs of monkeys gives the answer for the function <strong>can</strong>, which is true, if and only if the intersection interval is non-empty. Follows a C++ sample solution:
</p>
<p>
<pre>
<strong><font COLOR="#000080">bool</font></strong> can<font COLOR="#000000"> (</font><strong><font COLOR="#000080">long long</font></strong> d<font COLOR="#000000">,</font> vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> x<font COLOR="#000000">,</font> vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> y<font COLOR="#000000">)
{</font><font COLOR="#008000">

    // The intersection interval:
</font><strong><font COLOR="#000080">    long long</font></strong> down<font COLOR="#000000"> = -</font>10000000000LL<font COLOR="#000000">,</font> up<font COLOR="#000000"> =</font> 10000000000LL<font COLOR="#000000">;</font><font COLOR="#008000">

    
    // Intersect the intervals for all pairs of monkeys
</font><strong><font COLOR="#000080">    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> i<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000"> &lt;</font> x<font COLOR="#000000">.</font>size<font COLOR="#000000">() ;</font> i<font COLOR="#000000">++)</font><strong><font COLOR="#000080">

        for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> j<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> j<font COLOR="#000000"> &lt;</font> i<font COLOR="#000000"> ;</font> j<font COLOR="#000000">++)
        {</font><strong><font COLOR="#000080">

            long long</font></strong> dx<font COLOR="#000000"> =</font> abs<font COLOR="#000000"> (</font>x<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> x<font COLOR="#000000">[</font>j<font COLOR="#000000">]);</font><strong><font COLOR="#000080">

            long long</font></strong> dy<font COLOR="#000000"> =</font> abs<font COLOR="#000000"> (</font>y<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">]);</font><strong><font COLOR="#000080">

            if</font></strong><font COLOR="#000000"> (</font>dx<font COLOR="#000000"> ==</font><font COLOR="#000000"> 0</font><font COLOR="#000000">)</font><font COLOR="#008000"> // same tree
</font><font COLOR="#000000">            {</font><strong><font COLOR="#000080">
                if</font></strong><font COLOR="#000000"> (</font>dy<font COLOR="#000000"> &gt;=</font> d<font COLOR="#000000">)</font><strong><font COLOR="#000080"> return</font></strong><strong><font COLOR="#000080"> false</font></strong><font COLOR="#000000">;
            }</font><strong><font COLOR="#000080">

            else</font></strong><font COLOR="#000000">
            {</font><strong><font COLOR="#000080">
                if</font></strong><font COLOR="#000000"> (</font>d<font COLOR="#000000"> &lt;</font> dx<font COLOR="#000000"> +</font> dy<font COLOR="#000000"> +</font><font COLOR="#000000"> 1</font><font COLOR="#000000">)</font><strong><font COLOR="#000080">

                    return</font></strong><strong><font COLOR="#000080"> false</font></strong><font COLOR="#000000">;</font><strong><font COLOR="#000080">
                long long</font></strong> w<font COLOR="#000000"> =</font> d<font COLOR="#000000"> -</font> dx<font COLOR="#000000"> -</font> dy<font COLOR="#000000"> -</font><font COLOR="#000000"> 1</font><font COLOR="#000000">;</font>

                down<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>down<font COLOR="#000000">,</font> min<font COLOR="#000000">(</font>y<font COLOR="#000000">[</font>i<font COLOR="#000000">],</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">]) -</font> w<font COLOR="#000000"> /</font><font COLOR="#000000"> 2</font><font COLOR="#000000">);</font>

                up<font COLOR="#000000"> =</font> min<font COLOR="#000000"> (</font>up<font COLOR="#000000">,</font> max<font COLOR="#000000">(</font>y<font COLOR="#000000">[</font>i<font COLOR="#000000">],</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">]) +</font> w<font COLOR="#000000"> /</font><font COLOR="#000000"> 2</font><font COLOR="#000000">);
            }
        }</font><strong><font COLOR="#000080">

    return</font></strong> down<font COLOR="#000000"> &lt;=</font> up<font COLOR="#000000">;
}</font>

string minimalMaximumDistance<font COLOR="#000000"> (</font>vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">int</font></strong><font COLOR="#000000">&gt;</font> xd<font COLOR="#000000">,</font> vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">int</font></strong><font COLOR="#000000">&gt;</font> yd<font COLOR="#000000">)
{</font><strong><font COLOR="#000080">

    int</font></strong> N<font COLOR="#000000"> =</font> xd<font COLOR="#000000">.</font>size<font COLOR="#000000"> ();</font>
    vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> x<font COLOR="#000000"> (</font>N<font COLOR="#000000">),</font> y<font COLOR="#000000"> (</font>N<font COLOR="#000000">);</font><strong><font COLOR="#000080">

    
    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> i<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000"> &lt;</font> N<font COLOR="#000000"> ;</font> i<font COLOR="#000000">++)
    {</font>

        x<font COLOR="#000000">[</font>i<font COLOR="#000000">] =</font> xd<font COLOR="#000000">[</font>i<font COLOR="#000000">];</font>
        y<font COLOR="#000000">[</font>i<font COLOR="#000000">] =</font> yd<font COLOR="#000000">[</font>i<font COLOR="#000000">];
    }</font><strong><font COLOR="#000080">

    
    long long</font></strong> low<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000">,</font> high<font COLOR="#000000"> =</font> 10000000000LL<font COLOR="#000000">;</font><strong><font COLOR="#000080">

    
    while</font></strong><font COLOR="#000000"> (</font>high<font COLOR="#000000"> -</font> low<font COLOR="#000000"> &gt;</font><font COLOR="#000000"> 1</font><font COLOR="#000000">)
    {</font>
        cout<font COLOR="#000000"> &lt;&lt;</font> high<font COLOR="#000000"> &lt;&lt;</font><font COLOR="#000000"> " "</font><font COLOR="#000000"> &lt;&lt;</font> low<font COLOR="#000000"> &lt;&lt;</font> endl<font COLOR="#000000">;</font><strong><font COLOR="#000080">

        long long</font></strong> mid<font COLOR="#000000"> = (</font>low<font COLOR="#000000"> +</font> high<font COLOR="#000000">) /</font><font COLOR="#000000"> 2</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">
        if</font></strong><font COLOR="#000000"> (</font>can<font COLOR="#000000"> (</font>mid<font COLOR="#000000">,</font> x<font COLOR="#000000">,</font> y<font COLOR="#000000">))</font>

            high<font COLOR="#000000"> =</font> mid<font COLOR="#000000">;</font><strong><font COLOR="#000080">
        else</font></strong>
            low<font COLOR="#000000"> =</font> mid<font COLOR="#000000">;
    }</font>

    
    stringstream ss<font COLOR="#000000">;</font>
    ss<font COLOR="#000000"> &lt;&lt;</font> low<font COLOR="#000000">;</font><strong><font COLOR="#000080">
    return</font></strong> ss<font COLOR="#000000">.</font>str<font COLOR="#000000">();
}</font>
</pre>
</p>
<p>
<strong>Second approach:</strong><br />
The second approach requires solving a major part of the problem algebraically on paper. At most 50 monkeys are located in the world. So, there is at most 50 unique values of the y-coordinate. That breaks down the problem into this simpler form:<br />
Between y = <strong>a</strong> and y = <strong>b</strong> (inclusive), no monkeys are located except for the boundaries. Calculate the line on the form y = N, <strong>a</strong> &lt;= N &lt;= <strong>b</strong>, where it makes the largest distance as small as possible. This is what the function &quot;distance&quot; does in the following solution:<br />
<br />
In each interval, all pairs of monkeys can be divided into 3 categories:<br />
1) the pair of monkeys where both are in different directions from any line y = <strong>N</strong>, or they are both situated in the same tree.<br />
2) the pair of monkeys where both are above any line y = <strong>N</strong><br />
3) the pair of monkeys where both are below any line y = <strong>N</strong><br />
<br />
So for a pair of monkeys i, j:<br />
<strong>Case 1:</strong> the distance is constant and doesn't depend on the line position. The maximum is not dependant on the location of the vertical line, and as we seek its maximum, the maximum value is stored in maxconst.<br />
<strong>Case 2:</strong> the two monkeys are both above: That means the distance function = (<strong>y</strong>[<strong>i</strong>] - <strong>N</strong> + <strong>y</strong>[<strong>j</strong>] - <strong>N</strong> + <strong>abs</strong> (<strong>x</strong>[<strong>i</strong>] - <strong>x</strong>[<strong>j</strong>])), for a line y = <strong>N</strong>. We also want to get the maximum of this value, so we store <strong>maxup</strong> = <strong>y</strong>[<strong>i</strong>] + <strong>y</strong>[<strong>j</strong>] + <strong>abs</strong>(<strong>x</strong>[<strong>i</strong>] - <strong>x</strong>[<strong>j</strong>]). Now, the maximum distance for all such pairs equals: <strong>maxup - 2N</strong><br />
<strong>Case 3:</strong> the two monkeys are both below: similarly storing <strong>maxdown</strong> = - <strong>y</strong>[<strong>i</strong>] - <strong>y</strong>[<strong>j</strong>] + <strong>abs</strong>(<strong>x</strong>[<strong>i</strong>] - <strong>x</strong>[<strong>j</strong>]). Therefore, the maximum distance for all such pairs equals:  <strong>maxdown + 2N</strong><br />
<br />
Now, for N, such that <strong>a</strong> &lt;= <strong>N</strong> &lt;= <strong>b</strong>, find N that minimizes the value: &quot;<strong>max</strong> (<strong>maxconst</strong>, <strong>maxup - 2N</strong>, <strong>maxdown + 2N</strong>)&quot;. <strong>maxconst</strong> can be eliminated from the search process and handled later as it is independent of N. So:</p>
<pre>
max (maxup - 2N, maxdown + 2N) =  maxup - 2N      if maxup - 2N &gt;= maxdown + 2N
                                  maxdown + 2N    if maxdown + 2N &gt; maxup - 2N
<I>Reduces to:</I>
max (maxup - 2N, maxdown + 2N) =  maxup - 2N      if maxup - maxdown &gt;= 4N
                                  maxdown + 2N    if maxup - maxdown &lt; 4N
<I>Reduces to:</I>
max (maxup - 2N, maxdown + 2N) =  maxup - 2N      if N &lt;= (maxup - maxdown) / 4
                                  maxdown + 2N    if N &gt; (maxup - maxdown) / 4
</pre>
<p>
Here appears the value <strong>critical</strong> = (<strong>maxup</strong> - <strong>maxdown</strong>) / 4. The rest is that trying the following lines as the optimal lines: y = <strong>critical</strong>, y = <strong>critical</strong> + 1, y = <strong>critical</strong> - 1, y = <strong>a</strong> or y = <strong>b</strong>. Only if <strong>critical</strong>, <strong>critical</strong> + 1, or <strong>critical</strong> - 1 lie in the interval [<strong>a</strong>, <strong>b</strong>].<br />
For other values farther than [<strong>critical</strong> - 1, <strong>critical</strong> + 1], the maximum grows over the minimal value. as <strong>maxup - 2N</strong> will increase if <strong>N</strong> decreased, or <strong>maxdown + 2N</strong> will increase if <strong>N</strong> increased. Therefore, they should be greedily eliminated from the search.<br />
The algorithm runs three nested loops over all of the monkeys and it is O (n^3), which makes it under the time limit.<br />
Follows a sample implementation in C++, where the function <strong>maximum</strong> gets the value of the maximum distance for all pairs of monkeys given <strong>maxdown</strong>, <strong>maxup</strong> and <strong>maxconst</strong>, and a suspected line y = <strong>N</strong>.
</p>
<p>
<pre>
<strong><font COLOR="#000080">const</font></strong><strong><font COLOR="#000080"> long long</font></strong> BIG<font COLOR="#000000"> =</font> 1000000000000000LL<font COLOR="#000000">;</font><strong><font COLOR="#000080">

long long</font></strong> maximum<font COLOR="#000000"> (</font><strong><font COLOR="#000080">long long</font></strong> maxu<font COLOR="#000000">,</font><strong><font COLOR="#000080"> long long</font></strong> maxd<font COLOR="#000000">,</font><strong><font COLOR="#000080"> long long</font></strong> maxc<font COLOR="#000000">,</font><strong><font COLOR="#000080"> long long</font></strong> N<font COLOR="#000000">)
{</font><strong><font COLOR="#000080">

    return</font></strong> max<font COLOR="#000000">(</font>maxc<font COLOR="#000000">,</font> max<font COLOR="#000000">(</font>maxu<font COLOR="#000000"> -</font> N<font COLOR="#000000"> -</font> N<font COLOR="#000000">,</font> maxd<font COLOR="#000000"> +</font> N<font COLOR="#000000"> +</font> N<font COLOR="#000000">));
}</font><strong><font COLOR="#000080">

long long</font></strong> distance<font COLOR="#000000"> (</font>vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> x<font COLOR="#000000">,</font> vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> y<font COLOR="#000000">

                            ,</font><strong><font COLOR="#000080"> long long</font></strong> a<font COLOR="#000000">,</font><strong><font COLOR="#000080"> long long</font></strong> b<font COLOR="#000000">)
{</font><font COLOR="#008000">
    // a &lt; b AND no monkeys between y = a, y = b

</font><strong><font COLOR="#000080">    long long</font></strong> ans<font COLOR="#000000"> =</font> BIG<font COLOR="#000000">;</font><strong><font COLOR="#000080">
    long long</font></strong> maxup<font COLOR="#000000"> = -</font>BIG<font COLOR="#000000">,</font> maxdown<font COLOR="#000000"> = -</font>BIG<font COLOR="#000000">,</font> maxconst<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">

    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> i<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000"> &lt;</font> x<font COLOR="#000000">.</font>size<font COLOR="#000000">() ;</font> i<font COLOR="#000000">++)</font><strong><font COLOR="#000080">

        for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> j<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> j<font COLOR="#000000"> &lt;</font> x<font COLOR="#000000">.</font>size<font COLOR="#000000">() ;</font> j<font COLOR="#000000">++)
        {</font><strong><font COLOR="#000080">

            if</font></strong><font COLOR="#000000"> (</font>x<font COLOR="#000000">[</font>i<font COLOR="#000000">] ==</font> x<font COLOR="#000000">[</font>j<font COLOR="#000000">])</font>
                maxconst<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>maxconst<font COLOR="#000000">,</font> abs<font COLOR="#000000">(</font>y<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">]));</font><strong><font COLOR="#000080">

            else if</font></strong><font COLOR="#000000"> (</font>y<font COLOR="#000000">[</font>i<font COLOR="#000000">] &lt;=</font> a<font COLOR="#000000"> &amp;&amp;</font> b<font COLOR="#000000"> &lt;=</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">])</font>

                maxconst<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>maxconst<font COLOR="#000000">,</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">] -</font> y<font COLOR="#000000">[</font>i<font COLOR="#000000">] +</font> abs<font COLOR="#000000">(</font>x<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> x<font COLOR="#000000">[</font>j<font COLOR="#000000">]));</font><strong><font COLOR="#000080">

            else if</font></strong><font COLOR="#000000"> (</font>y<font COLOR="#000000">[</font>j<font COLOR="#000000">] &lt;=</font> a<font COLOR="#000000"> &amp;&amp;</font> b<font COLOR="#000000"> &lt;=</font> y<font COLOR="#000000">[</font>i<font COLOR="#000000">])</font>

                maxconst<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>maxconst<font COLOR="#000000">,</font> y<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">] +</font> abs<font COLOR="#000000">(</font>x<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> x<font COLOR="#000000">[</font>j<font COLOR="#000000">]));</font><strong><font COLOR="#000080">

            else if</font></strong><font COLOR="#000000"> (</font>y<font COLOR="#000000">[</font>i<font COLOR="#000000">] &gt;=</font> b<font COLOR="#000000"> &amp;&amp;</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">] &gt;=</font> b<font COLOR="#000000">)</font>

                maxup<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>maxup<font COLOR="#000000">,</font> y<font COLOR="#000000">[</font>i<font COLOR="#000000">] +</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">] +</font> abs<font COLOR="#000000">(</font>x<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> x<font COLOR="#000000">[</font>j<font COLOR="#000000">]));</font><strong><font COLOR="#000080">

            else if</font></strong><font COLOR="#000000"> (</font>y<font COLOR="#000000">[</font>i<font COLOR="#000000">] &lt;=</font> a<font COLOR="#000000"> &amp;&amp;</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">] &lt;=</font> a<font COLOR="#000000">)</font>

                maxdown<font COLOR="#000000"> =</font> max<font COLOR="#000000"> (</font>maxdown<font COLOR="#000000">, -</font> y<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> y<font COLOR="#000000">[</font>j<font COLOR="#000000">] +</font> abs<font COLOR="#000000">(</font>x<font COLOR="#000000">[</font>i<font COLOR="#000000">] -</font> x<font COLOR="#000000">[</font>j<font COLOR="#000000">]));
        }</font><font COLOR="#008000">

    
    // Handling of some special cases:
    // No maxup, use a (the lower limit):
</font><strong><font COLOR="#000080">    if</font></strong><font COLOR="#000000"> (</font>maxup<font COLOR="#000000"> == -</font>BIG<font COLOR="#000000">)</font><strong><font COLOR="#000080">
        return</font></strong> max<font COLOR="#000000"> (</font>a<font COLOR="#000000"> +</font> a<font COLOR="#000000"> +</font> maxdown<font COLOR="#000000">,</font> maxconst<font COLOR="#000000">);</font><font COLOR="#008000">

    // No maxdown, use b (the upper limit):
</font><strong><font COLOR="#000080">    if</font></strong><font COLOR="#000000"> (</font>maxdown<font COLOR="#000000"> == -</font>BIG<font COLOR="#000000">)</font><strong><font COLOR="#000080">
        return</font></strong> max<font COLOR="#000000"> (-</font> b<font COLOR="#000000"> -</font> b<font COLOR="#000000"> +</font> maxup<font COLOR="#000000">,</font> maxconst<font COLOR="#000000">);</font><strong><font COLOR="#000080">

    
    long long</font></strong> critical<font COLOR="#000000"> = (</font>maxup<font COLOR="#000000"> -</font> maxdown<font COLOR="#000000">) /</font><font COLOR="#000000"> 4</font><font COLOR="#000000">;</font><strong><font COLOR="#000080">
    if</font></strong><font COLOR="#000000"> (</font>a<font COLOR="#000000"> &lt;=</font> critical<font COLOR="#000000"> &amp;&amp;</font> critical<font COLOR="#000000"> &lt;=</font> b<font COLOR="#000000">)</font>

        ans<font COLOR="#000000"> =</font> min<font COLOR="#000000">(</font>ans<font COLOR="#000000">,</font> maximum<font COLOR="#000000"> (</font>maxup<font COLOR="#000000">,</font> maxdown<font COLOR="#000000">,</font> maxconst<font COLOR="#000000">,</font> critical<font COLOR="#000000">));</font><strong><font COLOR="#000080">

    
    if</font></strong><font COLOR="#000000"> (</font>a<font COLOR="#000000"> &lt;=</font> critical<font COLOR="#000000"> +</font><font COLOR="#000000"> 1</font><font COLOR="#000000"> &amp;&amp;</font> critical<font COLOR="#000000"> +</font><font COLOR="#000000"> 1</font><font COLOR="#000000"> &lt;=</font> b<font COLOR="#000000">)</font>

        ans<font COLOR="#000000"> =</font> min<font COLOR="#000000">(</font>ans<font COLOR="#000000">,</font> maximum<font COLOR="#000000"> (</font>maxup<font COLOR="#000000">,</font> maxdown<font COLOR="#000000">,</font> maxconst<font COLOR="#000000">,</font> critical<font COLOR="#000000"> +</font><font COLOR="#000000"> 1</font><font COLOR="#000000">));</font><strong><font COLOR="#000080">

    
    if</font></strong><font COLOR="#000000"> (</font>a<font COLOR="#000000"> &lt;=</font> critical<font COLOR="#000000"> -</font><font COLOR="#000000"> 1</font><font COLOR="#000000"> &amp;&amp;</font> critical<font COLOR="#000000"> -</font><font COLOR="#000000"> 1</font><font COLOR="#000000"> &lt;=</font> b<font COLOR="#000000">)</font>

        ans<font COLOR="#000000"> =</font> min<font COLOR="#000000">(</font>ans<font COLOR="#000000">,</font> maximum<font COLOR="#000000"> (</font>maxup<font COLOR="#000000">,</font> maxdown<font COLOR="#000000">,</font> maxconst<font COLOR="#000000">,</font> critical<font COLOR="#000000"> -</font><font COLOR="#000000"> 1</font><font COLOR="#000000">));</font>

    
    ans<font COLOR="#000000"> =</font> min<font COLOR="#000000">(</font>ans<font COLOR="#000000">,</font> maximum<font COLOR="#000000">(</font>maxup<font COLOR="#000000">,</font> maxdown<font COLOR="#000000">,</font> maxconst<font COLOR="#000000">,</font> a<font COLOR="#000000">));</font>

    ans<font COLOR="#000000"> =</font> min<font COLOR="#000000">(</font>ans<font COLOR="#000000">,</font> maximum<font COLOR="#000000">(</font>maxup<font COLOR="#000000">,</font> maxdown<font COLOR="#000000">,</font> maxconst<font COLOR="#000000">,</font> b<font COLOR="#000000">));</font><strong><font COLOR="#000080">

    return</font></strong> ans<font COLOR="#000000">;
}</font>

string minimalMaximumDistance<font COLOR="#000000"> (</font>vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">int</font></strong><font COLOR="#000000">&gt;</font> xd<font COLOR="#000000">,</font> vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">int</font></strong><font COLOR="#000000">&gt;</font> yd<font COLOR="#000000">)
{</font><strong><font COLOR="#000080">

    int</font></strong> N<font COLOR="#000000"> =</font> xd<font COLOR="#000000">.</font>size<font COLOR="#000000"> ();</font>
    vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> x<font COLOR="#000000"> (</font>N<font COLOR="#000000">),</font> y<font COLOR="#000000"> (</font>N<font COLOR="#000000">);</font><strong><font COLOR="#000080">

    
    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> i<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000"> &lt;</font> N<font COLOR="#000000"> ;</font> i<font COLOR="#000000">++)
    {</font>

        x<font COLOR="#000000">[</font>i<font COLOR="#000000">] =</font> xd<font COLOR="#000000">[</font>i<font COLOR="#000000">];</font>
        y<font COLOR="#000000">[</font>i<font COLOR="#000000">] =</font> yd<font COLOR="#000000">[</font>i<font COLOR="#000000">];
    }</font>

    
    set<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> y_pos<font COLOR="#000000"> (</font>y<font COLOR="#000000">.</font>begin<font COLOR="#000000">(),</font> y<font COLOR="#000000">.</font>end<font COLOR="#000000">());</font><font COLOR="#008000">    // Include all y values

</font>    y_pos<font COLOR="#000000">.</font>insert<font COLOR="#000000"> (-</font>BIG<font COLOR="#000000">/</font><font COLOR="#000000">10</font><font COLOR="#000000">);</font>
    y_pos<font COLOR="#000000">.</font>insert<font COLOR="#000000"> (</font>BIG<font COLOR="#000000">/</font><font COLOR="#000000">10</font><font COLOR="#000000">);</font>

    
    vector<font COLOR="#000000"> &lt;</font><strong><font COLOR="#000080">long long</font></strong><font COLOR="#000000">&gt;</font> ys<font COLOR="#000000"> (</font>y_pos<font COLOR="#000000">.</font>begin<font COLOR="#000000">(),</font> y_pos<font COLOR="#000000">.</font>end<font COLOR="#000000">());</font><strong><font COLOR="#000080">

    
    long long</font></strong> ans<font COLOR="#000000"> =</font> BIG<font COLOR="#000000">;</font><strong><font COLOR="#000080">
    for</font></strong><font COLOR="#000000"> (</font><strong><font COLOR="#000080">int</font></strong> i<font COLOR="#000000"> =</font><font COLOR="#000000"> 0</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000"> &lt;</font> ys<font COLOR="#000000">.</font>size<font COLOR="#000000">() -</font><font COLOR="#000000"> 1</font><font COLOR="#000000"> ;</font> i<font COLOR="#000000">++)</font>

        ans<font COLOR="#000000"> =</font> min<font COLOR="#000000">(</font>ans<font COLOR="#000000">,</font> distance<font COLOR="#000000">(</font>x<font COLOR="#000000">,</font> y<font COLOR="#000000">,</font> ys<font COLOR="#000000">[</font>i<font COLOR="#000000">],</font> ys<font COLOR="#000000">[</font>i<font COLOR="#000000">+</font><font COLOR="#000000">1</font><font COLOR="#000000">]));</font>

    
    stringstream ss<font COLOR="#000000">;</font>
    ss<font COLOR="#000000"> &lt;&lt;</font> ans<font COLOR="#000000">;</font><strong><font COLOR="#000080">
    return</font></strong> ss<font COLOR="#000000">.</font>str<font COLOR="#000000">();
}</font>
</pre>
</p>
<p>
For a third working approach, that uses <a href="http://en.wikipedia.org/wiki/Ternary_search">ternary search</a>, refer to <tc-webtag:handle coderId="22659963" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=22659963&rd=10790&pm=8020">solution</a>. This solution essentially assumed that the maximum distance for all pairs of monkeys according to the ground y = <strong>N</strong>, as a function of <strong>N</strong>, to have only one minimum point (or multiple successive points). This assumption could be either proved by an extension to the second approach. Or one have to believe in his intuition and goes for coding it.

</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/mohamedafattah_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15917161" context="algorithm"/><br />    <em>TopCoder Member</em>
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
