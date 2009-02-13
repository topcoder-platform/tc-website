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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505515" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 97</span><br>June 12, 2002
<br /><br />

<span class="bigTitle">Lessons Learned the Hard Way</span>
<br/>
June 14, 2002
</P>

<P>
Srm 97 was a wednesday night match. "En Topcoder", it was the night that
<B>Reid</B> blew through the 3000 point barrier.  In the rest of the world,
it was the day that Argentina were knocked out of the Soccer World
Cup.
</P>

<P>
As matches go, the problem set for Division-II is probably one of my
favourites.  The problems seem to me to give freshness to existing
themes.  There appear to have been a little over 330 coders in Div-II.
Each of the first two problems had a success rate of above 66%, and 
the third problem was real challenge.  This was done without resorting
to obscurity or mindless complexity.  In my view, that made for a
good, tough match.
</P>

<P>
<B>250 (MountainP):</B>
</P>

<P>
Take a string, sort the characters, then add the minimum necessary to
make a palindrome.
</P>

<P>
Not a great deal to be said, except that this isn't the sort of problem
which most of us have had to think about previously.  
</P>

<P>
One approach (indexing physically):
</P>

<P>
<pre>
char[] data = input.toCharArray();
Arrays.sort(data);
StringBuffer sb = new StringBuffer(new String(data));
char c = data[data.length-1];
for (int i = data.length-1; i &gt;= 0; i++) {
   if (c != data[i]) {
      sb.append(data[i]);
   }
}
return sb.toString();
</pre>
</P>


<P>
Problems:
<OL>
   <LI> A number of coders included a palidrome test (probably because
   palidromes featured in the previous match.)  The test-case "racecar"
        in particular exacted a toll when code-paths weren't worked out right.</LI>    
   <LI> Some coders failed when there were duplicate instances of the last 
        letter.</LI>
   <LI> One way to reverse a String is to use StringBuffer.reverse().
        However, unlike String, StringBuffer is not immutable, and the 
        original StringBuffer is changed.  So code like</LI>
</OL>
</P>

<P>
<pre>
StringBuffer sb1 = new StringBuffer();
StringBuffer sb2 = new StringBuffer();
sb1.append(input):
sb2 = sb1.reverse();
</pre>
    is likely to cause problems.  (Of course, this should have been caught 
    by testing.)
</P>


<P>
Less than a third of failing solutions were caught by challenges.  I'd 
argue that close attention to this problem was the easiest way to find
a successful challenge.  The grey coders did beet here: they successfully
challenged 39% of failing submission vs only 18.5% in the green rooms.
Neatly, that's twice as good.
</P>

<B>500 (JumpGame):</B>

<P>
This problem's input was a target and an array to represent moves in a
hypothetical game.  The values (i, input[i]) represented a directed
edge.  The goal was to return an array of all values of i whose
successor sequence contains the target.
</P>

<P>
where 0&lt;=i&lt;input.length where the sequence { i, input[i],
input[input[i]], ... } contained a particular value.
</P>

<P>
The solution is obvious to me now: simply trace the path starting at
each possible index of the array, and check whether the target was in
the sequence.  A little care was needed to check for loops, but
otherwise, the solution isn't taxing.  I give a complete solution:
</P>

<P>
<pre>
import java.util.*;
public class JumpGame {
    public int[] whichOnes(int[] boardSpec, int target) {
   // We will cache each 
   ArrayList al = new ArrayList();      
        for (int i = 0; i &lt; boardSpec.length;i++) {
            if (check(boardSpec, target, i, 0)) {
      al.add(new Integer(i));
            }
        }
        int[] ret = new int[al.size()];
        for (i = 0; i &lt; al.size();i++) {
            ret[i] = ((Integer)al.get(i)).intValue();
        }
        return ret;
    }
    boolean check(int[] arr, int target, int val, int count) {
        if (count == arr.length) return false;
        if (arr[val] == target) return true;
   return check(arr, target, arr[val], count+1);
    }
}
</pre>
</P>


