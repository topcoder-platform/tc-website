<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/tc_updates2.xsl"/>
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries2.xsl"/>
  <xsl:import href="../includes/modules/intro.xsl"/>      
  <xsl:import href="../includes/modules/coder_week2.xsl"/>
  <xsl:import href="../includes/modules/top_10_coders2.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:import href="../includes/modules/arena2.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/editorials.xsl"/>    
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="PublicBody">

<!-- Body Begins -->

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/>
      <!-- SRM Promo Begins -->

      <!-- SRM Promo Ends -->    
    </TD>
    <!-- Right Column Include Begins -->

    <!-- Gutter -->
    <!-- <TD WIDTH="3" ROWSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD> -->
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->

<!-- 
<TD WIDTH="170" ROWSPAN="2" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/> 
  <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>
  <xsl:call-template name="module_login"/> 
  <xsl:call-template name="top_10_coders"/>
  <xsl:call-template name="arena"/>
</TD> 
-->

  <!-- Right Column Ends -->

  <!-- Gutter -->

    <TD WIDTH="1" ROWSPAN="2" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->        
  </TR>    
   <TR>

<!-- Left Column Include Begins -->   

  <!-- Gutter Begins -->
    <!-- <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> -->
     <!-- Gutter Ends -->

    <!-- Left Column Begins -->

    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->
<xsl:call-template name="module_login"/>
<xsl:call-template name="intro"/>
<xsl:call-template name="srm_dates"/>
<!-- <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/> -->
<xsl:call-template name="calendar"/>
<xsl:call-template name="countries"/>
<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="5"/><BR/>
<!-- Do Not Delete This Line --><FONT SIZE="1" COLOR="#CCCCCC" FACE="tahoma">HiddenWord</FONT>      
      </TD>    

  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
<!-- Left Column Include Ends -->

<!-- Body Area -->

  <!-- Center Column Begins -->  
    <TD WIDTH="100%" VALIGN="top" ALIGN="center" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/> 

<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#999999">
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" CLASS="bodyText">TopCoder expands match community to include...
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=pr_05_28_02</xsl:attribute>
        full story
      </A><BR/>
      <DIV ALIGN="center">
         <A CLASS="bodyGeneric">
           <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=pr_05_28_02</xsl:attribute>
           <IMG SRC="/i/flag_china.gif" ALT="China" WIDTH="150" HEIGHT="40" HSPACE="5" BORDER="0"/>
           <IMG SRC="/i/flag_new_zealand.gif" ALT="New Zealand" WIDTH="150" HEIGHT="40" HSPACE="5" BORDER="0"/>
         </A>
      </DIV>
    </TD>  
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
  </TR>
</TABLE>
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/> -->

<!-- Feature -->  
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="top" WIDTH="5" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" WIDTH="40%" BGCOLOR="#FFFFFF" HEIGHT="26"><IMG SRC="/i/label_feat.gif" ALT="Weekly Feature" WIDTH="184" HEIGHT="26" BORDER="0"/></TD>
    <TD WIDTH="60%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="7" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="7" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" ALIGN="center" HEIGHT="15">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=features</xsl:attribute>
        Upcoming/Past Features
      </A>
    </TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" ALIGN="center"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Feature ideas?</A></TD>
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">   
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>
<!-- <IMG SRC="/i/f/feat_050102_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/> -->   
<IMG SRC="/i/m/kpsmith_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
<A CLASS="bodyGeneric">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=feat_062602</xsl:attribute>
  <B>From the Field</B>
</A><BR/><BR/>
<!-- <I>qubits Became TopCoder's First $100,000 Champion One Year Ago This Week</I><BR/><BR/> -->
By&#160;kpsmith,<I>[TC] Member</I><BR/>
June 25, 2002<BR/>

<P>
When I first joined TiVo in 1999, the first task I was assigned was to track down and fix 
something called The 9s Bug. The bug caused random memory corruption in our embedded Linux boxes, 
and had to be fixed as soon as possible. We had just started shipping our first boxes to customers 
that month, and software quality was a big concern. Random memory corruption was bad...
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=feat_062602</xsl:attribute>full&#160;story</A></P>
<!-- <P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Have an idea for the weekly feature?</A></P> -->
  </TD>
    <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"/></TD></TR>
  <TR>
  <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  <TD VALIGN="top" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
</TABLE>  

    <!-- Last SRM Begins -->    
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" HSPACE="5" BORDER="0" ALIGN="left"/></TD>
    <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!--
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="194" ALIGN="right">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>
        <IMG SRC="/i/label_view_results.gif" ALT="Last Match Results" WIDTH="194" HEIGHT="26" BORDER="0" ALIGN="right"/>
      </A>
    </TD> 
    -->
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="4" CLASS="bodyText"><SPAN CLASS="bodyTextBold">Single Round Match 102</SPAN><BR/>
Monday, July 1, 2002<BR/><BR/> 
    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR> 
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="25%" NOWRAP="0" HEIGHT="15">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=index#leaders</xsl:attribute>
        Div. Leaders
      </A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="35%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=index#problem_stats</xsl:attribute>
        Problem Stats
      </A>
    </TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="15%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
        Results
      </A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="25%" NOWRAP="0"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Want to write?</A></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>    
