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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm88_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm88_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm88_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm88_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links <A HREF="/stat?c=last_match&amp;rd=4140" CLASS="bodyGeneric">NDBronson</A> -->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 88</B><BR/>
May 15, 2002</P>
<P><B>Lessons Learned the Hard Way</B></P>

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

<IMG SRC="/i/m/slowjoe_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;slowjoe<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=271917" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          
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
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


