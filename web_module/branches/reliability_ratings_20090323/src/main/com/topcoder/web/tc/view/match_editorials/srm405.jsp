<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 405 Problem Set &amp; Analysis</title>

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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=12177">Match Overview</a><br />
    <tc-webtag:forumLink forumID="521576" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 405</span><br />Saturday, June 14, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
<tc-webtag:handle coderId="10574855" context="algorithm"/>'s match appeared to be much easier than his previous matches - a whopping total of 
3 coders solved the hard problem in Division 1. 
<tc-webtag:handle coderId="22675302" context="algorithm"/> won the round, with 
<tc-webtag:handle coderId="22662797" context="algorithm"/> and
<tc-webtag:handle coderId="22682264" context="algorithm"/> rounding the top 3.
In Division 2, newcomer <tc-webtag:handle coderId="22705757" context="algorithm"/> destroyed 
the opponents, winning by 300+ points. 
<tc-webtag:handle coderId="22672953" context="algorithm"/>
and <tc-webtag:handle coderId="22732902" context="algorithm"/> 
were next 2 finishers, with 
<tc-webtag:handle coderId="22732902" context="algorithm"/>
and
<tc-webtag:handle coderId="22690459" context="algorithm"/>
finishing a half-step ahead of a very close group.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9761&amp;rd=12177" name="9761">FallingFactorialPower</a></b> 
</font> 
<A href="Javascript:openProblemRating(9761)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521576" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      860 / 912 (94.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      795 / 860 (92.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>catcher</b> for 249.29 points (1 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208.44 (for 795 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
For this problem, the solution was just an implementation of the described algorithm: 
check whether k is positive and 
apply the corresponding operation:
<pre>
  public double compute (int n, int k) {
    double res = 1;
    if (k &gt;= 0) 
        for (int i = 0; i &lt; k; i++) res *= n - i;
    else
        for (int i = 0; i &lt; -k; i++) res /= n + i + 1;
    return res;
  }
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9760&amp;rd=12177" name="9760">RelativePath</a></b> 
</font> 
<A href="Javascript:openProblemRating(9760)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521576" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      655 / 912 (71.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      303 / 655 (46.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>BigGameHunters</b> for 470.26 points (7 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      299.50 (for 303 correct submissions) 
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
      626 / 645 (97.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      448 / 626 (71.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Giorgi</b> for 246.51 points (3 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189.17 (for 448 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>

The shortest relative path from current directory to a file can be built using the following
algorithm. First, we need to find a directory, which is a common parent of both 
current directory and file, and is the furthest from root among all such directories.
To find that, we will split boths paths using '/' as the delimiter. Then, 
we start from the first element for both paths and discard them until they become different:
<pre>
   public String makeRelative(String path, String currentDir) {
    String[] p = path.split("/");
    String[] s = currentDir.split("/");
    int n1 = 0;
    while (n1 &lt; p.length &amp;&amp; n1 &lt; s.length &amp;&amp; p[n1].equals(s[n1]))
        n1++;
...
</pre>
The best path will be moving level above until we reached that directory, and then go down
until we find the file:
</p>
<pre>
...
    int n2 = n1;
    String ans = "";
    while (n2 &lt; s.length)
        if (s[n2++].length() &gt; 0)
            ans += "../";
    while (n1 &lt; p.length)
        if (p[n1++].length() &gt; 0)
            ans += p[n1 - 1] + "/";
    return ans.substring(0, ans.length() - 1);
}
</pre>
<p>
Checking if the corresponding element is non-empty is necessary because of a specific behavior of String.split() method 
(remove that check and try this solution against input with currentDir = "/").
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9757&amp;rd=12177" name="9757">IdealString</a></b> 
</font> 
<A href="Javascript:openProblemRating(9757)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521576" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      109 / 912 (11.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 109 (17.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>cryinlaugh</b> for 733.98 points (18 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      541.01 (for 19 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
For the purposes of this editorial, <i>"ideal string"</i> will mean <i>"ideal string of length L"</i>.
A string P is <i>good</i> if there is an ideal string S, such
that P is a prefix of S. If there is not such ideal string S,
string P is <i>bad</i>.
</p>
<p>

Like in many other problems asking for a lexicographically smallest string or array, 
the solution for this one uses greedy approach.
We will select characters from left to right one by one, checking on each step whether 
we'll be able to construct the string of necessary length. To make sure we are using
each letter proper number of times, we'll counters for all letters used. 
Taking into account
that it never helps to use B before A, we will add letters to the answer 
in the alphabetical order:
<pre>
    public String construct(int L) {
        String ans = "";
        int nxt = 0; // the next letter which will be introduced. 
                         // 0 corresponds to 'A', 1 - to 'B', and so on
        int[] have = new int[26]; 
            // The i-th element of have is equal to the number of times the 
            // i-th letter must be used until the end of the string.
        while (ans.length() &lt; L) {
            boolean ok = false; 
            // we still haven't found a way to construct an ideal string
            for (int i = 0; i &lt; nxt; i++) 
            // If it is possible to add a previously used letter to the answer
            // and construct an ideal string, we'll do that
                        if (ok = (have[i] &gt; 0 &amp;&amp; CanConstruct(unknown params)) {
                have[i]--;
                ans += (char)('A' + i);
                break;
            }
            if (ok) 
                continue;
            // Now, we will try to add a new letter to the answer
            ans += (char)('A' + nxt++);
            // If we still can not construct a valid string, 
            // then it is not possible at all.
            if (!can(ans.length(), CanConstruct(unknown params)))
                return "";
        }
        return ans;
    }
</pre>
</p>
<p>
The most difficult part of the solution is method CanConstruct(), which is to determine 
whether the current prefix (<b>ans</b> in our code) is good.
The easiest way of implementing it is the following: try all letters from 'A' to 'Z',
throw out the letters which already be used a proper amount of times (if a letter 'C' first appeared
on the second position, and it was already used 2 times, then we can not use it anymore),
append remaining letters to the current prefix ans. If at least one of those new prefixes is good, 
then prefix ans is also good. This looks like a nice Dynamic Programming solution,
but there is an issue - there are too many prefixes to represent each of them as a state of a 
DP program.
</p>
<p>
Luckily, we can notice that prefix "ABCDBCD" is good if and only if prefix "ABCDDCB" is 
also good (because the order of the last 3 letters doesn't really matter in terms of "goodness" of a prefix).
We'll try to unite prefixes into groups, with each groups representing prefixes
which all either all good or all bad, and run a DP solution which state will be a group
of prefixes, instead of a single prefix.
And to unite prefixes in groups, we need to find
which properties of a prefix matter in terms of goodness, and which are not.
</p>
<p>
The most obvious meaningful property of a prefix is its length - 
if we'll need to append a 'new' letter L to the prefix, the length
of the prefix will determine the total number of occurences of letter L.

Other meaningful params are: the number of different letters used and the number of times
each of those letters appeared in the prefix. 
Fortunately, since the maximal input length is small (100), so the total number
of letters used does not matter - if we run out of letters, we will definitely need a much longer string.
So we are left with 2 params - the length of a prefix (an integer),
and the number of times we'll need to use letters which are already
in the word (an array of ints). This is still way too many states, but we 
can notice that arrays {0, 1, 2} and {0, 2, 1} are not really different - 
for example, prefix "ABC" can be extended to multiple ideal stringû of length 6 ("ABCBCC",
"ABCCCB" and "ABCCBC"). In other words, the parameter which determines if a prefix is good
is the grand total number of "non-used" occurences of already present letters (3 for "ABC", 1 for "ABCBC").
Now we cut the space enough - we know that each prefix is good or bad depending on
its length (an integer not greater than 100) and the total number of non-used appearences
of the used letters (ditto, because the prefix with more than 100 non-used appearences
definitely can NOT be extended to an ideal string of length less than 100).
</p>
<p>
The implementation of the DP is quite classical:
</p>
<pre>
    boolean canConstruct(int len, int left) {
        if (left &lt; 0) // invalid input
            return false;
        if (len == L) 
        // if we a prefix is of necessary length, then we don't need any more letters
            return left == 0;
        if (left + len &gt; L) // is already too long
            return false;
        if (memo[len][left] != -1) // if we already found the answer for this state
            return memo[len][left] == 1;
        // can construct an ideal string using a 'new' letter
        if ((canConstruct(len + 1, left + len)) ||  
        // or can construct an ideal string using an 'old' letter
            (left &gt; 0 &amp;&amp; canConstruct(len + 1, left - 1))) {
            memo[len][left] = 1;
            return true;
        }
        memo[len][left] = 0;
        return false;
    }
</pre>
<p>
Using all the information we've found about ideal strings, we can make our solution much prettier:
</p>
<pre>
public class IdealString {
    int L;
    int[][] memo; 
    public String construct(int L) {
        this.L = L;
        String ans = "";
        int nxt = 0;
        Queue&lt;Character&gt; q = new LinkedList();
        memo = new int[L + 1][L + 1];
        while (ans.length() &lt; L) {
            if (can(ans.length() + 1, q.size() - 1)) {
                ans += q.poll();
                continue;
            }
            char c = (char)('A' + nxt++);
            for (int i = 0; i &lt; ans.length(); i++)
                q.add(c);
            ans += c;
            if (!can(ans.length(), q.size()))
                return "";
        }
        return ans;
    }
    boolean can(int len, int left) {
        if (left &lt; 0)
            return false;
        if (len == L)
            return left == 0;
        if (left + len &gt; L)
            return false;
        if (memo[len][left] != 0)
            return memo[len][left] == 1;
        if ((can(len + 1, left + len)) || (left &gt; 0 &amp;&amp; can(len + 1, left - 1))) {
            memo[len][left] = 1;
            return true;
        }
        memo[len][left] = 2;
        return false;
    }
}



</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9764&amp;rd=12177" name="9764">AllCycleLengths</a></b> 
</font> 
<A href="Javascript:openProblemRating(9764)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521576" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      287 / 645 (44.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 287 (28.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 443.28 points (10 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      263.68 (for 82 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The major part of this problem is to estimate (or to believe) that the
answer will not be very long (<a href="http://forums.topcoder.com/?module=Thread&threadID=616249">our forums</a> already have the proof for that).
Once you have that, you iterate through all vertices and for each vertex i:
</p>
<ol>
<li>Create list A of vertices.</li>
<li>Add vertex i to that list.</li>
<li>Create a new list B, containing all vertices directly accessible from 
at least one vertex which was in list A.</li>
<li>Replace list A with list B.</li>
<li>If list A contains vertex i, then append '1' to answer. Otherwise, append '0'.</li>
<li>If we've completed less than 1000 cycles, return to point 3.</li>
</ol>
<p>
Having that done for all vertices, we merge all output sequences to one sequence, 
which has '1' as the i-th character if at least one of the initial sequences had '1' as 
the i-th character. Now we need to find the shortest representation of this sequence.
This task also becomes easy as soon as we remember that the length of the period can 
not be longer than 50 - check all possible start positions of the 
period X, and for all L between 1 and 50 we check whether 
we can represent the answer as the prefix of length X + period of length L starting at position X.
We iterate for X from 0 to infinity and for L from 1 to 50, and return the first answer
we'll get.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9744&amp;rd=12177" name="9744">ReasonableOdds</a></b> 
</font> 
<A href="Javascript:openProblemRating(9744)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521576" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      57 / 645 (8.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 57 (5.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tos</b> for 580.57 points (29 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      507.73 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote>
<p>
Let x be the unknown skill of the first team, and y be the skill of the second team. Note that, given x and y, it's not hard to calculate the probabilities of winning for each of the
teams and the probability of a draw. For example, to calculate the probability of winning for the first team we can iterate through all possible outcomes A:B, where 0 &le; B &lt; A &le; <b>k</b>,
and sum the values x<sup>A</sup> * (1 - x)<sup><b>k</b> - A</sup> * C(<b>k</b>, A) * y<sup>B</sup> * (1 - y)<sup><b>k</b> - B</sup> * C(<b>k</b>, B). Each
such value is the probability of the outcome A:B. To clarify
this, note that x<sup>A</sup> * (1 - x)<sup><b>k</b> - A</sup> gives us the probability for the first team to score exactly in given A shots, and
the binomial coefficient C(<b>k</b>, A) gives the number of ways to choose this
A shots among all <b>k</b> shots (if you are not familiar with binomial coefficients, please check this
<a href="/tc?module=Static&d1=tutorials&d2=combinatorics">tutorial</a>).
</p>
<p>
If we denote the probability of winning for the first team as F(x, y) and the probability of winning for the second team as G(x, y), then we'll need to check whether the following
system of equations have a solution:
<pre>
F(x, y) = <b>p1</b>
G(x, y) = <b>p2</b>
</pre>
</p>
<p>
The problem reduces to choosing some searching method in order to solve this system of equations. As it appears, the functions F(x, y) and G(x, y) have a number of special properties which allow to
use different search algorithms to solve this problem. Here's one such algorithm:
</p>
<pre>
set x = 0, y = 0
repeat many times:
    find x' such that F(x', y) = <b>p1</b> and set x = x'
    find y' such that G(x, y') = <b>p2</b> and set y = y'
</pre>
<p>
This algorithm is based on the following property: if F(x1, y1) = F(x2, y2), then x1 &le; x2 if and only if y1 &le; y2. The proof is very intuitive. If two teams had skills x1 and y1, and the skill of
the first team increased to x2, then the skill of the second team also should be increased in order to maintain the same winning probability for the first team. Similarly, if the skill level
of the second team increased to y2, then the skill of the first team also needs to increased. Obviously, the same property holds for the function G.
</p>
<p>
Now, suppose that our system has a solution x<sup>*</sup>, y<sup>*</sup>. Using induction, we can show that at any moment in our algorithm x &le; x<sup>*</sup> and
y &le; y<sup>*</sup>. Both inequalities
hold at the beginning. The inequality y &le; y* holds, when we change x to x'. As F(x', y) = F(x*, y*) = <b>p1</b>, there should be x' &le; x<sup>*</sup>. Similarly, the inequality x &le; x* holds,
when we change y to y'. As G(x, y') = <b>p2</b>, there should be y' &le; y<sup>*</sup>.
</p>
<p>
Another useful fact that can also be proven by induction is that we never decrease the values of x and y during this algorithm. At the beginning of the cycle, F(x, y) &le; <b>p1</b> and
G(x, y) &le; <b>p2</b>. We therefore need to increase x to make F(x, y) = <b>p1</b>. Increasing of x causes decreasing of G(x, y), therefore we will then need to increase y to
obtain G(x, y) = <b>p2</b>. Increasing of y causes decreasing of F(x, y) and we will need again to increase x, and so on.
</p>
<p>
So, as x and y always increase and at every time x &le; x<sup>*</sup>, y &le; y<sup>*</sup>, x and y should become closer and closer to x<sup>*</sup> and y<sup>*</sup>.
The only remaining question is the speed of convergence. It's actually not an easy question, but fortunately the functions F and G are quite special and point (x, y) converges to
(x<sup>*</sup>, y<sup>*</sup>) pretty fast. It allows to use the following approach. If after some many steps we have a point (x, y) such that F(x, y) and G(x, y) are within a very small
EPS of <b>p1</b> and <b>p2</b>, answer "YES", otherwise answer "NO". One final note is that searching for x' and y' can be done with usual dichotomy as functions F and G are
monotonic by any variable given that the other variable is fixed.
</p>
<p>
See the <tc-webtag:handle coderId="22675302" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=297620&rd=12177&pm=9744&cr=22675302">solution</a> for an example of implementation of this
approach.
</p>
<p>
As a conclusion, let's give 3 more special facts about functions F and G, which can be used to construct other search algorithms for this problem.
The first of these facts is not hard to prove, but for the other two there seem to be no easy proof.
</p>
<p>
<ol>
<li>F(x, y) = G(y, x) = G(1 - x, 1 - y) = F(1 - y, 1 - x).</li>
<li>The function 1 - F(x, y) - G(x, y) (i.e. the probability of a draw) is bimonotonic. That means, if one of variables is fixed, it first increases by the other variable and then decreases.</li>
<li>The curves F(x, y) = const are convex. The curves G(x, y) = const are concave.</li>
</ol>
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />&#160;<img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/>&#160;&amp;&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
    <em>TopCoder Members</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
