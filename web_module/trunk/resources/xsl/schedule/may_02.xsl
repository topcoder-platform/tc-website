<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/calendar_view_pulldown.xsl"/>
  <xsl:import href="../includes/schedule/public_schedule_left.xsl"/>   
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Schedule</TITLE>
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
        <xsl:call-template name="public_schedule_left"/>
	<!-- Global Seconday Nav Ends -->			
<!-- Left Column Include Ends -->					
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">schedule</xsl:with-param>
  <xsl:with-param name="title">Monthly View - May 2002</xsl:with-param>
</xsl:call-template>			
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
    <!-- Calendar Pulldown Begins -->	
        <xsl:call-template name="calendar_view_pulldown"/>
	<!-- Calendar Pulldown Ends -->	   
      <TABLE BACKGROUND="/i/steel_gray_bg.gif" WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1">
        <TR> 
          <TD VALIGN="top" COLSPAN="2"> 
            <TABLE WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="3">
              <TR> 
                <TD CLASS="registerNav" BACKGROUND="/i/orangebv_bg.gif" ALIGN="center"><B>Sun</B></TD>
                <TD CLASS="registerNav" BACKGROUND="/i/orangebv_bg.gif" ALIGN="center"><B>Mon</B></TD>
                <TD CLASS="registerNav" BACKGROUND="/i/orangebv_bg.gif" ALIGN="center" WIDTH="20%"><B>Tues</B></TD>
                <TD CLASS="registerNav" BACKGROUND="/i/orangebv_bg.gif" ALIGN="center" WIDTH="20%"><B>Wed</B></TD>
                <TD CLASS="registerNav" BACKGROUND="/i/orangebv_bg.gif" ALIGN="center" WIDTH="20%"><B>Thurs</B></TD>
                <TD CLASS="registerNav" BACKGROUND="/i/orangebv_bg.gif" ALIGN="center" WIDTH="20%"><B>Fri</B></TD>
                <TD CLASS="registerNav" BACKGROUND="/i/orangebv_bg.gif" ALIGN="center" WIDTH="20%"><B>Sat</B></TD>
              </TR>
              <TR BGCOLOR="#FFFFFF"> 
                <TD WIDTH="97" ALIGN="center" CLASS="smallText" BGCOLOR="#CCCCCC">&#160;</TD>
                <TD WIDTH="97" ALIGN="center" CLASS="smallText" BGCOLOR="#CCCCCC">&#160;</TD>
                <TD WIDTH="97" ALIGN="center" CLASS="smallText" BGCOLOR="#CCCCCC">&#160;</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText"><FONT COLOR="#FF0000"><B>1</B></FONT><BR/><SPAN CLASS="bodyTextBold"><B>Match 85</B></SPAN><BR/>Register: 7:30&#160;PM<BR/>Compete: 9:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4145&amp;t=schedule&amp;c=srm" CLASS="smallText">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">2</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">3</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">4</TD>
              </TR>
              <TR BGCOLOR="#FFFFFF"> 
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">5</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">6</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">7</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText"><FONT COLOR="#FF0000"><B>8</B></FONT><BR/><SPAN CLASS="bodyTextBold"><B>Match 86</B></SPAN><BR/>Register: 7:30&#160;PM<BR/>Compete: 9:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4150&amp;t=schedule&amp;c=srm" CLASS="smallText">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText"><FONT COLOR="#FF0000"><B>9</B></FONT><BR/><SPAN CLASS="bodyTextBold"><B>Match 87</B></SPAN><BR/>Register: 7:30&#160;PM<BR/>Compete: 9:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4155&amp;t=schedule&amp;c=srm" CLASS="smallText">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">10</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">11</TD>
              </TR>
              <TR BGCOLOR="#FFFFFF"> 
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">12</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">13</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">14</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText"><FONT COLOR="#FF0000"><B>15</B></FONT><BR/><SPAN CLASS="bodyTextBold"><B>Match 88</B></SPAN><BR/>Register: 7:30&#160;PM<BR/>Compete: 9:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4160&amp;t=schedule&amp;c=srm" CLASS="smallText">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">16</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">17</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText"><FONT COLOR="#FF0000"><B>18</B></FONT><BR/><SPAN CLASS="bodyTextBold"><B>Match 89</B></SPAN><BR/>Register: 11:30&#160;AM<BR/>Compete: 1:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4165&amp;t=schedule&amp;c=srm" CLASS="smallText">Details</A></TD>
              </TR>
              <TR BGCOLOR="#FFFFFF"> 
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">19</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">20</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText"><FONT COLOR="#FF0000"><B>21</B></FONT><BR/><SPAN CLASS="bodyTextBold"><B>Match 90</B></SPAN><BR/>Register: 7:30&#160;PM<BR/>Compete: 9:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4170&amp;t=schedule&amp;c=srm" CLASS="smallText">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="statText" BGCOLOR="#990000"><FONT COLOR="#FFFFFF"><B>22</B></FONT><BR/><SPAN CLASS="statText"><B>Match 91</B></SPAN><BR/>Sponsored by:<BR/><A HREF="/?ContestId=4175&amp;t=schedule&amp;c=srm" CLASS="statTextBig"><B>Citrix</B></A><BR/>Register: 7:30&#160;PM<BR/>Compete: 9:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4175&amp;t=schedule&amp;c=srm" CLASS="statTextBig">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">23</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">24</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">25</TD>
              </TR>
              <TR BGCOLOR="#FFFFFF"> 
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">26</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">27</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">28</TD>
                <TD ALIGN="left" VALIGN="top" CLASS="statText" BGCOLOR="#000033"><FONT COLOR="#FFFFFF"><B>29</B></FONT><BR/><SPAN CLASS="statText"><B>Match 92</B></SPAN><BR/>Sponsored by:<BR/><A HREF="/?ContestId=4180&amp;t=schedule&amp;c=srm" CLASS="statTextBig"><B>Motorola</B></A><BR/>Register: 7:30&#160;PM<BR/>Compete: 9:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4180&amp;t=schedule&amp;c=srm" CLASS="statTextBig">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="statText" BGCOLOR="#990000"><FONT COLOR="#FFFFFF"><B>30</B></FONT><BR/><SPAN CLASS="statText"><B>Match 93</B></SPAN><BR/>Sponsored by:<BR/><A HREF="/?ContestId=4185&amp;t=schedule&amp;c=srm" CLASS="statTextBig"><B>Citrix</B></A><BR/>Register: 8:30&#160;PM<BR/>Compete: 10:00&#160;PM<BR/><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/><BR/>..//<A HREF="/?ContestId=4185&amp;t=schedule&amp;c=srm" CLASS="statTextBig">Details</A></TD>
                <TD ALIGN="left" VALIGN="top" CLASS="smallText" BACKGROUND="/i/calendar_bg.gif">31</TD>
                <TD WIDTH="99" ALIGN="center" CLASS="smallText" BGCOLOR="#CCCCCC">&#160;</TD>
              </TR>
            </TABLE>
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
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
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
