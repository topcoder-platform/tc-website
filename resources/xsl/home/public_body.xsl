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
  <xsl:import href="../includes/modules/top_10_schools.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:import href="../includes/modules/arena2.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/editorials.xsl"/>    
  <xsl:import href="../includes/modules/simple_search.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>      
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

    <TD WIDTH="170" BGCOLOR="#000000" VALIGN="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->
<xsl:call-template name="global_left"/>

<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="5"/><BR/>
<!-- Do Not Delete This Line --><FONT SIZE="1" COLOR="#000000" FACE="tahoma">HiddenWord</FONT>      
      </TD>    

  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
<!-- Left Column Include Ends -->

<!-- Body Area -->

  <!-- Center Column Begins -->  
    <TD WIDTH="100%" VALIGN="top" ALIGN="center" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/> 

<!-- Summary/Best/Worst Begins -->         
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" HSPACE="5" BORDER="0" ALIGN="left"/></TD>
    <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
<TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="3" CLASS="bodyText"><A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><B>Single Round Match 125</B></A><BR/>
Monday, December 16, 2002<BR/><BR/>


    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="33%" NOWRAP="0" HEIGHT="15">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>
        Div. Leaders
      </A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="43%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>
        Problem Stats
      </A>
    </TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="23%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
        Results
      </A>
    </TD>   
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>  
</TABLE> 

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" CLASS="statText" WIDTH="100%">  
       <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#001935">  
          <TR>
             <TD VALIGN="middle" HEIGHT="17" ALIGN="center" COLSPAN="5" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">Best/Worst Rating Change</TD> 
          </TR>
          <TR><TD COLSPAN="5" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>          
          <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">
            <TR>
              <TD HEIGHT="14" VALIGN="middle" WIDTH="20%" CLASS="statTextBig" NOWRAP="0">&#160;&#160;&#160;<xsl:value-of select="division"/></TD>
              <TD VALIGN="middle" WIDTH="10%" CLASS="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</TD> 
              <TD VALIGN="middle" WIDTH="35%" CLASS="statText" NOWRAP="0">&#160;&#160;
                <A>
                  <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                  <xsl:attribute name="CLASS">bodyText</xsl:attribute>
                  <FONT>
                    <xsl:attribute name="color">
                      <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                    </xsl:attribute>
                    <xsl:value-of select="handle"/>
                  </FONT>
                </A>
              </TD>
              <TD VALIGN="middle" WIDTH="15%" CLASS="statText" ALIGN="center"><xsl:value-of select="change"/></TD>
              <TD VALIGN="middle" WIDTH="20%" CLASS="statText" NOWRAP="0">&#160;<xsl:value-of select="room_name"/></TD>
            </TR>            
          </xsl:for-each>
          <TR><TD COLSPAN="5" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
       </TABLE>
    </TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  
<!-- Uncomment for invit02
 
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="3" CLASS="bodyText"><BR/>
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=invit02_champ</xsl:attribute><B>G'day Mate!</B></A><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>

<P>
...
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournaments&amp;c=invit02_champ</xsl:attribute>read&#160;more</A>
</P>
    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR> -->  
  
  <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD></TR>  
</TABLE>

<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR><TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" COLSPAN="7"><IMG SRC="/i/label_coder_view.gif" ALT="Coder's Point of View" WIDTH="148" HEIGHT="26" BORDER="0"/></TD>   
      <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText" ROWSPAN="2"><IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/> 
    By&#160;ZorbaTHut<BR/><I>[TC]&#160;Member</I><BR/></TD>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText" COLSPAN="2">
    <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>SRM 125</B></FONT>
    </TD>
  </TR>      
  <TR>
    <TD VALIGN="top" CLASS="bodyText" WIDTH="100%">
	<A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm125_prob</xsl:attribute>
        <B>Problem Set Analysis &amp; Opinion</B>
      </A><BR/>
<P> 
SRM 125. Every once in a while we have a truly nasty round with a problem
that nobody solves, but usually we get at least a dozen submissions on it.
This would be an exception - there were only two submissions to the Div-I
Level Three problem, and unfortunately, they were both wrong. Many of the
other problems were similarly tough, with low success rates - and scores -
across the board...<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm125_prob</xsl:attribute>Get the analysis</A>
</P>
    </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>     
  </TR>
  <TR><TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="7" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD></TR>   
