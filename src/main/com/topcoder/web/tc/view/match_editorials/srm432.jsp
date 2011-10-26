<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 432 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/stat?c=round_overview&er=5&rd=13694">Match Overview</a><br />
    <tc-webtag:forumLink forumID="525289" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 432</span><br />Tuesday, January 6th, 2009
<br /><br />

<h2>Match summary</h2> 
</p> 
<p>
    Happy new year ! The first SRM in 2009 attracted 1143 coders.&nbsp; Div 2 easy was
    easy as always. Div 1 easy / Div 2 medium was not so standard and confused lots
    of coders. Div 1 Medium was tricky - like many other mediums. Hard problems in both
    division were solvable and about 20 coders in each division proved it.</p>
<p>
    Div 1 was won by <tc-webtag:handle coderId="10574855" context="algorithm"/>, who had the fastest solution for hard and earned 25 points in challenges. He was closely followed by <tc-webtag:handle coderId="15600311" context="algorithm"/> and <tc-webtag:handle coderId="21113940" context="algorithm"/>. Both of them made succesfull challenges and needed one more to win this match
    and their rooms were full of wrong mediums, but they didn't use their chance. Great
    result anyway.</p>
<p>
    Div 2 was won by <tc-webtag:handle coderId="22682913" context="algorithm"/>, who had good times on all 3 problems. He was followed by <tc-webtag:handle coderId="22686265" context="algorithm"/> and newcomer <tc-webtag:handle coderId="22766988" context="algorithm"/>.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10295&amp;rd=13694" name="10295">GroupedWordChecker</a></b> 
</font> 
<A href="Javascript:openProblemRating(10295)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      565 / 609 (92.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      538 / 565 (95.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>accn</b> for 249.99 points (0 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.09 (for 538 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    Of course, we should check each word separately. To check the given word, we should
    use definition: try all pairs of equal letters, and check if there is any different
    letter between them.
</p>
<p>
    Alternatively, we can only check the letter after the first letter of that pair.
    There are some faster algorithms, but this one requires less code:</p>
<pre><strong><span style="color: #2e8b57">public</span></strong> <font color="#2e8b57"><b>int</b></font> howMany(String[] words) {<br />&nbsp; <font
    color="#2e8b57"><b>int</b></font> ans = <font color="#ff00ff">0</font>;<br />&nbsp; <font
        color="#804040"><b>for</b></font> (<font color="#2e8b57"><b>int</b></font> i = <font
            color="#ff00ff">0</font>; i < words.length; i++) {<br />&nbsp; &nbsp; <font color="#2e8b57"><b>boolean</b></font> grouped = <font color="#ff00ff">true</font>;<br />&nbsp; &nbsp; <font
                    color="#804040"><b>for</b></font> (<font color="#2e8b57"><b>int</b></font> j = <font
                        color="#ff00ff">0</font>; j &lt; words[i].length()-<font color="#ff00ff">1</font>; j++)<br />&nbsp; &nbsp; &nbsp; <font
                            color="#804040"><b>if</b></font> (words[i].charAt(j) != words[i].charAt(j+<font color="#ff00ff">1</font>))<br />&nbsp; &nbsp; &nbsp; &nbsp; <font
                                color="#804040"><b>for</b></font> (<font color="#2e8b57"><b>int</b></font> k = j+<font
                                    color="#ff00ff">1</font>; k < words[i].length(); k++)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <font
                                        color="#804040"><b>if</b></font> (words[i].charAt(j) == words[i].charAt(k))<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; grouped = <font
                                            color="#ff00ff">false</font>;<br />&nbsp; &nbsp; <font color="#804040"><b>if</b></font> (grouped) ans++;<br />&nbsp; }<br />&nbsp; <font
                                                color="#804040"><b>return</b></font> ans;<br />}</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10154&amp;rd=13694" name="10154">LampsGrid</a></b> 
