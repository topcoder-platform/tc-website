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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505506" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 88</span><br>May 15, 2002
<br /><br />

<span class="bigTitle">Lessons Learned the Hard Way</span>

<P>
SRM 88 was the first match of the new "multiple submissions" era.
This was discussed at length in the lobby prior to the match.
The sense seemed to be that multiple submissions were a double
edged sword, adding to the coding phase, but possibly taking  
away from the challenge phase.
</P>

<P>
Statistics on multiple submissions in Div-II would be most interesting
to see.  Perhaps a staff member could post some data to the round
tables?  My feeling was that the problem slate was too demanding 
to allow much time for resubmission.
</P>

<P>
The problem slate in Div-II was probably more mathematical or
algorithmic than we've seen recently.  (Many Div-II problems have had
size limits of 100-1000 on integers, for instance.  The 500 in SRM 88
went up to a billion.)  Recently, Div-II has had a lot of simulation
problems, so some clean algorithmic problems were a refreshing change.
</P>

<P>
On the other hand, the socre seems to have been pretty low (particularly
on the 250, where many rooms had > 50% systest failure.
</P>

<P>
<B>300 (BadSpanish)</B>
</P>

<P>
A simple problem: input is a String, output is a String, translate 
according to the following rules:
<OL>
	<LI> yes -> si</LI>
	<LI> the -> el</LI>
	<LI> words in the input which end in a consonant get an 'o' appended.</LI>
	<LI> If the input ends with '!' or '?', then the output must start with the same character.</LI>
</OL>
</P>

<P>
This problem is make for java.util.StringTokenizer.  The constructor
StringTokenizer(String input, String delims, boolean returnDelimiters)
saves a considerable amount of coding.  Once split into tokens, the 
rest of the problem is much less tricky.
</P>

<P>
I'm not sufficiently familiar with the C# or C++ apis to comment on
the best solution there.
</P>

<P>
Problems:
<OL>
	<LI>ArrayIndexOutOfBoundsException thrown on the empty string.</LI>
	<LI>Apparent reading error, where the 'o' is appended when the word ends in a vowel rather than a consonant.</LI>  
	<LI>Some people implemented their own tokenizer, and failed to copy data into variables when there was only one word in the input.</LI>
	<LI>Failing to add an 'o' to the last word of input.</LI>
	<LI>Not replaceing "the" right at the start of the input.</LI>
	<LI>Adding an 'o' to more than one consecutive spaces.</LI>
	<LI>Adding an 'o' to "el" after a replacement.</LI>
</OL>
</P>

<P>
<B>500 (Divisors)</B>
</P>

<P>
The task was to take an array of up to 50 integers between 1 and 1,000,000,000 
and count (once) each integer which was a factor of at least one of the inputs.
Unusually for Div-II, this problem require attention to be paid to efficiency.
</P>

<P>
It turned out that the problem could be brute forced, provided some care 
was taken.  An outline of the solution:
</P>

<P>
for val in input {<BR/>
   for (i=1; i&lt;=sqrt(val); i++) {<BR/>
      if (val &#37; i == 0) {<BR/>
	 factors.add(i);<BR/>
         factors.add(val/i);<BR/>
      }<BR/>
   }<BR/>
}<BR/>
return uniqueCount( values in factors);<BR/>
</P>

<P>
The java.util.HashSet class or STL hash_set was ideal for this.
</P>

<P>
The critical issue here is to only scroll up to sqrt val.
(sqrt(1,000,000,000) is roughly 33,000 times 50 interations is pretty
comfortable in 8 secs on a modern box.)
</P>

<P>
Problems:
<OL>
	<LI>Overcomplicating the algorithm.  I messed about with prime numbers, then 
	regenerated the factors.  Why?  Sunspots or brain damage: you choose...</LI>
	<LI>Failing to pay attention to bounds.  Several solutions timed out because
	the loop did not stop at the square root.  The impact on running time is
	obvious after the contest is over.</LI>
	<LI>Failing on the test case with a single input of "1"</LI>
	<LI>Failing on the first test case of the input.  I know that many people 
	wonder "How much testing makes sense?".  Testing at least one example is 
	a good idea, I reckon...</LI>
	<LI>Not knowing about the Topcoder memory limits.  One solution starts:
	"boolean facts = new boolean[500000000];"</LI>
</OL>
</P>

<P>
<B>1000 (Farmers)</B>
</P>

<P>
Three farmers want to fence off and mark the land they own in a field.
Count the amount of fencing, and the number of signs required to mark each
area.  The input is a String[], return is an int.
</P>

<P>
The problem also saw service as the 500 in Div-I.  I believe this problem fits 
in a category called "flood/fill".  In outline, the solution is as follows:
</P>

<P>
// setup :<BR/>
int xmax, ymax, count = 0;<BR/>
int areaCount = 0, areaCost = 10;<BR/>
char[][] data = input;<BR/>
// This is used to ensure that we don't count a boundary twice.<BR/>
// An alternative is to only count internal boundaries, divide by 2<BR/>
// and then add the perimeter<BR/>
setFalse(boolean[][] visited);<BR/>
</P>

<P>
// check each square to see if it has been visited<BR/>
for (i = 0; i&lt;xmax; i++) {<BR/>
   for (j = 0; j&lt; ymax; j++) {<BR/>
      if (! visited[i][j]) {<BR/>
        // Recursively check the fences<BR/>
        check(data, visited, i, j, data[i][j]);<BR/>
	areaCount++;<BR/>
   }<BR/>
}<BR/>
return count + areaCount * areaCost;<BR/>
</P>

<P>
int check(char[][] data, int x, int y, char val) {<BR/>
   if (x &lt; 0 || y &lt; 0 ||x &gt;= xmax || y &gt;= ymax) {<BR/>
      return 1;<BR/>
   }<BR/>
   if (visited[x][y]) return 0;<BR/>
   if (data[x][y] != val) return 1;<BR/>
   visited[x][y] = true;<BR/>
   return check(data, x+1, y, val) + check(data, x-1, y, val) +<BR/>
          check(data, x, y+1, val) + check(data, x, y-1, val);<BR/>
}<BR/>
</P>

<P>
That is far shorter than average Div-II solution.  (I took inspiration 
from the Div-I coders, after the contest.)  It's also the sort of 
problem which is quite easy once you've seen a solution, but is 
hard to find in textbooks.  Note that a little global data is very
useful.
</P>

<P>
I noticed that the test cases on which the problems failed tended to 
involve large amounts of input.  This means that I may have failed to
spot errors in some of the problems.
</P>
  
<P>
Problems:
<OL>
	<LI>Segmentation faulting</LI>
	<LI>Not search for continuous areas correctly.  This included adding to
the area count every time there was a fence, or only adding to it if the square was an island of size 1x1.</LI>
</OL>
</P>

<p>
<img src="/i/m/slowjoe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="271917" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>
          
<P><B>Member Comments</B></P>

<P>
In "Lessons Learned the Hard Way" for "Single Round Match 88" slowjoe
states for the algorithm of the hard problem:
"[...] but is hard to find in textbooks."
</P>

<P>
I believe that depth first search (DFS), what this basically is, can be
found in about *every* textbook. The only part you have to do yourself
is to see the graph in the matrix.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=263379" CLASS="bodyGeneric">pochmann</A>
</P>

<HR/>

<P>
sloejoe, I think you have a problem in your 1000 pt div2 answer.
</P>
 
<P>
You say
</P>
 
<P>
// Recursively check the fences<BR/>
check(data, visited, i, j, data[i][j]);<BR/>
areaCount++;<BR/>
</P>

<P>
I say
</P>
 
<P>
// Recursively check the fences<BR/>
count += check(data, visited, i, j, data[i][j]);<BR/>
areaCount++;<BR/>
}<BR/>
:0 !<BR/>
</P>
 
<P><A HREF="/tc?module=MemberProfile&amp;cr=280735" CLASS="bodyGeneric">Shammah</A></P>

         
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
