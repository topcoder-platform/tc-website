<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
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
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->        
        <xsl:call-template name="tccc03_links"/>
  <!-- Coder of the Week Pulldown Ends -->
  <BR/><BR/>
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Schedule</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Regional Round One<BR/>
<!--
                        &#160;&#160;&#160;Northeast &amp; Southeast Regions<BR/>
                        &#160;&#160;&#160;&#160;Tuesday, Feb. 19 @ 8pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Tuesday, Feb. 26 @ 8pm EST)<BR/>
                        &#160;&#160;&#160;West &amp; Midwest Regions<BR/>
                        &#160;&#160;&#160;&#160;Thursday, Feb. 21 @ 10pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Thursday, Feb. 28 @ 10pm EST)<BR/>
-->
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_ne200" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_se200" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_w200" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_mw200" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_int200" CLASS="statTextBig"></A>Update</TD>                    
                    </TR>
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_ne200" CLASS="statTextBig"></A>NE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_se200" CLASS="statTextBig"></A>SE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_w200" CLASS="statTextBig"></A>W</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_mw200" CLASS="statTextBig"></A>MW</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_int200" CLASS="statTextBig"></A>International</TD>                    
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">1,000</TD>
                      <TD ALIGN="center" CLASS="statText">200</TD>
                      <TD ALIGN="center" CLASS="statText">200</TD>
                      <TD ALIGN="center" CLASS="statText">200</TD>
                      <TD ALIGN="center" CLASS="statText">200</TD>
                      <TD ALIGN="center" CLASS="statText">200</TD>                      
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>                      
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD ALIGN="center" CLASS="statText">20<BR/>80</TD>
                      <TD ALIGN="center" CLASS="statText">20<BR/>80</TD>
                      <TD ALIGN="center" CLASS="statText">20<BR/>80</TD>
                      <TD ALIGN="center" CLASS="statText">20<BR/>80</TD>
                      <TD ALIGN="center" CLASS="statText">20<BR/>80</TD>                      
                    </TR>
                    <!-- <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Top-10 Winners&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_ne" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_se" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_w" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_mw" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_nese1_summary" CLASS="statTextBig">NE/SE</A></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_wmw1_summary" CLASS="statTextBig">W/MW</A></TD>
                    </TR> -->
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                         
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                      
                    </TR>
                    <!-- <TR>
                      <TD VALIGN="middle" CLASS="statText">&#160;</TD>                    
                      <TD COLSPAN="2" VALIGN="top" CLASS="statText">Northeast &amp; Southeast Regions:<BR/>Tues. Feb. 18 @ 9pm EST<BR/>(raindate: Wed. Feb. 19 @ 9pm EST)</TD>
                      <TD COLSPAN="2" VALIGN="top" CLASS="statText">West &amp; Midwest Regions:<BR/>Thurs. Feb. 20 @ 9pm EST<BR/>(raindate: Fri. Feb. 21 @ 9pm EST)</TD>
                      <TD VALIGN="top" CLASS="statText">International Region:<BR/>Sat. Feb. 22 @ 12pm EST<BR/>(raindate: Sun. Feb. 23 @ 12pm EST)</TD>                    
                    </TR> -->
                    <TR>                   
                      <TD COLSPAN="6" VALIGN="middle" CLASS="statText" HEIGHT="30"><B>Northeast &amp; Southeast Regions:</B><BR/>Tues. Feb. 18 @ **9pm EST (raindate: Wed. Feb. 19 @ 9pm EST)</TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" CLASS="statText" HEIGHT="30"><B>West &amp; Midwest Regions:</B><BR/>Thurs. Feb. 20 @ **9pm EST (raindate: Fri. Feb. 21 @ 9pm EST)</TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" CLASS="statText" HEIGHT="30"><B>International Region:</B><BR/>Sat. Feb. 22 @ **12pm EST (raindate: Sun. Feb. 23 @ 12pm EST)</TD>                    
                    </TR> 
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="13" CLASS="statText">**Times are subject to change.</TD>
                    </TR>                                                                             
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Regional Quarterfinals<BR/>
<!--
                        &#160;&#160;&#160;Northeast &amp; Southeast Regions<BR/>
                        &#160;&#160;&#160;&#160;Tuesday, Feb. 19 @ 8pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Tuesday, Feb. 26 @ 8pm EST)<BR/>
                        &#160;&#160;&#160;West &amp; Midwest Regions<BR/>
                        &#160;&#160;&#160;&#160;Thursday, Feb. 21 @ 10pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Thursday, Feb. 28 @ 10pm EST)<BR/>
