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
        <TITLE>TopCoder :: About TopCoder</TITLE>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
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
  <!-- Global Seconday Nav Begins -->    
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->  
<!-- Left Column Include Ends -->
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">about_tc_membr</xsl:with-param>
  <xsl:with-param name="title">&#160;What is a tournament?</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
          			<TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
	            <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		            <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">QUESTIONS?:</TD>
	            </TR>                    
	            <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
					<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF">
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:service@topcoder.com" CLASS="bodyText">Contact member services</A></TD>
						</TR>
						<TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
					</TABLE>
		          	</TD>
        		</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
		  <BR/><BR/>
          <B>Tournaments</B>
          <P>Currently, TopCoder hosts two major tournaments annually. The first is the Collegiate Challenge, which is then followed by the Invitational Tournament. The Collegiate Challenge is open to rated members who are full-time students attending a college or university in the United States, while the Invitational Tournament is open to all rated members.</P>
          <P>The prize structure for a tournament differs from the <A HREF="/index?t=about_tc&amp;c=membr_match" CLASS="bodyText">Single Round Match</A>.  Competitors are given a chance to earn cash with each successful completion of an elimination round, all the way up and through the final round where the champion is awarded a Grand Prize of $100,000! Total tournament purses have been as much as $250,000.</P>
          <P>Tournaments take place over three months with the elimination matches running concurrently with regularly scheduled weekly matches. Normally, a tournament related match replaces one of the normally scheduled single round matches.</P>
          <B>What Tournaments Offer</B>
          <P>Aside from the obvious chance at a &#36;100,000 grand prize, tournaments offer:<UL>
          <LI>Exposure and recognition as a talented developer</LI>
          <LI>Strong differentiator on your resume</LI>
          <LI>Enormous earning potential</LI></UL>
          <A HREF="/index?t=schedule&amp;c=tourney_overview" CLASS="bodyText">Take a look at the current tournament</A></P>
          <P>The following table outlines the structure for a tournament competition.</P>
          <DIV ALIGN="center"><TABLE WIDTH="416" BORDER="0" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
          <TR><TD COLSPAN="5" HEIGHT="24" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">&#32;&#32;>>&#32;Regional Quarter-Finals</TD></TR>
          <TR>
            <TD ALIGN="right" WIDTH="120" HEIGHT="21" CLASS="statTextBig"><B>Total Competitors</B><BR/>512</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>NE</B><BR/>128</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>SE</B><BR/>128</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>MW</B><BR/>128</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>W</B><BR/>128</TD>
          </TR>
          <TR>
            <TD ALIGN="right" HEIGHT="21" CLASS="statTextBig"><B>Advancing</B><BR/>Room Winners<BR/>Wildcards</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>16<BR/>16</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>16<BR/>16</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>16<BR/>16</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>16<BR/>16</TD>
          </TR>
          <TR><TD COLSPAN="5" HEIGHT="24" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">&#32;&#32;>>&#32;Regional Finals</TD></TR>
          <TR>
            <TD ALIGN="right" WIDTH="120" HEIGHT="21" CLASS="statTextBig"><B>Total Competitors</B><BR/>128</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>NE</B><BR/>32</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>SE</B><BR/>32</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>MW</B><BR/>32</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>W</B><BR/>32</TD>
          </TR>
          <TR>
            <TD ALIGN="right" HEIGHT="21" CLASS="statTextBig"><B>Advancing</B><BR/>Room Winners<BR/>Wildcards</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>4<BR/>4</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>4<BR/>4</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>4<BR/>4</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>4<BR/>4</TD>
          </TR>
          <TR><TD COLSPAN="5" HEIGHT="24" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">&#32;&#32;>>&#32;Regional Championships</TD></TR>
          <TR>
            <TD ALIGN="right" WIDTH="120" HEIGHT="21" CLASS="statTextBig"><B>Total Competitors</B><BR/>32</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>NE</B><BR/>8</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>SE</B><BR/>8</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>MW</B><BR/>8</TD>
            <TD ALIGN="center" WIDTH="70" HEIGHT="21" CLASS="statTextBig"><B>W</B><BR/>8</TD>
          </TR>
          <TR>
            <TD ALIGN="right" HEIGHT="21" CLASS="statTextBig"><B>Advancing</B><BR/>Room Winners<BR/></TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1<BR/></TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1<BR/></TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1<BR/></TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1<BR/></TD>
          </TR>
          <TR>
            <TD HEIGHT="21" ALIGN="right" CLASS="statTextBig">Wildcards</TD>
            <TD COLSPAN="4" HEIGHT="21" ALIGN="center" CLASS="statTextBig">12 &#40;total&#41; Wildcards pulled from all regions</TD>
          </TR>
          <TR><TD COLSPAN="5" HEIGHT="24" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">&#32;&#32;>>&#32;Semifinals</TD></TR>
          <TR>
            <TD ALIGN="right" WIDTH="120" HEIGHT="21" CLASS="statTextBig"><B>Total Competitors</B><BR/>16</TD>
            <TD COLSPAN="4" ALIGN="center" HEIGHT="21" CLASS="statTextBig"><B>4 Coders in 4 Rounds</B></TD>
          </TR>
          <TR>
            <TD ALIGN="right" HEIGHT="21" CLASS="statTextBig"><B>Advancing</B><BR/>Room Winners</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1</TD>
            <TD ALIGN="center" HEIGHT="21" CLASS="statTextBig"><BR/>1</TD>
          </TR>
          <TR><TD COLSPAN="5" HEIGHT="24" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">&#32;&#32;>>&#32;Championship</TD></TR>
          <TR>
            <TD ALIGN="right" WIDTH="120" HEIGHT="21" CLASS="statTextBig"><B>Total Competitors</B><BR/>4</TD>
            <TD COLSPAN="4" ALIGN="center" HEIGHT="21" CLASS="statTextBig"><B>4 Coders in 1 Round</B></TD>
          </TR>
          <TR>
            <TD ALIGN="right" HEIGHT="21" CLASS="statTextBig">&#32;</TD>
            <TD COLSPAN="4" ALIGN="center" HEIGHT="21" CLASS="statTextBig"><B>Tournament Champion</B></TD>
          </TR>
          </TABLE></DIV>
          <P><A HREF="/index?t=about_tc&amp;c=spons_tourny" CLASS="bodyText">What is in a Tournament sponsorship package?</A></P>
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
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
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
