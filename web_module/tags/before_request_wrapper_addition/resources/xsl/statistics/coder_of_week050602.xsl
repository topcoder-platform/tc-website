<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/coder_week_pulldown.xsl"/>    
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
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
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
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Coder of the Week</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->				
        <xsl:call-template name="coder_week_pulldown"/>
	<!-- Coder of the Week Pulldown Ends -->					
					
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>					
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;May 6 - May 12, 2002</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>																	
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A> -->											
<IMG SRC="/i/m/kpsmith_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<b>Handle: </b><A HREF="/stat?c=member_profile&amp;cr=277956" CLASS="coderTextYellow">kpsmith</A><br/>
<b>Rating: </b>1929<br/>
<b>Member Since: </b>April&#160;20,&#160;2002<br/>
<b>Total Competitions: </b>2<br/>
</P>

<P>
TopCoder, Inc. announced today that <B>kpsmith</B> has been named the "Coder of the Week" for 
Single Round Matches 86 and 87, which took place between May 6 and May 12, 2002.  
</P>

<P>
In Single Round Match 86, <B>kpsmith</B>, in his initial TopCoder competition, earned a 
Division-II record 1935.74 final points 
(<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="statText">View the list of Division-II Rating Point Gain</A>).  
That point total broke the Division-II record of <A HREF="/stat?c=member_profile&amp;cr=155069" CLASS="coderTextBlue">chi</A>, 
who earned 1898.64 final points in 
Single Round Match 67 in February.  The final point total of <B>kpsmith</B> is also TopCoder's 
all-time point record, 8.35 more than the 1927.39 total of <A HREF="/stat?c=member_profile&amp;cr=109965" CLASS="coderTextYellow">vulture</A> in Single Round Match 1, 
which strangely enough occurred exactly one year to the date (May 8, 2001).  <B>kpsmith</B> also 
broke the record for the most points earned in a debut match, which was held by <A HREF="/stat?c=member_profile&amp;cr=112630" CLASS="coderTextYellow">Aleksey</A>, 
who earned 1787.55 final points in the Second Round of the 2001 TopCoder Collegiate Challenge.  
Lastly, <B>kpsmith</B> had a debut rating of 1894, which is the seventh highest ever 
(<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A>).
</P>

<P>
"I knew I had a good chance to do well, but you never know when a particular problem will cause 
you grief," said <B>kpsmith</B>.  I figured I had a 50/50 chance of winning $100.
</P>
 
<P>
<B>kpmsith</B> has been a TopCoder member since April 20, 2002, and is five-for-six in submissions and 
a perfect five-for-five in challenges in two overall matches.   
</P>

<P>
"I always loved both multi-player games as well as programming.  When I play other games on 
the net, I find that I spend as much time hacking on a client for the game as playing 
the game itself.  TopCoder seems to merge those two interests of mine really well"
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/stat?c=member_profile&amp;cr=281447" CLASS="coderTextYellow">Belle</A>, 
who had a 1746.01 final 
point total in Single Round Match 86, the fifth highest in Division-II; <A HREF="/stat?c=member_profile&amp;cr=275568" CLASS="coderTextBlue">stipe</A>, who had 
a 1706.88 final point total in Single Round Match 86, the 10th highest in Division-II 
debut rating of 1755, which is the 25th highest ever; and <A HREF="/stat?c=member_profile&amp;cr=277659" CLASS="coderTextYellow">radeye</A>, who had a 301-point 
rating gain in Single Round Match 87, which is the 10th highest in Division-I 
(<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="statText">View the list of Division-I Rating Point Gain</A>).
</P>

							</TD>						
						</TR>						
					</TABLE>
					<P><br/></P>
		</TD>
		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

