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
<style type="text/css">
    .code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 12px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }

</style>
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
<tc-webtag:forumLink forumID="506103" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Qualification Round 2</span><br>September 9, 2006
<br><br>

<h2>Match summary</h2> 

 

<p>

Despite the 763 registrants for qualification round 2, the competition went very smoothly.
With 32 competitors solving the nontrivial hard problem, it is clear that the upcoming rounds will
be exciting.
<tc-webtag:handle coderId="11948018" context="algorithm"/> won the match by a comfortable margin.
<tc-webtag:handle coderId="290274" context="algorithm"/>, although 70 points behind 
<tc-webtag:handle coderId="11948018" context="algorithm"/>, finished approximately 140 points
ahead of the rest of the competitors.  Good luck to all competitors in the upcoming rounds.

</p>

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=4639&amp;rd=10094" name="4639">ProseFlip</a></b> 

</font> 

<A href="Javascript:openProblemRating(4639)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      667 / 719 (92.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      651 / 667 (97.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>scotttiger</b> for 249.77 points (0 mins 52 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      226.36 (for 651 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Like many division 2 easy problems, the solution to this problem amounted to writing a few loops.
Here we simply transpose the given character matrix by swapping indices as we loop.  Java code
follows:
<pre class="code">
    public String[] getFlip(String[] text) {
    int R = text.length, C = text[0].length();
    String[] ret = new String[C];
    for (int c = 0; c < C; c++) {
        ret[c] = "";
        for (int r = 0; r < R; r++) ret[c] += text[r].charAt(c);
    } 
    return ret;
    }
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6045&amp;rd=10094" name="6045">CheapestTabComplete</a></b> 

</font> 

<A href="Javascript:openProblemRating(6045)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      313 / 719 (43.53%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      147 / 313 (46.96%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>lews</b> for 490.56 points (3 mins 57 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      280.50 (for 147 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Here we have a standard dynamic programming problem.  Since we cannot delete characters, at any
point we must have some prefix of the target string in the buffer.  Thus the current state is simply
an integer describing the length of the buffer.  From a particular state, our potential moves
include entering the next character or pressing tab some number of times.  Linearly filling in the
"DP Table," we quickly arrive at the cheapest key cost for the entire target string.  Java code
follows:
<pre class = "code">
    public int getFewest(String[] names, String w) {
        Arrays.sort(names);
        int[] best = new int[51];
        Arrays.fill(best,1000);
        best[0] = 1;
        for (int a = 0; a < w.length(); a++) {
            best[a+1] = Math.min(best[a+1],best[a]+1);
            int cnt = 0;
            String curr = w.substring(0,a);
            for (String s : names) {
               if (!s.startsWith(curr)) continue;
               cnt++;
               if (!w.startsWith(s)) continue;
               best[s.length()] = Math.min(best[s.length()],best[a]+cnt);
            }
        } return best[w.length()];
    }
}
</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=2321&amp;rd=10094" name="2321">QuickTableau</a></b> 

</font> 

<A href="Javascript:openProblemRating(2321)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      94 / 719 (13.07%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      32 / 94 (34.04%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>danielp</b> for 705.51 points (20 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      540.76 (for 32 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem breaks down into two fairly distinct tasks.  The first is efficiently generating all
Young tableaux.  The second is computing the swap cost of going from one tableau to another.  For
the first part, we recursively fill in a 4x4 array in numeric order.  Since at any point we are
inserting the next lowest number, there are a limited number of slots where we can stick it.  More
specifically, the spot we insert the value cannot have any empty spaces above it or to its left.  For
example, there is only one place the value 1 can go, then only two places for 2, and only three
places for 3 once the 2 is placed.  A potential speedup can be achieved by alternating between
placing the lowest remaining number and the highest remaining number.
<br/>
<br/>
For the second part of the problem, we need to figure out the least number of swaps to go from one
tableau to another.  To do this, we view a 4x4 tableau as a list of 16 numbers, and determine the
permutation that sends one tableau into the other.  That is, we see which position in the second
list the first list element is sent to, then the second element, and so forth.  For example, suppose
we were dealing with the following lists (made shorter for clarity):<pre>
    {3,4,2,1}     {2,4,1,3}
</pre>
Then our permutation would be as follows:
<pre>
    1 -&gt; 4, 2 -&gt; 2, 3 -&gt; 1, 4 -&gt; 3
</pre>
Once we have our
permutation, we need to break it down into individual swaps.  This is done by representing the
permutation in disjoint-cycle notation.  The above example has 1 cycle of length 3, and another of
length 1.  A cycle of length n requires n-1 swaps.  So, summing over
each cycle, we are able to compute the swap distance between two tableaux.

</p>


<div class="authorPhoto">
    <img src="/i/m/brett1479_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
