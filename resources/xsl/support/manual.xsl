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
        <TITLE>Competition Manual Download at TopCoder</TITLE>
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
  <xsl:with-param name="title">&#160;Competition Manual Download</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P>
The primary purpose of this manual is to provide the user with some examples of the
functionality of the competition arena.Please review the <A HREF="/?t=support&amp;c=software_req" CLASS="bodyText">software requirements</A> before entering the Competition Arena. 
For additional questions regarding the Competition Arena, take a look at the <A HREF="/?t=support&amp;c=comp_faq" CLASS="bodyText">Competition FAQ</A>.
</P>

                    <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR>
                            <TD COLSPAN="3"><IMG WIDTH="1" HEIGHT="15" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                        </TR>
                    </TABLE>
                    <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR>
                            <TD VALIGN="top" CLASS="bodyText">
                                        <B>Table of Contents<BR/>
                                        </B>
                                    
                                    <UL CLASS="bodyText">
                                        <LI>
                                            <B><A HREF="/support/index.shtml" CLASS="bodyText">Competition Arena: General Information</A></B>
                                            <UL>
                                                <LI>Login</LI>
                                                <LI>Lobby Area</LI>
                                                <LI>Practice Room</LI>
                                                <LI>Contestants vs. Spectators</LI>
                                            </UL>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B><A HREF="/support/process.shtml" CLASS="bodyText">Competition Arena: Competition Process Overview</A></B>
                                            <UL CLASS="bodyText">
                                                <LI>Beginning a Contest Round</LI>
                                                <LI>Contest Phases
                        <UL>
                                                        <LI>Phase I:  Coding Algorithms</LI>
                                                        <LI>Phase II:  Challenging Submitted Code</LI>
                                                        <LI>Phase III:  System Testing</LI>
                                                    </UL>
                                                </LI>
                                            </UL>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B><A HREF="/index?t=support&amp;c=editor_info" CLASS="bodyText">Competition Arena: Editor Information</A></B>
                                            <UL CLASS="bodyText">
                                                <LI>Standard</LI>
                                            </UL>
                                        </LI>
                                        <BR/>
                                        <LI>
                                            <B><A HREF="/support/guide">Visual Guide</A></B>
                                            <UL CLASS="bodyText">
                                                <LI>
                                                    <A HREF="/index?t=support&amp;c=guide" CLASS="bodyText"><B>Figure 1.</B> Login</A>
                                                </LI>
                                                <LI>
                                                    <A HREF="/index?t=support&amp;c=manual_fig2" CLASS="bodyText"><B>Figure 2.</B> Lobby</A>
                                                </LI>
                                                <LI>
                                                    <A HREF="/index?t=support&amp;c=manual_fig3" CLASS="bodyText"><B>Figure 3.</B> Problem Selection</A>
                                                </LI>
                                                <LI>
                                                    <A HREF="/index?t=support&amp;c=manual_fig4" CLASS="bodyText"><B>Figure 4.</B> Coding Window - Coding Phase</A>
                                                </LI>
                                                <LI>
                                                    <A HREF="/index?t=support&amp;c=manual_fig5" CLASS="bodyText"><B>Figure 5.</B> Status Window - Challenge Phase</A>
                                                </LI>
                                            </UL>
                                        </LI>
                                    </UL>
                            </TD>
                        </TR>
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