</TABLE>  
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <!-- <TD VALIGN="top" WIDTH="50%"><xsl:call-template name="last_srm"/></TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
    <TD VALIGN="middle" CLASS="bodyText" WIDTH="100%">    
       <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFF99">  
          <TR>
             <TD VALIGN="middle" HEIGHT="17" ALIGN="center" COLSPAN="5" CLASS="bodyText"><B>Best/Worst Rating Change</B></TD> 
          </TR>
          <TR><TD COLSPAN="5" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>          
          <TR>
             <TD VALIGN="middle" ROWSPAN="2" WIDTH="20%" ALIGN="center" CLASS="bodyText" BGCOLOR="#FFFF66" NOWRAP="0"><B>Div-I</B></TD>
             <TD VALIGN="middle" HEIGHT="16" WIDTH="10%" CLASS="bodyText">&#160;&#160;Best:</TD> 
             <TD VALIGN="middle" WIDTH="35%" CLASS="bodyText" NOWRAP="0">&#160;&#160;krowa</TD>
             <TD VALIGN="middle" WIDTH="15%" CLASS="bodyText" ALIGN="center">303</TD>
             <TD VALIGN="middle" WIDTH="20%" CLASS="bodyText" NOWRAP="0">&#160;Room 13</TD>
          </TR>
          <TR>
             <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;Worst:</TD> 
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;&#160;cristi</TD>
             <TD VALIGN="middle" CLASS="bodyText" ALIGN="center">-315</TD>
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;Room 12&#160;</TD>
          </TR>
          <TR><TD COLSPAN="5" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>          
          <TR>
             <TD VALIGN="middle" ROWSPAN="2" ALIGN="center" CLASS="bodyText" BGCOLOR="#FFFF66" NOWRAP="0">&#160;<B>Div-II</B></TD>
             <TD VALIGN="middle" HEIGHT="16" CLASS="bodyText">&#160;&#160;Best:</TD> 
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;&#160;Mysid</TD>
             <TD VALIGN="middle" CLASS="bodyText" ALIGN="center">235</TD>
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;Room 32</TD>
          </TR>
          <TR>
             <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;Worst:</TD> 
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;&#160;dealdon</TD>
             <TD VALIGN="middle" CLASS="bodyText" ALIGN="center">-312</TD>
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;Room 21</TD>
          </TR>
          <!-- <TR><TD VALIGN="middle" HEIGHT="15" COLSPAN="5" BGCOLOR="#FFFFFF" CLASS="smallText">&#160;Login is required to view room details.</TD></TR>   -->                                
       </TABLE>   
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
</TABLE>
<!-- Editorials -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR><TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" COLSPAN="11"><IMG SRC="/i/label_coder_view.gif" ALT="Coder's Point of View" WIDTH="148" HEIGHT="26" BORDER="0"/></TD>   
      <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText" ROWSPAN="2"><IMG SRC="/i/m/Penwiper_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/> By&#160;Penwiper<BR/><I>[TC]&#160;Member</I><BR/></TD>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText" COLSPAN="10">
    <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>SRM 102</B></FONT>
    </TD>
  </TR>      
  <TR>
    <TD VALIGN="top" CLASS="bodyText" WIDTH="30%">     
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_room1</xsl:attribute>
        <B>Room One Review</B>
      </A><BR/>SRM 102 was the first TopCoder match without cash prizes, although many of the Room One regulars, along with 350 other coders
competed anyways...<A CLASS="bodyGeneric">
<xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_room1</xsl:attribute>full&#160;story</A>
    </TD>
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" CLASS="bodyText" WIDTH="30%">      
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_rookie</xsl:attribute>
        <B>Rookie Review</B>
      </A><BR/>SRM 102 had 4 rooms containing first-time coders.  Room 35 was won by <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_rookie</xsl:attribute>bstanescu</A>
 who was the only rookie to solve all three problems
correctly...<A CLASS="bodyGeneric">
<xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_rookie</xsl:attribute>full&#160;story
      </A>
    </TD>
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" CLASS="bodyText" WIDTH="40%">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_prob</xsl:attribute>
        <B>Problem Set Analysis &amp; Opinion</B>
      </A><BR/>The GirlFriend problem was a nice creative example of how TopCoder members can optimize their social lives...<A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_prob</xsl:attribute>full&#160;story
      </A>
    </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>     
  </TR>
  <TR><TD VALIGN="top" COLSPAN="13"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="11" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD></TR>   
</TABLE>

 <!-- Coder of the Week Begins -->
   <!-- <xsl:call-template name="coder_week"/> -->