</TABLE>
<!-- End of Point of View -->

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
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=features</xsl:attribute>
        Upcoming/Past Features
      </A>
    </TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" ALIGN="center"> <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_topics</xsl:attribute>Want to write?</A></TD>
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">   
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>
<!-- <IMG SRC="/i/f/feat_050102_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/> -->   
<IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/>
By&#160;KaiEl<BR/><I>[TC] Member</I><BR/><BR/>
<A HREF="/?&amp;t=features&amp;c=feat_topics"><IMG SRC="/i/writers_wanted.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="15"/></A></TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText"><BR/>
<A CLASS="bodyGeneric">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_122002</xsl:attribute>
  <B>The Big Rerun</B></A><BR/>
<I>A Complete Breakdown of the 2002 Invitational Championship Round</I><BR/>
Friday, December 20, 2002<BR/>

<P>
Anyone who's been with TopCoder for long enough should be used to the troubles that occasionally 
come up during Single Round Matches. Whether it's due to an error in the problem statement, system 
testing or some other part of the process, sometimes there is an issue that compromises the fairness 
or feasibility of counting the results of a contest. Some coders get mad about having their 75 
minutes of hard work thrown out, but most of them accept that accidents do happen.
</P>

<P>
When there's a $150,000 tournament, though, people tend to be less accepting.
</P>

<P>
Since the controversial re-running of the final round of the 2002 TopCoder Invitational, an 
internal debate has flared up within the ranks of the TopCoder competitors and administrators. 
Hundreds of people who were not directly affected by the results have posted their opinions in 
the Round Tables and chatted endlessly about the results in the Competition Arena. If TopCoder 
had its own version of 'Sports Talk' radio, then this one issue would probably have taken up 
the morning and afternoon drive-time slots for the past month...<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_122002</xsl:attribute>full&#160;story</A></P>
<!-- <P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Have an idea for the weekly feature?</A></P> -->
  </TD>
    <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"/></TD></TR>
  <TR>
  <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  <TD VALIGN="top" BGCOLOR="#43515E" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
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
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournaments</A>. Read more about our 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>sponsorship programs</A>.<BR/></TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText"><FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Employment Services</B></FONT><BR/>TopCoder works with companies to connect them with top-rated developers. Read more about our 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>employment services</A>.<BR/></TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD></TR>
  <TR><TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
</TABLE> 
    </TD>
  <!-- Center Column Ends -->    
				<TD BGCOLOR="#001935" VALIGN="top" CLASS="statText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/> 
<!--SRM Sponsor Starts-->

  <!--   <IMG SRC="/i/srm_home.gif" WIDTH="244" HEIGHT="250" ALT="" BORDER="0" USEMAP="#srm_home"/><MAP NAME="srm_home">
<AREA ALT="" COORDS="124,28,228,90" HREF="/?&amp;t=tces&amp;c=fbi"/>
<AREA ALT="" COORDS="141,160,224,187" HREF="/?&amp;t=schedule&amp;c=srm_spon_artifact"/>
<AREA ALT="" SHAPE="POLY" COORDS="23,193,112,193,121,201,234,201,234,240,38,240,12,216,12,193" HREF="/stat?&amp;c=last_match"/>
</MAP> -->

					<IMG USEMAP="#microsoft_home" SRC="/i/es/ms/microsoft_home.gif" ALT="" WIDTH="244" HEIGHT="160" BORDER="0"/><BR/>
					<MAP NAME="microsoft_home">
						<AREA ALT="TCES" SHAPE="poly" COORDS="17,33,17,60,141,60,141,92,228,92,228,25,17,25" HREF="/?&amp;t=tces&amp;c=ms"/>
						<!-- <AREA ALT="" SHAPE="poly" COORDS="229,104,120,105,105,94,11,95,10,120,36,146,229,148" HREF="/?RoundId=4415&amp;t=schedule&amp;c=srm"/> --> 
						<AREA ALT="" SHAPE="poly" COORDS="229,104,120,105,105,94,11,95,10,120,36,146,229,148" HREF="/stat?&amp;c=last_match"/>
					</MAP>
