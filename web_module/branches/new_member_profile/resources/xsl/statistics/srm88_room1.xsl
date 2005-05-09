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
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 88</B><BR/>
May 15, 2002</P>
<P><B>Room 1 Review</B></P>

<P>
Since the 300 and 500 were pretty easy, almost everyone got both of
those correct.  The only exception was <A HREF="/tc?module=MemberProfile&amp;cr=113178" CLASS="bodyGeneric">po</A>, whose 300 point problem failed 
systests.  Of the three hundreds, 
<A HREF="/tc?module=MemberProfile&amp;cr=120816" CLASS="bodyGeneric">malpt</A>
 was the quickest, submitted in
4 minutes for 293.94 points.  <A HREF="/tc?module=MemberProfile&amp;cr=155275" CLASS="bodyGeneric">DjinnKahn</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=129672" CLASS="bodyGeneric">doeth</A>
 were right behind him,
with 293.22 and 292.77 points, repsectively.  The 500 point submissions 
were all very fast, and all in about the same amount of time, with a 
range of only 32 points.  <A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A> manage to come out on top, 
beating <B>DjinnKahn</B> by about 5 points.  However, <B>DjinnKahn</B> was faster on 
the 300, and managed to beat <B>John Dethridge</B>
 by less than a point.  So, 
after about 20 minutes, most people were done with the 300 and 500 and 
had moved on to stare at the 1100.  
</P>

<P>
For the next 50 minutes or so 5 of 
the room 1 coders worked to figure out the trick to prevent the problem 
from timing out, to no avail.  With about five minutes left, 
<B>po</B> and <A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="bodyGeneric">evd</A>
both finally submitted solution.  <B>DjinnKahn</B> did slightly better, 
submitting with a little over 10 minutes left.  But, in the end the 
winner, hands down, was <B>dmwright</B>, whose 1100 point problem took a little
over 20 minutes.  In the end only 4 of the coders had submitted
solutions to all three problems.  Of these only two would pass systests, as <B>po</B>'s
300 and 1100 failed, while <B>DjinnKahn</B>'s 1100 failed.  Thus, when are had been 
said and done, <B>dmwright</B> cleaned up, beating second place <B>evd</B> by over 300
points and taking the division by over 100 points.  Due to the low 
deviation in the scores, most of the room 1 coders kept much the 
same rating.  The top 3 all moved up about 60 points, while <B>po</B> ended up 
taking a big hit and dropping 105 points.
</P>

<TABLE ALIGN="center" CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#CCCCCC" ALIGN="left" CLASS="bodyText" WIDTH="16%"><B>&#160;Problem<BR/>&#160;</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Points<BR/>&#160;</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Submission Rate</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Submission Succ.</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Avg. Pts.<BR/>&#160;</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="center" CLASS="bodyText" WIDTH="16%"><B>High Score<BR/>&#160;</B></TD>
  </TR>
  <TR>
    <TD BGCOLOR="#FFFFFF" COLSPAN="6"><IMG BORDER="0" HEIGHT="5" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText" COLSPAN="6">Division I</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 1<BR/>Patterns</TD>
    <TD ALIGN="right" CLASS="bodyText">300</TD>
    <TD ALIGN="right" CLASS="bodyText">86.78%</TD>
    <TD ALIGN="right" CLASS="bodyText">69.60%</TD>
    <TD ALIGN="right" CLASS="bodyText">232.42</TD>
    <TD ALIGN="center" CLASS="bodyText">malpt<BR/>293.94</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 2<BR/>Farmers</TD>
    <TD ALIGN="right" CLASS="bodyText">500</TD>
    <TD ALIGN="right" CLASS="bodyText">82.38%</TD>
    <TD ALIGN="right" CLASS="bodyText">66.96%</TD>
    <TD ALIGN="right" CLASS="bodyText">347.94</TD>
    <TD ALIGN="center" CLASS="bodyText">venco<BR/>461.67</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 3<BR/>SlideGame</TD>
    <TD ALIGN="right" CLASS="bodyText">1100</TD>
    <TD ALIGN="right" CLASS="bodyText">11.01%</TD>
    <TD ALIGN="right" CLASS="bodyText">3.08%</TD>
    <TD ALIGN="right" CLASS="bodyText">594.14</TD>
    <TD ALIGN="center" CLASS="bodyText">dmwright<BR/>771.97</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD BGCOLOR="#FFFFFF" COLSPAN="6"><IMG BORDER="0" HEIGHT="20" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText" COLSPAN="6">Division-II</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 1<BR/>BadSpanish</TD>
    <TD ALIGN="right" CLASS="bodyText">300</TD>
    <TD ALIGN="right" CLASS="bodyText">66.49%</TD>
    <TD ALIGN="right" CLASS="bodyText">23.27%</TD>
    <TD ALIGN="right" CLASS="bodyText">195.55</TD>
    <TD ALIGN="center" CLASS="bodyText">mthreat<BR/>281.41</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 2<BR/>Divisors</TD>
    <TD ALIGN="right" CLASS="bodyText">500</TD>
    <TD ALIGN="right" CLASS="bodyText">54.48%</TD>
    <TD ALIGN="right" CLASS="bodyText">15.60%</TD>
    <TD ALIGN="right" CLASS="bodyText">365.51</TD>
    <TD ALIGN="center" CLASS="bodyText">FlySkippy1<BR/>479.62</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
   <TD ALIGN="left" CLASS="bodyText">Level 3<BR/>Farmers</TD>
   <TD ALIGN="right" CLASS="bodyText">1000</TD>
   <TD ALIGN="right" CLASS="bodyText">21.23%</TD>
   <TD ALIGN="right" CLASS="bodyText">9.72%</TD>
   <TD ALIGN="right" CLASS="bodyText">576.13</TD>
   <TD ALIGN="center" CLASS="bodyText">b0b0b0b<BR/>853.39</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
</TABLE>
<P><BR/></P>
<IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;lbackstrom<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=159052" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


