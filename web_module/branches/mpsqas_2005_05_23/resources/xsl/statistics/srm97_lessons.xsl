<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Lessons Learned the Hard Way</B><BR/>
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

<IMG SRC="/i/m/slowjoe_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;slowjoe<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=271917" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <center><A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_rookie','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A></center><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


