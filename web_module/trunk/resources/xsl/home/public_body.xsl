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

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
  <tr>
    <td valign="top" colspan="3"><img src="/i/clear.gif" width="1" height="1" border="0"/><br/>
      <!-- SRM Promo Begins -->

      <!-- SRM Promo Ends -->    
    </td>
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

    <td width="1" rowspan="2" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
    <!-- Gutter Ends -->        
  </tr>    
   <tr>

<!-- Left Column Include Begins -->   

  <!-- Gutter Begins -->
    <!-- <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> -->
     <!-- Gutter Ends -->

    <!-- Left Column Begins -->

    <td width="170" bgcolor="#000000" valign="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->
<xsl:call-template name="global_left"/>

<img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="5"/><br/>
<!-- Do Not Delete This Line --><font size="1" color="#000000" face="tahoma">HiddenWord</font>      
      </td>    

  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <td width="1" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
    <!-- Gutter Ends -->
<!-- Left Column Include Ends -->

<!-- Body Area -->

  <!-- Center Column Begins -->  
    <td width="100%" valign="top" align="center" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/><br/> 


<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF"> 
  <tr> 
    <td VALIGN="top" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></td> 
    <td VALIGN="top" WIDTH="1" bgcolor="#000000"><A HREF="/?&amp;t=tournaments&amp;c=tccc03_sched"><IMG SRC="/i/tournament/tccc03/tccc03_home.gif" ALT="" WIDTH="138" HEIGHT="90" BORDER="0"/></A></td>     
    <td VALIGN="top" bgcolor="#000000" CLASS="statText"><BR/>
    <B>When:</B> Feb. 18th - April 5th, 2003<BR/>
    <B>Where:</B> the University Park Hotel @ MIT in Cambridge, MA<BR/>
    <B>Total Purse:</B> $100,000<BR/><BR/>
    <FONT COLOR="#CC0000"><B>200 TopCoder Members will win money!</B></FONT><BR/>
<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_sched</xsl:attribute>Click here</A>
for more information.<BR/><BR/>
    </td>    
    <td VALIGN="top" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></td>   
  </tr>
</table>

<!-- Summary/Best/Worst Begins -->         
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td valign="middle" bgcolor="#FFFFFF" width="184"><img src="/i/label_srm_summary.gif" alt="Last Match Summary" width="184" height="26" hspace="5" border="0" align="left"/></td>
    <td width="100%" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
  </tr>
</table>
<table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
<tr> 
    <td valign="top" width="4"><img src="/i/clear.gif" alt="" width="4" height="1" border="0"/></td> 
    <td valign="top" colspan="3" class="bodyText"><a class="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><b>Single Round Match 128</b></a><br/>
Monday, January 6, 2003<br/><br/>


    </td>    
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>   
  </tr>
  <tr> 
    <td valign="top" width="4"><img src="/i/clear.gif" alt="" width="4" height="1" border="0"/></td> 
    <td valign="middle" align="center" bgcolor="#CCCCCC" width="33%" nowrap="0" height="15">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>
        Div. Leaders
      </a>
    </td>
    <td valign="middle" align="center" bgcolor="#CCCCCC" width="43%" nowrap="0">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>
        Problem Stats
      </a>
    </td> 
    <td valign="middle" align="center" bgcolor="#CCCCCC" width="23%" nowrap="0">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
        Results
      </a>
    </td>   
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>   
  </tr>  
</table> 

<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">  
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="middle" class="statText" width="100%">  
       <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#001935">  
          <tr>
             <td valign="middle" height="17" align="center" colspan="5" class="statTextBig" background="/i/steel_bluebv_bg.gif">Best/Worst Rating Change</td> 
          </tr>
          <tr><td colspan="5" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>          
          <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">
            <tr>
              <td height="14" valign="middle" width="20%" class="statTextBig" nowrap="0">&#160;&#160;&#160;<xsl:value-of select="division"/></td>
              <td valign="middle" width="10%" class="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</td> 
              <td valign="middle" width="35%" class="statText" nowrap="0">&#160;&#160;
                <a>
                  <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                  <xsl:attribute name="CLASS">bodyText</xsl:attribute>
                  <font>
                    <xsl:attribute name="color">
                      <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                    </xsl:attribute>
                    <xsl:value-of select="handle"/>
                  </font>
                </a>
              </td>
              <td valign="middle" width="15%" class="statText" align="center"><xsl:value-of select="change"/></td>
              <td valign="middle" width="20%" class="statText" nowrap="0">&#160;<xsl:value-of select="room_name"/></td>
            </tr>            
          </xsl:for-each>
          <tr><td colspan="5" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="6" border="0"/></td></tr>
       </table>
    </td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr> 
  
  <tr><td colspan="3" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>  
