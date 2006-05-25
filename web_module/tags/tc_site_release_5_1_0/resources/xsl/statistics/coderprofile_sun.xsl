<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
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
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;2002 Collegiate Challenge - Coder Profiles</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/><BR/>
<IMG SRC="/i/sun_coderprofile_header.jpg" ALT="" WIDTH="320" HEIGHT="96" ALIGN="left" BORDER="0"/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">TOURNAMENT LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=schedule&amp;c=tourny_spons" CLASS="bodyText">&#160;&#160;Sun Sponsorship</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=2002tccc_favs" CLASS="bodyText">"Favorites"</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyText">&#160;&#160;Brackets</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=2002tccc_cind" CLASS="bodyText">"Cinderellas"</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=schedule&amp;c=tourny_regions_ne" CLASS="bodyText">&#160;&#160;Regions</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=2002tccc_eyeon" CLASS="bodyText">"Keep Your Eye on"</A></TD>
      </TR>
      <TR>
         <TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>&#160;&#160;<B>Become a Member today!</B></A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE><BR CLEAR="all"/>
<!--end contextual links-->
<P><B>Finalists Compete in the Sun Microsystems and TopCoder Collegiate Challenge</B></P>
<P>Learn about top collegiate-level developers as they compete for a $150,000 prize in the Sun Microsystems and TopCoder 2002 Collegiate Challenge.</P>
<P>Sixteen of the top collegiate computer programmers in the nation will battle for the distinction of being recognized as the ultimate "Top Coder," this Friday and Saturday, April 19-20, in the semifinal/final rounds of the 2002 Sun Microsystems and TopCoder Collegiate Challenge. Four of those sixteen advanced to the finals by becoming Regional Champions in previous qualifying rounds.</P>
<P><B>Dan Adkins</B>, (<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A>) a doctoral student in computer science at the University of California at Berkeley, is the champion of the West region. He began the Collegiate Challenge as the West region's fourth seed. This is Adkins' second appearance in the semifinals of one of TopCoder's major tournaments. He recently appeared in the 2001 TopCoder Invitational last November, finishing tied for ninth and winning $5,750. Adkins has been a member of TopCoder since April 17, 2001. He is ranked fourth overall among all TopCoder members, which include both professional and collegiate level developers, with a rating of 2706.</P>
<P>The Northeast Regional champion was <B>Ben Wilhelm</B> (<A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>) of Oberlin College in Ohio. Wilhelm is a sophomore physics major, and began the tournament as the second seed in the region. Like Adkins, he was a semifinalist in the 2001 TopCoder Invitational, although he finished tied for 13th, winning $3,000. Wilhelm was the Cinderella story of the Invitational, qualifying for the final 16 after beginning the competition ranked 92nd. He joined TopCoder on August 2, 2001, with his 2685 rating ranking him fifth among all members. He is a perfect nine-for-nine in his coding solution submissions through the first three rounds of the Collegiate Challenge.</P>
<P><B>Tom Sirgedas</B> (<A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>) is a graduate student in computer science and engineering at the University of Michigan in Ann Arbor, and is making his first appearance as a finalist in a major TopCoder tournament. Tom was the top-seed in the Midwest, and has been one of the top scorers in the Collegiate Challenge, averaging 1005.84 points over the first three rounds. He is a perfect nine-for-nine in his coding solution submissions, and one-for-one in challenges. Tom has been a member since September 8, 2001, and has an overall rating of 2125, which ranks him 40th among all members.</P>
<P>Georgia Tech sophomore <B>Trayton Otto</B> (<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>) was the surprise champion of the Southeast, as he began the Collegiate Challenge as the eighth ranked coder in the region. This is the third major tournament for Otto, who made it to the third round of the 2001 TopCoder Collegiate Challenge, and was one of the 16 semifinalists in the 2001 TopCoder Invitational. He finished tied for 13th place in the Invitational and won $3,000. Otto was one of the first people to join TopCoder, becoming a member on March 28, 2001. He has a rating of 1750, which ranks him in a tie for 110th place overall.</P>
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


