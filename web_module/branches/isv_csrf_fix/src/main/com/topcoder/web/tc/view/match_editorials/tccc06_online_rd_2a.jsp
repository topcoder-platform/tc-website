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
    <A href="/stat?c=round_overview&er=5&rd=10110">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506110" message="Discuss this match" />
</div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Online Round 2-A</span><br>September 27, 2006
<br><br>


<h2>Match summary</h2> 

<p>
Only <tc-webtag:handle coderId="19929536" context="algorithm"/>, <tc-webtag:handle coderId="22641345" context="algorithm"/> and <tc-webtag:handle coderId="309982" context="algorithm"/> were able to correctly solve all three problems in Round 2-A.
The gold medal winner at the last IOI, <tc-webtag:handle coderId="19929536" context="algorithm"/> came up with another huge performance, winning the round by more than a 100 point margin over <tc-webtag:handle coderId="22641345" context="algorithm"/>. <tc-webtag:handle coderId="2058177" context="algorithm"/> made up for his flawed medium with four challenges, coming in third. <tc-webtag:handle coderId="309982" context="algorithm"/> and <tc-webtag:handle coderId="10574855" context="algorithm"/> rounded out the top-five.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4798&amp;rd=10110" name="4798">MatchCounts</a></b> </font> <A href="Javascript:openProblemRating(4798)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506110" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      132 / 134 (98.51%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      127 / 132 (96.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 247.39 points (2 mins 55 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      223.62 (for 127 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be brute forced by checking all different valid assignments.
For each person, try assigning it to any of the tasks it can perform, and marking each task that gets assigned. 
Java code by <tc-webtag:handle coderId="277659" context="algorithm"/> follows:
<pre>
   int go(String[] a, int used, int at) {
      if (at >= a.length)
         return 1 ;
      int r = 0 ;
      for (int i = 0; i < a[at].length(); i++) {
         int b = a[at].charAt(i) - '0' ;
         if ((used & (1 << b)) == 0)
            r += go(a, used | (1 << b), at + 1) ;
      }
      return r;
   }
   public int howMany(String[] a) {
      return go(a, 0, 0) ;
   }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6693&amp;rd=10110" name="6693">Repeat</a></b> </font> <A href="Javascript:openProblemRating(6693)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506110" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      105 / 134 (78.36%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      47 / 105 (44.76%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>zhuzeyuan</b> for 463.37 points (8 mins 7 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      320.45 (for 47 correct submissions) 
    </td>
  </tr>
</table></blockquote>
Experienced coders needed only a couple of seconds to see this problem required DP techique, 
but finding the proper way to split a case into smaller ones saved a lot of time here.
Since all repeat operation are 'stopped' by an 'M' letter in the resulting expression, 
it's natural to use these letters to divide the input string into smaller substrings, which are encoded without using 'M's.
<br /><br />
 
When we need to encode a string without using any letter 'M', this means that any letter 'R' in the compression code will repeat everything between itself and the beginning of the string. Therefore, there are only two different ways to encode string s without any 'M' (code(s) denotes compression code for string s):
<ul><li>Don't use any letters 'R' at all. In this case code(s) = s. In this case, the length of code(s) is equal to the length of s.</li> 
<li>We use 'R' to repeat some prefix of s. Here, code(s) = code(p) + "R" + q, where p and q are prefix and suffix of s, and s is a concatenation of  p and q. The length of code(s) is equal to (the length of code(p) + 1 + (length of s - length of p)).</li>
</ul>
The best code for any substring of input string s can be found using a DP over a two-dimensional array (<b>withoutM</b> in the code below). Element (i, j) of this array will contain the length of the minimal code necessary to encode the characters [i, j) of the input string.
<br>
<br>
Now, let's move to the second part of the problem -- encoding the input string using letters 'M'. To encode string s, we can use one of the following two options:
<ul><li>Don't use any letters 'M' at all. In this case, the answer is equal to <b>withoutM</b>[0][s.length()].</li> 
<li>Use some letters 'M'. In this case, the letter 'M' splits code(s) in two parts (denote them s1 and s2), so code(s) = s1 + 'M' + s2.
If s1, when decompressed, represents first j characters of string s, the length of s1 is equal to <b>withoutM</b>[0][s1.length()]. To find the answer for s2, we again can either don't use any letter 'M' or split it into 2 parts, and so on.
</li></ul>
The implementation of this approach follows: 

<pre> 
    int minLength(string text) { 
        int N = text.size();
        vector&lt vector&lt int> > withoutM(N + 1, vector&lt int>(N + 1, 10000000));
        for (int len = 0; len <= N; len++)
            for (int i = 0; i <= N - len; i++) {
                withoutM[i][i + len] = len;
                for (int j = 1; j <= len/2; j++) 
                    if (text.substr(i, j) == text.substr(i + j, j))
                        withoutM[i][i + len] &lt?= (len - 2*j) + 1 + withoutM[i][i + j];
            }
         vector&lt int> withM(N + 1);
         for (int i = N; i >= 0; i--) {
             withM[i] = withoutM[i][N];
             for (int j = i + 1; j < N; j++)
                withM[i] &lt?= withM[j] + withoutM[i][j] + 1;
             }
         return withM[0];
    }
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6679&amp;rd=10110" name="6679">DominoesLines</a></b> </font> <A href="Javascript:openProblemRating(6679)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506110" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      19 / 134 (14.18%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 19 (26.32%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 713.57 points (19 mins 44 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      538.35 (for 5 correct submissions) 
    </td>
  </tr>
</table></blockquote>

The domino lines from the statement can be easily transformed into a graph, where numbers 0..6 are vertices, and each single domino tile is 
a non-oriented edge. For exampe, a "2:3" tile is an edge between vertices 2 and 3, and a "1:1" tile is a loop-edge from vertex 1 to itself.
Having a graph, we are to find the smallest set of paths such that these paths go through each of the edges exactly once. 
First, lets compute the total number of paths in such a set (this problem is closely related to building an <a href="http://en.wikipedia.org/wiki/Eulerian_path">Eulerian path</a> for a graph).
<br />
<br />
It's clear that the total answer for the graph will be the sum of the answers for connected components of the graph. To find this number,
compute the degree for each of the vertices in the component. If the component doesn't have any vertices with odd degree, then we can build an Eulerian cycle for this component, and the answer is 1. If the component has K vertices with odd degree, we need at minimum K/2 (you can easily prove that K will always be even) paths to cover each edge exactly once (each such path will start and end in a vertex with odd degree). Adding these number for all components gives us the total answer for the whole graph. 
<br />
<br />
To construct the <b>i</b>-th path in the lexicographically first solution, we start it from the empty line and make it longer following the next rules:
<ul>
<li>Stop building the path if the answer for the remaining graph is <b>T - i - 1</b>. In other words - stopping the path too early can increas the total number of paths needed, which will make our answer worse. Therefore, we can stop building the path only if the remaining edges can be grouped into <b>T - i - 1</b> paths.</li>
<li>If we continue the path, at each moment we move to the smallest vertex, which is a) connected to the previous vertex and b) doesn't change the final answer. In other words, sometimes we can continue to a wrong direction, which will force us to use more paths than needed in the optimal answer.</li>
</ul>
See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=249925&rd=10110&pm=6679&cr=10574855">solution</a> for an implementation of this approach.


<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