</table>

<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">  
  <tr><td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="8" border="0"/></td>
      <td valign="top" colspan="7"><img src="/i/label_coder_view.gif" alt="Coder's Point of View" width="148" height="26" border="0"/></td>   
      <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>    
  </tr>  
  <tr>
    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>  
    <td valign="top" width="55" align="left" class="bodyText" rowspan="2"><img src="/i/m/brett1479_mug.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/><br/> 
    By&#160;brett1479<br/><i>[TC]&#160;Member</i><br/></td>
    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td> 
    <td valign="top" width="100%" align="left" class="bodyText" colspan="2">
    <font size="2" color="#000000" face="tahoma, verdana"><b>SRM 128</b></font>
    </td>
  </tr>      
  <tr>
    <td valign="top" class="bodyText" width="100%">
	<a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm128_prob</xsl:attribute>
        <b>Problem Set Analysis &amp; Opinion</b>
      </a><br/>
<P>
Over 350 competitors registered for Single Round Match 128, one of the largest turnouts in 
months.  The match's problem writer awarded them for their attendance with problems both 
beautifully worded and interesting to solve.
</P>

<p>
<B>Ambrose</B>, who claimed the Division-I crown, has been leaping up and down since, stopping 
every 10 minutes to catch his breath.  "This was the best competition ever" is what he 
probably would have said had I asked.  <B>Coshx</B>, who had the highest score in Division-II, 
would be ecstatic but he is a hyperbolic trig function, and thus has no emotions.  
Perhaps, due to the occasion, he will take his own derivative.  <B>WishingBone</B>, who had 
the second highest score in Division-I, is now broken in two.  Hopefully he will be back 
in one piece by next competition.  <B>HappyMutant</B>, one of the top scoring Division-II competitors, 
is both happy since he did so well, and sad since he is a mutant
...<a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm128_prob</xsl:attribute>Get the analysis</a>
</p>
    </td>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>     
  </tr>
  <tr><td valign="top" colspan="9"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>  
  <tr>  
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="100%" colspan="7" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>    
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
  </tr> 
  <tr><td valign="top" colspan="8"><img src="/i/clear.gif" alt="" width="1" height="4" border="0"/></td></tr>   
</table>
<!-- End of Point of View -->

<!-- Feature -->  
<table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td valign="top" width="5" rowspan="2"><img src="/i/clear.gif" alt="" width="5" height="1" border="0"/></td>
    <td valign="middle" width="40%" bgcolor="#FFFFFF" height="26"><img src="/i/label_feat.gif" alt="Weekly Feature" width="184" height="26" border="0"/></td>
    <td width="60%" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    <td valign="top" width="7" rowspan="2"><img src="/i/clear.gif" alt="" width="7" height="1" border="0"/></td>    
  </tr>  
  <tr>
    <td valign="middle" bgcolor="#CCCCCC" align="center" height="15">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=features</xsl:attribute>
        Upcoming/Past Features
      </a>
    </td>
    <td valign="middle" bgcolor="#CCCCCC" align="center"> <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_topics</xsl:attribute>Want to write?</a></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">   
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>  
    <td valign="top" width="55" align="left" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/><br/>
<!-- <IMG SRC="/i/f/feat_050102_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/> -->   
<img src="/i/m/KaiEl_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/><br/>
By&#160;KaiEl<br/><i>[TC] Member</i><br/><br/>
<a href="/?&amp;t=features&amp;c=feat_topics"><img src="/i/writers_wanted.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="15"/></a></td>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="100%" align="left" class="bodyText"><br/>
<a class="bodyGeneric">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_122002</xsl:attribute>
  <b>The Big Rerun</b></a><br/>
<i>A Complete Breakdown of the 2002 Invitational Championship Round</i><br/>
Friday, December 20, 2002<br/>

<p>
Anyone who's been with TopCoder for long enough should be used to the troubles that occasionally 
come up during Single Round Matches. Whether it's due to an error in the problem statement, system 
testing or some other part of the process, sometimes there is an issue that compromises the fairness 
or feasibility of counting the results of a contest. Some coders get mad about having their 75 
minutes of hard work thrown out, but most of them accept that accidents do happen.
</p>

<p>
When there's a similiar problem at a $150,000 tournament, though, people tend to be less accepting.
</p>

