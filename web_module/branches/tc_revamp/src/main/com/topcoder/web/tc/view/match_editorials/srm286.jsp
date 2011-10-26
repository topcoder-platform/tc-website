<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505800" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 286</span><br>Monday, January 30, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Single Round Match 286 presented a problem set headed by hard 1000-pointers, which decided most part of match standings and were solved by few coders in each division.
</p>
<p>
Division 1 was a land of challenges and failed solutions. Only six coders passed their solutions for the hard problem, out of 85 submissions. <b>Petr</b>, with the fastest correct submission for that problem, won by over 300 points over the second position, with three successful challenges for his record. <b>kalinov</b> followed, and 130 points later came <b>marian</b>, <b>Eryx</b> and <b>tomek</b> in a close group.
</p>
<p>
In Division 2 only three coders scored above over 1000 points. Newcomers <b>lapsedbird</b> and <b>NauCoder</b> lead, very close each other, with 130 points over the next group: <b>butler</b>, <b>mitnickcbc</b> and <b>Knith</b>.
</p>

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5905&amp;rd=8083" name="5905">CuttingPoles</a></b>
</font>
<A href="Javascript:openProblemRating(5905)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505800" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    324 / 360 (90.00%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>

  <td class="bodyText" style="background: #eee;">
    252 / 324 (77.78%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">

    <b>lei0883</b> for 249.29 points (1 mins 31 secs)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">

    200.81 (for 252 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>
The algorithm to implement was already described in the statement and all a solution needed just to implement it. Using a sort function to keep poles sorted by height (time constraints are generous for so little input) and using the fact that the average height of poles is an integer, a solution could be:
<pre>
  int countCuts(int[] poles) {
    int avg = 0;
    for (int i=0; i&lt;poles.length; i++)
      avg += poles[i];
    // result is guaranteed to be an integer
    avg = avg / poles.length;
    Arrays.sort(poles);
    int cuts = 0;
    while (poles[poles.length-1] > avg) {
      // plenty of execution time, iterate cutting & resorting
      poles[0] += poles[poles.length-1] - avg;
      poles[poles.length-1] = avg;
      Arrays.sort(poles);
      cuts++;
    }
    return cuts;
  }
</pre>
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=5891&amp;rd=8083" name="5891">ExtraBall</a></b>
</font>
<A href="Javascript:openProblemRating(5891)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505800" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

    214 / 360 (59.44%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    168 / 214 (78.50%)
  </td>

  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>DaiYan</b> for 448.50 points (9 mins 51 secs)
  </td>

  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    290.20 (for 168 correct submissions)
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
    314 / 324 (96.91%)
  </td>
  </tr>

  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    282 / 314 (89.81%)
  </td>
  </tr>
  <tr>

  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>John Dethridge</b> for 242.62 points (4 mins 59 secs)
  </td>
  </tr>
  <tr>

  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    181.70 (for 282 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>
We need to know what patterns have already been paid at the end of the game; and then compute the probability of matching each of the remaining prizes with just one ball to be released. The probability of winning the i-th pattern in that ball can be obtained as <tt>1/(75�-balls.length)*prizes[i]</tt> for those patterns with exactly one unmatched cell, or zero otherwise (either because they have been already paid or they would need more than one ball to be released). To compute matched and unmatched cells a simple iteration could be performed, or bitmasks could also be used. Java code follows:

<pre>
  double expectedPayout(int[] card, int[] balls,
              String[] patterns, int[] prizes) {
    Arrays.sort(balls);
    int maxpayout = 0;
    for (int i=0; i&lt;patterns.length; i++) {
      int missing = 0;
      for (int j=0; j&lt;card.length; j++)
        if (patterns[i].charAt(j) == 'X' && Arrays.binarySearch(balls, card[j]) &lt; 0)
          missing++;
      if (missing == 1)
        maxpayout += prizes[i];
    }
    return (double)maxpayout / (75.0-balls.length);
  }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5898&amp;rd=8083" name="5898">MonomorphicTyper</a></b>
</font>
<A href="Javascript:openProblemRating(5898)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505800" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    46 / 360 (12.78%)
  </td>
  </tr>

  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    5 / 46 (10.87%)
  </td>
  </tr>
  <tr>

  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>lapsedbird</b> for 643.64 points (24 mins 9 secs)
  </td>
  </tr>
  <tr>

  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    523.20 (for 5 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>
Regardless the extension of the statement, the problem should be easily understood by anyone familiar to programming: it asked for inferring the type of an expression in a (typed) programming language, based on certain assumptions given as the �definitions�. Any compiler of a typed language (as all languages currently used in TopCoder competitions) performs this task for each constant, function call, operator application, etc. in a piece of source code.

A great part of the problem complexity comes from parsing of the expression, which can be seen as a tree where function calls are nodes (with one or more children), and constants are its leaves. Parsing such an expression is a common example of use of stack automatas, and can be implemented either using recursion or a stack to keep track of depth in the tree that represents the expression (parenthesis nesting).

Inferring the type of the expression requires to check each function and constant name against the definitions, and recurse this task to typecheck each of the subexpressions. For a constant to have type, it has just to be declared in the definitions. For a node to have type, it must hold that:

<ul>
<li>there is a definition for that name, </li>
<li>the parameter count in that definition matches the actual usage in the expression, and </li>
<li><i>recursively</i> each of the nodes have type and match the type declared for each parameter in the definitions.</li>
</ul>
</p>
<p>
In <a href="http://en.wikipedia.org/wiki/Type_theory">Type Theory</a>, these two rules are usually part of a </i>monomorphic type system</i>, usually being the simplest rules in typechecking.

<p>
<p>
The following is a concise and clear recusrive solution contributed by <b>radeye</b>:
<pre>
  public class MonomorphicTyper {
    String[] tokens, defs;
    int at = 0 ;
    void msplit(String s) {
      StringTokenizer t = new StringTokenizer(s, ":(),!", true);
        tokens = new String[t.countTokens()];
      int i = 0;
      while(t.hasMoreTokens())
        tokens[i++]=t.nextToken();
    }
    String mustMatch(String s) {
      for (String d : defs)
        if (d.startsWith(s))
  	     return d.substring(s.length()) ;
      return "" ;
    }
    String eval() {
      String r = tokens[at++] ;
      if (tokens[at].equals("(")) {
         r += tokens[at++] ;
         while (true) {
           r = r + eval() + tokens[at++] ;
           if (tokens[at-1].equals(")")) break ;
         }
      }
      return mustMatch(r+":") ;
    }
    public String infer(String expression, String[] definitions) {
      msplit(expression+"!") ;
      defs = definitions ;
      return eval() ;
    }
  }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5908&amp;rd=8083" name="5908">BallGift</a></b>
</font>
<A href="Javascript:openProblemRating(5908)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505800" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>
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
    115 / 324 (35.49%)
  </td>
  </tr>

  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    44 / 115 (38.26%)
  </td>
  </tr>
  <tr>

  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>Egor</b> for 512.80 points (12 mins 8 secs)
  </td>
  </tr>
  <tr>

  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    333.45 (for 44 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>
To know the best place to seat in if all we have as input is the number of sheets of each color, we could enumerate all possible configurations computing which position wins the gift in each case, and then return the position with most winning configurations.

<p>
</p>
The only parameters needed in a recursive function to perform the computation are the number of red, green and black sheets -- note that the number of players in the given moment can be inferred as the total number of players minus the number of black sheets already used. Its return value can be a collection including a count of winning configurations for each sitting position (its size will be the number of players still playing). We can make the first position in such return value to represent the player that holds the ball in that turn, and subsequent positions enumerated in the order the ball is being passed by. The function will then we rearrange the return values from recursive calls depending on the colors that can be use in current turn: for instance, a green sheet will rotate one position the values in that collection.
<p>
</p>
A na�ve recursive function will timeout with the given constraints, but memoization or a dynamic programming approach will work. One additional warning is that 32-bit integers would overflow in the largest inputs. Once the right parameters are chosen for this recursive function, the &quot;only&quot; difficulty is to properly combine each of the results from recursive cases -- find the details in the following Java solution:
<pre>
  // parameters: int players, int green, int red, int black
  long dp[][][][];
  dp = new long[green + 1][red + 1][black + 1][players];
  for (int g = 0; g &lt;= green; g++) {
    for (int r = 0; r &lt;= red; r++) {
      for (int b = 0; b &lt;= black; b++) {
        int pl = players + b - black;
        if (r + g + b == 0) {
          // if no sheets in the ball, player at position 0 wins
          dp[g][r][b][0] = 1;
          for (int i = 1; i &lt; pl; i++)
            dp[g][r][b][i] = 0;
        } else {
          if (b > 0) {
            // players are copied from recursive call,
            // but current gets eliminated from circle
            dp[g][r][b][0] = 0;
            for (int i = 0; i &lt; pl - 1; i++)
              dp[g][r][b][i + 1] += dp[g][r][b - 1][i];
          }
          if (g > 0)
            // the counts for all players are just cycled
            // with 1-position shift
            for (int i = 0; i &lt; pl; i++)
              dp[g][r][b][(i + 1) % pl] += dp[g - 1][r][b][i];
          if (r > 0)
            // the circle order is reversed, so the array with counts
            for (int i = 0; i &lt; pl; i++)
              dp[g][r][b][i] += dp[g][r - 1][b][pl-i-1];
        }
      }
    }
  }
  // All we need to complete this solution is to return the least index that gives
  // a maximum in dp[green][red][black][p] for p=0..players-1.

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6017&amp;rd=8083" name="6017">InfiniteSoup</a></b>
</font>
<A href="Javascript:openProblemRating(6017)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505800" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    85 / 324 (26.23%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">

    6 / 85 (7.06%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>Petr</b> for 807.70 points (14 mins 36 secs)
  </td>

  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    617.61 (for 6 correct submissions)
  </td>
  </tr>

</table></blockquote>
<p>
This problem required to solve two different tasks. The first and easier step was to realize that the 200*200 possible rays actually describe much fewer <i>different</i> sequences in the grid <b>g</b>: two rays crossing <tt>(x1,y1)</tt> and <tt>(x2,y2)</tt> will spell out the same sequence if and only if <tt>x1=x2 mod c</tt> and <tt>y1=y2 mod r</tt>, where <tt>c</tt> and <tt>r</tt> are the number of columns and rows in <b>g</b>, respectibely. Many coders quickly found this fact and were tempted to submit really fast solutions, in which words were searched on the sequences generated using string search functions provided by their standard libraries.

</p>
<p>
However, such functions usually implement a search with <i>O(nm)</i> runtime, where <i>n</i> is length of sequence and <i>m</i> the length of word being searched. Such runtime timed out for large inputs in the problem, and that is the reason why so many solutions failed and only 7% out of a relatively high count of submissions passed system testing.
</p>
<p>
An efficient method for this type of search is to use infer some information on the structure of the word being searched, so as to avoid �backtracking� to the beginning of the string every time a character is not matched. A well known solution for this task is known as <i>Knutt-Morris-Pratt algorithm</i>: it bases the search on knowing the how suffixes of initial parts of the string are actually initial parts of the same string. This allows to, when finding a mismatch while walking on the sequence, to recover the search from any of the other possible points where search could be, if starting from some an index greater than the one already failed.

</p>
<p>
For those familiar with theory of languages, an instance of KMP algorithm for a given search word can be seen as a (deterministic) finite automata, or DFA, with one state for each letter in the word. Each state in this DFA has to exits: one for the matching character corresponding to that state, and one to jump back to a previous state, which depends on the abovementioned string prefixes - this replaces the backtracking to the beginning of word in the quadratic algorithm mentioned, and must be performed as long as current letter still do not match, up to the beginning of the word. Thinking a nondeterministic automata (NFA) approach, that DFA can be seen as a translation from the straightforward NFA solution deterministic version.
<p>
The Wikipedia contains several <a href="http://en.wikipedia.org/wiki/String_search_algorithms">search algorithms</a>. A very clear explanation of KMP algorithm can also be found
<a href="http://www.ics.uci.edu/~eppstein/161/960227.html">here</a>
See also <a href="/stat?c=problem_solution&rm=247505&rd=8083&pm=6017&cr=144400">tomek's</a> as for a solution written during the contest.
</p><div class="authorPhoto">
    <img src="/i/m/ged_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10505830" context="algorithm"/><br />
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