-->
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_ne100" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_se100" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_w100" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_mw100" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_int100" CLASS="statTextBig"></A>Update</TD>                    
                    </TR>
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_ne100" CLASS="statTextBig"></A>NE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_se100" CLASS="statTextBig"></A>SE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_w100" CLASS="statTextBig"></A>W</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_mw100" CLASS="statTextBig"></A>MW</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_int100" CLASS="statTextBig"></A>International</TD>                    
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">500</TD>
                      <TD ALIGN="center" CLASS="statText">100</TD>
                      <TD ALIGN="center" CLASS="statText">100</TD>
                      <TD ALIGN="center" CLASS="statText">100</TD>
                      <TD ALIGN="center" CLASS="statText">100</TD>
                      <TD ALIGN="center" CLASS="statText">100</TD>                      
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;<BR/>(All advancers win $50 each)</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>                      
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">10<BR/>30</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">10<BR/>30</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">10<BR/>30</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">10<BR/>30</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">10<BR/>30</TD>                      
                    </TR>
                    <!-- <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Top-10 Winners&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_ne" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_se" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_w" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_mw" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_nese1_summary" CLASS="statTextBig">NE/SE</A></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_wmw1_summary" CLASS="statTextBig">W/MW</A></TD>
                    </TR> -->
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                         
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                      
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" CLASS="statText">All Regions: Wed. Feb. 26 @ **9pm EST (raindate: Thurs. Feb. 27 @ 9pm EST)</TD>                   
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="13" CLASS="statText">**Time is subject to change.</TD>
                    </TR>                    
                                                          
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Regional Semifinals</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_ne40" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_se40" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_w40" CLASS="statTextBig"></A>Update</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_mw40" CLASS="statTextBig"></A>Update</TD> 
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_int40" CLASS="statTextBig"></A>Update</TD>                    
                    </TR>                    
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_ne40" CLASS="statTextBig"></A>NE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_se40" CLASS="statTextBig"></A>SE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_w40" CLASS="statTextBig"></A>W</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_mw40" CLASS="statTextBig"></A>MW</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_int40" CLASS="statTextBig"></A>International</TD>                    
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">200</TD>
                      <TD ALIGN="center" CLASS="statText">40</TD>
                      <TD ALIGN="center" CLASS="statText">40</TD>
                      <TD ALIGN="center" CLASS="statText">40</TD>
                      <TD ALIGN="center" CLASS="statText">40</TD>
                      <TD ALIGN="center" CLASS="statText">40</TD>                      
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;<BR/>(All advancers win $50 each)</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>                      
                    </TR>                 
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>6</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>6</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>6</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>6</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>6</TD>                      
                    </TR>
                    <!-- <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Room Winners&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_regional_semi" CLASS="statTextBig">All Regions</A></TD>
                    </TR> -->
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                      
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" CLASS="statText">All Regions: Wed. Mar. 5 @ **9pm EST (raindate: Thurs. Mar. 6 @ 9pm EST)</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="13" CLASS="statText">**Time is subject to change.</TD>
                    </TR>                                        
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Regional Championship</TD>
                      <TD COLSPAN="5" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
                    </TR>                    
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_ne" CLASS="statTextBig"></A>NE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_se" CLASS="statTextBig"></A>SE</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_w" CLASS="statTextBig"></A>W</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_mw" CLASS="statTextBig"></A>MW</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tccc03_regions_int" CLASS="statTextBig"></A>INT</TD>                    
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">50</TD>
                      <TD ALIGN="center" CLASS="statText">10</TD>
                      <TD ALIGN="center" CLASS="statText">10</TD>
                      <TD ALIGN="center" CLASS="statText">10</TD>
                      <TD ALIGN="center" CLASS="statText">10</TD>
                      <TD ALIGN="center" CLASS="statText">10</TD>                      
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;<BR/>(Each regional champion wins $600 each)</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>                      
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>                      
                    </TR>
                    <TR>
                      <TD HEIGHT="13" ALIGN="right" CLASS="statText">Wildcards</TD>
                      <TD COLSPAN="5" HEIGHT="13" ALIGN="center" CLASS="statText">11  &#40;total&#41; Wildcards from all regions</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                      
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" CLASS="statText">All Regions: Wed. Mar. 12 @ **9pm EST (raindate: Thurs. Mar. 11 @ 9pm EST)<BR/></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="13" CLASS="statText">**Time is subject to change.</TD>
                    </TR>                                        
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Semifinals</TD>
                      <TD COLSPAN="5" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
                    </TR>                    
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                    
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">16</TD>
                      <TD COLSPAN="5" ALIGN="center" CLASS="statText">4 Coders in 4 Rooms</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">&#160;</TD>                      
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                      
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">All matches occur on Friday, April 4th</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">**10:00am (EST)</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">**1:00pm (EST)</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">**4:00pm (EST)</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">**7:00pm (EST)</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">&#160;</TD>                      
                    </TR>                    
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="13" CLASS="statText">**Times are subject to change.</TD>
                    </TR>                    
                    <!-- <TR>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Room 1 - 8am EST<BR/>Room 2 - 11am EST</TD>
                      <TD COLSPAN="3" VALIGN="middle" CLASS="statText">Room 3 - 3pm EST<BR/>Room 4 - 6pm EST</TD>
                    </TR> -->                  
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Championship</TD>
                      <TD COLSPAN="5" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
                    </TR>                                         
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                      
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">4</TD>
                      <TD COLSPAN="5" ALIGN="center" CLASS="statText">4 Coders in 1 Round</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>                      
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="13" CLASS="statText">Saturday, April 5, @ **12pm EST</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="6" VALIGN="middle" HEIGHT="13" CLASS="statText">**Time is subject to change.</TD>
                    </TR>                     
                    <TR>
                      <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                                       
                    <TR>
                      <TD ALIGN="right" WIDTH="26%" HEIGHT="18" CLASS="statText" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>                      
                      <TD COLSPAN="3" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif"><B>Tournament Champion</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>
                    </TR>
                    </TABLE>
          <P><BR/></P>
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
            <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


