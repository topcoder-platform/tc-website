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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
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
<P><B>Single Round Match 89</B><BR/>
May 18, 2002</P>
<P><B>Lessons Learned the Hard Way</B></P>

<P>SRM89 was a Saturday afternoon contest, starting at 1pm.  The
unusually early start time saw a couple of people griping in the
lobby.  The entry of 500 coders (low compared to many recent
contests) may have been related to this.  In division 2, this resulted
in 33 room, of which 5 were rookies.</P>

<P>The problem slate was challenging enough to be interesting, but
doable.  For instance, in all rooms except one room of the rooky
section, someone got the level 3 problem.  Challenge phase appears
to have been pretty quiet.</P>

<P>200 (Average):<BR/><BR/>
Given 2 int arrays, count the number combined socre (score[i] = a[i] + b[i])
which are below average.</P>

<P>Some care is needed to ensure that scores equalling the average don't get returned.
Most submission for this problem were successful.</P>

<P>The easiest test for below average is:<BR/>if (total&#91;i&#93; &#42; length &#60; totalSum)</P>

<P>Problems:<BR/><BR/>
1.  Using integer division, which rounds down the average number.<BR/>
2.  Some solutions appear to fail because of lack of precision in floating
    point maths.<BR/>
3.  Counting entries which are above average instead of below.<BR/>
4.  Testing whether individual scores were less than average.<BR/>
5.  Returning the average.<BR/>
6.  Calculating the average based on math.length-1</P>

<P>I'd be surprised if some of the failing solutions could have been tested much.
I know it's often hard while others are submitting</P>

<P><B>500 (Powerful):</B><BR/><BR/>
This problem also saw service as the div1 200.  The goal of the problem was check whether the input, 
an integer (1 &#60;= n &#60;= 2,000,000,000), was an exact power, and return either an error message or an 
expression of the number as the highest possible power (ie 81=3^4 and not 9^2). Subtleties included 
the fact that 1 was not considered to be a power.</P>

<P>A simple brute force search is possible. Sqrt(2,000,000,000) is roughly 
45,000.  Since 2 billion is close to 2^31, the time complexity on linear
brute force (worst case) is way less than 1.4 million iterations.</P>

<P>At first sight, it looks like a floating point problem.  I'd actually
recommend avoiding floating point math like the plague.  Something like the
following is much more likely to work:</P>
<pre>

maxBase = maxPow = 0
// Quite important for the loop to allow square roots.
for (int base = 2; base &#60; Math.sqrt(number+1); base++) {
	int result = 1;
	for (int pow = 2; pow &#60; 32; pow++) {
		result &#42;= base;
	}
	if (pow &#62; maxPow) {
		maxPow = pow;
		maxBase = base;
	}
}
if (maxPow &#62; 0) {
	return ""+maxBase+"^"+maxPow;
} else {
	return "NOT A PERFECT POWER";
}
</pre>

<P>It is interesting that many solutions to this problem failed, but relatively 
few successful challenges were made.  In particular, the first 2 test cases,
2,000,000,000 and 1,000,000,000, seem to have tripped up many coders.</P>

<P>Problem:<BR/><BR/>

1.  Uncaught C++ exceptions felled some people (I don't understand C++ sufficiently
    to find the cause.<BR/>
2.  Failing to return the highest power.<BR/>
3.  One solution checked whether the current power was even, and returned false
    if this was the case.<BR/>
4.  Incorrect looping bounds.  Some solutions looped to j &#60; Math.sqrt(number).
    Others looped to "klimit = sqrt(number) / 1000"<BR/>
5.  Misreading the problem: one coder returned "2^1" on input of 2.<BR/>
6.  Over-complicating the algorithm.  Some coders tried to do a binary search,
    and left fence-post errors.</P>

<P>The pass rate for this problem was low, and the errors quite diverse, so I've probably
not covered quite a few problems, I'm afraid.</P>

<P><B>900 (Filter):</B><BR/>
Given a field of '1's and '0's, remove all '1's which do not form a cross pattern,
then count the number removed.</P>

<P>This problem was straightforward (there were probably more correct solutions than
for the 600.  Two basic approaches seem to have been used: one was to check all possible
crosses containing the current element.  The other was to check each possible cross, and
store the result of the check, then compare the input to the data.</P>

<P>Problems:<BR/><BR/>
1.  One technique used was to check around a particular element:<BR/>
<pre>
boolean inCross(int x, int y, char&#91;&#93;&#91;&#93; data) {
	if (centre(x+!, y, data)) return true;
	if (centre(x-1!, y, data)) return true;
	if (centre(x, y+1, data)) return true;
	if (centre(x, y+1, data)) return true;
	if (centre(x, y, data)) return true;
	return false;
}

boolean centre(int x, int y, char&#91;&#93; data) {
	if (x&#62;=0 || y>=0 || x&#60;=maxX || yx&#60;=maxY) return false;
	if (data&#91;x-1&#93;&#91;y&#93; != '1') return false;
	if (data&#91;x+1&#93;&#91;y&#93; != '1') return false;
	if (data&#91;x&#93;&#91;y-1&#93; != '1') return false;
	if (data&#91;x&#93;&#91;y+1&#93; != '1') return false;
	// Note: no check on the centre
	return true;
}
</pre></P>
<P>This would fail on:<BR/><BR/>
<pre>
111
101
111
</pre>
2.  Exceeding time limits.<BR/>
3.  ArrayIndexOutOfBoundsException thrown.<BR/>
4.  Overwriting intermediate results.  Some solutions kept arrays of previously 
    calculated results.  They didn't check the contents and lost data, ending 
    with the wrong answer.</P>

<P>Finally, a response to Pochmann's comment on my column on SRM88:
I was referring to a problem solution technique as "flood and fill", which I hadn't
found in textbooks.  He correctly pointed out that the search technique used is
depth first search, which is _every_ textbook, pretty much.</P>

<P>My comment was based on the idiom used.  I've seen the same type of problem a couple
of times in room 1.  Looking over some of the solutions, spotting the differences can
be like spotting differences between two peoples' "for" loops.  The level 3 problem in
SRM88 was generally attacked by rather adhoc and difficult-to-read code, and privately,
a couple of people have asked that I cover algorithms in a little more depth.</P>

<P>But pochmann is right :)</P>
<IMG SRC="/i/m/slowjoe_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;slowjoe<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=271917" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


