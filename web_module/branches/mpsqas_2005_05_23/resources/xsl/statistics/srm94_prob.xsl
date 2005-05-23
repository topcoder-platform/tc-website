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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm94_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm94_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm94_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <!-- <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR> -->
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 94</B><BR/>
June 3, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<b>DIV-I easy? (350 points, SquareFind.numSquares):</b>

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

<b>DIV-I medium (450 points, NumberFill.gradient):</b>

<p>This was a fill algorithm
problem with two stages. In the first stage, you searched each area for the
highest number, saving the position. In the second stage, you filled the area
from that number with the following rules when you fill in a given direction:<br/>
<br/>
up, down: copy the number in the current location<br/>
right: add one to the number in the current location<br/>
left: subtract one to the number in the current location<br/>
standard recursive fill algorithms execute in plenty of time.</p>

<b>DIV-I hard (1050 points, Counter.tallyer):</b>

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

<IMG SRC="/i/m/schveiguy_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;schveiguy<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=273217" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
<!-- <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
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


