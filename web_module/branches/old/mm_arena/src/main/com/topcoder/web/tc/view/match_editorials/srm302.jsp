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
<tc-webtag:forumLink forumID="505868" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 302</span><br>Thursday, May 11, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
This contest was held just one and a half day after <a href="/tc?module=Static&d1=match_editorials&d2=srm301">the previous SRM</a> &mdash; 
nevertheless the number of the participants was pretty high. 
Russian coders put on an excellent performance, getting five of 
the top 10 places, including first and second. 
<b>andrewzta</b> proved his right to wear the new target sign he got after the 
last SRM and won the Division 1. Second place went to <b>Petr</b>, who 
scored most in the first and third problems. Third was <b>Ying</b> from China.
</p>
<p>
In Division 2 many participants successfully solved the first and second problems. The third also had a fairly 
high success rate. The division leaders are <b>thecompknight</b>, <b>Vadimmer</b>, and <b>atlas_ding</b>.
</p>

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&pm=6375&rd=9823" name="6375">NounReform</a></b> 
</font> 
<A href="Javascript:openProblemRating(6375)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList forumID=505868" CLASS="statText"><img
src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      322 / 354 (90.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      258 / 322 (80.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>andres14bc</b> for 244.71 points (4 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192.16 (for 258 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
In this problem you just need to do what is written in the problem statement.
Here is the sample solution:
<pre>
public class NounReform {
    static final String[] rule1 = new String[]{"s", "z", "x", "ch", "sh"};
    static final String[] rule2 = new String[]{"ay", "ey", "iy", "oy", "uy"};

    public String[] makePlural(String[] nouns) {
        List&lt;String&gt; result = new ArrayList&lt;String&gt;();
        for (String s : nouns) {
            result.add(reform(s));
        }
        return result.toArray(new String[0]);
    }

    private String reform(String noun) {
        for (String s : rule1) {
            if (noun.endsWith(s)) return noun + "es";
        }
        for (String s : rule2) {
            if (noun.endsWith(s)) return noun + "s";
        }
        if (noun.endsWith("y")) return noun.substring(0, noun.length() - 1) + "ies";
        return noun + "s";
    }
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&pm=6387&rd=9823" name="6387">XBallGame</a></b> 
</font> 
<A href="Javascript:openProblemRating(6387)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList forumID=505868" CLASS="statText"><img
src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      244 / 354 (68.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205 / 244 (84.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>zein</b> for 472.26 points (6 mins 57 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      324.75 (for 205 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>

This problem as well is pretty straightforward. 
You just need to rebuild the statistics thoroughly following rules from the problem statement. 
Here is the sample solution:

<pre>
    public String[] newStatistics(String[] placeboard) {
        List&lt;String&gt; result = new ArrayList&lt;String&gt;();
        for (String s : placeboard) {
            String player = s.substring(0, s.length() - 2);
            String position = s.substring(s.length() - 2);
            List&lt;String&gt; tail = new ArrayList&lt;String&gt;();
            for (String s1 : placeboard) {
                if (s1.startsWith(player)) {
                    tail.add(s1.substring(s1.length() - 2));
                }
            }
            tail.remove(position);
            Collections.sort(tail);
            for (String s1 : tail) {
                position += "," + s1;
            }
            result.add(player + position);
        }
        return result.toArray(new String[0]);
    }
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&pm=6186&rd=9823" name="6186">DivisorInc</a></b> 
</font> 
<A href="Javascript:openProblemRating(6186)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList forumID=505868" CLASS="statText"><img
src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      46 / 354 (12.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      18 / 46 (39.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tsjoker</b> for 841.08 points (7 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      568.23 (for 18 correct submissions) 
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
      196 / 300 (65.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178 / 196 (90.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 246.90 points (3 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      194.07 (for 178 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>
Let's build a graph where vertices are numbers from <b>N</b> to <b>M</b> 
and there is an edge from vertex v1 to vertex v2 if v2 can be 
obtained from v1 using exactly one operation from the problem statement. 
To solve the problem you just need find the shortest path from the vertex <b>N</b> 
to the vertex <b>M</b> in this graph. 
This can be done using <a href="http://en.wikipedia.org/wiki/Breadth-first_search">breadth first search</a> algorithm. 
</p>

<p>
The subtask of the finding of all natural divisors of a number K can be solved 
using O(sqrt(K)) operations (each divisor p greater than 
sqrt(K) has one correpsonding divisor K/p less than sqrt(K)). 
</p>

</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&pm=6184&rd=9823" name="6184">IntegerPalindrome</a></b> 
</font> 
<A href="Javascript:openProblemRating(6184)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList forumID=505868" CLASS="statText"><img
src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      176 / 300 (58.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      140 / 176 (79.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Revenger</b> for 488.22 points (4 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      330.22 (for 140 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>

<p>
<p>
Let's call <i>left part</i> of a number (L + 1) / 2 leftmost digits of the number, 
where L is the length of this number. The <i>left part</i> of the palindrome 
unambiguously defines the whole palindrome and vice versa. 
</p>
<p>
Let's note that for a given length N the number of the <i>left parts</i> for the numbers of 
this length is 9*10<sup>(N-1)/2</sup>, because the leftmost digit cannot be equal to zero. 
Therefore the number of the palindromes of the length N is also 9*10<sup>(N-1)/2</sup>.
</p>
<p>
So we can easily find the 
length of the <b>K</b>-th palindrome and its position P among 
the palindromes of this length.
Note, that if two palindromes have a same length and the <i>left part</i> of one 
palindrome is less than the <i>left part</i> of another palindrome, the same is true 
and for the palindromes themself. 
Thus the <i>left part</i> of the desired palindrome will be 10<sup>(N-1)/2</sup> + P. And the hole 
palindrome can be reconstructed by its <i>left part</i>.
</p>
</p>

<p>
Here is the sample solution:
</p>

<pre>
public class IntegerPalindrome {
     public long findByIndex(int K) {
        int k = K;
        for(int len = 0; len &lt;=10; len++) {
            for(int add=0; add&lt;=1; add++) {
                long total = getTotal(len, add);
                if (k &gt;= total) {
                    k -= total;
                } else {
                    return generatePalindrome(len, add, k);
                }
            }
        }
        return 0;
    }

    private long getTotal(int len, int add) {
        if (len+add == 0 ) return 0;
        long res = 9;
        for(int i=0; i&lt;len+add-1; i++)
            res *= 10;
        return res;
    }

    private long generatePalindrome(int len, int add, int k) {
        StringBuffer buffer = new StringBuffer();
        for(int i=0; i &lt; len+add-1; i++) {
            buffer.append(k % 10);
            k /= 10;
        }
        buffer.append(k+1);
        String s = buffer.reverse().toString();
        s = s + new StringBuffer(s.substring(0, s.length() - add)).reverse().toString();
        return Long.parseLong(s);
    }
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&pm=6215&rd=9823" name="6215">JoinedString</a></b> 
</font> 
<A href="Javascript:openProblemRating(6215)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList forumID=505868" CLASS="statText"><img
src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      45 / 300 (15.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 45 (26.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 690.02 points (16 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      525.92 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>
This task can be solved using the dynamic programming technique.
First let's remove all the words which are the part of some other 
word from the given array. Clearly, if we have a part of 
the string written, and we want to add some word to the 
end of this string, we should use as many characters from 
the end of the string as the prefix of the word as possible. 
</p>
<p>
Let A(subset of <b>words</b> S, last used word W) be the shortest 
string containing all words from S and tailing with the word W. 
A(S, W) can be calculated by iterating through all the 
words T<sub>i</sub> from S and adding the necessary number 
of characters to A(S - W, T<sub>i</sub>). 
Holding only the last word is sufficient, because no word is a substring 
of another word after the first step of the solution.
</p>
<p>
You can look at the <b>Petr</b>'s solution as reference.
</p><div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
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
