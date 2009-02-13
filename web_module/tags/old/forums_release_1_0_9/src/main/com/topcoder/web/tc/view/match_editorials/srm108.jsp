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
<tc-webtag:forumLink forumID="505525" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 108</span><br>Thursday, August 12, 2002
<br><br>

<span class="bigTitle">Match summary</span>

<P>This set of problems was unusually easy, and correct solutions mostly came 
about from an ability to follow directions. Surprisingly, considering the low 
level of difficulty of the problems, only one person (out of 167) successfully 
solved the Division-II Level 3 problem. The remaining problems generally showed 
high success rates. </P>
<P>Despite the easiness of the problems, only four coders solved all three of 
their problems (all in Division-I): <B>bstanescu</B>, with a final score of 
1421.7; <B>Yarin</B> with 1347.74; <B>ZorbaTHut</B> with 1302.99; and 
<B>ShakeSpace</B> with 1077.79. In Division-II the competition was much more 
intense, with most room leaders scoring in the 600s. </P>

<H1> 
The Problems 
</H1> 

<B>Lars</B> (value 300)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505525" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 2 :<BR/><BR/>
<P>
Submission Rate - 145/167 (86.83%) <BR/>
Success Rate - 90/145 (62.07%) <BR/>
High Score - <B>RajAjmani</B> for 297.03 points<BR/>
</P>
Reference implementation: <B>RajAjmani</B><BR/><BR/>
<B>Implementation</B>
<P>This problem is a simple matter of dealing with ASCII values of letters and 
following directions. The easiest mistakes to make were probably to use 
inclusive comparison operations rather than exclusive operations (e.g., 
<TT>length &gt;= 20</TT> as opposed to <TT>length &gt; 20</TT>). </P>

<B>StemChange</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505525" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 2 (Value 500):<BR/><BR/>
<P>
Submission Rate - 118 / 167 (70.66%)<BR/>
Success Rate - 87 / 118 (73.73%)<BR/>
High Score <B>UFP2161</B> for 400.96 points 
</P>
Used as: Division-I, Level 1 (Value 250):<BR/><BR/>
<P>
Submission Rate - 91 / 96 (94.79%)<BR/>
Success Rate - 77 / 91 (84.62%)<BR/>
High Score - <B>radeye</B> for 241.83 points 
</P>
Reference implementation: <B>radeye</B> <BR/><BR/>
<B>Implementation</B>
<P>This problem was a good demonstration of how crazy natural languages tend to 
be. Like the previous problem, solving this problem was primarily a matter of 
carefully following directions. The problem provided the necessary data 
structure. </P>
<P>If the conjugation is singular and not third-person, the stem change needs to 
be performed. This consists of locating the next to last vowel in the word (a 
simple linear search from the end of the word) and replacing it with the given 
replacement. It is then a simple matter of dropping the last two characters and 
appending the proper ending obtained from one of the given tables. </P>


<B>Packyman</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505525" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 Used as: Division-II, Level 3
Reference implementation: <B>fiddlybit</B> <BR/><BR/>
<B>Implementation</B>
<P>Only once before have I noticed an event where only one coder successfully 
solved a particular problem. It's rather surprising that this was the case with 
this particular problem. The logic of the solution is reasonably simple. One has 
to be able to compute the result of pitting one Packyman against another, and 
then return the Packyman with the three highest scores. </P>
<P>The former task consists of accumulating a bonus percentage by iterating 
through the four type combinations (primary and secondary types between two 
opponents). This could be simple cut and paste coding, as in fiddlybit's 
solution. </P>
<P>The latter task consists if imposing the prescribed ordering on the Packymen, 
once you've computed how they would fare against their opponents. Once the best 
three have been selected, sort them by name and return them. </P>

<B>WordSearch</B> (Value 450) &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505525" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 2 :<BR/><BR/>
<P>
Submission Rate - 73 / 96 (76.04%)<BR/>
Success Rate - 19 / 73 (26.03%)<BR/>
High Score - <B>ZorbaTHut</B> for 369.81 points 
</P>
Reference implementation: <B>ZorbaTHut</B> <BR/><BR/>
<B>Implementation</B>
<P>This problem poses an interesting slant (if you will pardon the pun) on word 
searches. The problem is to locate an occurance of a word where each successive 
letter of that word occurs in a fixed distance in a particular direction from 
the preceding letter. Furthermore, there is a restriction on what this distance 
can be: it must be the minimum distance between lattice points intersected by 
the line formed by the letters. </P>
<P>In other words, one needs to iterate through all the reasonable slopes that 
can be constructed from two relatively prime values. That is, each slope is 
constructed from two values, <TT>dx</TT> and <TT>dy</TT>, representing offset in 
columns and rows respectively between each letter. These two values then 
describe how a successive letter in the word will be reached. The reason that 
these values must be relatively prime is that, if they are not, then the line 
segment described will intersect at least one lattice point before the 
successive letter is reached. </P>
<P>As the search area is of finite size, there are a finite number of reasonable 
relatively prime pairs that we can form. Our values for <TT>dx</TT> and 
<TT>dy</TT> each must be between <TT>1</TT> and <TT>20</TT> inclusive, and there 
can only be far fewer than <TT>400</TT> possible directions. </P>
<P>For each combination of direction <TT>(+/-dx, +/-dy)</TT> and location 
<TT>(x, y)</TT> in the puzzle, we check to see if the word exists there. The 
direction tells us how to increment/decrement <TT>x</TT> and <TT>y</TT> between 
each successive letter in the word. As long as we are careful about not going 
out of bounds, it is easy to determine if the word exists at a particular 
location in a particular orientation. We must also not forget to deal with the 
horizontal and vertical directions, represented by <TT>(+/-1, 0)</TT> and 
<TT>(0, +/-1)</TT> respectively. </P>

<B>LeftMoves</B> (Value 900) &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505525" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 3 :<BR/><BR/>
<P>
Submission Rate - 32 / 96 (33.33%) <BR/>
Success Rate - 18 / 32 (56.25%) <BR/>
High Score - <B>bstanescu</B> for 687.40 points 
</P>
Reference implementation: <B>bstanescu</B> <BR/><BR/>
<B>Implementation</B>
<P>Despite its added complexity, this problem is still nothing more than a 
simple optimal-path-through-a-maze finding problem. This can be easily tackled 
with a breadth-first search. In this case, distance becomes a tuple <TT>(keys, 
leftMoves)</TT>, giving simultaneously minimum number of keys required and the 
minimum number of left moves for that number of keys. Initially we know the 
distance to any 'V' location is <TT>(0, 0)</TT>, and it is easy update the 
minimum distance to each of its neighbors. We then repeat the process for each 
updated neighbor in the next step. We continue this until no more updates occur. 
At this point we will know the minimum distance from some 'V' location to the 
'W' location (or, if this distance was never updated, it will be some preset 
value representing infinity). </P>



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


