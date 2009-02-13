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
<tc-webtag:forumLink forumID="505737" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 246</span><br>Thursday, June 9, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>This problem set was pretty easy. Some coders completed their work in 20 minutes.  
There was a long list of contestants with a complete set of problems after 40 minutes and at the end of the contest 86.15% of coders had submitted the hardest task.
But only 36.18% of div1-hard solutions were correct. <b>Im2Good</b>, who made 12 successful challenges, won this match and became the <A href="/stat?&amp;c=highest_totals&amp;dn=1">Highest Match Total</A> champion (a
title that hasn't changed since 05.08.01). <b>misof</b> and <b>jdmetz</b> took second and third.
</p>
<p>
In the division 2, <b>korntest</b> was first, followed by <b>p45c4l</b> and <b>titid_gede</b> who took 
second and third.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4469&amp;rd=7221" name="4469">CalcTest</a></b>
</font>
<A href="Javascript:openProblemRating(4469)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505737" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      243 / 268 (90.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      209 / 243 (86.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>a2nnu</b> for 249.92 points (0 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      210.70 (for 209 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>The most elegant solution for this problem uses regular-expressions. Here is a sample Java submission:</p>
<pre>
for (int i = 0; i &lt; numbers.length; i++) 
    numbers[i] = numbers[i].replaceAll(" ","").replaceAll("[^0-9]",".");
return numbers;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4562&amp;rd=7221" name="4562">Conglutination</a></b>
</font>
<A href="Javascript:openProblemRating(4562)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505737" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      400
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      223 / 268 (83.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      88 / 223 (39.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>korntest</b> for 390.85 points (4 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      297.17 (for 88 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>There are at most 19 split points. We can try all of them and choose one with the smallest A value (if any). 
Here is a sample Java submission:</p>
<pre>
for (int i = 1; i &lt; conglutination.length(); i++) {
    int A = strToInt(conglutination.substring(0,i)); 
    int B = strToInt(conglutination.substring(i));
    if (A &gt;= 0 &amp;&amp; B &gt;= 0 &amp;&amp; A + B == expectation) 
        return conglutination.substring(0,i) + "+" + conglutination.substring(i);
} 
return "";
</pre>
<p>
The only trick is that <code>strToInt</code> should return negative results for strings that represent 
integers greater than <code>expectation</code>.
</p>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4472&amp;rd=7221" name="4472">CalcButton</a></b>
</font>
<A href="Javascript:openProblemRating(4472)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505737" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      162 / 268 (60.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      16 / 162 (9.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>DarkSolver</b> for 859.35 points (11 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      650.36 (for 16 correct submissions)
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
      226 / 231 (97.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      107 / 226 (47.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 484.94 points (5 mins 2 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      391.96 (for 107 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>There are only 1000 different buttons and we can test all of them. If we know the digits 
on the button how many clicks are required for typing the sequence? The secret is easy: if the next 
three digits in the sequence equals to the corresponding button's digits, we should 
click three-digit button. The result will be optimal. Here is a sample Java submission:</p>
<pre>
//merge sequence into char array s
...
String ans = "";
int bestRes = s.length + 1;
for (char ch1='0';ch1&lt;='9';ch1++)
    for (char ch2='0';ch2&lt;='9';ch2++)
        for (char ch3='0';ch3&lt;='9';ch3++) {
            int curRes = 0;
            int index = 0;
            while (index &lt; s.length) {
                if (index + 2 &lt; s.length  &amp;&amp; s[index] == ch1 &amp;&amp; 
                    s[index + 1] == ch2 &amp;&amp; s[index + 2] == ch3) {
                    index += 3;
                } else {
                    index += 1;
                }
                curRes += 1;
            }
            if (curRes &lt; bestRes) {
                bestRes = curRes;
                ans = "" + ch1 + ch2 + ch3;
            }
        }
return ans;
</pre>
<p>Some coders (for example Im2Good, John Dethridge...) used dynamic programming to obtain 
the required amount of clicks. This solution is also correct.</p>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4470&amp;rd=7221" name="4470">PiCalculator</a></b>
</font>
<A href="Javascript:openProblemRating(4470)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505737" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      229 / 231 (99.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      191 / 229 (83.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 248.37 points (2 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      206.90 (for 191 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>For solving this problem we should manually round the value of &#928;. Note contains several 
first &#928; value digits and this amount is enough for solving this problem. 
Here is a sample Java submission:</p>
<pre>        
byte[] pi = "3.141592653589793238462643383279".getBytes();
if (pi[precision + 2] &gt; '4')
    pi[precision + 1]++;
int index = precision;
while (pi[index + 1] &gt; '9') {
    pi[index + 1] = (byte)'0';
    pi[index]++;
    index--;
}

return new String(pi, 0, precision + 2);
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4519&amp;rd=7221" name="4519">CalcRoot</a></b>
</font>
<A href="Javascript:openProblemRating(4519)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505737" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      199 / 231 (86.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      72 / 199 (36.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Krzysan</b> for 978.74 points (4 mins 12 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      739.29 (for 72 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>There are at most 1000 possible denominators. We can try all of them. If we know a denominator B, 
a numerator A of the closest fraction can be easily found using the following formula:
</p>
<pre>
A = round(B * sqrt(N))
</pre>
<p>After that we can compare the obtained fraction with the currently best fraction and update it if 
needed. Where is the trick? The trick in the phrase "we can compare obtained fraction with the currently 
best fraction" because we can't do it in a usual way:</p>
<pre>
if (abs(A<sub>1</sub>/B<sub>1</sub> - sqrt(N)) &lt; abs(A<sub>2</sub>/B<sub>2</sub> - sqrt(N)))
    ...
</pre>
<p>The standard double type does not provide the required precision.</p>
<p>So, let's solve the following problem. There are two fractions A<sub>1</sub>/B<sub>1</sub> and A<sub>2</sub>/B<sub>2</sub>. Which of them is 
closer to sqrt(N)? Let A<sub>2</sub>/B<sub>2</sub> be greater than A<sub>1</sub>/B<sub>1</sub>. If A<sub>2</sub>/B<sub>2</sub> less than sqrt(N) or A<sub>1</sub>/B<sub>1</sub> greater than sqrt(N) 
when the closest fraction is obvious (A<sub>2</sub>/B<sub>2</sub> in the first case, A<sub>1</sub>/B<sub>1</sub> in the second). So we can assume that</p>
<pre>
A<sub>1</sub>/B<sub>1</sub> &lt; sqrt(N) &lt; A<sub>2</sub>/B<sub>2</sub>.
</pre>
<p>In this case the fraction A<sub>1</sub>/B<sub>1</sub> is closer to sqrt(N) if and only if</p>
<pre>
sqrt(N) - A<sub>1</sub>/B<sub>1</sub> &lt; A<sub>2</sub>/B<sub>2</sub> - sqrt(N)
</pre>
<p>And after a number of manipulations:</p>
<pre>
4*N*(B<sub>1</sub>*B<sub>2</sub>)<sup>2</sup> &lt; (A<sub>1</sub>*B<sub>2</sub>+A<sub>2</sub>*B<sub>1</sub>)<sup>2</sup>
</pre>
<p>All described calculation can be done within 64bit integers.</p>
<p>Some coders was searching for the closest fraction minimizing <code>abs((A/B)<sup>2</sup> - N)</code> function. 
In the problem limitations this solution is also possible.</p>



<p>
<img src="/i/m/Andrew_Lazarev_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
