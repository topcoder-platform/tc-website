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
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 89</B><BR/>
May 18, 2002</P>
<P><B>Rookie Review</B></P>
<P>At the end of the coding phase, the rookie high scorers were:
<UL>
    <LI><B>Room 48</B></LI>
    <UL>
        <LI>ethaneade: 1327.48</LI>
    </UL>
    <LI><B>Room 49</B></LI>
    <UL>
        <LI>jmarron: 1447.99</LI>
        <LI>stewarrb: 1265.58</LI>
    </UL>
    <LI><B>Room 51</B></LI>
    <UL>
        <LI>ssotangkur: 1210.89</LI>
    </UL>
    <LI><B>Room 52</B></LI>
    <UL>
        <LI>purpleankh: 1396.96</LI>
        <LI>InsaneParadox: 1248.12</LI>
    </UL>
</UL>
</P>
<P>The Challenge Phase would shake things up a bit, however. In Room 48, <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">ethaneade</A> 
boosted his score by submitting 5 challenges, 4 of which were successful. This earned him 150 points, raising his score to 1477.48. In Room 49, 
<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">stewarrb</A> lost 50 points due to an unsuccessful challenge, and later lost his points earned 
from the Level 2 problem in the System Test Phase, putting him out of the running. Meanwhile, in Room 51, <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">ssotangkur</A> 
gained 150 points with 3 successful challenges, giving him a score of 1360.89.</P>

<P>Many of these impressive scores were then mowed down by the system tests. In Room 48, <B>ethaneade</B> lost his points for the Level 2 problem, reducing his score 
to a modest 1060.64 (still sufficient to win his room).</P>

<P>The same also applied to <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">jmarron</A> and <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">stewarrb</A> 
in Room 49, who finished second and third in the room, respectively. In Room 52, <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">purpleankh</A> also 
lost his Level 2 problem, leaving him with 1002.92 points and third in the room.</P>

<P><A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">InsaneParadox</A> and <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">ssotangkur</A> passed all 
of the system tests, and thus each won his room. <B>InsaneParadox</B> finished with a total 1248.12 points, the second highest rookie score of the match, while <B>ssotangkur</B> finished with 
1360.89, giving him the highest rookie score of the match and a shiny yellow rating.</P>
<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


