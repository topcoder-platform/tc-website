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
<tc-webtag:forumLink forumID="505570" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Collegiate Challenge <br> Regional Finals</span><BR/>Wednesday, March 12, 2003
<br><br>

<span class="bigTitle">Summary</span>

                                          <p>
                              This round of the Collegiate Championship was clearly a notch more difficult than all previous rounds.  
                              bstanescu, the only competitor to sucessfully complete the hard problem, received the highest score 
                              for the round.  Along with the the challenging hard, coders were faced with an incredibly tricky medium 
                              problem.  The 550 caught many competitors by surprise with its unusual style.  The easy problem, 
                              a relatively simple dynamic programming exercise, would have been a medium had it been a normal SRM.  
                              If this round is any indication of the future, competitors will need to be in top form to score above 
                              1000 in the upcoming rounds.
                              </p>
                              
<H1> The Problems </H1> 
                              
                              <font size="+2"><b>ChessMetric</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505570" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                              Used as: Division 1 - Level 1:
                              <blockquote><table cellspacing="2">
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                              <td style="background: #eee;" class="bodyText">250</td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                              <td style="background: #eee;" class="bodyText">47 / 50  (94.00%)</td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                              <td style="background: #eee;" class="bodyText">42 / 47  (89.36%)</td>
                              </tr>
                              <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                              <td style="background: #eee;" class="bodyText"><b>Yarin</b> for 240.21 points</td>
                              </tr></table></blockquote>
                              <p>
                              The most popular way to solve this problem uses dynamic programming. First, set up a 
                              2-dimensional array that represents the board. Each element of the array will signify 
                              how many ways there are of reaching a given square.  In other words, after the ith iteration 
                              of our loop, a particular element in the array will represent how many ways there are of reaching 
                              the corresponding square in i moves.  To initialize the array, all elements should be 0 except the 
                              start square which should be 1. We then loop over the number of moves, using the array from the 
                              previous iteration to produce the array for the next iteration.</p>

                              <font size="+2"><b>TileMatch</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505570" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                              Used as: Division 1 - Level 2:
                              <blockquote><table cellspacing="2">
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                              <td style="background: #eee;" class="bodyText">550</td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                              <td style="background: #eee;" class="bodyText">26 / 50  (52.00%)</td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                              <td style="background: #eee;" class="bodyText">14 / 26  (53.85%)</td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                              <td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 378.71 points</td>
                              </tr></table></blockquote>
                              <p>
                              At first glance, it may appear that a brute force solution trying combinations of removals would be 
                              the way to solve this problem, but the size of the inputs makes such a method infeasible.  
                              Instead of blindly trying removals, we can directly calculate which colored tiles are causing 
                              problems.  By looping over the border of the given tile, we can check, for each square on an edge, 
                              what squares it can come into contact with.  For each of the non-corner squares, this involves 
                              checking 12 possible adjacencies that can occur given any rotation of the tile.  For corner squares 
                              we must also check 12 possible adjacencies at each of the corners. If we ever find a colored square 
                              that does not have a colored adjacent square we must uncolor that square. We return the total number 
                              of squares that need be uncolored.
                              </p>
                              <font size="+2"><b>Optimizer</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505570" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                              Used as: Division 1 - Level 3:
                              <blockquote>
                              <table cellspacing="2">
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                              <td style="background: #eee;" class="bodyText">1000</td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                              <td style="background: #eee;" class="bodyText">5 / 50  (10.00%) </td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                              <td style="background: #eee;" class="bodyText">1 / 5 (20.00%)</td>
                              </tr>
                              <tr>
                              <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                              <td style="background: #eee;" class="bodyText"><b>bstanescu</b> for 428.07 points</td>
                              </tr></table></blockquote>
                              <p>
                              This question, although more straightforward than the medium, requires more code to complete.  
                              Given the grammar of the problem language, we construct a recursive descent parser that will 
                              produce a parse tree of the input.  This basically involves building a function for each production 
                              in the grammar.  Some tricks are: 1) arranging the grammar such that multiplication has higher precedence 
                              than addition, 2) removing left recursion from the grammar (productions of the form ( N -&gt; N... ).  
                              The grammar in this problem is easy enough that these two steps are almost automatic.  Once the parser 
                              has built a tree, we can traverse it producing the required optimizations.  The easiest transformations 
                              are the identity and annihilation properties: multiply by 1, add 0, multiply by 0.  If we find any of 
                              these in the grammar we can simply cut off tree branches.  Another easy transformation changes subtrees 
                              of the form "(Number)" to a leaf "Number".  In other words, performs the unparenthesizing of numbers.  
                              The most complicated transformation requires the isolation of subtrees that consist of multiplications.  
                              Such subtrees can be replaced by a simpler subtree resulting from applying all associativity rules.  
                              A similar transformation can be performed on subtrees consisting of additions and variable multiplications.  Repetitive use of these transformations in a bottom up manner will give us the optimized tree.  A final count of the number of multiplies and adds contained in the tree will produce the answer.
                              </p>

<p>
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
