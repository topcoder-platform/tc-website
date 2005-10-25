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
<tc-webtag:forumLink forumID="505781" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 268</span><br>Tuesday, October 18, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
A difficult medium and sneaky hard gave Div 1 coders many challenge opportunities.  The tricky hard,
which featured an interesting mix of parsing and searching, had only 6 correct submissions.
tjq, who bolstered his 3 correct submissions with 2 challenges, narrowly edged out Petr for the win.
Strong performances from Im2Good and Per kept them in striking distance.  
The division 2 hard was no slouch either, claiming all but 9 submissions.  Seasoned competitor
emka207 captured the div 2 crown, with mhchan and xnitin close behind.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5867&amp;rd=8001" name="5867">CrossWordPuzzle</a></b>
</font>
<A href="Javascript:openProblemRating(5867)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>

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
      310 / 363 (85.40%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      268 / 310 (86.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>zylum</b> for 247.33 points (2 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193.85 (for 268 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem required more string manipulation than a typical Div 2 easy.  One type of solution
loops over each line of the input, and keeps a counter tracking periods.  The first period seen
initializes the counter to 1.  An 'X' or end-of-line causes the counting to stop, at which point it
is determined if the correct number of periods were found.  We can simplify this code somewhat using
regular expressions.  Java code follows: <pre>

public int countWords(String[] board, int size) {
    int ret = 0;
    for (int i =0; i < board.length; i++) {
	board[i] = ("X"+board[i]+"X").replaceAll("X","XX").replaceAll("X\\.{"+size+"}X","XAX");
	ret += board[i].replaceAll("[^A]*","").length();
    } 
    return ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3490&amp;rd=8001" name="3490">CmpdWords</a></b>
</font>
<A href="Javascript:openProblemRating(3490)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      236 / 363 (65.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      165 / 236 (69.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>KillerCoder</b> for 493.87 points (3 mins 10 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      353.45 (for 165 correct submissions)
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
      278 / 283 (98.23%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      249 / 278 (89.57%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>krijgertje</b> for 248.77 points (2 mins 0 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      213.61 (for 249 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

The problem asks us to consider all possible ways of concatenating distinct dictionary words.  This
naturally lends itself to a double loop over the dictionary elements.  The algorithm maintains a set
S that is initialized with the words in the dictionary.
If a generated word (by our concatenations) is present in S, 
we add it to a set of ambiguous words.  Otherwise, we add the generated word to S.  
When this process is complete, all
ambiguities will be in a single set.  We return the size of this set.  Java code follows: <pre>
public int ambiguous(String[] dictionary) {
    HashSet<String> words = new HashSet<String>(Arrays.asList(dictionary));
    HashSet<String> cntd = new HashSet<String>();
    for (int a = 0; a < dictionary.length; a++) {
	for (int b = 0; b < dictionary.length; b++) {
	    if (a == b) continue;
	    String comp = dictionary[a] + dictionary[b];
	    if (!words.contains(comp)) words.add(comp);
	    else cntd.add(comp);
	}
    }
    return cntd.size();
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4699&amp;rd=8001" name="4699">TriArea</a></b>

</font>
<A href="Javascript:openProblemRating(4699)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      26 / 363 (7.16%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 26 (34.62%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>emka207</b> for 699.24 points (20 mins 35 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      534.92 (for 9 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

The constraints allow us to avoid most of the geometric issues in the problem, and reduce the
algorithm to semi-routine looping.  The general idea is to loop over each triangle, and color in
each grid section it touches.  We maintain a boolean array that tracks which sections are colored.
This allows us to avoid double coloring a section.  The number of colored sections is the return
value.  The tricky aspect is that square grid sections will not work.  To accurately keep track of
the triangles, we divide the natural grid squares into fourths using diagonals.  Thus each grid
square becomes 4 triangular sections.  The return value is changed to one-fourth the number of
colored triangles.  There are some potential traps with this method, such as not
allocating a large enough array to account for all possible triangles.  If a set of triangle
identifiers is used instead of a boolean array, this issue is avoided.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4677&amp;rd=8001" name="4677">MaxTrip</a></b>
</font>
<A href="Javascript:openProblemRating(4677)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      191 / 283 (67.49%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      79 / 191 (41.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalinov</b> for 465.67 points (7 mins 49 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      303.94 (for 79 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
This problem basically came down to figuring out the underlying graph theory.  Using standard
depth-first search code, we can label each connected component.  In addition, we store the number of odd
degree vertices each component contains.  The vertices here are locations, so an odd degree vertex occurs
when an odd number of tickets reference a location.  Why are odd degrees important?  The
problem requires a path containing all of the edges (tickets).  Using graph theory terminology, we
need to add edges until we have an Eulerian walk.  This occurs exactly when the graph is connected,
and has at most 2 odd degree vertices.  Once this goal is clear, 
the components labeled, and the odd degree vertices counted, we still must determine how many
additional edges are needed.<br/>
<br/>
We can deal with the two problems in isolation.  Firstly, we must connect the graph.  That is, if
the graph contains more than 1 component, we need intercomponent edges.  Arranging the components in
an arbitrary sequence, we can connect them in a path.  For example, if the component sequence is
<pre>
C1, C2, ..., Cn
</pre>
then we add an edge between C1 and C2, C2 and C3, etc.  Looking ahead, we see that removing odd
degree vertices is also a goal.  Thus, if a component has odd vertices, we use these connecting edges to
remove them (at most 2 per component).  If a component does not have odd degree vertices, we can add
both edges (if it isn't C1 or Cn) to the same vertex in that component.  The resulting connected
graph may still have more than 2 odd degree vertices.  We patch these loose ends up by connecting
odd degree vertex pairs with edges.  Thus this process requires n-1 edges for the connections.  Then
each component originally containing v > 2 odd degree vertices contributes (v-2)/2 edges.<br/>
<br/>
The remaining question is why this solution is optimal.  Basically, you assume there is an optimal
solution that doesn't connect the components in a simple path.  Loops in this "component graph" 
can be flattened at no cost, and take us closer to our given solution.  
Induction is used to complete the argument.  Details are left to the reader/round tables.  Some
coders took another route by systematically merging components and removing odd vertices.  Done
correctly, this solution will work and probably requires less figuring out.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=3925&amp;rd=8001" name="3925">CommentNest</a></b>
</font>
<A href="Javascript:openProblemRating(3925)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      33 / 283 (11.66%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 33 (18.18%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 500.87 points (37 mins 23 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      443.53 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The trickiness of this parsing problem is due solely to the strings "*/*" and "/*/".  These nasty
sequences keep their intentions hidden.  We do not know whether they are comment enders or comment
beginners.  To determine their nature, some searching is required.  Adhering to the procedure
described in the problem statement, we process the string left-to-right trying to remove maximal
MultiLine Comments.  Upon finding a "/*" string, we must determine the largest MLC it participates in, if
any at all.  Marking the location of "/*" in the input, we breadth-first search the remainder of the
string using (location,nesting depth) pairs as nodes.  The strings "/*" and "*/" increment and
decrement nesting depth respectively.  The strings "*/*" and "/*/", if detected, can be used in
either fashion, and so both possibilities are tried.  Letters simply advance the location and ignore
the depth.  Nodes with nesting depth 0 are terminal, since
they complete an MLC.  Once the search is complete, we can determine which pair with depth 0
had the largest location.  This gives us the length of our maximal MLC.  Removing this comment, we
repeat the process until no further comments can be removed.
</p>



      <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
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
