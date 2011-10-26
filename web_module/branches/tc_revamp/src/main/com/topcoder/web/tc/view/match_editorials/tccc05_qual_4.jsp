<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505707" message="Discuss this match" /></div>
<span class="bodySubtitle">2005 TopCoder Collegiate Challenge <br> Qualification Problem Set 4</span><BR/>January 11-12, 2005
<br><br>

<span class="bigTitle">Summary</span> 

<p> 
This set had the hardest hard problem, and only 12 competitors were able to solve both of them.  Top among them was John Dethridge, scoring over 60 points more than second place mathijs.  Luckily, the easy problem was straightforward, and almost everyone who submitted it got it correct.
</p> 
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3506&amp;rd=6526" name="3506">ImageEnlarger</a></b> 
</font> 
<A href="Javascript:openProblemRating(3506)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505707" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      138 / 160 (86.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      123 / 138 (89.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Ruberik</b> for 248.21 points (1 mins 56 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      204.27 (for 123 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
Unlike last year's problem dealing with bitmaps, this one was relatively simple.
Basically, you just need to make an array with <tt>factor</tt> times as many elements as
the input, and then fill in the characters.  If you notice that <tt>ret[i][j] ==
    input[i/factor][j/factor]</tt>, when using integer division, then the task of
generating the output becomes particularly simple.
<pre class="code">
for (int i = 0; i &lt; input.length*factor; i++)
    ret[i] = "";
    for (int j = 0; j &lt; input[0].length(); j++){
        ret[i] += input[i/factor].charAt(j/factor);
    }
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3504&amp;rd=6526" name="3504">Justify</a></b> 
</font> 
<A href="Javascript:openProblemRating(3504)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505707" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      51 / 160 (31.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 51 (21.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>John Dethridge</b> for 741.01 points (14 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      511.02 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
This was probably the hardest problem of the qualification round.  It requires
the use of <a href="/tc?module=Static&d1=features&d2=040104">dynamic programming</a>.
The basic idea is that you want to figure out the optimal way to place the last
<tt>wordCount-k</tt> words for all <tt>k</tt>.  Once you know the optimal placement for
all <tt>k &gt; j+1</tt>, you can then calculate the optimal placement for 
<tt>j</tt>.  Here is the basic algorithm in pseudocode:
<pre class="code">
    <font color="blue">//Finds the optimal placement for the last wordCount-j words</font>
    findOptimalPlacement(int j){
        <font color="red">if(cache contains j){
            return cache[j]
        }</font>
        placement best = BAD_PLACEMENT;
        foreach (k &gt; j+1 and k &#8804; wordCount){
            <font color="blue">//Within this loop, we will consider each 
            //placement starting with word j at the beginning 
            //of a line, by trying to put words j 
            //through k-1 on a single line, and then 
            //recursively calling findOptimalPlacement to get
            //the placement for the words starting at k.</font>
            placement p = findOptimalPlacement(k)
            prepend a single line with words j through k-1 to p
            if(p is better than best){
                best = p
            }
        }
        <font color="red">cache[j] = best</font>
        return best
    }
</pre>
This method will calculate the optimal placement for every <tt>j</tt> by first
trying to place some words, starting at <tt>j</tt>, on a single line, and then
placing the rest of the words on subsequent lines.  The reason this words is
because there is an <i>optimal subproblem</i> that you can solve.  That is, once the first
<tt>N</tt> words have been placed, the best way to place the remaining words is
always the same, regardless of how you placed the first <tt>N</tt> words.  The
key to making the solution run within the 8 second time limit is to use
memoization (the red code) so that you only compute the solution to the 
subproblem once for each <tt>N</tt>.  If you were to omit the red code, you're
solution would still return the correct answer, but the resulting runtime would
not pass the constraints from the round 3 hard problem, as it would take over 1000
years for some inputs.
</p>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
