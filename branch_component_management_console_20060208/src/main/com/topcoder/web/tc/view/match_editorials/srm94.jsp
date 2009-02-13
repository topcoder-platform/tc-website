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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm94_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm94_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505512" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm94" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 94</span><br>June 3, 2002
<br /><br />

<H1> 
The Problems 
</H1> 

<b>DIV-I easy? (350 points, SquareFind.numSquares):</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505512" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


<p>This problem had some people
puzzled. I know in my room, I, and at least one other person, spent almost the
whole contest on this problem. However, if you recognized how to determine a
square quickly, you were all set, as no special algorithm was needed to loop
through the inputs.<br/>
<br/>
Given a list of points, return the number of perfect squares you can find
between all the points. Oh, and squares need not be aligned to the axes.<br/>
There were two algorithms that I saw for this problem:<br/>
1) for all possible sets of 4 points, determine if they make a square.<br/>
2) search for square line possibilities, then return the count / 4.<br/>
<br/>
for the first algorithm, there were two properties that you needed to look for:<br/>
1. two diagonals were equal non-zero length<br/>
2. all four lines were equal length<br/>
<br/>
If these two properties were true, it must be a square. For a good solution of
this type, see bigg_nate's solution.<br/>
<br/>
For the second algorithm, this was a clever way to determine squareness.
Consider a line between two points p<sub>1</sub> = (x<sub>1</sub>,y<sub>1</sub>)
and p<sub>2</sub> = (x<sub>2</sub>,y<sub>2</sub>). This line is a part of a
square if and only if there exists two points p<sub>3</sub> = (x<sub>3</sub>,y<sub>3</sub>),
and p<sub>4</sub> = (x<sub>4</sub>,y<sub>4</sub>) in our list, such that p<sub>1</sub>,
p<sub>2</sub>, p<sub>3</sub>, and p<sub>4</sub> make a square. If we say that
starting at p<sub>n</sub>, traveling to p<sub>n+1</sub>, we can get to p<sub>n+2</sub>
by turning left 90 degrees. Using geometry, we can calculate x<sub>n+2</sub> by
the formula x<sub>n+1</sub> - (y<sub>n+1</sub> - y<sub>n</sub>), and calculate
y<sub>n+2</sub> by the formula y<sub>n+1</sub> + (x<sub>n+1</sub> - x<sub>n</sub>).
Using this relationship, we can find p3 and p4.<br/>
<br/>
At the end, we have each side of a square being counted once for the square
that it can be in, so we must divide the number of matches by 4 to get the
number of squares.<br/>
<br/>
For a good example of this, see venco's solution</p>

<b>DIV-I medium (450 points, NumberFill.gradient):</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505512" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


<p>This was a fill algorithm
problem with two stages. In the first stage, you searched each area for the
highest number, saving the position. In the second stage, you filled the area
from that number with the following rules when you fill in a given direction:<br/>
<br/>
up, down: copy the number in the current location<br/>
right: add one to the number in the current location<br/>
left: subtract one to the number in the current location<br/>
standard recursive fill algorithms execute in plenty of time.</p>

<b>DIV-I hard (1050 points, Counter.tallyer):</b>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505512" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


<p>This problem was a combinatorical problem. The range of 1 to
99999999 made sure a brute force solution would time out. Of the myriad of ways
to solve this problem, I chose two that I thought were good representations of
the mentality necessary to solve it:<br/>
<br/>
<b>METHOD 1: break the range into two more manageable pieces of 1 to 9999.
(SnapDragon)</b><br/>
<br/>
Assume we have two functions: sum(n) = the sum of the digits of n, and prod(n)
= the product of the digits of n.<br/>
<br/>
1 to 9999 is a very manageable range, and can be easily counted. The way
SnapDragon did his algorithm is:<br/>
step 1: count the ways you can make your number from 1 to 9999 for both
products and sums by using the sum and prod functions.<br/>
<br/>
step 2: if high &gt;= 10000, count the ways you can make your number from high
- (high % 10000) to high. I will explain the reasoning for this below.<br/>
<br/>
step 3: Here is the tricky part. He builds a map of all the possibilities for
0000 to 9999 (including leading 0s) for both sums and products. The key of the
map is the sum or product of all the digits, and the value is the number of
ways that sum or product is achieved in this range. For each number in the
range, he adds one to the map elements with keys sum(n) and prod(n).<br/>
<br/>
Then, we assume that for the range:<br/>
<i>n * 10000 + 0 to n * 10000 + 9999</i><br/>
The number of &quot;valid&quot; numbers whose digits add up to x are the number
of numbers in the range:<br/>
<i>0000 to 9999</i><br/>
whose sum adds up to x - sum(n). You can see that we can use the key x - sum(n)
to look up the precomputed value in the map. Therefore, for each range of
numbers, there is only one call to sum(n) and one search in the map.<br/>
<br/>
Products are computed the same way, except instead of using x - sum(n), he uses
x / prod(n) (being careful for divide by 0 errors).<br/>
<br/>
Step 3 is done for all n such that 1 &lt;= n &lt; high / 10000.<br/>
<br/>
Notice that we do not say n &lt;= high / 10000. The reason for this is because
we already did the values where n == high / 10000 in step 2. We cannot do those
numbers in step 3 because step 3 goes up to n * 10000 + 9999, which may be
higher than the high number.<br/>
<br/>
<b>METHOD 2: For sums, break the ranges into smaller ranges. (dmwright)</b><br/>
<br/>
First, for the products, it is pretty apparent that all the digits must be
factors of x, and none can be 0 (unless the product is 0). This eliminates most
of the numbers in the range, allowing a brute force solution to work for
products. dmwright's algorithm to find the products is to try all values for
digits. If a particular value is not a factor of the number, or the current
product is greater than the number, or the current number is greater than the
high value, try another value.<br/>
<br/>
Now, for the sums, perform the recursive function below:<br/>
for a given range, if the high limit of the range is &lt; 10, return 1 if the
target is in the range of numbers given, 0 otherwise.<br/>
if the high limit is &gt; 10, he sets the lowest digit to 0 - 9, and then
recurses for the higher digits by calling the function again with the range low
/ 10 to high / 10 trying to match the value x - digit. The only issue is for
the first 10 numbers in the range, and the last 10 numbers in the range. For
example, in the range 25 - 143, he actually calculates the values for 20 - 149.
He must remove the values for 20 - 24, and the values for 144 - 149. He does
this by hand calculating the sums for those numbers, and if they equal the
target, subtracting one from the total.<br/>
<br/>
The final touch is to use memorization to eliminate duplicate calculations.<br/>
<br/>
Note that this technique could be used for products as well, by recursing with
x / digit instead of x - digit as the new target.</p>


<p>
<img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
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
