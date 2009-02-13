<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:import href="../top.xsl"/>
 <xsl:import href="../script.xsl"/>
 <xsl:import href="../includes/body_top.xsl"/>
 <xsl:import href="../foot.xsl"/>
 <xsl:import href="../includes/modules/srm_results.xsl"/>
 <xsl:import href="../includes/modules/white_last_srm.xsl"/>
 <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
 <xsl:import href="../includes/modules/coder_week2.xsl"/>
 <xsl:import href="../includes/modules/practice_room.xsl"/>
 <xsl:import href="../includes/modules/calendar.xsl"/>
 <xsl:import href="../includes/modules/top_room_wins.xsl"/>
 <xsl:import href="../includes/global_left.xsl"/>
 <xsl:import href="../includes/public_right_col.xsl"/>
 <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
 <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/> 

<title>Single Round Match 246 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">

<!-- Left Column Begins -->
    <td width="170" bgcolor="#FFFFFF">
       <xsl:call-template name="global_left"/>
    </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
    <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
    <td class="bodyText" width="100%">
       <xsl:call-template name="BodyTop">
          <xsl:with-param name="image1">white</xsl:with-param>
          <xsl:with-param name="image">statisticsw</xsl:with-param>
          <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
       </xsl:call-template>

       <table border="0" cellspacing="10" cellpadding="0" width="100%">
       <tr valign="top">
             <td class="bodyText" width="100%">

<!--body contextual links-->
                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                   <tr valign="middle">
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 246</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Thursday, June 9, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>This problem set was pretty easy. Some coders completed their work in 20 minutes.  
There was a long list of contestants with 
a complete set of problems after 40 minutes and at the end of the contest 86.15% of coders had submitted the hardest task.
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
<A href="Javascript:openProblemRating(4469)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
<A href="Javascript:openProblemRating(4562)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
<A href="Javascript:openProblemRating(4472)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
<A href="Javascript:openProblemRating(4470)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
<A href="Javascript:openProblemRating(4519)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=7485898"><strong>Andrew_Lazarev</strong></a><br />
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
