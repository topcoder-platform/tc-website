<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Visual Guide to participating in TopCoder</TITLE>
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
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;Visual Guide - Coding Window - Coding Phase</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                                   <P>
 <ul CLASS="bodyText">
                                        <li>
                                            <A HREF="/index?t=support&amp;c=guide" CLASS="bodyText"><b>Figure 1.</b> Login</A></li>
                                        <li>
                                            <A HREF="/index?t=support&amp;c=manual_fig2" CLASS="bodyText"><b>Figure 2.</b> Lobby</A>
                                        </li>
                                        <li>
                                            <A HREF="/index?t=support&amp;c=manual_fig3" CLASS="bodyText"><b>Figure 3.</b> Problem Selection</A>
                                        </li>
                                        <li>
                                            <b>Figure 4.</b> Coding Window - Coding Phase
                                        </li>
                                        <li>
                                            <A HREF="/index?t=support&amp;c=manual_fig5" CLASS="bodyText"><b>Figure 5.</b> Status Window - Challenge Phase</A>
                                        </li>
                                    </ul>
</P>

<P CLASS="bodyText"><b>Figure 4: Coding Window - Coding Phase</b></P>
<IMG SRC="/i/problem_statement.gif" ALT="Coding Window" WIDTH="619" HEIGHT="434" BORDER="0"/>







<P CLASS="bodyText">The <b>Coding Window</b> consists of: 
          <ol CLASS="bodyText">
                                        <li>The <b>problem information:</b> Class Name, Method Name, Return Type, and Argument Types, found at the top of the window.</li>
                                        <BR/>
                                        <li>Choice of <b>Standard</b> or <b>VI</b> editor is given. The user can switch between editors at any time during the Coding Phase.</li>
                                        <BR/>
                                        <li>The <b>Problem Statement</b>.</li>
                                        <BR/>
                                        <li>The <b>Coding Area</b>.</li>
                                        <BR/>
                                        <li>When coding a problem,  A line number is used for easy access to specific strings. When coding a problem, the <b>Find (up and down)</b>, 
          and <b>Go To</b> buttons will remain enabled. The <b>Save, Compile, Test, Clear, Submit</b> buttons will be enabled and disabled as they are 
          needed.</li>
                                        <ul>
                                            <li>
                                                <b>Find (Up) or (Down):</b> Prompts user for specific string and performs back or forward search from that specific point. This is case 
          sensitive.</li>
                                            <BR/>
                                            <li>
                                                <b>Go To:</b> Prompts user for specific line number and takes user directly to that particular area.</li>
                                            <BR/>
                                            <li>
                                                <b>Save:</b> Allows the user to save anytime during coding.</li>
                                            <BR/>
                                            <li>
                                                <b>Compile: </b>Compiles the user's code and automatically saves it. If the code is written correctly, a "Compile was successful" window appears 
          and the code is rendered suitable for submission. If the code is written incorrectly, a "Syntax Error" window will appear and the code cannot be 
          submitted until the error has been corrected.</li>
                                            <BR/>
                                            <li>
                                                <b>Test:</b> Allows the user to test an application with real arguments, confirming that, to the best of the user's knowledge, the program is 
          working. Programs may be run to determine the validity of the code.</li>
                                            <BR/>
                                            <li>
                                                <b>Submit:</b> Submits a user's code. Once a user's code is submitted, it can be viewed but it may not be edited.</li>
                                            <BR/>
                                            <li>
                                                <b>Clear:</b> Clears existing code.</li>
                                        </ul>
                                    </ol>
                               </P>
                               
                                


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
		<TD WIDTH="1" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <!-- <xsl:call-template name="public_right_col"/> -->      
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

