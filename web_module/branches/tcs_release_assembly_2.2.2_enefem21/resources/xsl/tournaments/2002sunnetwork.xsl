<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>  
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
            <TD WIDTH="180" VALIGN="top">
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
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/>
<!-- <DIV ALIGN="center"><A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/sun_network_logo.gif" ALT="" WIDTH="284" HEIGHT="80" BORDER="0"/></A></DIV> -->
	<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
      <TR>
        <TD><DIV ALIGN="center"><A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/sun_network_logo.gif" ALT="" WIDTH="284" HEIGHT="80" BORDER="0"/><!-- </A><A HREF="/?&amp;t=authentication&amp;c=login&amp;errorMsg=You%20must%20log%20in%20to%20view%20this%20portion%20of%20the%20site.&amp;errorURL=/Registration" TARGET="_blank"> --><IMG SRC="/i/tournament/sun_challenge_logo.gif" ALT="" WIDTH="174" HEIGHT="65" BORDER="0"/></A></DIV></TD>
      </TR>      
      
      <!-- <TR>
         <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>	
      </TR>
      <TR>
         <TD COLSPAN="2" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>	
      </TR> -->      	      
      <TR>
      <TD VALIGN="top" CLASS="statText">
<P>
<!-- <FONT SIZE="5" COLOR="#FFFFFF" FACE="tahoma, verdana">Welcome!</FONT><BR/> -->Thanks for your interest in the 2002 SunNetwork<SUP>sm</SUP> Coding
Challenge powered by TopCoder. This is <B>NOT</B> a rated event. </P>

<P>
<B>Date:</B> Sept. 18-20<BR/>
<B>Prize Purse:</B> $80,000<BR/>
<B>Place:</B> Moscone Center, San Francisco, CA<BR/>
</P>      
      </TD>  
       <!--  <TD VALIGN="middle"><DIV ALIGN="center"><A HREF="/?&amp;t=authentication&amp;c=login&amp;errorMsg=You must log in to view this portion of the site.&amp;errorURL=/Registration" TARGET="_blank"><IMG SRC="/i/tournament/sun_challenge_logo.gif" ALT="" WIDTH="174" HEIGHT="65" BORDER="0"/></A></DIV></TD> -->
      </TR>                    						
</TABLE>
	<BR/>
	
	<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">      
      <TR>
        <TD COLSPAN="2" ALIGN="center" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;SunNetwork Coding Challenge Features</TD>
      </TR>                    						
	  <TR>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" >
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='2002sunnetwork_rules'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
		<A HREF="/index?t=tournaments&amp;c=2002sunnetwork_rules#4" CLASS="statTextBig">Rounds</A></TD> -->
		<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<!-- <xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_regions_ne'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute> -->		
		<FONT COLOR="#666666">Round Updates</FONT></TD>
		<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='2002sunnetwork_rules'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/index?t=tournaments&amp;c=2002sunnetwork_rules" CLASS="statTextBig"><FONT COLOR="#FFCC00">Rules &amp; Regulations</FONT></A></TD>

		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='2002sunnetwork_rules'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
		<A HREF="/?&amp;t=authentication&amp;c=login&amp;errorMsg=You%20must%20log%20in%20to%20view%20this%20portion%20of%20the%20site.&amp;errorURL=/Registration" CLASS="statTextBig"><FONT COLOR="#FFCC00">Sign-Up!</FONT></A></TD> -->
	  </TR>
    </TABLE>
    <BR/>
<DIV ALIGN="center">
	<TABLE WIDTH="80%" BORDER="0" CELLPADDING="0" CELLSPACING="6" BGCOLOR="#093158">      
      <TR>
        <TD VALIGN="top">
<P CLASS="statText">
<B>TopCoder members</B><BR/>
<xsl:choose>
  <xsl:when test="/TC/LoggedIn='true'">
Please <A HREF="/Registration" CLASS="statText"><FONT COLOR="#FFCC00">update</FONT></A> your member profile to sign-up.
  </xsl:when>
  <xsl:otherwise>  
Please <A HREF="/tc?&amp;module=Login&amp;message=You%20must%20log%20in%20to%20view%20this%20portion%20of%20the%20site.&amp;nextpage=/Registration" CLASS="statText"><FONT COLOR="#FFCC00">login</FONT></A> to update your member profile to sign-up.
  </xsl:otherwise>
</xsl:choose>
</P>

<xsl:if test="not(/TC/LoggedIn='true')">
<P CLASS="statText">
<B>New to TopCoder?</B><BR/>
Click here to <A HREF="/Registration" CLASS="statText"><FONT COLOR="#FFCC00">register</FONT></A> as a TopCoder member and sign-up.
After you complete the registration process, we will send your account activation code via email.
</P>        
</xsl:if>
        </TD>
      </TR>                    						
    </TABLE>
</DIV>
<P CLASS="statText">
For more information, please read the 
<A HREF="/?&amp;t=tournaments&amp;c=2002sunnetwork_rules" CLASS="statText"><FONT COLOR="#FFCC00">Official Rules &amp; Regulations</FONT></A> prior to registration.
</P>
<P CLASS="statText">
Remember to visit the <A HREF="/?&amp;t=tournaments&amp;c=practice_room" CLASS="statText"><FONT COLOR="#FFCC00">Practice Room</FONT></A>
to sharpen your skills or simply to get familiar with the Competition Arena.
</P>
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
            <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
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
