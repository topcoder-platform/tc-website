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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505516" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 98</span><br>June 19, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<p>
            My general impression of these problems is that they were relatively easy.
            However, the resulting statistics seem to indicate that the difficulty was just right.
            Regardless, this was a fun set of problems.  My only suggestion to the author,
            <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=266750" class="bodyGeneric">axchma</a> is to pick an easier-to-type handle if he ever again intends to
            use his handle in the input to a problem.
        </p>

<H1> 
The Problems 
</H1> 
<a name="Movie"></a><b>Movie</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505516" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Author:
        <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=266750" class="bodyGeneric">axchma</a>

<br/>

    Used as: Division 2, Level 1:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td class="bodytext">
          <b>Value</b>
        </td>
        <td class="bodytext">250</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Submission Rate</b>
        </td>
        <td class="bodytext">332
    /
    347
    (95.68%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Success Rate</b>
        </td>
        <td class="bodytext">299
    /
    332
    (90.06%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>High Score</b>
        </td>
        <td class="bodytext">
          <B>jovian</B> for
            248.71 points
        </td>
      </tr>
    </table>
  </blockquote>

Reference implementation:
    <B>jovian</B>

<br/>
<B>Implementation</B>
<p>
                This is quite a simple problem to implement.  Initialize a counter to <tt>1</tt>.
                Iterate through the input string.  For each instance of the letter <tt>'e'</tt>,
                increment the counter.  Otherwise, if the counter is <tt>0</tt>, return one plus
                the current index in the string, else decrement the counter.  Of course, one can
                increment and decrement by <tt>2</tt> (or <tt>50</tt> or any constant, really), if
                one prefers.
            </p>
<p>&#160;</p>
<a name="TelNum"></a><b>TelNum</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505516" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Author:
        <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=266750" class="bodyGeneric">axchma</a>

<br/>

    Used as: Division 2, Level 2:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td class="bodytext">
          <b>Value</b>
        </td>
        <td class="bodytext">450</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Submission Rate</b>
        </td>
        <td class="bodytext">323
    /
    347
    (93.08%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Success Rate</b>
        </td>
        <td class="bodytext">160
    /
    323
    (49.54%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>High Score</b>
        </td>
        <td class="bodytext">
          <B>ragnabot</B> for
            412.54 points
        </td>
      </tr>
    </table>
  </blockquote>

Reference implementation:
    <B>ragnabot</B>

<br/>
<B>Implementation</B>
<p>
                This problem simply tests one's ability to follow directions.  Most of the types of phone
                numbers are easy to detect.  A prefix of <tt>1</tt>, <tt>0</tt>, or <tt>555</tt>; <tt>11</tt> occurring
                immediately after the first digit; and certain properties of the last four digits.
            </p>
<p>
                Checking whether a number is a vanity number is the most complex part.  First one has to check if
                the four digits form an ascending or descending series.  This can be done in one <tt>if</tt>-statement.
                Then one has to count up digits
                and see how many distinct digits there are.  There are many ways of doing this: sorting the digits
                and counting the ``transitions'', accumulating occurences in an array and counting the non-zero
                values, etc.
            </p>
<p>&#160;</p>
<a name="Language"></a><b>Language</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505516" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Author:
        <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=266750" class="bodyGeneric">axchma</a>

<br/>

    Used as: Division-I, Level 1:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td class="bodytext">
          <b>Value</b>
        </td>
        <td class="bodytext">200</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Submission Rate</b>
        </td>
        <td class="bodytext">259
    /
    265
    (97.74%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Success Rate</b>
        </td>
        <td class="bodytext">171
    /
    259
    (66.02%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>High Score</b>
        </td>
        <td class="bodytext">
          <B>wybili</B> for
            190.99 points
        </td>
      </tr>
    </table>
  </blockquote>

Reference implementation:
    <B>wybili</B>

<br/>
<B>Implementation</B>
<p>
                For each language, maintain a count of the number of non-amhcxa users of that particular language.
                Also maintain a separate count of users that come after amhcxa in the list of that particular language.
                If the second count is exactly three, then the number of challenges for that particular language will
                be three.  If the second count is greater than three, then the number of challenges for that particular
                language will be zero.  Otherwise, the number of challenges for that particular language will be equal
                to the total count of non-amhcxa users of that particular language.
                An alternative method is to simply simulate the challenges submitted by each non-amhcxa contestant.
            </p>
<B>Mistakes</B>
<p>
                The special case to look out for is when there are exactly three submissions using a particular
                language following amhcxa's submission.  In this case, there will always be exactly three
                challenges if amhcxa chooses that language.  This basically corresponds to avoiding counting
                self-challenges.  Many people seem to have made this mistake.
            </p>
<p>&#160;</p>
<a name="Catan"></a><b>Catan</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505516" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Author:
        <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=266750" class="bodyGeneric">axchma</a>

<br/>

    Used as: Division-I, Level 2:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td class="bodytext">
          <b>Value</b>
        </td>
        <td class="bodytext">450</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Submission Rate</b>
        </td>
        <td class="bodytext">176
    /
    265
    (66.42%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Success Rate</b>
        </td>
        <td class="bodytext">159
    /
    176
    (90.34%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>High Score</b>
        </td>
        <td class="bodytext">
          <B>bigg_nate</B> for
            441.28 points
        </td>
      </tr>
    </table>
  </blockquote>


    Used as: Division 2, Level 3:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td class="bodytext">
          <b>Value</b>
        </td>
        <td class="bodytext">900</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Submission Rate</b>
        </td>
        <td class="bodytext">79
    /
    347
    (22.77%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Success Rate</b>
        </td>
        <td class="bodytext">35
    /
    79
    (44.3%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>High Score</b>
        </td>
        <td class="bodytext">
          <B>Partorg</B> for
            786.61 points
        </td>
      </tr>
    </table>
  </blockquote>

Reference implementation:
    <B>Yarin</B>

<br/>
Reference implementation:
    <B>bigg_nate</B>

<br/>
<B>Summary</B>
<p>
                This problem is an excellent, simple demonstration of dynamic programming.  It proved to be quite
                easy for the Division-I contestants who knew how to do it, where only 15 out of 176 submissions
                failed.
            </p>
<B>Algorithm</B>
<p>
                It is clear from the potentially high values that can be returned that the approach of generating every
                possible permutation of dice rolls that can lead up to the desired sum is not tractable.  Instead, we
                must find some way to reduce the problem.
            </p>
<p>
                We know how to solve the problem easily for the roll of one die (this is trivial).  From the results of
                rolling one die, can we somehow easily determine the results of rolling another die?  We can, because
                there are only six ways the additional die can be rolled, and this is completely independent from the
                result of the previous die.  For each number obtained from the previous roll and for each possible roll
                of the additional die, we compute the sum and know that we have found a way to obtain that particular
                sum with two dice.
            </p>
<p>
                In fact, we can generalize this to any number of dice.  Suppose we know how many possible ways there are
                to obtain <tt>any</tt> sum from rolling <tt>n</tt> dice.  Let us denote this as <tt>S(n, v)</tt>, meaning that
                the number of ways to obtain a sum of <tt>v</tt> from <tt>n</tt> dice is <tt>S(n, v)</tt>.  Each value of
                <tt>v</tt> for which <tt>S(n, v) &gt; 0</tt> will contribute its value to <tt>S(n + 1, v + i)</tt> for
                each <tt>1 &lt;= i &lt;= 6</tt>.  That is, <tt>S(n + 1, v) = S(n, v - 1) + S(n, v - 2) + ... + S(n, v - 6)</tt>,
                where <tt>S(n, v) = 0</tt> if <tt>v &lt; 0</tt>.
            </p>
<p>
                This is what is known as a 
                <a href="http://planetmath.org/encyclopedia/RecurrenceRelation.html" target="_blank" class="bodyGeneric">recurrence relation</a>.
                All that is left are the initial conditions.
                The relation only really works if we assume <i>a priori</i> that there is exactly one way to obtain a sum of <tt>0</tt>
                with <tt>0</tt> dice.
                This gives <tt>S(0, 0) = 1</tt>.  This is all we need to know to solve the problem.
                (Alternatively, we could assume <tt>S(1, i) = 1</tt> for <tt>1 &lt;= i &lt;= 6</tt>, but this can be derived
                 from the simpler initial condition of <tt>S(0, 0) = 1</tt>).
            </p>
<p>
                Reducing a problem in this manner is known as <i>dynamic programming</i> (which sounds like a buzzword but really
                refers to a general algorithmic technique).  It basically means we reduce a problem to the smaller version
                of the same problem, until we reach some base case.  To do this we have to determine a way to get from the
                smaller version to the larger version while maintaining correctness.  This approach only makes sense, of
                course, if deriving the answer to a larger problem from a smaller problem isn't too computationally intensive,
                and if the number of problems we'd have to solve for is reasonably small.  In this case, deriving the solution
                of one problem from the next simpler problem is <tt>O(sum)</tt>.  The number of problems we solve is
                exactly <tt>numDice</tt>, and so the solution is <tt>O(numDice * sum)</tt>.
            </p>
<B>Implementation</B>
<p>
                To solve this problem we need to implement the computation of the recurrence relation which we derived.
                For this problem it is sufficient to initialize a two-dimensional array, where each row represents
                a value of <tt>n</tt> and each column represents a value of <tt>v</tt> (we'll call this array <tt>S</tt>
                because, after the computation is done, it will be equivalent to our recurrence relation <tt>S</tt>).
                We initialize the entire first row to zero, except for the first element which we initialize to <tt>1</tt>
                (<tt>S[0][0] = 1</tt>, our initial condition).  The width of the array need only be as wide as the sum
                we are looking for (because once we obtain a sum greater than our target, we will never be able to reach
                our target from that combination of dice rolls).  It should have a width of <tt>sum + 1</tt>, in fact,
                so that we can represent every possible sum from <tt>0</tt> to <tt>sum</tt> inclusive.
            </p>
<p>
                We then build our way up to knowing the value of <tt>S[numDice][sum]</tt>, one die at a time.
                We have an outer <tt>for</tt>-loop, which iterates <tt>i</tt> from <tt>1</tt> to <tt>numDice</tt>
                inclusive.  Nested in that loop we have another <tt>for</tt>-loop, which iterates <tt>j</tt> from
                <tt>i - 1</tt> to <tt>sum</tt> inclusive.  And nested in that loop we have another <tt>for</tt>-loop,
                which iterates <tt>k</tt> from <tt>1</tt> to <tt>6</tt>, inclusive.
            </p>
<p>
                For each combination of <tt>i, j, k</tt> such that <tt>j + k &lt;= sum</tt>, we add to
                the current value of <tt>S[i][j + k]</tt> the value of <tt>S[i - 1][j]</tt>.  And that is the
                entire program.
                Once we complete populating the row for <tt>i = numDice</tt>, we simply return <tt>S[numDice][sum]</tt>.
            </p>
<p>
                Many variations of this technique exist, of course.  For example, only a one-dimensional array is really needed,
                if one updates the values in the array in descending order of indices.
            </p>
<p>&#160;</p>

<a name="Graph"></a><b>Graph</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505516" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Author:
        <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=266750" class="bodyGeneric">axchma</a>

<br/>

    Used as: Division-I, Level 3:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td class="bodytext">
          <b>Value</b>
        </td>
        <td class="bodytext">1000</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Submission Rate</b>
        </td>
        <td class="bodytext">75
    /
    265
    (28.3%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>Success Rate</b>
        </td>
        <td class="bodytext">29
    /
    75
    (38.67%)
</td>
      </tr>
      <tr>
        <td class="bodytext">
          <b>High Score</b>
        </td>
        <td class="bodytext">
          <B>SnapDragon</B> for
            793.49 points
        </td>
      </tr>
    </table>
  </blockquote>

Reference implementation:
    <B>SnapDragon</B>

<br/>
<B>Summary</B>
<p>
                This is the only problem of the match that was really difficult (though, at least from my own perspective,
                it seemed easier than recent Division-I Level 3 problems).  The solution was basically a depth-first search
                of all the graphs that can be constructed within the given constraints.
            </p>
<B>Algorithm</B>
<p>
                Our initial "position" in the depth-first search is a graph with no edges (all our graphs will have the exact
                same vertices).  The depth-first traversal will consist of adding edges from the current vertex (which is initially
                the vertex whose degree is represented by the first value in the input array) until the current vertex has the desired
                degree.  For each possible way of adding edges to the current vertex, we recursively build the graph with the next vertex
                as the current vertex.
            </p>
<p>
                We backtrack whenever the current vertex has a degree that is larger than its desired degree (or, if its desired degree
                is unreasonably large, as in greater than the number of vertices following it in the list, although this didn't seem
                to be an important optimization).  Whenever we reach a vertex, we know we have satisfied the constraints for all the
                vertices preceding it, so the maximum depth in the vertex list that we reach gives the maximum <tt>i</tt> for which
                the graph is <tt>i</tt>-good.
            </p>
<B>Implementation</B>
<p>
                We begin our implementation with a recursive function that attempts to build all possible edge combinations from
                the current vertex.  For each edge combination that gives the current vertex the desired degree, it then recursively
                calls itself on the next vertex.
            </p>
<p>
                For each vertex, then, we must iterate through all combinations of vertices following it of a particular size.
                That is, if the vertex requires <tt>d</tt> more edges to reach its desired degree, and there are <tt>n</tt> vertices
                following it in the list, then there will be <tt>C(n, d)</tt> possible edge combinations.  We need to iterate through
                each of these.
            </p>
<p>
                One method of doing this, which I've discussed in previous writeups, consists of a recursive function to build each
                combination and an array to
                represent which elements have already been added to the current combination.  Another method is to iterate through all
                combinations, and simply filter out the ones of the desired size.  As discussed previously, one can iterate
                through all combinations (that is, all subsets) from a set of size <tt>n</tt> by iterating through all values
                from <tt>0</tt> to <tt>(1 &lt;&lt; n) - 1</tt> inclusive.  The binary representation of the iterator represents which
                elements are in (or not in) the subset.  By counting the <tt>1</tt> bits (or the <tt>0</tt> bits if you're a pessimist),
                one can determine the subset size.  This approach was used by <B>SnapDragon</B>.
            </p>
<p>
                Once we have an edge combination, we decrement the degree of each vertex attached to the current vertex by the set of edges by one.
                We can then recursively call our function on the next vertex, and after it returns, increment the degrees of those same vertices.
                Rather than keeping a separate count of running degree values, and comparing to the input list, we can simply decrement values
                in that list as we add edges and increment as we remove them (thus giving a list of "remaining" degrees).
                Whenever we visit a vertex that has a remaining degree less than 0, we know it cannot have the desired degree given the edges that
                have already been constructed, and so we return.
            </p>
<p>
                The value returned by our solution is then the highest index in the degree list that was visited.  If the entire list was visited,
                we return <tt>-1</tt>.  By constructing the solution carefully, so that no edge combinations are visited twice, the solution will
                be efficient enough.
            </p>


<div class="authorPhoto">
    <img src="/i/m/Logan_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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

