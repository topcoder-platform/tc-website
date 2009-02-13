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
  <xsl:with-param name="title">&#160;Visual Guide - Lobby</xsl:with-param>
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
                                            <b>Figure 2.</b> Lobby
                                        </li>
                                        <li>
                                            <A HREF="/index?t=support&amp;c=manual_fig3" CLASS="bodyText"><b>Figure 3.</b> Problem Selection</A>
                                        </li>
                                        <li>
                                            <A HREF="/index?t=support&amp;c=manual_fig4" CLASS="bodyText"><b>Figure 4.</b> Coding Window - Coding Phase</A>
                                        </li>
                                        <li>
                                            <A HREF="/index?t=support&amp;c=manual_fig5" CLASS="bodyText"><b>Figure 5.</b> Status Window - Challenge Phase</A>
                                        </li>
                                    </ul>
</P>

<P CLASS="bodyText"><b>Figure 2: Lobby</b></P>
<IMG SRC="/i/lobby.gif" ALT="Lobby" WIDTH="619" HEIGHT="433" BORDER="0"/>







                                    <ol CLASS="bodyText">
                                        <li>
                                            <b>Status Panel:</b> Contains user's handle, rank, and status. In a live competition, Status identifies the coder 
            as coding or challenging.</li>
                                        <BR/>
                                        <li>
                                            <b>Main Menu</b> Options:
          		<ul CLASS="bodyText">
                                                <li>
                                                    <b>Lobby</b> - Navigate to the Lobby</li>
                                                <li>
                                                    <b>Search</b> - Search for the location of a specific user (see #9).</li>
                                                <li>
                                                    <b>Logoff</b> - Logoff of the applet. User returns to the login screen.</li>
                                            </ul>
                                            <BR/>
                                        </li>
                                        <li>
                                            <b>Options: Disable Chat</b> - Disables all incoming and outgoing chat requests and responses to and from the server. 
            This can be used to minimize network traffic.</li>
                                        <BR/>
                                        <li>
                                            <b>Active Contests:</b> Contains a list of all active contests and the practice room.</li>
                                        <BR/>
                                        <li>
                                            <b>Help</b> Options:
            	<ul>
                                                <li>
                                                    <b>Contest Manual</b> - Takes user back to contest manual.</li>
                                                <li>
                                                    <b>Register</b> - Unregistered coders may register for a Login ID.</li>
                                                <li>
                                                    <b>About</b> - Contains general information about the applet.</li>
                                            </ul>
                                            <BR/>
                                        </li>
                                        <li>
                                            <b>Contest timer:</b> Counts down to the start of the next competition.</li>
                                        <BR/>
                                        <li>
                                            <b>Rating Key:</b> A legend showing a rating group's corresponding color.</li>
                                        <BR/>
                                        <li>
                                            <b>Users Panel:</b> Contains a list of all users currently in the lobby.</li>
                                        <BR/>
                                        <li>
                                            <b>Chat Area:</b> Contains live scrolling chat provided by users currently in the same room. System messages appear in green and 
            follow a "System &gt;" prompt. User messages appear in white, and the username appears in the color of the user's rating.</li>
                                        <BR/>
                                        <li>
                                            <b>Search:</b>  Search for a logged in user by entering the user's handle.</li>
                                        <BR/>
                                        <li>
                                            <b>Info:</b>  Obtain information on a user by double clicking on the user's handle or by right clicking on the user's handle and 
            selecting "Info".</li>
                                    </ol>

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

