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
<tc-webtag:forumLink forumID="505606" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Open <br> Online Round 1</span><BR/>Wednesday, October 15, 2003
<br><br>

<span class="bigTitle">Summary</span>

<p>
Those who hesitated were lost as nearly 500 of TopCoder's best jockeyed
for position in the first elimination round of the 2003 Open. Nine out of
ten contestants made Level One and Level Two submissions, but only one out
of four went on to complete a Level Three problem that asked for a
simulation of orbiting planets. It was evident that Newtonian physics
posed no obstacle for <b>reid</b>, <b>WishingBone</b>, and <b>bmerry</b>,
who led their respective rooms with scores over 1400 when the coding
phase drew to a close. <b>WishingBone</b> reaped 100 more points during
the challenge phase, giving him the victory in this early skirmish.
</p>

<p>
Although the leader board was thronged with coders from the red and yellow 
portions of the rating spectrum, blue coders <b>port6000</b>,
<b>fiveEasyPieces</b>, and <b>TheFaxman</b> were room winners, along with Division 2 veteran 
<b>irulet</b>. With so many agile minds solving the Level One and Level Two problems, rapid submission times
made all the difference. The quick thinkers who made the cut can look
forward to increasingly profound challenges in coming weeks. The rest
will watch with keen interest from the sidelines and plot a
spectacular comeback in some future match.
</p>

<H1>The Problems</H1>