<!--SRM Sponsor Ends-->

<!-- <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
<IMG SRC="/i/tces_promo.gif" alt="" width="244" height="77" border="0"/></A> -->
<A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
<IMG SRC="/i/tces_quote.gif" ALT="" WIDTH="244" HEIGHT="174" BORDER="0"/></A>
<!-- <A HREF="/?&amp;t=tournaments&amp;c=invit02_cnn"><IMG SRC="/i/tournament/invit02/invit02_cnn_home.gif" ALT="TC on CNN" WIDTH="244" HEIGHT="145" BORDER="0"/></A> -->

<!-- Software Promo Begins -->
					<A HREF="/?&amp;t=development&amp;c=comp_projects"><IMG SRC="/i/tcs_board.gif" ALT="TCS" WIDTH="244" HEIGHT="128" VSPACE="1" BORDER="0"/></A>
<!-- Software Promo Ends -->

<!-- Software Leader Board Begins -->
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif">
				<TR><TD HEIGHT="17" CLASS="moduleTitle" VALIGN="middle"><IMG SRC="/i/module_labels_tcs_coders.gif" ALT="TopCoder Software Leaders" WIDTH="226" HEIGHT="17" BORDER="0"/></TD></TR>
			</TABLE>

			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
				<TR VALIGN="top">
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="3" BORDER="0"/></TD>
					<TD WIDTH="59%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
					<TD WIDTH="39%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="3" BORDER="0"/></TD>
				</TR>              
							
				<TR VALIGN="middle">
					<TD WIDTH="10" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="15" BORDER="0"/></TD>
					<TD CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">Handle</TD>
					<TD CLASS="statTextBig" ALIGN="right" BACKGROUND="/i/steel_bluebv_bg.gif" NOWRAP="nowrap">Average Score</TD>  
					<TD WIDTH="10" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="15" BORDER="0"/></TD>
				</TR>              
							
				<TR VALIGN="top">
					<TD COLSPAN="4" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>                             
							
				<TR VALIGN="top">
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="statText"><A CLASS="coderTextYellow" HREF="/stat?c=member_profile&amp;cr=296145">srowen</A></TD>
					<TD CLASS="statText" ALIGN="right">87.54</TD>
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>             
							
				<TR VALIGN="top">
					<TD COLSPAN="4" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>                             
							
				<TR VALIGN="top">
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="statText"><A CLASS="coderTextRed" HREF="/stat?c=member_profile&amp;cr=158067">KurtSteinKraus</A></TD>
					<TD CLASS="statText" ALIGN="right">83.78</TD>
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>             
							
				<TR VALIGN="top">
					<TD COLSPAN="4" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>                             
							
				<TR VALIGN="top">
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="statText"><A CLASS="coderTextGray" HREF="/stat?c=member_profile&amp;cr=302729">kislookhin</A></TD>
					<TD CLASS="statText" ALIGN="right">82.40</TD>
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>             
							
				<TR VALIGN="top">
					<TD COLSPAN="4" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>                             
							
				<TR VALIGN="top">
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="statText"><A CLASS="coderTextGreen" HREF="/stat?c=member_profile&amp;cr=299180">isv</A></TD>
					<TD CLASS="statText" ALIGN="right">81.52</TD>
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>             
							
				<TR VALIGN="top">
					<TD COLSPAN="4" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>                             
							
				<TR VALIGN="top">
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="statText"><A CLASS="coderTextYellow" HREF="/stat?c=member_profile&amp;cr=150940">orb</A></TD>
					<TD CLASS="statText" ALIGN="right">81.38</TD>
					<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>             
							
				<TR>
					<TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>                       
			</TABLE>
<!-- Software Leader Board Ends -->

<!-- <A HREF="/?&amp;t=news_events&amp;c=pr_10_22_02"> -->

<!-- <A HREF="/?&amp;t=schedule&amp;c=oraclesurv_rules">
<IMG SRC="/i/oraclesurv_promo.gif" ALT="Oracle Code Survivor" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A> -->

