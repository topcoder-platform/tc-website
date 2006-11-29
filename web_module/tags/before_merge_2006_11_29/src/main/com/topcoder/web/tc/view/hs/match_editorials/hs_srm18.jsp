<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10070&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506040" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 18</span><br>Monday, October 30, 2006
<br><br>

<h2>Match summary</h2> 

 

<p> 
<tc-webtag:handle coderId="14886245" context="hs_algorithm"/> took first place in this match, thanks to seven successful challenges. He was followed by <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, in second place, with <tc-webtag:handle coderId="22652634" context="hs_algorithm"/> close behind in third.

<br /><br />
The 500 problem was the most frequently challenged, probably because of several tricky corner cases.  Less than one third of all medium submissions survived the challenge phase and the system tests. The 1000 problem was rather standard for High School SRMs and 17 people managed to solve it.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6772&amp;rd=10070" name="6772">ApplePie</a></b> 

</font> 

<A href="Javascript:openProblemRating(6772)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506040" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      148 / 157 (94.27%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      130 / 148 (87.84%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>sluga</b> for 249.22 points (1 mins 36 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      230.82 (for 130 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The solution to this problem is straightforward: Iterate over all apples in the order in which they are given, counting the ones that fall within the given rectangle.  If the counter equals the amount that we need, return the day on which the current apple fell.
</p>
<p>
This approach (or similar) was used in <tc-webtag:handle coderId="15604398" context="hs_algorithm"/>'s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=15604398&rd=10070&pm=6772">solution</a>.
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6829&amp;rd=10070" name="6829">FrogDerby</a></b> 

</font> 

<A href="Javascript:openProblemRating(6829)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506040" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      97 / 157 (61.78%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      30 / 97 (30.93%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>crazzy</b> for 467.72 points (7 mins 34 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      300.03 (for 30 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

For this problem, let's call points <i>(x[i],y[i])</i> and <i>(x[j],y[j])</i> co-linear if <i>x[i]/y[i] = x[j]/y[j]  or  y[i]=y[j]=0</i>.  It can be proven that using a jump with coordinates <i>(x[i]/d, y[i]/d)</i> (where <i>d=<a href="http://en.wikipedia.org/wiki/Greatest_common_divisor">gcd</a>(x[i],y[i])</i>) you can visit all points that are co-linear with <i>(x[i],y[i])</i> and are on the same side of x-axis and y-axis.  Thanks to this, the algorithm can be as follows:<br>
<pre>for each point p do<br>
    count the points that are co-linear with p and on the same side of x-axis and y-axis.<br>
return the maximum result
</pre>
<p>
The easiest way to see if points <i>(x[i],y[i])</i> and <i>(x[j],y[j])</i> are co-linear is to check if <i>x[i]*y[j] = x[j]*y[i]</i> or <i>y[j]=y[i]=0</i></p>
<p> Correctly handling zero and negative coordinates was very important in this problem.</p>
<p>
For a reference, see
<tc-webtag:handle coderId="22641901" context="hs_algorithm"/>'s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22652634&rd=10070&pm=6829">solution</a>.
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6768&amp;rd=10070" name="6768">WarehouseJob</a></b> 

</font> 

<A href="Javascript:openProblemRating(6768)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506040" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      27 / 157 (17.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      15 / 27 (55.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>sluga</b> for 864.26 points (11 mins 38 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      632.55 (for 15 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem has a standard backtracking solution.  Let's look at the recursive version.  Let <i>rec</i> be a function that, given a subset of boxes, calculates the cost of the cheapest arrangement using these boxes.
<pre>
<b>n</b> = total number of boxes;

int rec(<b>boxes</b>){
    <b>height</b> = <b>n</b> - size of <b>boxes</b>;
    <b>cost</b>= infinity;
    for each <b>b</b> in <b>boxes</b> do {
        if some box in <b>boxes</b> must lie under <b>b</b>, go to next box;
        <b>c</b>= rec(<b>boxes</b> - <b>b</b>);          <i>//<b>boxes</b>-<b>b</b> is a set operation</i>
        <b>cost</b> = min(<b>cost</b>, <b>c</b> + weight(<b>b</b>)*<b>height</b>);
    }
    return <b>cost</b>;
}
</pre>
The above function counts the cost of the optimal arrangement.  To make it a valid solution, we need to add two things.  
First, it must also return the box at the bottom of the arrangement, so we can retrace the order:
<pre>
<b>n</b> = total number of boxes;

(int,box) rec(<b>boxes</b>){
    <b>height</b> = <b>n</b> - size of <b>boxes</b>;
    <b>cost</b>= infinity;
    for each <b>b</b> in <b>boxes</b> do {
        if some box in <b>boxes</b> must lie under <b>b</b>, go to next box;
        <b>c</b>=(first value of) rec(<b>boxes</b> - <b>b</b>);
        if <b>cost</b> &lt; <b>c</b> + weight(<b>b</b>)*<b>height</b> {
            <b>cost</b> = <b>c</b> + weight(<b>b</b>)*<b>height</b>;
            <b>best_box</b>=<b>b</b>;
        }
    }
    return (<b>cost</b>,<b>best_box</b>);
}

retrace(<b>boxes</b>){
    for i=1 to <b>n</b> do {
        <b>b</b>=(second value of)rec(<b>boxes</b>);
        <b>boxes</b>:=<b>boxes</b>-<b>b</b>;
        <b>b</b> is the <b>i</b>-th box from the bottom;
    }
}
</pre>
<p>
It's easy to see that if the loop in <i>rec</i> traverses the boxes in increasing order, then <i>retrace</i> calculates the lexicographically smallest arrangement (out of all optimal arrangements).</p>
<p>
The second thing to add is memoization, which is left as an exercise for the reader (it's basically adding a table of size 2<sup>n</sup> and changing the first and last line of <i>rec</i>).
</p>


 
<div class="authorPhoto">
    <img src="/i/m/rusolis_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20289593" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
