<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Press Room</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
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
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Articles</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="smallText" COLSPAN="2" HEIGHT="18">&#160;</TD></TR>
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2001</TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/darwin_logo.gif" ALT="" WIDTH="150" HEIGHT="55" BORDER="0"/></DIV><BR/><BR/>
						Five Thoughts about Hiring IT Professionals<BR/>
						With Jack Hughes, founder and chairman of TopCoder Inc., a company that specializes in the evaluation of programmers.<BR/>
						By Daniel J. Horgan<BR/><BR/>
						November 29, 2001 - Without a standard, objective means of differentiation, finding the most qualified professional for your IT team is a very tricky feat. To get the lowdown on attaining and retaining skilled IT professionals, Darwinmag.com spoke with Jack Hughes, the founder and chairman of TopCoder Inc., a company that specializes in the evaluation and grading of programmers through competition.<BR/><BR/>
						Darwinmag.com: How would you describe the dream IT professionals?<BR/><BR/>
						Hughes: The ideal IT workers would be grounded in technology, but would understand business, too. They would have gone to school for computer science or electrical engineering or some technical discipline. They would have spent time utilizing technology and implementing it in a position for a technical company. But they also would have time on the business side, where they got a good feel for what the objectives of a business are so they can understand the application of technologies to business problems.<BR/><BR/>
						To the extent that IT pros are at fault for what I consider this wedge between IT and the rest of the company, I put most of the blame for that on the IT professionals and their unwillingness to learn the business side.<BR/><BR/>
						<B>What's the best way for a company to attract qualified IT professionals?</B><BR/><BR/>
						The single biggest factor in attracting the ideal IT worker is to keep the work interesting. If it is not interesting work, regardless of how much money you pay somebody, that person is not going to stay. The best employees will leave and go to an environment in which they feel challenged. If they are not challenged, you need to set up an environment in which they are. That has a lot to do with the types of projects given, the way they are assessed, and the reward system in place -- whether it be bonuses or promotions or both. It must be an environment that is constantly changing, constantly giving them new challenges and rewarding them for their work along the path.<BR/><BR/>
						<B>Is there still a skills shortage within the IT community?</B><BR/><BR/>
						Yes, and it is not likely to go away any time soon. The systems environments in which we work get more complex all the time, and they move up in order of magnitudes and complexities. That means you need both more people on an absolute basis to handle more and more systems, and you need more highly developed skills. There is definitely a shortage of the highly skilled folks, although it can be argued that there's not as much a shortage in absolute numbers as there was two or three years ago, but there is still an overall shortage. The supply has yet to meet the demand.<BR/><BR/>
						<B>How important a role does education play in the future of IT?</B><BR/><BR/>
						A big role. The lack of rigor and desire for learning science, math and the technical disciplines is a large issue affecting American IT folks. There is going to be a bigger gulf between demand and supply, especially if the economy turns up. If this country is going to have a viable IT workforce, it's going to have to put an awful lot more emphasis on education earlier on, in elementary school and high school. We have to come up with more creative ways to do that. You have to get kids interested in computers themselves and how they work. Otherwise, much like what happened with manufacturing labor, the manufacturing capacity will head offshore and jobs will follow. Although companies will say it's a cost issue, if they can't find the talent they need here, then they will go offshore looking for it. And once companies start looking offshore, they are going to stay there.<BR/><BR/>
						<B>In the current harsh hiring climate, who must adapt/evolve: The employer or the IT professional?</B><BR/>
						Both. You can't be an employer and act as if individuals are interchangeable. If you try to do that then you are going to lose some of the better talent you have. If you are letting people go or cutting back on bonuses, you have to be selective in how you do it. You can't just take a broad brush.<BR/><BR/>
						The IT professionals have some thinking to do as well. It is going to be much tougher for an employer to give them bonuses like in the past, and even their pay may be too high. They are going to have to get used to less pay, probably not for any less work. The job functions aren't likely to change and may even increase if the company is cutting people, it is going to put more work on their shoulders. They just have to reset their expectations.<BR/><BR/>
						</TD></TR>
					</TABLE>
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="pr_right_col"/>       
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