<!-- <A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournaments/2002sunnetwork_button.gif" alt="" width="244" height="79" border="0"/></A><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
    <TD class="statText" WIDTH="100%" ALIGN="right"><A HREF="http://sunnetwork.sun.com/sf2002/reg/general/index.en.jsp" TARGET="_blank" CLASS="statText"><B>Register for the conference</B> &gt;</A></TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
    <TD class="statText" WIDTH="100%" ALIGN="right"><A HREF="http://sunnetwork.sun.com/" TARGET="_blank" CLASS="statText">Learn more &gt;</A></TD>    
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                              
</TABLE>
<A HREF="http://sunnetwork.sun.com/sf2002/reg/general/index.en.jsp" TARGET="_blank" CLASS="statText"><IMG SRC="/i/tournament/2002sunnetwork_chall.gif" alt="" width="244" height="56" border="0"/></A><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD class="statText" WIDTH="100%" ALIGN="right"><A class="statText"><xsl:attribute name="HREF">http://sunnetwork.sun.com/sf2002/topcoder/index.jsp</xsl:attribute>For more information and official rules and regulations&gt;</A></TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                               
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD class="statText" WIDTH="100%"><B>Note:</B><BR/>Contestants must be a <A HREF="/reg/index.jsp" CLASS="statText"></A>TopCoder member and a registered attendee of the SunNetwork<sup>sm</sup> Conference 
in order to participate in the SunNetwork<sup>sm</sup> Coding Challenge.</TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                               
</TABLE>
<IMG SRC="/i/tournament/2002sunnetwork_btm.gif" alt="" width="244" height="34" border="0"/><BR/> -->

			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif">
				<TR><TD HEIGHT="17" CLASS="moduleTitle" VALIGN="middle"><IMG SRC="/i/module_labels_10_coders.gif" ALT="TopCoder Competition Leaders" WIDTH="226" HEIGHT="17" BORDER="0"/></TD></TR>
				<TR><TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
				<TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>      
			</TABLE>

<xsl:call-template name="top_10_schools"/>
<xsl:call-template name="top_10_coders"/>

			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
				<TR>
					<TD ALIGN="left" CLASS="statText"><IMG SRC="/i/clear.gif" WIDTH="20" HEIGHT="4" BORDER="0"/></TD>
					<TD></TD>
					<TD></TD>
					<TD ALIGN="left" CLASS="statText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="4" BORDER="0"/></TD>
				</TR>

				<TR><TD ALIGN="center" CLASS="statTextBig" COLSPAN="4">More Leaders</TD></TR>

				<TR>
					<TD></TD>
					<TD ALIGN="left" CLASS="statText">Coders</TD>
					<TD ALIGN="right"><A HREF="/stat?c=coder_ratings" CLASS="statText">view all</A></TD>
					<TD></TD>
				</TR>

				<TR>
					<TD></TD>
					<TD ALIGN="left" CLASS="statText">Schools</TD>
					<TD ALIGN="right"><A HREF="/stat?c=school_avg_rating" CLASS="statText">view all</A></TD>
					<TD></TD>
				</TR>
				
				<TR>
					<TD></TD>
					<TD ALIGN="left" CLASS="statText">States</TD>
					<TD ALIGN="right"><A HREF="/stat?c=state_avg_rating" CLASS="statText">view all</A></TD>
					<TD></TD>
				</TR>

				<TR>
					<TD></TD>
					<TD ALIGN="left" CLASS="statText">Countries</TD>
					<TD ALIGN="right"><A HREF="/stat?c=country_avg_rating" CLASS="statText">view all</A></TD>
					<TD></TD>
				</TR>
			</TABLE>

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
<!-- <A HREF="/?&amp;t=schedule&amp;c=2002sun_sched">
			<IMG SRC="/i/2002sn_winner.gif" ALT="SunNetwork Coding Challenge" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A> -->
			<A HREF="/stat?c=member_profile&amp;cr=302185">
			<IMG SRC="/i/codermonth_nov.gif" ALT="Coder of the Month" WIDTH="244" HEIGHT="156" VSPACE="10" BORDER="0"/></A>
		</TD>
<!-- <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
<!-- Body Area Ends -->
	</TR>   
</TABLE>

  </xsl:template>
</xsl:stylesheet>