<p>
Since the controversial re-running of the final round of the 2002 TopCoder Invitational, an 
internal debate has flared up within the ranks of the TopCoder competitors and administrators. 
Hundreds of people who were not directly affected by the results have posted their opinions in 
the Round Tables and chatted endlessly about the results in the Competition Arena. If TopCoder 
had its own version of 'Sports Talk' radio, then this one issue would probably have taken up 
the morning and afternoon drive-time slots for the past month...<a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_122002</xsl:attribute>full&#160;story</a></p>
<!-- <P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Have an idea for the weekly feature?</A></P> -->
  </td>
    <td valign="top" width="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
  <tr><td valign="top" colspan="5"><img src="/i/clear.gif" alt="" width="1" height="12" border="0"/></td></tr>
  <tr>
  <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
  <td valign="top" bgcolor="#43515E" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
  <td valign="top" width="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>    
</table> 

 <!-- Coder of the Week Begins -->
   <!-- <xsl:call-template name="coder_week"/> -->
<!-- Coder of the Week Ends -->
<xsl:call-template name="tc_updates"/>
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr><td valign="top" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td></tr>  
  <tr>  
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
    <td valign="top" width="100%" bgcolor="#CCCCCC"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>    
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr> 
  <tr><td valign="top" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td></tr>   
</table>
<xsl:call-template name="arena"/> 
<!-- TC special promo --> 
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">  
  <tr>  
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" colspan="3" width="100%" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>    
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr>    
  <tr><td valign="top" colspan="5"><img src="/i/clear.gif" alt="" width="1" height="6" border="0"/></td></tr>     
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="26" border="0"/></td>  
    <td valign="top" width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="tahoma, verdana"><b>[TC] Sponsorships</b></font><br/>TopCoder offers sponsorship programs for the weekly 
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>
        Single Round Matches
      </a> as well as for 
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournaments</a>. Read more about our 
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>sponsorship programs</a>.<br/></td>
    <td valign="top" width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0"/></td>
    <td valign="top" width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="tahoma, verdana"><b>[TC] Employment Services</b></font><br/>TopCoder works with companies to connect them with top-rated developers. Read more about our 
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>employment services</a>.<br/></td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
  <tr><td valign="top" colspan="5"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
</table> 
    </td>
  <!-- Center Column Ends -->    
				<td bgcolor="#001935" valign="top" class="statText" width="244"><img src="/i/clear.gif" alt="" width="244" height="1" border="0"/><br/> 
<!--SRM Sponsor Starts-->

  <!--   <IMG SRC="/i/srm_home.gif" WIDTH="244" HEIGHT="250" ALT="" BORDER="0" USEMAP="#srm_home"/><MAP NAME="srm_home">
<AREA ALT="" COORDS="124,28,228,90" HREF="/?&amp;t=tces&amp;c=fbi"/>
<AREA ALT="" COORDS="141,160,224,187" HREF="/?&amp;t=schedule&amp;c=srm_spon_artifact"/>
<AREA ALT="" SHAPE="POLY" COORDS="23,193,112,193,121,201,234,201,234,240,38,240,12,216,12,193" HREF="/stat?&amp;c=last_match"/>
</MAP> -->

					<img usemap="#srmaminmation_home" src="/i/es/srmanimation_home.gif" alt="" width="244" height="160" border="0"/><br/>
					<map name="srmaminmation_home">
						<area alt="TCES" shape="poly" coords="17,33,17,60,141,60,141,92,228,92,228,25,17,25" href="/?&amp;t=tces&amp;c=index"/>
						<area alt="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/?RoundId=4430&amp;t=schedule&amp;c=srm"/>
						<!-- <area alt="" SHAPE="poly" COORDS="229,104,120,105,105,94,11,95,10,120,36,146,229,148" HREF="/stat?&amp;c=last_match"/> --> 
					</map>
<!--SRM Sponsor Ends-->

<!-- <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
<IMG SRC="/i/tces_promo.gif" alt="" width="244" height="77" border="0"/></A> -->
<a><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
<img src="/i/tces_quote.gif" alt="" width="244" height="174" border="0"/></a>
<!-- <A HREF="/?&amp;t=tournaments&amp;c=invit02_cnn"><IMG SRC="/i/tournament/invit02/invit02_cnn_home.gif" ALT="TC on CNN" WIDTH="244" HEIGHT="145" BORDER="0"/></A> -->