<!-- Coder of the Week Ends -->
<xsl:call-template name="tc_updates"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR><TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>   
</TABLE>
<xsl:call-template name="arena"/> 
<!-- TC special promo --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
  <TR><TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="26" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText"><FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Sponsorships</B></FONT><BR/>TopCoder offers sponsorship programs for the weekly 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>
        Single Round Matches
      </A> as well as for 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>
        Tournaments
      </A>. Read more about our 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>
        sponsorship programs
      </A>.<BR/></TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText"><FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Employment Services</B></FONT><BR/>TopCoder works with companies to connect them with top-rated developers. Read more about our 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=empl_tces</xsl:attribute>
        employment services
      </A>.<BR/></TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD></TR>
  <TR><TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
</TABLE> 
    </TD>
  <!-- Center Column Ends -->    
    <TD BGCOLOR="#001935" VALIGN="top" CLASS="bodyText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/>
<A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=2002invit_rules</xsl:attribute>
<IMG SRC="/i/2002invit_button.gif" alt="" width="244" height="77" border="0"/></A><BR/><BR/>
<!-- <A>
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4220&amp;t=schedule&amp;c=srm</xsl:attribute>
    <IMG SRC="/i/sponspromo_motorola.gif" ALT="" WIDTH="244" HEIGHT="172" BORDER="0"/>
  </A><BR/> -->
<!-- <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=jack_qa_061302</xsl:attribute>
<IMG SRC="/i/jack_chat_qa.gif" alt="" width="244" height="100" border="0"/></A><BR/><BR/>
     <IMG SRC="/i/jack_chat_promo3.gif" alt="" width="244" height="201" border="0"/><BR/><BR/>

<IMG SRC="/i/sponspostmatch_citrix.gif" WIDTH="244" HEIGHT="172" BORDER="0" USEMAP="#sponspromo_citrix_Map"/>
<MAP NAME="sponspromo_citrix_Map">
  <AREA SHAPE="rect" ALT="" COORDS="4,5,240,109">
    <xsl:attribute name="HREF">Javascript:sponsorLinkWindow('http://<xsl:value-of select="/TC/Host"/>/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=home','Citrix','1','1','680','489')</xsl:attribute>
  </AREA>
  <AREA SHAPE="rect" ALT="" COORDS="106,145,195,157">
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=smr93_room1</xsl:attribute>
  </AREA>
  <AREA SHAPE="rect" ALT="" COORDS="106,133,196,144">
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=match_summary</xsl:attribute>
  </AREA>
  <AREA SHAPE="rect" ALT="" COORDS="107,117,192,132">
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>
  </AREA>
</MAP>
<A>
  <xsl:attribute name="HREF">Javascript:sponsorLinkWindow('http://<xsl:value-of select="/TC/Host"/>/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=home','Citrix','1','1','680','489')</xsl:attribute>
  <img BORDER="0" HEIGHT="172" WIDTH="244" ALT="" SRC="/i/sponspromo_citrix.gif"/>
</A><BR/> 

  <A>
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm96</xsl:attribute>
    <IMG SRC="/i/sponspromo_motorola.gif" ALT="" WIDTH="244" HEIGHT="172" BORDER="0"/>
  </A><BR/><BR/>-->

<!--  <A>
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4210&amp;t=schedule&amp;c=srm</xsl:attribute>
    <IMG SRC="/i/sponspromo_motorola.gif" ALT="" WIDTH="244" HEIGHT="172" BORDER="0"/>
  </A><BR/><BR/>

<A TARGET="_parent">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute>
  <IMG SRC="/i/promo_teams.gif" WIDTH="244" HEIGHT="81" BORDER="0"/>
</A><BR/>
<A TARGET="_parent">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=jobs&amp;c=index</xsl:attribute>
  <IMG SRC="/i/promo_jobs.gif" WIDTH="244" HEIGHT="81" BORDER="0"/>
</A> -->
<xsl:call-template name="top_10_coders"/>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR><TD COLSPAN="3" BGCOLOR="#001935"><IMG SRC="/i/label_quick_stats_home.gif" ALT="Quick Stats" WIDTH="166" HEIGHT="17" BORDER="0"/></TD></TR>
  <TR><TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                
  <TR>
    <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
    <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
  </TR>              
  <TR><TD CLASS="statText" VALIGN="top">Select a Quick Stat from the menu below.</TD></TR>
  <TR><TD CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                              
  <TR><TD CLASS="quickstatText" VALIGN="top">
  <!-- Quick Stat Pulldown Begins --> 
  <xsl:call-template name="quick_stats_pulldown"/>
  <!-- Quick Stat Pulldown Ends -->
  <!-- Quick Stat Pulldown Begins --> 
  <!-- <xsl:call-template name="quick_stats_tidbit"/> -->
  <!-- Quick Stat Pulldown Ends -->
  </TD>
  </TR>               
</TABLE><BR/>
<A HREF="/stat?c=member_profile&amp;cr=286951" CLASS="coderTextRed">
<IMG SRC="/i/codermonth_june.gif" ALT="Coder of the Month" WIDTH="244" HEIGHT="156" VSPACE="10" BORDER="0"/></A>   
</TD>
<TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Body Area Ends -->
</TR>   
</TABLE>

  </xsl:template>
</xsl:stylesheet>
