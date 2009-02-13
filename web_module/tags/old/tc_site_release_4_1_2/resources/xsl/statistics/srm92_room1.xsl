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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm92_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm92_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm92_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
   <!--<TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 92</B><BR/>
May 29, 2002</P>
<P><B>Room 1 Review</B></P>
<P>
Room 1 started with <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">venco</A>, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">ambrose</A>, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">bigg_nate</A>, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">ZorbaTHut</A>, and 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">SnapDragon</A> opening the Level One within ten seconds, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">John Dethridge</A> arriving a minute
late but taking the same track. <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">dmwright</A> showed up 
two and a half minutes late, but started on the Level Two instead. <B>SnapDragon</B> finished the Level One after seven seconds 
flat, for 283.16 points, the highest in the room. Two minutes later <B>bigg_nate</B> completed his solution, followed seconds later 
by the late arrival of <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">reid</A>, who immediately opened his own Level One
problem. <B>ambrose</B>, <B>ZorbaTHut</B>, and <B>venco</B> submitted their Level One solutions within fifteen seconds of each other, <B>ambrose</B> 
getting 261.34 points and <B>ZorbaTHut</B> beating out venco by two seconds for 260.41 points to <B>venco's</B> 260.18. <B>John Dethridge</B> 
spent 16 minutes on his solution, getting only 233.96 points.</P>
<P>
Meanwhile, <B>dmwright</B> completed his Level Two submission for 413.60 points in thirteen and a half minutes, followed after a mere two and a half minutes by
<B>SnapDragon</B>, racking out a Level Two solution in only eleven minutes for 437.27 points. <B>dmwright</B> continued on to the Level Three, as did <B>SnapDragon</B>. 
<B>ZorbaTHut</B>, <B>bigg_nate</B>, <B>venco</B>, and <B>John Dethridge</B> completed in anywhere from twelve minutes to eighteen minutes, the widely varying Level One 
submission times making unpredictable scores. <B>ZorbaTHut</B> moved on to the Level Three before anyone but <B>SnapDragon</B> and <B>dmwright</B>, though <B>John Dethridge</B>, 
finishing almost five minutes later, nevertheless got six points more, for 427.99 on the Level Two. <B>bigg_nate</B>, on the other hand, despite submitting a minute and a 
half sooner than <B>John Dethridge</B>, actually spent over 50% longer, getting only 369.46 points.</P>
<P>
<B>reid</B> showed up to the match over nine minutes late and spent almost twelve minutes on the Level One, getting 257.92 points and opening the Level Two 
after <B>SnapDragon</B> and <B>dmwright</B> had finished it and moved on. Nevertheless, he finished the Level Two faster than anyone else, shaving 20 seconds off 
<B>SnapDragon's</B> time and earning 439.97 points, moving on to the Level Three still five minutes behind even <B>John Dethridge</B>. <B>ambrose</B> continued struggling 
with his Level Two. He eventually finished it after nearly forty minutes of work for only 242.55 points.</P>
<P>
<B>SnapDragon</B> continued his unbelievable times, spending less than 16 minutes on the Level Three, netting a whopping 747.37 points and finishing the entire problem set 
in less than 35 minutes, for a grand total of 1467.80 points. <B>dmwright</B> finished the Level Three eight minutes later for 588.29 points after twenty-six minutes of work, 
going back to his unopened Level One. <B>John Dethridge</B> finished the problem set forty-six minutes into the match, spending almost exactly one minute more than <B>SnapDragon</B> 
on his Level Three for 730.17 points. <B>ZorbaTHut</B> finished four minutes later, taking 25 minutes on the Level Three for only 590.57 points. <B>reid</B> completing the set 
after 56 minutes, taking only 21 and a half for his Level Three for 648.48 points. <B>dmwright</B> and <B>bigg_nate</B> finished their sets within seconds of each other, <B>dmwright</B> 
burning 18 minutes on a 222.90point Level One submission and <B>bigg_nate</B> taking almost 33 minutes on a 513.08point Level Three. <B>venco</B> and <B>ambrose</B> did not submit a Level Three.</P>
<P>
At the end of coding phase, <B>SnapDragon</B> was easily in the lead with his amazing total of 1467.80 points. <B>John Dethridge</B> was 2nd with 1392.12 points, and <B>reid</B> 
third with 1346.37 points. <B>ZorbaTHut</B>, <B>dmwright</B>, and <B>bigg_nate</B> took the middle places, with <B>venco</B> and <B>ambrose</B> trailing far behind.</P>
<P>
Challenge phase was, as usual, quiet, the only event being <B>dmwright's</B> successful challenge of <B>ZorbaTHut's</B> Level One problem, dropping <B>ZorbaTHut</B> behind 
<B>bigg_nate</B> and pushing <B>dmwright</B> up to almost exactly ZorbaTHut's old score.</P>
<P>
Systests, however, produced some changes, with <B>ZorbaTHut's</B> Level Two failing as well as both submissions of <B>ambrose</B>. <B>bigg_nate</B> and <B>John Dethridge</B> 
both lost their Level Three, and <B>reid</B> lost his Level One. <B>venco</B> kept both his submissions, and both <B>SnapDragon</B> and <B>dmwright</B> kept all three, <B>SnapDragon</B> 
preserving his impressive score.</P>
<P>
<B>SnapDragon</B> finished as the room winner, <B>dmwright</B> getting 2nd place and <B>reid's</B> Level One loss knocking him from 2nd to 3rd, still in the running. 
<B>John Dethridge</B>, <B>bigg_nate</B>, and <B>venco</B> took up the middle. <B>ZorbaTHut's</B> multiple failures dropped him into the second-to-last place, only above 
<B>ambrose</B>, left with zero points.</P>
<P>
<B>SnapDragon</B> gained 112 rating points from his impressive work, sending him up several places. <B>dmwright</B> gained the second most, getting 62 points. <B>reid</B>, 
<B>bigg_nate</B>, and <B>venco</B> gained 32, 37, and 47 respectively. <B>John Dethridge</B> did almost as predicted, gaining eight points, as did <B>ZorbaTHut</B>, losing 
a mere six. <B>ambrose</B>, on the other hand, plummeted a full 169 points down the rankings, not quite his maximum for one round.</P>



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
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
      <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<!--<center><A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A></center>-->
<BR/>
<!-- <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
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