<!-- Software Promo Begins -->
					<a href="/?&amp;t=development&amp;c=comp_projects"><img src="/i/tcs_board.gif" alt="TCS" width="244" height="156" vspace="1" border="0"/></a>
<!-- Software Promo Ends -->

<!-- Software Leader Board Begins -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top" bgcolor="#001935" background="/i/steel_darkblue_bg.gif">
				<tr><td height="17" class="moduleTitle" valign="middle"><img src="/i/module_labels_tcs_coders.gif" alt="TopCoder Software Leaders" width="226" height="17" border="0"/></td></tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif">
				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="3" border="0"/></td>
					<td width="59%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
					<td width="39%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
					<td width="10"><img src="/i/clear.gif" width="10" height="3" border="0"/></td>
				</tr>              
							
				<tr valign="middle">
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
					<td class="statTextBig" background="/i/steel_bluebv_bg.gif">Handle</td>
					<td class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Average Score</td>  
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
				</tr>              
							
				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
							
				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
					<td class="statText" align="right">87.54</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>             
							
				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
							
				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150940">orb</a></td>
					<td class="statText" align="right">83.78</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>             
							
				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
							
				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=285960">jkang</a></td>
					<td class="statText" align="right">82.40</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>             
							
				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
							
				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
					<td class="statText" align="right">81.52</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>             
							
				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
							
				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=302729">kislookhin</a></td>
					<td class="statText" align="right">81.38</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>             
											
				<tr>
					<td colspan="4"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
				</tr>                       
			</table>
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

			<table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top" bgcolor="#001935" background="/i/steel_darkblue_bg.gif">
				<tr><td height="17" class="moduleTitle" valign="middle"><img src="/i/module_labels_10_coders.gif" alt="TopCoder Competition Leaders" width="226" height="17" border="0"/></td></tr>
				<tr><td bgcolor="#FFFFFF"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>
				<tr><td><img src="/i/clear.gif" width="1" height="3" border="0"/></td></tr>      
			</table>

<xsl:call-template name="top_10_schools"/>
<xsl:call-template name="top_10_coders"/>

			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr>
					<td align="left" class="statText"><img src="/i/clear.gif" width="20" height="4" border="0"/></td>
					<td></td>
					<td></td>
					<td align="left" class="statText"><img src="/i/clear.gif" width="10" height="4" border="0"/></td>
				</tr>

				<tr><td align="center" class="statTextBig" colspan="4">More Leaders</td></tr>

				<tr>
					<td></td>
					<td align="left" class="statText">Coders</td>
					<td align="right"><a href="/stat?c=coder_ratings" class="statText">view all</a></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td align="left" class="statText">Schools</td>
					<td align="right"><a href="/stat?c=school_avg_rating" class="statText">view all</a></td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td align="left" class="statText">States</td>
					<td align="right"><a href="/stat?c=state_avg_rating" class="statText">view all</a></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td align="left" class="statText">Countries</td>
					<td align="right"><a href="/stat?c=country_avg_rating" class="statText">view all</a></td>
					<td></td>
				</tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr><td colspan="3" bgcolor="#001935"><img src="/i/label_quick_stats_home.gif" alt="Quick Stats" width="166" height="17" border="0"/></td></tr>
				<tr><td bgcolor="#FFFFFF" colspan="3"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>                
				<tr>
					<td rowspan="4"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>                
					<td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td>
					<td rowspan="4"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>             
				</tr>              
				<tr><td class="statText" valign="top">Select a Quick Stat from the menu below.</td></tr>
				<tr><td class="statText" valign="top"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>                              
				<tr><td class="quickstatText" valign="top">

<!-- Quick Stat Pulldown Begins --> 
				<xsl:call-template name="quick_stats_pulldown"/>
<!-- Quick Stat Pulldown Ends -->

<!-- Quick Stat Pulldown Begins --> 
<!-- <xsl:call-template name="quick_stats_tidbit"/> -->
<!-- Quick Stat Pulldown Ends -->
					</td>
				</tr>               
			</table><br/>
<!-- <A HREF="/?&amp;t=schedule&amp;c=2002sun_sched">
			<IMG SRC="/i/2002sn_winner.gif" ALT="SunNetwork Coding Challenge" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A> -->
			<!-- <a href="/stat?c=member_profile&amp;cr=302185">
			<img src="/i/codermonth_nov.gif" alt="Coder of the Month" width="244" height="156" vspace="10" border="0"/></a> -->
		</td>
<!-- <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
<!-- Body Area Ends -->
	</tr>   
</table>

  </xsl:template>
</xsl:stylesheet>
