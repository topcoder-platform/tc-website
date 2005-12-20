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
<tc-webtag:forumLink forumID="505590" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 154</span><br>Wednesday, July 9, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<P><b>Snapdragon</b> crushed the competition in Division One with an authoritative performance, winning the division by over 200 points.  
<b>tomek</b> remains absolutely perfect, tying <b>Yarin</b> for the longest perfection streak ever (seven matches).  However all seven of 
Yarin's matches were in Division One.  tomek has only competed in Division One six times to-date. <strong>Veloso</strong>, back in Division One after a brief slump in Division 
Two has turned up the heat again with a room win and the seventh highest score overall.<br /><br />
Division Two only saw four correct level three submissions.  The fastest of those was from <b>P.S</b> who submitted in just under 40 minutes.  
Although P.S was rewarded with a 274 point rating jump, both <b>fbird</b>'s and <b>ozzie</b>'s performances on the level one and two problems 
were enough to make up for the deficit on the level three and P.S ended up in third place overall. </P>
                        
<H1>The Problems</H1>
<FONT size="+2"><B>MarginCalculator</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505590" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 1:
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">300</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">197 / 214 (92.06%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">183 / 197 (92.89%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Gladiator</B> for 292.54 points 
    </td></TR></TBODY></TABLE></BLOCKQUOTE>
<H4>Implementation</H4>
<p>To begin, we parse the values provided by each entry of the input array. We 
can do this with a simple tokenizer (such as a <CODE>stringstream</CODE> in 
C++), retrieving two floating point values from each string. As we do this, we 
maintain two running totals for the total cost and the total price. </p>
<p>Once we have the totals, we take the difference of the total cost from the 
total price. We then take this difference (which should be a floating point 
value) and divide it by the total price. We then multiply this percentage by 
<CODE>100</CODE> and truncate it (by casting it to an <CODE>int</CODE>) and 
return it. </p>

<FONT size="+2"><B>SuperRot</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505590" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 2:
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">450</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">189 / 214 (88.32%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">179 / 189 (94.71%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>liu</B> for 438.84 points 
  </td></TR></TBODY></TABLE></BLOCKQUOTE>
<H4>Implementation</H4>
<p>This problem is a simple string transformation that can be done in-place. We 
iterate through each character of the string. We then apply one of the following 
transformations to it: </p>
<TABLE>
  <TBODY>
  <TR>
    <TH>Condition</TH>
    <TH>Transformation</TH></TR>
  <TR>
    <td align="middle"><CODE>'A'</CODE> &lt;= <I>c</I> &lt;= <CODE>'M'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>+= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'N'</CODE> &lt;= <I>c</I> &lt;= <CODE>'Z'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>-= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'a'</CODE> &lt;= <I>c</I> &lt;= <CODE>'m'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>+= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'n'</CODE> &lt;= <I>c</I> &lt;= <CODE>'z'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>-= 13</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'0'</CODE> &lt;= <I>c</I> &lt;= <CODE>'4'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>+= 5</CODE> </td></TR>
  <TR>
    <td align="middle"><CODE>'5'</CODE> &lt;= <I>c</I> &lt;= <CODE>'9'</CODE> 
</td>
    <td align="middle"><I>c</I> <CODE>-= 5</CODE> </td></TR></TBODY></TABLE>
<p>In languages where strings are immutable (such as Java), we would have to 
construct a new string or do our work in a mutable string buffer, but the 
concept is the same. </p>

<FONT size="+2"><B>ContestScore</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505590" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 3:
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">1000</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">31 / 214 (14.49%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">4 / 31 (12.9%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>P.S</B> for 483.44 points 
  </td></TR></TBODY></TABLE></BLOCKQUOTE>
Used as: Division-I, Level 2:
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">500</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">79 / 137 (57.66%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">34 / 79 (43.04%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>ZorbaTHut</B> for 442.90 points 
    </td></TR></TBODY></TABLE></BLOCKQUOTE>
<H4>Implementation</H4>
<p>This problem is all about sorting. First we iterate through each of the three 
categories (columns). For each category, we sort the entries in descending order 
of their score in that category. We then assign their ranks for this category by 
iterating through this sorted list. The first entry in the list will be ranked 
1st, of course. For each following entry, if its score is the same as the 
preceding entry, then it gets the same rank as the preceding entry. Otherwise, 
its rank is its (1-based) index in the sorted list. E.g. </p>
<p><PRE><CODE>rank[cat][i] = score[cat][i] == score[cat][i - 1] ? rank[cat][i - 1] : i + 1</CODE></PRE>
</p>
<p>Once we have done this for all three categories, we can easily determine the 
sum of the rankings for each entry. We then sort the entries again, in ascending 
order of rank, with descending order of score as the tiebreaker (and 
lexicographical ordering of the names as a further tiebreaker). </p>
<p>The most difficult aspect of this problem is maintaining the data with all 
the repeated sorts. The easiest thing to do is probably to build objects, each 
of which hold the name, three scores, three rankings, and total ranking (or a 
method for computing that on the fly). These objects can then be rearranged by 
whatever sort routines one uses as much as one wants. Then all is left is 
properly defining the comparison function for each of the two types of sorting 
involved. </p>

<FONT size="+2"><B>CheatCode</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505590" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 1:
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Value</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">350</td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">114 / 137 (83.21%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></td>
      <td style="BACKGROUND: #eee" class="bodyText">73 / 114 (64.04%) </td></TR>
    <TR>
      <td style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></td>
      <td style="BACKGROUND: #eee" class="bodyText"><B>malpt</B> for 327.38 points 
    </td></TR></TBODY></TABLE></BLOCKQUOTE>
<h4>Implementation</h4>
<p>
                This problem can be modeled as a nondeterministic finite automaton (NFA).
                That is, we iterate through each sequence of keystrokes.  At each keystroke, we
                are in some set of states (which for this problem is a set of positions in the target cheat code).
                For each keystroke, we iterate through each state and, for each state, find as many states that
                can be reached from that state using that keystroke as possible.  These become part of the new set of states.
            </p>
<p>
                For instance, initially our set of states consists of only one state: the beginning of the cheat code.
                When we read a keystroke, we see if it matches the next character in the cheat code.  If it does, then
                we know that advancing the position by one gives one possible next state.  If that character is the same as
                the previous keystroke entered, then we can also ignore it, which means the current state is also a
                possible next state.  And, we can also always go back to the beginning of the cheat code as the next state.
            </p>
<p>
                We can represent the set of current states as a simple bitmask (e.g., an array of boolean values), where
                the <i>i</i>th value of the bitmask specifies whether or not position <i>i</i> in the cheat code is reachable at this point.
                Initially, <code>bitmask[0] = true</code> while the rest is <code>false</code>.
                We then proceed through the keystrokes and generate a new bitmask.  After we process the keystroke, we replace the
                previous bitmask with the new one.  If the <i>n</i>th bit of the bitmask is ever true, where <i>n</i> is the length
                of the cheat code, then we have a valid entry of the cheat code.
            </p>
<p>
                The trick to this problem is understanding the model (that is, how to map it to an NFA, and what an NFA is).
                The implementation is actually rather easy.
            </p>
<p><br  /></p>

<font size="+2"><b>PossibleOrders</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505590" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 3:

<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">1000</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">18
    /
    137
    (13.14%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">14
    /
    18
    (77.78%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText"><b>vorthys</b> for 893.76 points
</td>
</tr>
</table></blockquote></font><H4>Implementation</H4>
<p>
                To begin, we use the information provided to build a graph.  Initially, we have a graph with no edges and a vertex for each
                of the <i>num</i> objects.  Then, for each equivalence given, we construct an edge between the two objects.
                Once we have constructed this graph, we then identify how many connected components there are.  This gives us
                the number of distinct values we are working with.
            </p>
<p>
                If there
                are <i>n</i> connected components, then there are <i>at most</i> <i>n</i> distinct values among our objects.  However, there
                may be fewer distinct objects, because there may be equivalences that <i>weren't</i> given to us.  So,
                if there are <i>n</i> connected components, then there are at least 1 and at most <i>n</i> equivalence classes.
                When the objects are put in order, equivalent objects will be adjacent, so we can just treat all equivalent objects
                as a single object.  Thus the problem is reduced to counting the number of ways to order <i>n</i> objects when there
                are no equivalences given.
            </p>
<p>
                Now, we must keep in mind that there may exist equivalences that were not given to us.
                In other words, the number of <a href="http://planetmath.org/encyclopedia/EquivalenceClass.html">equivalence classes</a>
                is at least <code>1</code> and at most <i>n</i>, and we know nothing about them.
                We must count each case distinctly.
                For each choice for the number of equivalence classes, we must count the number of ways we can
                <a href="http://planetmath.org/encyclopedia/Partition.html">partition</a> all of the objects into that many groups,
                as each partition arbitrarily assigns objects to equivalence classes.
                We then multiply that value by the number of possible ways we can order our equivalence classes (which is simply
                the factorial of the number of equivalence classes).
            </p>
<p>
                The number of possible ways we can partition a set of <i>n</i> objects into <i>k</i> groups
                is given by a
                <a href="http://planetmath.org/encyclopedia/StirlingNumbersSecondKind.html">Stirling number of the second kind</a>.
                The preceding link gives an overview of this concept, but it essentially boils down to the following recurrence
                relation (for partitioning <i>n</i> items into <i>k</i> groups):
            </p>
<blockquote>
                <code>S(n, k) = k * S(n - 1, k) + S(n - 1, k - 1)</code><br />
                <code>S(n, n) = S(n, 1) = 1</code>
            </blockquote>
<p>
                This is a simple recurrence relation to implement (using basic memoization techniques).  So, if we have <i>n</i>
                connected components, then the solution to this problem is:
            </p>
<blockquote>
                <pre>
sum = 0;
for(long long i = 1; i &lt;= n; i++)
    sum += factorial(i) * S(n, i);
                </pre>
            </blockquote>
                

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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
                
