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
        <TITLE>Editor Information for TopCoder computer programming competitions</TITLE>
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
  <xsl:with-param name="title">&#160;Editor Information</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>  
                                    <BR/><B>1. STANDARD</B>
                                    <BR/>
The "Standard" editor was created as the default editor. It contains some basic 
"windows" style editing features. The "ctrl" refers to the "Control" key.
                                <BR/>
                                <BR/>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5"><B>Key Commands</B></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText"><IMG SRC="/i/clear.gif" WIDTH="5" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                                <B>&#183;</B>
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                                <B>Ctrl-c</B>
                                        </TD>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD>
                                        <TD CLASS="bodyText" VALIGN="top">
                                            Copy selected text to windows clipboard.
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText"><IMG SRC="/i/clear.gif" WIDTH="5" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Ctrl-x</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Cut selected text from the editing buffer, and store in the windows clipboard.
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="5" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Ctrl-v</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Paste text from the windows clipboard into the editing buffer.
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG ALT="" HEIGHT="15" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top">
                                            
                                                <B>Mouse Commands</B>
                                            
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="5" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Text selection</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Click and hold the the left mouse button at the beginning of your text 
    block, and drag mouse to the right and down to the end of your text block.
                                        </TD>
                                    </TR>
                                </TABLE>
                                <BR/>
                                <BR/>
                                <BR/>
                                

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