<font size="+2"><b>PowSum</b></font>
<A href="Javascript:openProblemRating(1821)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505606" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      454 / 460 (98.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      417 / 454 (91.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>hamster</b> for 249.47 points (1 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      234.80 (for 417 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
We are asked to take each integer in a given range, raise it to every
power from one to a given limit, and compute the sum of the whole
lot. A solution can be rendered in pseudocode as follows, where <i>**</i>
is the exponentiation operator.
</p>

<pre>
def powsum(low, high, pow):
    tot = 0
    for i in range(low, high+1):
        for j in range(1, pow+1):
            tot += i**j
    return tot
</pre>

<p>
This doesn't tell the whole story, however, if we're using a programming
language that restricts the size of integers. If this function were
implemented in C++ using 32-bit signed integer variables but with the
incremental calculation
</p>

<pre>
tot += (int) pow((double) i, (double) j);
</pre>

<p>
then the value of <i>i**j</i> would overflow in an ugly way and produce an
incorrect answer.
</p>

<p>
The problem statement guarantees that the final result will fit into a 32-bit signed
integer. Such an integer may only have a value between -2**31 =
-2147483648 and 2**31-1 = 2147483647, inclusive. This is not necessarily true for the intermediate results.
</p>

<p>
Consider the case where <i>low</i>, <i>high</i>, and <i>power</i> are
respectively -11, 10, and 9. For <i>i</i> = -11 and <i>j</i> = 9, we
have <i>i**j</i> = -2357947691, which is less than the lower bound of a
32-bit signed integer. If such a value is represented as a <i>double</i>
and cast to an <i>int</i>, its value becomes simply -2147483648, throwing
off the final result by 2357947691-2147483648 = 210464043.
</p>

<p>
A correct and very cautious approach is to carry
out the exponentiation using 64-bit integers, which easily accommodate
the intermediate results of our calculation. The following will do the trick.
</p>

<pre>
def powsum(low, high, pow):
    tot = 0
    for i in range(low, high+1):
        m = 1
        for j in range(1, pow+1):
            m *= i
            tot += m
    return tot
</pre>

<p>
Then again, thanks to the properties of modulo arithmetic, this
pseudocode yields correct results when implemented with 32-bit unsigned or signed integers. Consider, for 
example, that (x mod b + y mod b) mod b = (x + y) mod b. Full proof is left as an exercise for the reader.
</p>

<p>
Another way to preserve adequate precision is to implement the
earlier version with
</p>

<pre>
tot += (long long) pow((double) i, (double) j);
</pre>

<p>
so that the result of the exponentiation is first stored as a 64-bit
integer and subsequently cast, with proper overflow, to 32 bits.
</p>


<font size="+2">
<b>Logger</b>
</font>
<A href="Javascript:openProblemRating(1816)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505606" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      435 / 460 (94.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      370 / 435 (85.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ZorbaTHut</b> for 477.98 points (6 mins 9 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      359.64 (for 370 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>
We iterate over the messages in order, deciding to log each one only if
its priority is equal to or greater than the minimum logging priority. A
priority is a pair of values, the first of which is a string, while the
second is an integer. If we say that the minimum logging priority is
<i>(s_min, i_min)</i>, it can be compared with an arbitrary priority
<i>(s, i)</i> in the following manner.
</p>

<p>
If <i>s</i> occurs later in the precedence vector than <i>s_min</i>,
the given priority clearly exceeds the minimum, so we may disregard
the integer values. If <i>s</i> occurs earlier in the precedence vector than
<i>s_min</i>, the given priority falls well below the minimum.
</p>

<p>
But if <i>s</i> matches <i>s_min</i>, the integers are decisive. In such a case,
the given priority meets the threshold only if <i>i</i> is at least as great
as <i>i_min</i>.
</p>

<p>
Pseudocode follows. First comes a helper function for parsing priority
strings, and then the main function.
</p>

<pre>
def split_priority(priority):
    tokens = priority.split()
    s = tokens[0].lower()
    i = 0
    if (len(tokens) &gt; 1):
        i = int(tokens[1])
    return (s, i)

def logger(messages, priorities, precedence, priority_min):
    (s_min, i_min) = split_priority(priority_min)
    s_lookup = {}
    for i in range(len(precedence)):
        s_lookup[precedence[i].lower()] = i
    log = []
    for j in range(len(messages)):
        (s, i) = split_priority(priorities[j])
        if s_lookup[s] &gt; s_lookup[s_min]:
            log.append(messages[j])
            continue
        if s_lookup[s] &lt; s_lookup[s_min]:
            continue
        if i &gt;= i_min:
            log.append(messages[j])
    return log
</pre>

<p>
Notice that because priorities are case-insensitive, we render <i>s</i>,
<i>s_min</i>, and the contents of <i>precedence</i> in lower case. We
store the precedence strings in an associative array (also known as a
map or a hash) for ease of lookup and comparison.
</p>

<font size="+2">
<b>Planets</b>
</font>
<A href="Javascript:openProblemRating(1522)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505606" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      109 / 460 (23.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      57 / 109 (52.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>reid</b> for 768.25 points (16 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      496.58 (for 57 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>
The problem statement supplies formulas with which we are to implement
a crude simulation, leaving to us the details of handling the vectors
and formatting the output.
</p>

<p>
We recall from Cartesian geometry that the distance between two points in
space <i>(x0, y0, z0)</i> and <i>(x1, y1, z1)</i> may be obtained by calculating the
component-wise differences <i>xd=x1-x0</i>, <i>yd=y1-y0</i>, <i>zd=z1-z0</i> and taking the
square root of <i>xd*xd+yd*yd+zd*zd</i>. To see why this makes sense, observe
that an analogous result for points in a plane follows directly from
the Pythagorean Theorem.
</p>

<p>
Because the mass of each planet as well as distances between planets are
linear quantities, the formula <i>F = (G*m1*m2)/(d^2)</i> yields a linear
result. We then apply <i>v[p] = v[p] + F/m[p] * t</i> individually to each
component of a planet's velocity.
</p>

<p>
The following fragment of pseudocode will carry out the simulation,
assuming that the arrays <i>p_x</i>, <i>p_y</i>, <i>p_z</i>, <i>v_x</i>, <i>v_y</i>, and <i>v_z</i> are filled
with the components of the initial position and velocity of each planet,
while <i>m</i> holds the respective mass.
</p>

<pre>
for i in range(t):
    for j in range(len(p_x)):
        for k in range(len(p_x)):
            if j == k:
                continue
            xd = p_x[k] - p_x[j]
            yd = p_y[k] - p_y[j]
            zd = p_z[k] - p_z[j]
            d = math.sqrt(xd*xd + yd*yd + zd*zd)
            F = G*m[k]/(d*d)*t
            v_x[j] += F*xd/d
            v_y[j] += F*yd/d
            v_z[j] += F*zd/d
    for j in range(len(px)):
        p_x[j] += v_x[j]*t
        p_y[j] += v_y[j]*t
        p_z[j] += v_z[j]*t
</pre>

<p>
Now for the question of formatting. The input is straightforward, since
real numbers in the specified format can be read directly by the C++
format <i>"%lf"</i> and the Java method <i>Double.parseDouble</i>, for example.
The output is trickier to deal with, due to the fact that standard floating-point formats
don't respect the requirement that the exponent remain non-negative for
small values.
</p>

<p>
In Java, <b>lars2520</b> suggests that we tweak the format as follows.
</p>

<pre>
String s = new DecimalFormat("0.000E0").format(dd);
if(Math.abs(dd)&lt;1)
    s = new DecimalFormat("0.000").format(dd)+"E0";
if(s.equals("-0.000E0"))
    s="0.000E0";
</pre>

<p>
There are many ways, some more broadly applicable than others, to
accomplish the same in C++. Here's how <b>SnapDragon</b> pulled it off.
</p>

<pre>
string dtos(double d) {
    char buf[1000];
    if( fabs(d) &lt; 1.0 )
        sprintf(buf, "%.3lfE00", d);
    else
        sprintf( buf, "%.3lE", d );
    string s = buf;
    int x = s.find('+');
    if( x != -1 )
        s.erase(x, 1);
    x = s.find("E0");
    if( x != -1 )
        s.erase(x+1, 1);
    if( s == "-0.000E0" ) return "0.000E0";
    return s;
}
</pre>

<p>
After selecting a <i>printf</i> format based on the size of the number,
<b>SnapDragon</b> erases any extraneous symbols from the string. These
include a plus sign or leading zero in the exponent, or a minus sign in
the special case of 0.000, against which the problem statement
specifically warned.
</p>


<p>
<img src="/i/m/Eeyore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273434" context="algorithm"/><br />
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
