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

<tc-webtag:forumLink forumID="506026" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 4</span><br>Monday, June 26, 2006
<br><br>

<span class="bigTitle">Match summary</span>




<p>

The fourth HS SRM (the first for group delta) proved to be the
trickiest thus far.  Only two coders were able to solve the hard
problem.  <b>lssi</b>, the only competitor to solve all three, took
first place with <b>hml</b> close behind.

</p>



<H1>

The Problems

</H1>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6421&amp;rd=10023" name="6421">WinningTrick</a></b>

</font>

<A href="Javascript:openProblemRating(6421)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506026" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Level One: <blockquote><table cellspacing="2">

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

      109 / 111 (98.20%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      82 / 109 (75.23%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>sluga</b> for 249.08 points (1 mins 44 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      230.39 (for 82 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The wording of this problem cleverly hides the fact that all we care
about is the fastest competitor.  Once we know this maximum, we can
compute exactly how much wind is needed.  Remember that the wind both
hurts the competitors and helps us, so only half the difference in
speed is necessary.  Java code follows:<pre>
public double minimumSpeed(int[] speed, int yourSpeed) {
    int M = 0;
    for (int a : speed) M = Math.max(M,a);
    return yourSpeed >= M ? 0 : (M-yourSpeed)/2.0;
}
</pre>
Returning negative values, and performing integer division are
two potential errors that should be avoided.
</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6423&amp;rd=10023" name="6423">CompositionTimeSignature</a></b>

</font>

<A href="Javascript:openProblemRating(6423)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506026" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Level Two: <blockquote><table cellspacing="2">

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

      68 / 111 (61.26%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      19 / 68 (27.94%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>nordom</b> for 415.71 points (13 mins 21 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      299.63 (for 19 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Instead of dealing with fractions, we can simplify the problem by
assigning sixteenth notes a value of 1, eighth notes a value of 2, and
so forth.  In addition, we assign the signature 3/8 a value of 6 (3*2), 2/4 a value of 8 (2*4), and so forth.<br/>
<br/>
As the first step, we sum all of the values for the given
composition, and determine whether they are evenly divisible by each
signature.  Any signatures that do not divide can be discarded.
Looping over the remaining signatures, we simulate each composition,
and count how many notes cross measures.  This determines our
return value.  Java code follows:<pre>
public String getTimeSignature(String duration) {
    String poss = "WHQES", rets[] = {"3/8","2/4","3/4","4/4"};
    int[] vals = {16,8,4,2,1}, lens = {6,8,12,16};
    boolean[] bad = new boolean[4];
    int cnt = 0, tot = 0;
    for (char c : duration.toCharArray()) tot += vals[poss.indexOf(c)];
    for (int i = 0; i < 4; i++) 
	if (tot % lens[i] != 0) {  //check divisibility
	    bad[i] = true; 
	    cnt++; 
	}
    if (cnt == 4) return "?/?";  //all signatures are bad
    int ret = -1, best = 1000;
    for (int a = 0; a < 4; a++) {
	if (bad[a]) continue;  //skip bad signatures
	int score = 0, len = lens[a], acc = 0;
	for (char c : duration.toCharArray()) { //simulate composition
	    acc += vals[poss.indexOf(c)];
	    if (acc / len > 0) //passed a measure
		if (acc % len != 0 || acc / len > 1) score++;
	    acc %= len;
	} 
	if (score < best) {
	    best = score;
	    ret = a;
	}
    } 
    return rets[ret];
}
</pre>
One tricky implementation issue is forgetting to check for notes that
are longer than the measures (above we check acc / len > 1).
</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6562&amp;rd=10023" name="6562">ProductionOptimization</a></b>

</font>

<A href="Javascript:openProblemRating(6562)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506026" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      1100

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      13 / 111 (11.71%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      2 / 13 (15.38%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>hml</b> for 706.19 points (24 mins 16 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      589.74 (for 2 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

If you can spot it, the solution using memoization is easy to code and
understand.  We first define the following function: <pre>
int mem(int idx, int totCost, int totTime, int[] costs, int[] times) 
</pre>
Given the unit we are up to (idx), the amount we have left to spend
(totCost), and the time left (totTime), this function returns the
greatest number of &quot;final&quot; units we can make.  We must build
at least 1 unit, so we immediately expend costs[idx] and times[idx].
At this point, our process splits.  In parallel we can now continue
building units of type idx and, at the same time, use the last built unit to construct
units of type idx+1.  What isn't clear is how much of the remaining
cost should be split between the two parallel processes.  So, we try
every possible split.  Java code follows: <pre>
int[][][] cache = new int[50][101][101];
int mem(int idx, int totCost, int totTime, int[] costs, int[] times) {
    if (idx == costs.length) return 1;
    if (cache[idx][totCost][totTime] > -1) return cache[idx][totCost][totTime];
    int ret = 0, newTime = totTime - times[idx], newCost = totCost - costs[idx];
    //If there is not enough time to build a unit, we are done
    if (newTime < 0) return cache[idx][totCost][totTime] = 0;
    //Try all possible cost splits
    for (int c = 0; c < newCost; c++) {
	int k = mem(idx+1,c,newTime,costs,times)+mem(idx,newCost-c,newTime,costs,times);
	ret = Math.max(ret,k); 
    }
    return cache[idx][totCost][totTime] = ret;
}
public int getMost(int[] costs, int[] times, int totCost, int totTime) {
    //Initialize cache
    for (int[][] a : cache) for (int[] b : a) Arrays.fill(b,-1);
    return mem(0,totCost,totTime,costs,times);
}
</pre>
</p>


<div class="authorPhoto">
    <img src="/i/m/brett1479_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />    <em>TopCoder Member</em>
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
