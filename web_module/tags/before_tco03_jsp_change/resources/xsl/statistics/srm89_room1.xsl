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
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">-->
<P><B>Single Round Match 89</B><BR/>
May 18, 2002</P>
<P><B>Room 1 Review</B></P>

<P><B>Coding Phase</B><BR/><BR/>
Much like the rest of Division 1, Room 1 submitted a mediocre performance in SRM 89, most likely due to the difficulty 
of the problems.  Initially all but <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">dmwright</A> and 
<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">po</A> opted to begin on the 200 point problem.  Within five minutes, 
<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">John Dethridge</A>, <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">venco</A>, 
and <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">benetin</A> had each submitted the 200 point problem.  Five minutes later saw submissions 
from <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">DjinnKahn</A> and <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">dvickrey</A>, 
leaving <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">Sord</A>, <B>dmwright</B>, and <B>po</B> as the only ones not to have submitted a problem.</P>

<P>At the 21 minute mark, <B>venco</B> became the first to submit a 600 point solution for 476.40 points, making him the first to submit two problems. 
He must have observed a problem with his solution, however, because he resubmitted it two minutes later, reducing the value of his solution to 390.55 points. 
At about the same time <B>Sord</B> submitted a solution to the 200 point problem as his first submission and po submitted his 600 point solution, leaving 
<B>dmwright</B> as the only one without a submission.</P>

<P>A few minutes later <B>dmwright</B> through with his 600 point solution, which was immediately followed by <B>John Dethridge's</B> 600 point solution. 
Within five minutes <B>dmwright</B> had also submitted his 200 point solution.</P>

<P><B>DjinnKahn</B>, <B>dvickrey</B>, and <B>Sord</B> were next to submit 600 point solutions over the following half hour.  The 900 point submissions did not 
arrive until the final five minutes of the Coding Phase.  The first 900 point submission came from <B>venco</B>, for 392.79 points.  The last submission of the 
Coding Phase was <B>benetin's</B> 900 point submission, for 490.16.  This gave these two competitors the lead going into the Challenge Phase.  At the end of the 
Coding Phase, the scores were:
<OL>
    <LI>venco: 976.36 (3 submissions)</LI>
    <LI>benetin: 682.72 (2 submissions)</LI>
    <LI>John Dethridge: 597.17 (2 submissions)</LI>
    <LI>dmwright: 555.25 (2 submissions)</LI>
    <LI>DjinnKahn: 538.10 (2 submissions)</LI>
    <LI>dvickrey: 514.56 (2 submissions)</LI>
    <LI>Sord: 419.41 (2 submissions)</LI>
    <LI>po: 381.33 (1 submission)</LI>
</OL>
</P>
<P><B>Challenge Phase</B><BR/><BR/>
<B>venco</B> opened up the Challenge Phase with an unsuccessful challenge of Sord's 200 point submission. <B>John Dethridge</B> then immediately followed up with a 
successful challenge of the same submission, exploiting the fact that <B>Sord's</B> solution incorrectly returned answers with exponents of <TT>1</TT>. This narrowed 
the gap between <B>benetin</B> and <B>John Dethridge</B>.</P>
<P>Things were quiet for the next seven minutes, until <B>dmwright</B> successfully challenged <B>DjinnKahn's</B> 600 point submission, taking advantage of <B>DjinnKahn's</B> 
incorrect implementation of a distance function for the hexagonal coordinate system and pulling himself further ahead of <B>dvickrey</B>.</P>

<P>The final challenge came a few minutes later in the form of another successful challenge by <B>John Dethridge</B> of the other submission from <B>Sord</B>. 
<B>Sord's</B> error consisted of accidentallY doubling the power of a club on the opening stroke.</P>

<P>The Challenge Phase concluded with a close race for second place between <B>John Dethridge</B> and <B>benetin</B>, with <B>venco</B> having a comfortable lead in first place. 
The scores at this point were:
<OL>
    <LI>venco: 926.36</LI>
    <LI>John Dethridge: 697.17</LI>
    <LI>benetin: 682.72</LI>
    <LI>dmwright: 605.25</LI>
    <LI>dvickrey: 514.56</LI>
    <LI>po: 381.33</LI>
    <LI>DjinnKahn: 177.53</LI>
    <LI>Sord: 0.00</LI>
</OL>
</P>
<P><B>System Test Phase</B><BR/><BR/>
The system tests knocked out both 900 point submissions, from <B>benetin</B> and <B>venco</B>. <B>benetin's</B> submission timed out on the <TT>12</TT>x<TT>12</TT> sample case, which 
explains why he submitted it in the final two minutes of the Coding Phase. <B>venco's</B> submission failed to detect that it was impossible to pair up all the students in one of 
the system test cases.</P>
<P>The only other submission to fail the system tests was <B>po's</B> 600 point solution, which strangely enough timed out on one of the sample cases.</P>

<P><B>Final Results</B><BR/><BR/>
The final scores were:
<OL>
    <LI>John Dethridge: 697.17</LI>
    <LI>dmwright: 605.25</LI>
    <LI>venco: 533.57</LI>
    <LI>dvickrey: 514.56</LI>
    <LI>benetin: 192.56</LI>
    <LI>DjinnKahn: 177.53</LI>
    <LI>po: 0.00</LI>
    <LI>Sord: 0.00</LI>
</OL>
</P>
<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


