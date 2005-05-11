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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
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
<P><B>Single Round Match 101</B><BR/>
June 26, 2002</P>

<P><B>Lessons Learned the Hard Way</B></P>

<P>
Srm 101 was the last paying Single Round Match, and as such, marked
the end of an era.  In the real world, it was in the day of the
WorldCom accounting scandal, and that Brazil won through to the Soccer
World Cup final.  The turnout of 594 was respectable.  I had anticipated
a record turnout for the last paying match, but was clearly wrong.
Another interesting stat is that there were only 21 debut coders.
</P>

<P>
The problem slate, in my opinion, was one of the easier slates we've
seen.  The level 3 problem was a calculation problem, the level 2 was
required a powerset enumeration, but was small enough to be hard
coded, and the level one required the ability of looping downwards
rather than upwards.
</P>

<P>
On challenge phase, performance was patchy.  Of failing problems,
25%, 26% and 41% were taken out in challenge phase.  As seems to be
the pattern, the grey coders took out the highest percentage of 
failing problems in challenge phase.
</P>

<P>
<B>225 (AutoMorphic):</B>
</P>

<P>
Take an integer, calculate its square, count the number of digit in
the input which are not part of the longest suffix of the input which
is also a suffix of the square.
</P>

<P>
This is a straightforward problem, solvable in a few lines of code.
Two approaches are obvious: 
<OL>
	<LI> Compare characters or digits starting with the least significant/
	 end of String.</LI>
	<LI> Convert to Strings, and check for substrings.</LI>
</OL>
</P>


<P>
Problems:
<OL>
	<LI> Working with prefixes instead of suffixes.</LI>
	<LI> Counting common digits after the first difference has occurred.</LI>
	<LI> Counting common digits instead of different digits.</LI>
</OL>
</P>


<P>
<B>475 (SRM):</B>
</P>

<P>
A prescient coder knows in advance how long and how many points they'll
get for each problem.  Return the highest total which can be attained
within 75 minutes.
</P>

<P>
This problem is best tackled as an exhaustive search problem.  C++ coders
who know std_algorithm.h have a definite advantage here.
</P>

<P>
I have library code:
<pre>
	boolean makePerm(boolean[] bs) {
		int i,j,len = bs.length;
		for (i = 0; i &lt; len &amp;&amp; bs[i];i++);
		if (i == len) return false;
		for (j = 0; j &lt; i; j++) {
			bs[j] = false;
		}
		bs[i] = true;
		return true;
	}
</pre>
</P>

<P>
It's horribly inefficient (O^n in an inner loop: you can enumerate far
better by bitmasking an int between 0 and 2^n-1, but I've never had a
problem with timing.  It's used as follows:
</P>

<P>
<pre>
boolean[] bs = new boolean[3];
while (makePerm(bs)) {
	current = count(bs, problemScores, times);
	best = (best &gt;= current) ? best : current;
}
return best;
</pre>
</P>

<P>
Of course, this is overkill: it is perfectly possible to simply check 
each of the eight cases individually.
</P>

<P>
Problems:
<OL>
	<LI> Checking cases individually, but not checking all of them.</LI>
	<LI> Overly complex code.</LI>
	<LI> Fencepost errors when the total time taken is exactly 75 minutes.</LI>
</OL>
</P>


<P>
<B>1000 (Speeding):</B>
</P>

<P>
For each driving offence, penalty points are added to a driver's
licence.  For each complete year of being offence-free, 3 points
are removed.  Given a list of offence dates and penalty values,
calculate the number of points on a driver's licence at a particular
date.
</P>

<P>
This problem seems simple to me.  My approach to this was to count
days since 12/31/1900, and compare based on this.  The only challenge
of the problem is to test effectively.
</P>

<P>
Problems:
<OL>
	<LI> ArrayIndexOutOfBoundsExceptions on empty input.</LI>
	<LI> Not dealing with offences exactly a year apart correctly.</LI>
	<LI> My initial solution assumed European "dd/mm/yy" style dates.</LI>
</OL>
</P>

<P><BR/></P>
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


