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
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm83_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm83_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm83_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links <A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A> -->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 83</B><BR/>
April 27, 2002</P>
<P><B>Room 1 Review</B></P>
<P>Room 1 started with everyone opening the Level One problem, except <A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright</A> 
who skipped to the Level Two and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">reid</A> who did start with the Level One, but 
for some reason started five minutes late. Meanwhile, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">ZorbaTHut</A> had finished 
and submitted the Level One problem in only seconds more than three and a half minutes, getting 196.90 points. 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">SnapDragon</A> and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">doeth</A> 
submitted theirs in four and a half minutes for 195.07 and 195.15 points respectively, followed by the rest of Room One 
(except <B>dmwright</B>), each coder proceeding to the Level Two problem.</P>

<P><B>doeth</B> submitted the Level Two problem both fast and best, getting 418.77 points for 17 minutes of work, while <B>dmwright</B> 
finished his solution, taking almost 27 minutes for 333.96 points and going back to the Level One problem, finishing it in 6 minutes 
for 192.60 points.</P>

<P>In a surprise move, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">benetin</A> apparently gave up on the Level Two problem, moving 
on to the Level Three problem after almost 18 minutes of work. Meanwhile, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Joe</A>, 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge</A>, <B>reid</B>, and finally <B>ZorbaTHut</B> submitted their Level Two 
solutions within ten minutes, <B>Joe</B> getting 340.62 points due to a late start and <B>ZorbaTHut</B> bringing up the end with only 278.27 points, taking
him 37 minutes.</P>

<P>Aside from <A HREF="/stat?c=last_match" CLASS="bodyGeneric">derkuci's</A> late Level Two submission, only half a minute before the 
end of coding phase, getting 206.07 points for almost 70 minutes of work, all that was left were the Level Three submissions. <B>reid</B> 
scored dramatically higher than anyone else, submitting in under 16 minutes and getting 787.79 points. <B>dmwright</B> took half an hour and 
got 552.89 points, while <B>doeth</B> spent 48 minutes for 429.12 points.</P>

<P>At the end of coding phase, <B>reid</B> was comfortably in the lead by almost 250 points, followed by <B>dmwright</B> and <B>doeth</B> 
seperated by a mere 20 points, but <B>Snapdragon</B>, <B>Joe</B>, and <B>John Dethridge</B> 
behind them by over 500.</P>

<P>Challenge phase started with the only Level Three challenge attempted, <B>doeth's</B> unsuccessful challenge on <B>dmwright</B>. All 
the other challenges were on the Level Two problem, with <B>Joe</B>, <B>doeth</B>, and <B>dmwright's</B> solutions falling to <B>John Dethridge</B>, 
<B>benetin</B>, and <B>SnapDragon</B> respectively. <B>SnapDragon</B> also challenged <B>doeth's</B> Level Two unsuccessfully, and <B>benetin</B> 
attacked <B>SnapDragon</B> and <B>ZorbaTHut's</B> solutions unsuccessfully.</P>

<P>Despite <B>dmwright</B> and <B>doeth</B> losing their Level Two submission, both of them were still in the same positions after challenge phase. 
Systest produced no changes, only shuffling around 5th through 7th place, as <B>ZorbaTHut</B>, <B>SnapDragon</B>, and <B>derkuci's</B> Level Two 
solutions all failed. <B>ZorbaTHut</B> ended up in 5th place on the strength of his Level One solution with <B>benetin</B> picking up last due to 
a very slow submission (over 9 minutes, for 180.71 points.)</P>

<P><B>reid</B>, the only coder in Room One with all three submissions still intact, won by a margin of over 570 points, boosting his rating by 137 
points. <B>dmwright</B> and <B>doeth</B> picked up second and third place, <B>doeth</B> increasing by 32 points and <B>dmwright</B>, due to his 
exceedingly high rating after the collegiate and the exceptional performance by <B>reid</B>, actually dropping by 8 rating points.</P>

<P><B>benetin</B> picked up last, his Level One submission combined with a net loss of 50 points in challenge phase only giving him 130.71 points, 
losing him 183 rating points.</P>

<P><B>John Dethridge</B> was 4th by only 22 points despite a successful challenge by him and an unsuccessful by <B>doeth</B>.</P>

  
    <IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


