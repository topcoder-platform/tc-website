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
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;May 20 - May 26, 2002</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>																	
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A> -->											
<IMG SRC="/i/m/Brian_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<B>Handle: </B><A HREF="/tc?module=MemberProfile&amp;cr=274068" CLASS="coderTextYellow">Brian</A><BR/>
<B>Rating: </B>1906<BR/>
<B>Member Since: </B>March&#160;28,&#160;2002<BR/>
<B>Total Competitions: </B>6<BR/>
</P>

<P>TopCoder, Inc. announced today that <B>Brian</B>, based on his performance in Single Round Match 91, has been named the "Coder of the Week" for Single Round Matches 90 and 91, which took place between May 20 and May 26, 2002.</P>
<P>In Single Round Match 91, <B>Brian</B> added 318 points to his rating, which is the 10th largest single round gain in Division-I (<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="statText">View the list of Division-I Rating Point Gain</A>).  <B>Brian</B> won Room 9 with 1404.28 final points.  He earned 235.65 points on the Level One problem, 399.07 on the Level Two problem, and 719.56 on the Level Three problem, for a total of 1354.28 points in the "Coding Phase".  <B>Brian</B> then added 50 points to his total with a successful challenge of the Level One submission of <A HREF="/tc?module=MemberProfile&amp;cr=266162" CLASS="coderTextYellow">rashok</A> in the "Challenge Phase".</P>
<P>"I have been coding a lot more in the past week or so, than I was previously," said <B>Brian</B>.  "I may have been a little more warmed up at the time of the SRM.</P>
<P>All three problems in SRM 91 were a good match for my programming style.  My knowledge of STL is a little rusty, so I tend to be slower at parsing and sorting problems.  I also tend to do better at mathematical problems than problems with letters and words.</P>
<P>I found the third problem particularly interesting, and I had a solution coded for it very quickly, but the program wasn't efficient enough.  I enjoyed figuring out how to optimize the solution.  At the end of the competition, I enjoyed seeing how differently other people had approached the problem.  This problem was clearly one of my favorites!</P>
<P>My biggest problem in SRM 91 was actually understanding the problems before starting to code.  I had some trouble with the first problem, but I particularly had trouble reading the second problem's description.  Eventually, it helped to think of the two races as G and T, but even then I got confused.</P>
<P>On a good note, I actually successfully challenged another program.  My record on challenges isn't too good, so I tend to be careful.  This time, I was pretty sure I had found an issue."</P>
<P><B>Brian</B> has been a TopCoder member since March 28, 2002, and has won $274.</P>
<P>"I've been having a great time using TopCoder these last couple of months.</P>
<P>I was amazed when a friend showed me the site.  I immediately started looking forward to my first opportunity to compete.</P>
<P>I'm regularly impressed by the quality of the people who compete here; their willingness and excitement to discuss the problems and their solutions; and their encouragement of one another at the end of the match.</P>
<P>It feels wonderful to be selected as 'Coder of the Week'.  Coding is a big part of who I am, and it's nice to have to use that skill in a competitive environment."</P> 
<P>Other members nominated for "Coder of the Week" were: <A HREF="/tc?module=MemberProfile&amp;cr=283374" CLASS="coderTextYellow">indigo9</A>, who had a debut rating of 1845 in SRM 90, which is the 12th highest ever (<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A>); and <A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextBlue">Ninjak</A>, who had 1557.10 final points in SRM 91, the most of any Division-II member.</P>
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