<P>
This clearly shows two Java design decisions interacting to make C++ a
better choice for this problem.  These are the fact that {int, char,
boolean, etc} are not objects, and that extensible arrays like
ArrayList and Vector only hold objects.
</P>

<P>
In contrast, the same solution in C++ (my first ever C++ program...):
</P>

<P>
<pre>
#include &lt;string&gt;
#include &lt;vector&gt;
class JumpGame {
public:
    vector&lt;int&gt; whichOnes(vector&lt;int&gt; boardSpec, int target) {
        vector&lt;int&gt; ret;
        for (int i = 0; i &lt; boardSpec.size();i++) {
            if (check(boardSpec, target, i, 0)) {
                ret.push_back(i);   
            }
        }
        return ret;
    }
    int check(vector&lt;int&gt; arr, int target, int val, int count) {
        if (count == arr.size()) return 0;
        if (val == target) return 1;
        return check(arr, target, arr[val], count+1);
    }
};
</pre>
</P>

<P>
I guess Java gives stack traces and StringTokenizer, C++ is bound to 
have some advantages.
</P>

<P>
While this is clear, clean and elegant, in competition, I went and used
a breadth-first search, and took a week longer than everyone else. 
</P>

<P>
Problems:
<OL>
   <LI> Daft algorithm choice :)</LI>
   <LI> When checking for loops, looping a maximum of val times.</LI>
   <LI> Not checking for loops at all.</LI>
   <LI> Not considering that a sequence starting at target obviously 
    contains target.  (This was catchable from the examples)</LI>
</OL>
</P>

<P>
<B>1000 (LineDraw):</B>
</P>

<P>
Given the data on a series of up to 25 points, calculate the least
number of points which are not on two straight lines.
</P>

<P>
To me, this seems to cry out for a brute force solution.  In
particular, the fact that the problem size is 25 rather than the
traditional 50 is a dead give-away.  (For the newer coders, the number
50 has some poorly-understood mystical significance to the initiates of
the Topcoder problem-writers' guild.)
</P>

<P>
So simple loops are your friend:
<pre>
    for (int i = 0; i &lt; xs.length; i++)
      for (int j = i+1; j &lt; xs.length; j++)
        for (int k = 0; k &lt; xs.length; k++)
          for (int l = k+1; l &lt; xs.length; l++) {
              // Check lines in here...
          }
</pre>
</P>

<P>
The more difficult element of a solution is the reliable check whether
a point is on a line.  My solution (not debugged in time) used a Line
class with isHorizontal and isVertical fields to avoid divide by zero.
Beyond that, the slope in maintained as delta_y and delta_x.  
</P>

<P>
Then 
<pre>
   slope1 == slope2  
=&gt; delta_y1 / delta_x1 == delta_y2 / delta_x2
=&gt; delta_y1 * delta_x2 == delta_y2 * delta_x1
</pre>
So all the nasty floating point maths related to slope can be avoided,
provided there is no overflow.
</P>

<P>
As Zorba points out, a range of -20,000 &lt; x, y &lt; 20,000 means that
there isn't even a need to take a gcd.
</P>

<P>
Problems:
<OL>
   <LI> I saw an O(n^8) problem which fell to a challenge.</LI> 
   <LI> Looping using the following code:
<pre>
    for (int i = 0; i &lt; xs.length; i++)
      for (int j = 1; j &lt; xs.length; j++)
        for (int k = 2; k &lt; xs.length; k++)
          for (int l = 3; l &lt; xs.length; l++) {
              // ...
          }
     return min;
   }
</pre>
    This actually has a couple of problems.  It revisits the same points 
    repeatedly once all counter are greater than 3.  If the input size is
    6, It fails when points { 1, 2 } are colinear, and (say) {0, 3, 4, 5}
    are colinear.</LI> 
   <LI> Floating point math caught a few.  Remember, AVOID!</LI> 
</OL>
</P>

<p>
<img src="/i/m/slowjoe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="271917" context="algorithm"/><br />
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