</font> 
<A href="Javascript:openProblemRating(10154)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      243 / 609 (39.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      107 / 243 (44.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Alex_KPR</b> for 459.73 points (8 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      279.85 (for 107 correct submissions) 
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
      478 / 534 (89.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      375 / 478 (78.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>lovro</b> for 247.91 points (2 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      196.29 (for 375 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    Sooner or later you should notice one very important fact: all equal rows remain
    equal after any number of flips. So, if some row is lit at any moment, all initially
    equal rows will be lit as well and all other rows will not be lit. Therefore, the
    solution is to try for each row to make lit, and if it is possible, count the number
    of rows equal to this one and choose among such rows one with the maximal number
    of equal rows.
</p>
<p>
    How to check if the given row can be lit after exactly <strong>K</strong> flips
    ? Note that the order of flips doesn't affect on the final result. Also, making
    2 flips in the same column doesn't change row at all. Suppose we have <strong>M</strong>
    "off" lamps in this row. To be able to switch all these lamps to the "on" state
    we need exactly <strong>M</strong> flips. So, <strong>K</strong> should be no less
    than <strong>M</strong>. Now, if <strong>(K-M)</strong> is even, we can flip always
    the first column and at the end the row will be lit. If <strong>(K-M)</strong> is
    odd, it's impossible to lit this row after exactly <strong>(K-M)</strong> flips.
</p>
<p>
    Take a look at <tc-webtag:handle coderId="7390467" context="algorithm"/>'s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=299973&rd=13694&pm=10154&cr=7390467">code</a> for a good example of using STL.
</p>
<p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9873&amp;rd=13694" name="9873">TreesDivision</a></b> 
</font> 
<A href="Javascript:openProblemRating(9873)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Three: 
</p>
<blockquote><table cellspacing="2"> 
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
      53 / 609 (8.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 53 (37.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>adrianoo07</b> for 764.04 points (16 mins 55 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      584.50 (for 20 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    This problem needs a method, which is very common in geometry problems.</p>
<p>
    As there are at least 2 points, the optimal line always lies between some two points.
    We can move it so, that it "touches" (in this case it means that it is close enough)
    some point. After that, we can rotate this line from that point so, that it touches
    another point and these two touching points are on the different sides of it. So,
    we can start searching this line as the one, that touchs any two of the given points.
    Note, that these two points should not contain other points in the same line between
    them. In this case, that line wouldn't touch these two points and would touch other
    two points earlier.</p>
<p>
    For two fixed points, there are 2 ways to draw such line: In the first case the
    first point in on the left side from this line and the second point on the right
    side and in the second case - vice versa. For both cases we can determine which
    trees go to which brother. We will choose optimal line among all such possible lines.</p>
<p>
    To be able to do all the computations in integer numbers, reading <a href=http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=geometry1>Geometry tutorial</a>
    would be useful.
</p>
<p>
    Sample solution in Java:
</p>
<pre><strong><span style="color: #2e8b57">private</span></strong> <font color="#2e8b57"><b>boolean</b></font> between(<font
    color="#2e8b57"><b>int</b></font> x1, <font color="#2e8b57"><b>int</b></font> y1, <font
        color="#2e8b57"><b>int</b></font> x2, <font color="#2e8b57"><b>int</b></font> y2, <font
            color="#2e8b57"><b>int</b></font> x, <font color="#2e8b57"><b>int</b></font> y) {<br />&nbsp; <font
                color="#804040"><b>if</b></font> (x < Math.min(x1, x2) || x > Math.max(x1, x2)) <font
                    color="#804040"><b>return</b></font> <font color="#ff00ff">false</font>; <br />&nbsp; <font
                        color="#804040"><b>if</b></font> (y < Math.min(y1, y2) || y > Math.max(y1, y2)) <font
                            color="#804040"><b>return</b></font> <font color="#ff00ff">false</font>;<br />&nbsp; <font
                                color="#804040"><b>return</b></font> <font color="#ff00ff">true</font>;<br />}
<font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>int</b></font> minDifference(<font
    color="#2e8b57"><b>int</b></font> x[], <font color="#2e8b57"><b>int</b></font> y[], <font
        color="#2e8b57"><b>int</b></font> income[]) {<br />&nbsp; <font color="#2e8b57"><b>int</b></font> best = Integer.MAX_VALUE, i, j, k, n = x.length, pa, pb, qa, qb;<br />&nbsp; <font
            color="#2e8b57"><b>boolean</b></font> good;<br />&nbsp; <font color="#0000ff">// Line that touches points i and j &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</font>  <font
                    color="#804040"><b>for</b></font> (i = <font color="#ff00ff">0</font>; i &lt; n; i++) {<br />&nbsp; &nbsp; <font
                        color="#804040"><b>for</b></font> (j = i+<font color="#ff00ff">1</font>; j &lt; n; j++) {<br />&nbsp; &nbsp; &nbsp; good = <font
                            color="#ff00ff">true</font>;<br />&nbsp; &nbsp; &nbsp; <font color="#0000ff">// pa - First brother in the first case</font><br />&nbsp; &nbsp; &nbsp; <font color="#0000ff">// qa - First brother in the second case</font><br />&nbsp; &nbsp; &nbsp; pa = qa = income[i];<br />&nbsp; &nbsp; &nbsp; <font
                                        color="#0000ff">// pb - Second brother in the first case</font><br />&nbsp; &nbsp; &nbsp; <font
                                            color="#0000ff">// qb - Second brother in the second case</font><br />&nbsp; &nbsp; &nbsp; pb = qb = income[j];<br />&nbsp; &nbsp; &nbsp; <font
                                                color="#804040"><b>for</b></font> (k = <font color="#ff00ff">0</font>; k &lt; n; k++)<br />&nbsp; &nbsp; &nbsp; &nbsp; <font
                                                    color="#804040"><b>if</b></font> (k != i && k != j) {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <font
                                                        color="#2e8b57"><b>int</b></font> dir = (x[i]-x[j])*(y[i]-y[k]) - (x[i]-x[k])*(y[i]-y[j]);<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <font
                                                            color="#804040"><b>if</b></font> (dir &lt; <font color="#ff00ff">0</font>) {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pa += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; qb += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <font
                                                                color="#804040"><b>else</b></font> <font color="#804040"><b>if</b></font> (dir &gt; <font
                                                                    color="#ff00ff">0</font>) {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pb += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; qa += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <font
                                                                        color="#804040"><b>else</b></font> {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <font
                                                                            color="#804040"><b>if</b></font> (between(x[i], y[i], x[j], y[j], x[k], y[k])) {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <font
                                                                                color="#0000ff">// Some point between</font><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; good = <font
                                                                                    color="#ff00ff">false</font>;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <font
                                                                                        color="#804040"><b>break</b></font>;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <font
                                                                                            color="#804040"><b>else</b></font> <font color="#804040"><b>if</b></font> (between(x[i], y[i], x[k], y[k], x[j], y[j])) {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pb += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; qb += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <font
                                                                                                color="#804040"><b>else</b></font> {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pa += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; qa += income[k];<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />&nbsp; &nbsp; &nbsp; &nbsp; }<br />&nbsp; &nbsp; &nbsp; <font
                                                                                                    color="#804040"><b>if</b></font> (good) {<br />&nbsp; &nbsp; &nbsp; &nbsp; best = Math.min(best, Math.abs(pa - pb));<br />&nbsp; &nbsp; &nbsp; &nbsp; best = Math.min(best, Math.abs(qa - qb));<br />&nbsp; &nbsp; &nbsp; }<br />&nbsp; &nbsp; }<br />&nbsp; }<br />&nbsp; <font
                                                                                                        color="#804040"><b>return</b></font> best;<br />}</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10153&amp;rd=13694" name="10153">GroupedWord</a></b> 
</font> 
<A href="Javascript:openProblemRating(10153)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      345 / 534 (64.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      87 / 345 (25.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krzysan</b> for 445.60 points (10 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      248.18 (for 87 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    There are many different solutions for this problem, but as it's success rate and
    the number of resubmits suggest, most of them are either wrong or at least they
    need to consider some special cases which are not so easy to find. We will describe
    the algorithm, which is not hard to prove correct and can be coded without much
    troubles.</p>
<p>
    In the beginning, we join any two words that should be joined until no such two
    words exist. Two words <strong>p</strong> and <strong>s</strong> should be joined, if there is some letter <strong>c</strong> such,
    that <strong>p</strong> ends with 
    <strong>c</strong> and <strong>s</strong> begins with <strong>c</strong>. In this
    case we should change these two words with <strong>p+s</strong>. But there is main and the only trick in this solution: we should
    care about words which consist only of letters <strong>c</strong>. We should insert all these words
    between <strong>p</strong>
    and <strong>s</strong>. We can, for example at the beginning join those words, which consist
    of all equal letters and then unite all the other words. In fact, having all letters
    equal isn't necessary, it's enough that it's first and last letters are equal.</p>
<p>
    After joinings are done, we have one or more words that couldn't be joined more.
    Now, let's take their concatenation in any order. If the resulting word isn't grouped,
    then answer is <strong>"IMPOSSIBLE"</strong>. Otherwise, all concatenations (which differ with words
    order) will give us all possible original words. Therefore, if after the joining
    process we get exactly one word, this word is the answer. Otherwise, the answer
    is <strong>"MANY"</strong>.</p>
<p> <tc-webtag:handle coderId="22686851" context="algorithm"/>'s <a href=http://www.topcoder.com/stat?c=problem_solution&rm=299963&rd=13694&pm=10153&cr=22686851>solution</a> does what's described here.
    <tc-webtag:handle coderId="8527113" context="algorithm"/>'s very fast <a href=http://www.topcoder.com/stat?c=problem_solution&rm=299974&rd=13694&pm=10153&cr=8527113>submission</a> uses the same ideas. &nbsp;</p>
<p>
    Exercise 1. Prove that the described algorithm is correct.</p>
<p>
    Exercise 2. Find a linear algorithm for this problem.</p>
<p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10178&amp;rd=13694" name="10178">BuildersCountry</a></b> 
</font> 
<A href="Javascript:openProblemRating(10178)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525289" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: 
</p>
<blockquote><table cellspacing="2"> 
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
      42 / 534 (7.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 42 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 708.88 points (20 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      548.05 (for 21 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    Like many other "hard" problems - this one relies on the smaller subproblems.
</p>
<p>
    In the beginning, let's determine how much is paid to builders for building houses
    in the same city. In the i-th city, the first house costs <strong>before[i]*houseCost[i]</strong>,
    the second <strong>(before[i]+1)*houseCost[i],</strong> ..., the last - <strong>(after[i]-1)*houseCost[i]</strong>.
    The total cost is <strong>houseCost[i]*(before[i]+after[i]-1)*(after[i]-before[i])/2</strong>.
    Now we will think about how to reduce "between cities" and road building payments.</p>
<p>
    Consider the second building phase for only two cities i and j connected by a road.
    When building <strong>after[i]-before[i]</strong> new houses in the i-th city, each
    of old <strong>before[j]</strong> builders int the j-th city will get <strong>houseCost[i]</strong>
    units of money, so this expense equals to <strong>(after[i]-before[i])*before[j]*houseCost[i]</strong>.
    Similarly, after building new houses in the j-th city, old i-th city builders are
    paid <strong>(after[j]-before[j])*before[i]*houseCost[j]</strong> units of money
    in total. What's left is how much money will new builders get.</p>
<p>
    Consider any new house x in the i-th city and new house y in the j-th city. If house
    <strong>x</strong> is built before house <strong>y</strong>, the builder from <strong>
        x</strong> will get <strong>houseCost[j]</strong> units of money for <strong>(x,y)</strong>
    houses pair. If house <strong>y </strong>is built before <strong>x</strong>, the
    builder from <strong>y</strong> will get <strong>houseCost[i] </strong>units for
    the same <strong>(x,y)</strong> pair.
</p>
<p>
    Note that for each such <strong>(x,y)</strong> pair we will have to pay some amount
    - either <strong>houseCost[i]</strong> or <strong>houseCost[j]</strong>, depending
    on which house is built before. We don't have any other expenses. From it we can
    conclude, that it's always better to build first all the houses in the city, which
    has more <strong>houseCost</strong>. So, the minimal total payment for new builder
    is <strong>Min(houseCost[i], houseCost[j])*(after[i] - before[i])*(after[j] - before[j])</strong>.</p>
<p>
    Now consider the second building phase for any number of cities. It's not hard to
    see that the same happens here: for any pair of houses <strong>x</strong> and <strong>
        y</strong> from the neighboring cities - we have to pay money to builder either
    from <strong>x</strong> or <strong>y</strong> (except the case when both x and y
    are old houses), depending on which one is built earlier. So, it's always profitable
    to build each time a new possible house in the city with maximal <strong>houseCost</strong>.</p>
<p>
    It's time to combine both phases of building. When building a new road between cities
    i and j, we have to pay not only <strong>roadCost*(before[i]+before[j])</strong>
    units of money for constructing it, also we must consider that it adds to our expenses
    <strong>(after[i]-before[i])*before[j]*houseCost[i]+(after[j]-before[j])*before[i]*houseCost[j]+Min(houseCost[i],houseCost[j])*(after[i]
        - before[i])*(after[j] - before[j])</strong> units. So, their sum is the actual
    cost of that road. If this road already exists, we only add that last amount to
    our answer.</p>
<p>
    The remaining part is clear - we must construct Minimal Spanning Tree (MST) from
    all existing and possible new roads (In fact it's not exactly spanning tree, there
    are some more edges). For it, you can use either Kruskal's or Prim's algorithm.</p>
<p>
    ... and be careful - int overflow!</p>
<p>
    &nbsp;Take a look at <tc-webtag:handle coderId="10574855" context="algorithm"/>'s the fastest correct <a href=http://www.topcoder.com/stat?c=problem_solution&rm=299962&rd=13694&pm=10178&cr=10574855>submission</a>. If you like Prim's algorithm more,
    <tc-webtag:handle coderId="22627586" context="algorithm"/>'s <a href=http://www.topcoder.com/stat?c=problem_solution&rm=299983&rd=13694&pm=10178&cr=22627586>solution</a> does with it.</p>

<div class="authorPhoto">
    <img src="/i/m/nika_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20315020" context="algorithm"/><br />
    <em>TopCoder Member</em>
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
