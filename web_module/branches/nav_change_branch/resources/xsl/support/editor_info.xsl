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
        <TITLE>TopCoder :: Support/FAQs</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
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
                                
                                    <B>2. JVI</B>
                                    <BR/>
The "JVI" editor, is a java implementation of the well known VI editor on the unix platform. 
This editor is purely implemented in Java and contains a subset of the commands and 
functionality of the original VI editor.
                                <BR/>
                                <BR/>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="3"><B>Unimplemented features</B></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            Anything involving named registers, such as buffers and setting marks 
    in the document.
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            All ":" commands.
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            Regex engine for searches ( '/' '?' ) - all searches are 
    executed exactly as typed.
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            Anything related to macros.
                                        </TD>
                                    </TR>
                                </TABLE>
                                <BR/>
                                The rest of JVI has been implemented as closely to the original VI as possible including all 
the required undo buffers, repeat command features, and complex command combinations such as 
"repeat/command/motion command" i.e. "7dw", etc.
                                <BR/>
                                <BR/>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="2"><B>Implemented features</B></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="12" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="12" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="10" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Motion commands</B>
                                            
                                        </TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="80" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>j</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Down
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>k</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Up
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>h</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Left
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>h</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Left
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>l</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Right
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>o</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Beginning of line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>$</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            End of line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            First non-whitespace character
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>+</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            First character of next line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>-</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            First character of previous line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>spacebar</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Next character
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>return</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Next line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>e</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            End of word
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>E</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            End of word, ignore punctuation
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>b</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Beginning of previous word
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>w</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Beginning of next word
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>W</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Beginning of next word, ignore punctuation
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>H</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            First line on screen
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>L</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Last line on screen
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>M</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Middle of Screen
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>G</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Goto (defaults to end of file)
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>%</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Find match of current parenthesis, brace, or bracket
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>(</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Previous sentence
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>)</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Next sentence
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>{</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Previous paragraph
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>}</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Next paragraph
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>[</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Previous section
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>]</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Next section
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^m</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Carriage return
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            
                                                <B>^n</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Down in command
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            
                                                <B>^j</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Down in command, create newline in insert
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^p</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Up in command
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^h</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Backspace in insert mode, left in command mode
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG WIDTH="1" HEIGHT="15" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD HEIGHT="1" WIDTH="10"><IMG ALT="" HEIGHT="1" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Insert Commands</B>
                                            
                                        </TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="80" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            i
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Insert before current location
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            I
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Insert before first non-whitespace character on line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            a
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Append after the current location
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            A
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Append at the end of the line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            o
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Open line below current
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top" WIDTH="30">
                                            O
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Open line above current
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG WIDTH="1" HEIGHT="15" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" HEIGHT="1" WIDTH="10"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Change Commands</B>
                                            
                                        </TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="80" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>~</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Switch case of current character
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>c</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Change until...
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>C</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Change to end of line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>r</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Replace current character
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>R</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Replace characters until insert mode is left
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>s</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Substitute
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>S</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Substitute entire line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG WIDTH="1" HEIGHT="15" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD HEIGHT="1" WIDTH="10"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                                <B>Cut/copy/paste/undo</B>
                                        </TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="80" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>x</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Delete current character
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>X</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Delete previous character
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>d</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Delete until...
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>D</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Delete to end of line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>y</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Yank...
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Y</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Yank current line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>p</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Put below current line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>P</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Put above current line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>u</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Undo last change
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>U</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Undo changes to current line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG WIDTH="1" HEIGHT="15" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD HEIGHT="1" WIDTH="10"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Scrolling</B>
                                            
                                        </TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="80" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>z</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Reposition screen around line (\n to top of screen, . to middle, - to bottom)
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^b</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Scroll back one screen
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^d</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Scroll down half a window, moves to previous shift width in insert mode
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^e</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Scroll screen down one line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^f</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Scroll forward one screen
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^u</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Scroll up half a window, in insert mode move to the beginning of insert mode
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^y</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Scroll screen up one line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG WIDTH="1" HEIGHT="15" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD HEIGHT="1" WIDTH="10"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>Miscellaneous</B>
                                            
                                        </TD>
                                    </TR>
                                </TABLE>
                                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="80" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="15" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="8" WIDTH="100" SRC="/i/clear.gif" BORDER="0"/></TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>#</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            (where # is a number) following command n times...
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>.</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Repeat last command
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>&lt;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Shift one shiftwidth to the left
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>&gt;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Shift one shiftwidth to the right
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>t</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Moves to next shiftwidth
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>J</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Join next line with current line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>g</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Show status line
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^l</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Redraw screen
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^r</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Redraw screen in command mode
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^c</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Ends insert mode, unused in command mode (if defined as interupt)
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^[</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Ends insert mode (ESCAPE)
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^i</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Tab in insert, unused in command
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^v</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Unused in command, quotes next character in insert
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" VALIGN="top"><IMG ALT="" HEIGHT="5" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD CLASS="bodyText" ALIGN="center" VALIGN="top">
                                            
                                                <B>&#183;</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top">
                                            
                                                <B>^w</B>
                                            
                                        </TD><TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD><TD CLASS="bodyText" VALIGN="top">
                                            Unused in command, in insert move back to beginning of previous word
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD CLASS="bodyText" COLSPAN="5" VALIGN="top"><IMG WIDTH="1" HEIGHT="15" ALT="" SRC="/i/clear.gif" BORDER="0"/></TD>
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
		<TD WIDTH="25" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

