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
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;June 3 - 9, 2002</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>																	
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A> -->											
<IMG SRC="/i/m/SnapDragon_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<B>Handle: </B><A HREF="/stat?c=member_profile&amp;cr=272072" CLASS="coderTextRed">SnapDragon</A><BR/>
<B>Rating: </B>3005<BR/>
<B>Member Since: </B>March&#160;17,&#160;2002<BR/>
<B>Total Competitions: </B>17<BR/>
</P>

<P>
TopCoder, Inc. announced today that <B>SnapDragon</B>, based on his performance in Single 
Round Match 94, has been named the "Coder of the Week" for Single Round Matches 
94 and 95, which took place between June 3 and June 9, 2002.  
</P>

<P>
In Single Round Match 94, <B>SnapDragon</B> won Room 1 and increased his rating to 3005, 
becoming just the second member ever to reach that mark.  Also, by reaching 3000 
in 17 matches, <B>SnapDragon</B> is the quickest to reach 3000.  
<A HREF="/stat?c=member_profile&amp;cr=152073" CLASS="coderTextRed">NDBronson</A> is the only 
other TopCoder member to reach 3000.  He had a 3000 or better rating for SRM 47, 
54-65, and 77-84, and needed 22 matches to reach that mark.
</P>

<P>
"Well, to be honest, I've been extraordinarily lucky recently," said <B>SnapDragon</B>.  
"I never actually expected to reach #1 on the site; I've been intimidated by 
<A HREF="/stat?c=member_profile&amp;cr=152347" CLASS="coderTextRed">ZorbaTHut</A>
 and <A HREF="/stat?c=member_profile&amp;cr=270505" CLASS="coderTextRed">John Dethridge</A>'s 
 speed, <A HREF="/stat?c=member_profile&amp;cr=260835" CLASS="coderTextRed">reid</A>'s 
 credentials, and <A HREF="/stat?c=member_profile&amp;cr=114853" CLASS="coderTextRed">dmwright</A>'s 
persistence ever since I first discovered TopCoder.  My last 5 TC matches 
all went very well, and I keep waiting for this bubble of good fortune to burst around me. :)
</P>

<P>
The main reason for my success, of course, is that I am VERY experienced in 
computer competitions.  In many ways, TC is more about practice than intelligence.  
I've literally solved thousands of problems before, and by the time you've done 
that, it's rare to encounter a problem that ISN'T similar to something you've solved before.
</P>

<P>
For SRM 94 in particular, I had an extremely good day.  The 1050, especially, 
was key to my large rating gain.  When I saw it, something just clicked, and I 
immediately thought of the algorithm that made it fairly simple to implement.  
I was lucky; nobody else used the same approach.  I coded it up, and it didn't 
work the first time.  I scanned the code, quickly located a typo, and fixed it.  
It worked the second time on all the sample inputs.  It's always a relief when a 
complex program you've written works immediately out of the gate!  I was so 
worried about the 1050's complexity that even after submitting it, I ran 
tens of test cases on it.  But my program stood up to them, and eventually 
passed system tests.  It was quite a relief!"
</P>

<P>
<B>SnapDragon</B> has been a TopCoder member since March 17, 2002 and has won $100.   
</P>

<P>
"I never expected to break 3000, and I still can't really picture myself 
as a 3000-level coder. :)  I'm starting to feel nervous before every round, 
now that I'm getting a reputation that I feel I need to uphold.  It's 
important not to get in that mindset, and just to try to do the best you 
can as each contest comes up.  That's the way to have fun."
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/stat?c=member_profile&amp;cr=156420" CLASS="coderTextGreen">edragon</A>
, who won his 
room in both SRM's 94 and 95 with seven total successful challenges; and 
<A HREF="/stat?c=member_profile&amp;cr=286907" CLASS="coderTextYellow">WishingBone</A>, who had a 355-point rating gain in SRM 95, which is the fourth highest in Division-I.
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

